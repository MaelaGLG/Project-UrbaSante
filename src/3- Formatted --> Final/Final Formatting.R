#----------------------------------- INFO -------------------------------------#
# Author : Alfonso AWADALLA
# Date	: November 2024
# Descr	: Merge all formated indicators / process / clean
#------------------------------------------------------------------------------#


# This script is designed to ensure that all our indicators have the correct 
# format before merging them. The expected format being:
# 
# ┌────────────┬──────────────────────────────┬──────────────┬──────────────┐
# │ code_insee │ nom                          │ niveau       │ valeur       │
# ├────────────┼──────────────────────────────┼──────────────┼──────────────┤
# │ 290420102  │ Morgat et Cap de la Ch.      │ Iris         │ x            │
# │ 29042      │ Crozon                       │ Communes     │ x            │
# │ 32         │ Gers                         │ Departements │ x            │
# │ 53         │ Bretagne                     │ Regions      │ x            │
# └────────────┴──────────────────────────────┴──────────────┴──────────────┘


#----------------------------- Import Libraries -------------------------------#

packages <- c("raster", "sp", "sf", "data.table", "writexl", "tools")

# Check each package, install if missing
for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
  library(pkg, character.only = TRUE)
}


#-------------------------- Import Files and Paths ----------------------------#

# Specify all folder paths manually
data_directory = "/Users/alfonso/Desktop/ECOLAB/Formatted Indicators"
iris_insee = read_sf("/Users/alfonso/Dropbox/Alfonso/Cours l'X/M1/Policy-in-Action Project/Insee Tables/1- Iris INSEE/CONTOURS-IRIS.shp")
communes_insee = read_sf("/Users/alfonso/Dropbox/Alfonso/Cours l'X/M1/Policy-in-Action Project/Insee Tables/2- Communes INSEE/communes-20220101.shp")
departements_insee = read_sf("/Users/alfonso/Dropbox/Alfonso/Cours l'X/M1/Policy-in-Action Project/Insee Tables/3- Départements INSEE/departements-20180101.shp")
regions_insee = read_sf("/Users/alfonso/Dropbox/Alfonso/Cours l'X/M1/Policy-in-Action Project/Insee Tables/4- Régions INSEE/regions-20180101.shp")
france_shp = st_union(read_sf("/Users/alfonso/Dropbox/Alfonso/Cours l'X/M1/Policy-in-Action Project/Insee Tables/France shapefile/fr_100km.shp"))
folder_path_export = "/Users/alfonso/Desktop/ECOLAB"

# List all Excel files in the directory
file_list <- list.files(path = data_directory, pattern = "\\.xlsx$", full.names = TRUE)

# Load each file and assign it to a variable named after the file (without extension)
for (file_path in file_list) {
  # Extract the file name without extension
  dataset_name = tools::file_path_sans_ext(basename(file_path))
  
  # Load the data
  assign(dataset_name, as.data.table(read_excel(file_path)))
}

################################################################################
#            1- CREATE THE MERGED SHAPEFILE FOR FINAL INDICATORS               #
################################################################################

# Create a column dataframe with all insee_codes for every scale from the 
# shapefiles that are used later to join with polygons
setnames(iris_insee, old = c("CODE_IRIS", "NOM_IRIS"), new = c("code_insee", "nom"))
setnames(communes_insee, old = "insee", new = "code_insee")

# Transform and crop each dataset in a loop for efficiency
datasets = list(
  iris_insee = iris_insee,
  communes_insee = communes_insee,
  departements_insee = departements_insee,
  regions_insee = regions_insee
)

# Transform and intersect each dataset with the `france_shp` shapefile
for (name in names(datasets)) {
  # Get current dataset
  dataset = datasets[[name]]
  
  # Transform `france_shp` to the CRS of the current dataset
  france_crs = st_transform(france_shp, st_crs(dataset))
  
  # Crop the dataset with metropolitan France and assign it back to `datasets`
  datasets[[name]] = st_intersection(dataset, france_crs)
  datasets[[name]] = as.data.table(datasets[[name]])
}

# Add the "niveau" column for each scale
datasets[["iris_insee"]][, niveau := "Iris"]
datasets[["communes_insee"]][, niveau := "Communes"]
datasets[["departements_insee"]][, niveau := "Departements"]
datasets[["regions_insee"]][, niveau := "Regions"]

# Extract the `code_insee` column from each cropped dataset as data.table and bind rows
all_codes = rbindlist(lapply(datasets, function(dt) as.data.table(dt)[, .(code_insee, nom, niveau)]))

# Adding a correspondance to department for Iris and Communes scale (for visualisation tool)
merge_dep = datasets[["departements_insee"]][, .(code_dep = code_insee, nom_dep = nom)]
all_codes[niveau %in% c("Iris", "Communes"), code_dep := substr(code_insee, 1, 2)]
all_codes = merge.data.table(all_codes, merge_dep, by="code_dep", all.x = TRUE)
all_codes[, code_dep := NULL]

