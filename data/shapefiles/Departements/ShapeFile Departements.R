# Install and Load Necessary Packages
library(raster)
library(sp)
library(tmap)
library(sf)
library(dplyr)
library(readxl)
library(shapefiles)

# Import shapefile
departements = st_read("/Users/alfonso/Dropbox/Alfonso/Cours l'X/Policy-in-Action Project/Insee Tables/Départements INSEE/departements-20180101.shp")

# Row numbers you want to merge (e.g., row 1 and row 2)
row_rhone <- 64
row_lyon <- 65

# Merge the geometries
merged_geometry <- st_union(departements$geometry[row_rhone], departements$geometry[row_lyon])

# Convert the merged geometry to MULTIPOLYGON if it's not already one
if (!inherits(merged_geometry, "MULTIPOLYGON")) {
  merged_geometry <- st_cast(merged_geometry, "MULTIPOLYGON")
}

# Keep the attributes from the first row
attributes <- departements[row_rhone, ]

# Replace the geometry with the merged geometry
attributes$geometry <- merged_geometry

# Change de departement number from 69D to 69

attributes$code_insee <- '69'

# Remove the old rows from the shapefile
departements <- departements[-c(row_rhone, row_lyon), ]

# Add the new row with merged geometry
departements <- rbind(departements, attributes)

# Write the shapefile as R object
saveRDS(departements, "/Users/alfonso/Dropbox/Alfonso/Cours l'X/Policy-in-Action Project/Insee Tables/Départements INSEE/New Version/departement_shapefile.rds")
