# -------------------------------------------------------------- 
# -------------------------------------------------------------- 
# Determinant : n° 10                                                 
# Indicator : Taux de services de proximité à 6 min. en voiture 
# Author : Maela Guillaume Le Gall 
# Date : 02/13/2024
# -------------------------------------------------------------- 
# -------------------------------------------------------------- 



# ---------------------------------- #
# --- Presentation of the script  -- #
# ---------------------------------- #
# The script has 3 parts
# 1) Creation of isochrones around municipalities
# 2) Cleaning of the BPE 2021 to keep only local facilities
# 3) Counting the number of facilities and calculating the rate of local facilities in each municipal isochrone


# BPE data can be downloaded here: https://www.insee.fr/fr/metadonnees/source/operation/s2077/bases-donnees-ligne
# This code only applies to the IDF region

# Installing necessary packages
install.packages(c("sf", "dplyr", "rgdal", "osrm", "readxl", "tidyr"))

library(sf)
library(osrm)
library(dplyr)
library(readxl)
library(tidyr)
library(rgdal)

setwd(Sys.getenv("HOME"))  



# ---------------------------------- #
# --- 1) Creation of isochrones ---- #
# ---------------------------------- #


#### LOADING AND CLEANING OF MUNICIPAL DATABASE

# Load a table with centroid coordinates of the municipalities
communes_centroide <- read.csv("./Project-UrbaSante/data/Insee Tables/Communes/carto_communes.csv")

# Remove existing duplicates in the table
communes_centroide <- communes_centroide[!duplicated(communes_centroide$code_commune_INSEE), ]

# Remove municipalities without geographic coordinates
communes_centroide <- communes_centroide[complete.cases(communes_centroide$longitude), ]
communes_centroide <- communes_centroide[complete.cases(communes_centroide$latitude), ]

# Select IDF region (11)
communes_centroide <- communes_centroide  %>% filter(code_region == "11")

#### CALCULATION OF ISOCHRONES
# Calculate 6-minute drive isochrones from each municipality centroid
isochrones_list <- lapply(1:nrow(communes_centroide), function(i) {
  osrmIsochrone(loc = cbind(communes_centroide$longitude[i], communes_centroide$latitude[i]), breaks = c(6))
})

# Create a list of isochrone dataframes using lapply
isochrones_df_list <- lapply(1:length(isochrones_list), function(i) {
  # Convert each element of the isochrones_list to a dataframe
  isochrone_df <- as.data.frame(isochrones_list[[i]]) 
  # Add the column code_commune_INSEE from communes_centroide to each isochrone_df
  isochrone_df$code_commune_INSEE <- communes_centroide$code_commune_INSEE[i] 
  # Return the isochrone_df dataframe
  return(isochrone_df)
})

# Combine all dataframes from the isochrones_df_list into a single dataframe
isochrones_df <- do.call(rbind, isochrones_df_list)

# Perform a left join between the communes_centroide and isochrones_df dataframes
# using the column "code_commune_INSEE" as the join key
communes_centroide_isochrones <- left_join(communes_centroide, isochrones_df, by = "code_commune_INSEE")


# Impose a coordinate system compatible with the sports facility database
communes_centroide_isochrones <- communes_centroide_isochrones %>%
  mutate(geometry = st_as_sfc(st_as_text(geometry), crs = 4326))

# Convert to sf using the geometry column
communes_centroide_isochrones_sf <- st_as_sf(communes_centroide_isochrones, crs = 4326)


# Repair invalid geometries in the municipalities
communes_centroide_isochrones_sf_valid <- st_make_valid(communes_centroide_isochrones_sf)




# ---------------------------------- #
# --- 2) Cleaning of the BPE ------ #
# ---------------------------------- #

# Load the table  
base_equipements <- read.csv("./Project-UrbaSante/data/raw/bpe21_ensemble_xy.csv", header = TRUE, sep = ";")

