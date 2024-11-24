# -------------------------------------------------------------- 
# -------------------------------------------------------------- 
# Determinant : n° 11                                                 
# Indicator : Accessibilité aux infrastructures sportives 
# Author : Maela Guillaume Le Gall 
# Date : 02/13/2024
# -------------------------------------------------------------- 
# -------------------------------------------------------------- 



# -------------------------------------- #
# --- Presentation of the script  ------ #
# -------------------------------------- #

# The script has 3 sections
# 1) Creation of isochrones around municipalities 
# 2) Cleaning up the sports facilities database
# 3) Counting the number of facilities in the isochrone of each municipality

# ---------------------------------- #
# ---    Preprocessing          ---- #
# ---------------------------------- #


# The sports facilities census can be downloaded here: https://www.data.gouv.fr/fr/datasets/recensement-des-equipements-sportifs-espaces-et-sites-de-pratiques/
#You must then rename the file to "equipements_sportifs.csv"  and place it in the corresponding directory: `data/1- Raw Data/Déterminant 11 - Activités physiques et sportives`

# This code only concerns the IDF region

# Installing necessary packages
packages <- c("sf", "dplyr", "rgdal", "osrm", "readxl", "tidyr")

# Check each package, install if missing
for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
  library(pkg, character.only = TRUE)
}



# Set current directory to current folder of the script
current_folder = dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(current_folder)


# ---------------------------------- #
# --- 1) Creation of isochrones  --- #
# ---------------------------------- #

#### LOADING AND CLEANING "carto_commune" DATABASE

# Load a table with centroid coordinates of communes
communes_centroide <- read.csv("..../data/linking tables/liaison - carto communes/carto_communes.csv")

# Remove existing duplicates in the table
communes_centroide <- communes_centroide[!duplicated(communes_centroide$code_commune_INSEE), ]

# Remove communes without geographic coordinates
communes_centroide <- communes_centroide[complete.cases(communes_centroide$longitude), ]
communes_centroide <- communes_centroide[complete.cases(communes_centroide$latitude), ]

# Select the IDF region (11)
communes_centroide <- communes_centroide %>% filter(code_region == "11")

#### ISOCHRONE CALCULATIONS
# Calculate 15-minute driving isochrones from each commune centroid
isochrones_list <- lapply(1:nrow(communes_centroide), function(i) {
  osrmIsochrone(loc = cbind(communes_centroide$longitude[i], communes_centroide$latitude[i]), breaks = c(6))
})

# Create a list of isochrone_df dataframes using lapply
isochrones_df_list <- lapply(1:length(isochrones_list), function(i) {
  # Convert each element of isochrones_list to a dataframe
  isochrone_df <- as.data.frame(isochrones_list[[i]]) 
  # Add the code_commune_INSEE column from communes_centroide to each isochrone_df
  isochrone_df$code_commune_INSEE <- communes_centroide$code_commune_INSEE[i] 
  # Return the isochrone_df dataframe
  return(isochrone_df)
})

# Combine all dataframes from isochrones_df_list into a single dataframe
isochrones_df <- do.call(rbind, isochrones_df_list)

# Perform a left join between communes_centroide and isochrones_df 
# using the "code_commune_INSEE" column as the join key
communes_centroide_isochrones <- left_join(communes_centroide, isochrones_df, by = "code_commune_INSEE")

# Apply a geographic coordinate system compatible with the sports facilities database
communes_centroide_isochrones <- communes_centroide_isochrones %>%
  mutate(geometry = st_as_sfc(st_as_text(geometry), crs = 4326))

# Convert to sf format using the geometry column
communes_centroide_isochrones_sf <- st_as_sf(communes_centroide_isochrones, crs = 4326)

# Repair invalid geometries in communes
communes_centroide_isochrones_sf_valid <- st_make_valid(communes_centroide_isochrones_sf)

# --------------------------------------------------------- #
# --- 2) Cleaning the Sports Facilities Table  ------------ #
# --------------------------------------------------------- #

# Load the table
equipements_sportifs <- read.csv("....data/1- Raw Data/Déterminant 11 - Activités physiques et sportives/equipements_sportifs.csv", header = TRUE, sep = ";")

### Select regions neighboring the Paris region (facilities may be in a commune's isochrone)
equipements_sportifs <- equipements_sportifs %>% filter(reg_code == "11" | reg_code == "32" | reg_code == "44" | reg_code == "28" | reg_code == "24" | reg_code == "27")

# Remove facilities without geographic coordinates
equipements_sportifs <- subset(equipements_sportifs, !is.na(coordgpsx))
equipements_sportifs <- subset(equipements_sportifs, !is.na(coordgpsy))

# Convert equipements_sportifs to an sf object with imposed coordinate system
equipements_sportifs <- st_as_sf(equipements_sportifs, coords = c("coordgpsx", "coordgpsy"), crs = 4326)

# Correct outlier values
equipements_sportifs <- equipements_sportifs %>%
  filter(st_coordinates(.)[,2] <= 90 & st_coordinates(.)[,2] >= -90)

equipements_sportifs <- equipements_sportifs %>% select(numinstallation, geometry)

# ------------------------------------------------- #
# --- 3) Counting Facilities per Isochrone -------- #
# ------------------------------------------------- #

# Spatial join of sports facilities within polygons (isochrones)
equipements_sportifs_isochrones <- st_join(equipements_sportifs, communes_centroide_isochrones_sf_valid, join = st_within)

# Count the number of facilities per commune
nb_equipement_communes <- equipements_sportifs_isochrones %>% group_by(code_commune_INSEE) %>% count()

# Quintile categorization
quantile(nb_equipement_communes$n, probs = seq(0, 1, by = 0.1))

nb_equipement_communes$quintile <- cut(nb_equipement_communes$n,
                                       include.lowest = TRUE,
                                       right = FALSE,
                                       dig.lab = 4,
                                       breaks = c(1.0,     54.0,     90.0,    132.9,    174.2,    240.0,    351.8,    527.3,    869.4,   1630.7, 106917.0)
)

# Export the table
nb_equipement_communes <- nb_equipement_communes %>% select(code_commune_INSEE, n, quintile)

writexl::write_xlsx(nb_equipement_communes, ".../data/2- Intermediate Data/nb_equipement_sport_IDF.xlsx")