################################################################################
#                          2- CHECKS AND CLEANING                              #
################################################################################

# Atmo ; somo35 ; qualite_eaux_souterraines ; secheresse ; couvert_forestier ; 
# surface impermeable ; radiance are already well formatted (since coming
# from the same shapefile)

#----------------------------------
#  Check of the insee_code column |
#----------------------------------

# Specific handling for Parisian sub-communes in the IDF datasets
# Calculate the mean of 'nb_equipements_sport' for Parisian sub-communes in 'nb_equipements_sport_IDF' dataset
mean_nb_equipements_sport = nb_equipements_sport_IDF[grep("^75", code_insee), mean(nb_equipements_sport, na.rm = TRUE)]
nb_equipements_sport_IDF = rbind(nb_equipements_sport_IDF, data.table(code_insee = "75056", scale = "Commune", nb_equipements_sport = mean_nb_equipements_sport))

# Repeat similar steps for 'pourc_equipements_prox_IDF' dataset
mean_pourc_equipements_prox = pourc_equipements_prox_IDF[grep("^75", code_insee), mean(pourcentage_equip, na.rm = TRUE)]
pourc_equipements_prox_IDF = rbind(pourc_equipements_prox_IDF, data.table(code_insee = "75056", scale = "Commune", pourcentage_equip = mean_pourc_equipements_prox))

#----------------------------------
#  Check of the insee_code column |
#----------------------------------

# Function to standardize the 'niveau' column and 'code_insee' handling
clean_and_check = function(dt) {
  
  # Change 'scale' to 'niveau' if it exists
  if ("scale" %in% names(dt)) {
    setnames(dt, old = "scale", new = "niveau")
  }
  
  # Check if 'niveau' contains specific values and adjust accordingly
  if (any(c("Département", "Departement") %in% dt$niveau)) {
    dt[niveau %in% c("Département", "Departement"), niveau := "Departements"]
  }
  if (any(c("Région", "Region") %in% dt$niveau)) {
    dt[niveau %in% c("Région", "Region"), niveau := "Regions"]
  }
  if ("Commune" %in% dt$niveau) {
    dt[niveau == "Commune", niveau := "Communes"]
  }
  
  # Make sure 'code_insee' is a character string without decimals
  dt[, code_insee := sub("\\..*$", "", as.character(code_insee))]
  
  # Deal with missing leading zeros in 'code_insee' based on 'niveau'
  dt[, code_insee := ifelse(nchar(code_insee) == 8 & niveau == 'Iris', paste0("0", code_insee),
                            ifelse(nchar(code_insee) == 4 & niveau == 'Communes', paste0("0", code_insee),
                                   ifelse(nchar(code_insee) == 1 & niveau %in% c('Departements', 'Regions'), paste0("0", code_insee),
                                          code_insee)))]
  
  # Make sure indicator values are numeric, conditionally excluding "nom" if it doesn't exist
  cols_to_numeric = setdiff(names(dt), c("code_insee", "niveau"))
  if ("nom" %in% cols_to_numeric) {
    cols_to_numeric = setdiff(cols_to_numeric, "nom")
  } 
  dt[, (cols_to_numeric) := lapply(.SD, as.numeric), .SDcols = cols_to_numeric]
  
  # Check for unmatched 'code_insee' values
  dt[, check_code := !(code_insee %in% all_codes$code_insee)]
  dt = dt[check_code != TRUE]
  dt[, check_code := NULL]
  
  return(dt)
}


# Now apply this function to all your datasets
cyclabilite = clean_and_check(cyclabilite)
pesticides = clean_and_check(pesticides)
dengue = clean_and_check(dengue)
eloignement = clean_and_check(eloignement)
mixite_generationelle = clean_and_check(mixite_generationelle)
nb_equipements_sport_IDF = clean_and_check(nb_equipements_sport_IDF)
parcelles_bio = clean_and_check(parcelles_bio)
pourc_equipements_prox_IDF = clean_and_check(pourc_equipements_prox_IDF)
securite = clean_and_check(securite)
suroccupation = clean_and_check(suroccupation)


################################################################################
#                          2- MERGE ALL INDICATORS                             #
################################################################################

