#----------------------------------- INFO -------------------------------------#
# Author : Alfonso AWADALLA 
# Date	: November 2024
# Descr	: Manipulating the french departements shapefile to put it up to date
#------------------------------------------------------------------------------#

#----------------------------- Import Libraries -------------------------------#

# List of required packages
packages <- c("raster", "sp", "tmap", "sf", "dplyr", "readxl", "shapefiles")

# Function to install and load packages
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
    library(pkg, character.only = TRUE)
  } else {
    library(pkg, character.only = TRUE)
  }
}

#--------------------------- Update Paths Manually ----------------------------#

# Update paths manually
path_import = "path/to/folder/departements-20180101.shp"
path_export = "path/to/folder/departement_shapefile.rds"

#--------------------- Shapefile Manipulation & Export ------------------------#

# Import shapefile
departements = st_read(path_import)

# Row numbers you want to merge (e.g., row 1 and row 2)
row_rhone = 64
row_lyon = 65

# Merge the geometries
merged_geometry = st_union(departements$geometry[row_rhone], departements$geometry[row_lyon])

# Convert the merged geometry to MULTIPOLYGON if it's not already one
if (!inherits(merged_geometry, "MULTIPOLYGON")) {
  merged_geometry = st_cast(merged_geometry, "MULTIPOLYGON")
}

# Keep the attributes from the first row
attributes = departements[row_rhone, ]

# Replace the geometry with the merged geometry
attributes$geometry = merged_geometry

# Change de departement number from 69D to 69

attributes$code_insee = '69'

# Remove the old rows from the shapefile
departements = departements[-c(row_rhone, row_lyon), ]

# Add the new row with merged geometry
departements = rbind(departements, attributes)

# Write the shapefile as R object
saveRDS(departements, path_export)
