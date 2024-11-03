#----------------------------------- INFO -------------------------------------#
# Author : Alfonso AWADALLA
# Date	: November 2024
# Descr	: Master file - Satellite Data
#------------------------------------------------------------------------------#


#------------------------
#  UPDATE PATHS TO DATA |--------------------------------
#  Update all the paths and the indicator name manually |
#--------------------------------------------------------

# Put the name of the indicator "Couvert_Forestier" | "Radiance" | "Surface_Imperméable"
indicator = "Surface_Impermeable"

# Path to raster files
path = "path/to/folder/Data"
files = list.files(path, pattern="*.tif$", full.names=TRUE)

# Path to France shapefile
path_shp = "path/to/folder/France shapefile/fr_100km.shp"
france = st_read(path_shp)

# Read the IRIS shapefile from the INSEE
path_iris = "/path/to/folder/CONTOURS-IRIS.shp"
iris = st_read(path_iris)

# Read the Communes shapefile from the INSEE
path_communes = "path/to/folder/2- Communes INSEE/communes-20220101.shp"
communes = st_read(path_communes)

# Read the Departements shapefile from the INSEE
path_departements = "/path/to/folder/departements-20180101.shp"
departements = st_read(path_departements)

# Read the Regions shapefile from the INSEE
path_regions = "/path/to/folder/regions-20180101.shp"
regions = st_read(path_regions)

# Path to folder where you want to save the indicator dataframe
path_export = "path/to/folder"