### Select regions bordering the Paris region (facilities may be located within a municipality isochrone)
base_equipements <- base_equipements %>% filter(REG == "11" |REG == "32" | REG == "44" | REG == "28" | REG == "24"  | REG == "27")

# Remove facilities without geographic coordinates
base_equipements <- subset(base_equipements, !is.na(LAMBERT_X))
base_equipements <- subset(base_equipements, !is.na(LAMBERT_Y))

# Convert dataframe to sf object
base_equipements_sf <- st_as_sf(base_equipements, coords = c("LAMBERT_X", "LAMBERT_Y"), crs = 2154, remove = FALSE)

# Reproject to WGS 84 (EPSG:4326)
base_equipements_sf <- st_transform(base_equipements_sf, crs = 4326)

# Correct outlier values
base_equipements_sf <- base_equipements_sf %>%
  filter(st_coordinates(.)[,2] <= 90 & st_coordinates(.)[,2] >= -90)

# Select relevant variables
base_equipements_sf<- base_equipements_sf %>% select(AAV2020, REG, TYPEQU, geometry)


## Load the table for mapping local facilities

table_passage_equipements_prox <- read_excel("./Project-UrbaSante/data/intermediate/table_passage_equipements_prox.xlsx")


## Assign the code for local facility
base_equipements_sf <- base_equipements_sf %>%
  rowwise() %>%
  mutate(equip_prox = case_when(
    # If TYPEQ corresponds to a value in regroupement_1, assign the corresponding code_equipement
    TYPEQU %in% table_passage_equipements_prox$regroupement_1 ~ table_passage_equipements_prox$code_equipement[match(TYPEQU, table_passage_equipements_prox$regroupement_1)],
    # If TYPEQU corresponds to a value in regroupement_2, assign the corresponding code_equipement
    TYPEQU %in% table_passage_equipements_prox$regroupement_2 ~ table_passage_equipements_prox$code_equipement[match(TYPEQU, table_passage_equipements_prox$regroupement_2)],
    # If TYPEQU corresponds to a value in regroupement_3, assign the corresponding code_equipement
    TYPEQU %in% table_passage_equipements_prox$regroupement_3 ~ table_passage_equipements_prox$code_equipement[match(TYPEQU, table_passage_equipements_prox$regroupement_3)],
    # If no match, NA is assigned
    TRUE ~ NA_character_
  )) %>%
  ungroup()  # Remove row grouping to return to initial dataframe state


# Remove all facilities not in the proximity table

base_equipements_sf <- subset(base_equipements_sf, !is.na(equip_prox))


# ------------------------------------------------- #
# --- 3) Counting facilities per isochrone ------ #
# ------------------------------------------------- #



# Spatial join of local facilities within polygons (isochrones)
equipements_proximite_isochrones <- st_join(base_equipements_sf, communes_centroide_isochrones_sf_valid, join = st_within)

# Keep one row for each unique combination of facilities and municipalities
equipements_proximite_isochrones <- equipements_proximite_isochrones %>%
  distinct(code_commune_INSEE, equip_prox, .keep_all = TRUE)

# Count the number of types of facilities per municipality
nb_equipements_prox_communes <- equipements_proximite_isochrones %>% group_by(code_commune_INSEE) %>% count()

# Percentage of facilities present (/28 as there are 28 types of local facilities)
nb_equipements_prox_communes$pourcentage_equip <- nb_equipements_prox_communes$n/28*100

# Round the percentage to the nearest integer
nb_equipements_prox_communes <- nb_equipements_prox_communes %>%
  mutate(pourcentage_equip = round(pourcentage_equip))

# Select columns and convert to dataframe
nb_equipements_prox_communes <- as.data.frame(nb_equipements_prox_communes)
nb_equipements_prox_communes <- nb_equipements_prox_communes %>% select(code_commune_INSEE, n, pourcentage_equip)

write.csv(nb_equipements_prox_communes, "./Project-UrbaSante/data/processed/nb_equipements_prox_communes.csv", row.names = FALSE)