# Combined list of datasets with original and new column names for merging and renaming
datasets_to_merge = list(
  
  atmo = list(columns = c("ATMO"), rename = c("ATMO" = "Qualité de l'Air (ATMO score)")),
  somo35 = list(columns = c("SOMO35"), rename = c("SOMO35" = "Indicateur Ozone (SOMO35)")),
  qualite_eaux_souterraines = list(columns = c("qualite_eaux_souterraines"), rename = c("qualite_eaux_souterraines" = "Qualité des Eaux Souterraines")),
  secheresse = list(columns = c("Secheresse"), rename = c("Secheresse" = "Sécheresse")),
  dengue = list(columns = c("dengue_pop"), rename = c("dengue_pop" = "Dengue")),
  pesticides = list(columns = c("quantity_pesticides_Autre", "quantity_pesticides_CMR", 
                                "quantity_pesticides_EnvA", "quantity_pesticides_EnvB", "quantity_pesticides_Sante_A"),
                    rename = c("quantity_pesticides_Autre" = "Pesticides Santé Autres",
                               "quantity_pesticides_CMR" = "Pesticides CMR",
                               "quantity_pesticides_EnvA" = "Pesticides Env. A",
                               "quantity_pesticides_EnvB" = "Pesticides Env. B",
                               "quantity_pesticides_Sante_A" = "Pesticides Santé A")),
  couvert_forestier = list(columns = c("Couvert_Forestier"), rename = c("Couvert_Forestier" = "Couvert Forestier")),
  surface_impermeable = list(columns = c("Surface_Imperméable"), rename = c("Surface_Imperméable" = "Surface Imperméable")),
  radiance = list(columns = c("Radiance"), rename = c("Radiance" = "Radiance")),
  securite = list(columns = c("Coups et blessures volontaires (taux) 2022", 
                              "Vols sans violence contre des personnes (taux) 2022", 
                              "Cambriolages de logement (taux) 2022", 
                              "Usage de stupéfiants (taux) 2022"),
                  rename = c("Coups et blessures volontaires (taux) 2022" = "Coups et Blessures Volontaires",
                             "Vols sans violence contre des personnes (taux) 2022" = "Vols Sans Violence Contre des Personnes",
                             "Cambriolages de logement (taux) 2022" = "Cambriolages de Logement",
                             "Usage de stupéfiants (taux) 2022" = "Usage de Stupéfiants")),
  eloignement = list(columns = c("Part de la population éloignée des équipements intermédiaires, 2021", 
                                 "Part de la population éloignée des équipements de proximité, 2021", 
                                 "Part de la population éloignée des équipements supérieurs, 2021"),
                     rename = c("Part de la population éloignée des équipements intermédiaires, 2021" = "Eloignement des Equipements Intermédiaires",
                                "Part de la population éloignée des équipements de proximité, 2021" = "Eloignement des Equipements de Proximité",
                                "Part de la population éloignée des équipements supérieurs, 2021" = "Eloignement des Equipements Supérieurs")),
  pourc_equipements_prox_IDF = list(columns = c("pourcentage_equip"), rename = c("pourcentage_equip" = "Equipement de Proximité Accessibles")),
  cyclabilite = list(columns = c("Cyclabilité voirie"), rename = c("Cyclabilité voirie" = "Cyclabilité de la Voirie")),
  nb_equipements_sport_IDF = list(columns = c("nb_equipements_sport"), rename = c("nb_equipements_sport" = "Nombre d'Infrastructures Sportives Accessibles")),
  parcelles_bio = list(columns = c("part_surfconv"), rename = c("part_surfconv" = "Part des Surfaces Agricoles Biologiques")),
  suroccupation = list(columns = c("Part des résidences principales (hors studio de 1 personne) suroccupées 2020"), 
                       rename = c("Part des résidences principales (hors studio de 1 personne) suroccupées 2020" = "Part des Résidences Principales Suroccupées")),
  mixite_generationelle = list(columns = c("Part des pers. âgées de - de 25 ans 2020", 
                                           "Part des pers. âgées de 25 à 64 ans 2020", 
                                           "Part des pers. âgées de 65 ans ou + 2020"),
                               rename = c("Part des pers. âgées de - de 25 ans 2020" = "Part des pers. âgées de - de 25",
                                          "Part des pers. âgées de 25 à 64 ans 2020" = "Part des pers. âgées de 25 à 64",
                                          "Part des pers. âgées de 65 ans ou + 2020" = "Part des pers. âgées de 65"))
)

# Initialize the final indicators data.table with the first dataset
final_indicators = all_codes

# Loop through the datasets and perform the merge and renaming
for (dataset_name in names(datasets_to_merge)) {
  
  dataset = get(dataset_name)  # Get the dataset by name
  columns = datasets_to_merge[[dataset_name]]$columns  # Get columns to merge
  rename_map = datasets_to_merge[[dataset_name]]$rename  # Get rename mapping
  
  # Merge the dataset with final_indicators using both 'code_insee' and 'niveau'
  final_indicators = merge.data.table(final_indicators, 
                                      dataset[, c("code_insee", "niveau", columns), with = FALSE], 
                                      by = c("code_insee", "niveau"), all.x = TRUE)
  
  # Rename columns based on the rename_map
  setnames(final_indicators, old = names(rename_map), new = rename_map)
}

#-------------------------------------------------------------------------------
# Save as an excel file
saveRDS(final_indicators, paste0(folder_path_export, "/final_indicators.rds"))




