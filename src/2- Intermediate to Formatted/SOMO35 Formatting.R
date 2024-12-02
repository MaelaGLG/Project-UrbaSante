#----------------------------------- INFO -------------------------------------#
# Author : Alfonso AWADALLA 
# Date	: August 2024
# Descr	: Formatting for latitude/longitude Data
#------------------------------------------------------------------------------#

#----------------------------- Import Libraries -------------------------------#

packages <- c("raster", "sp", "sf", "data.table", "writexl", "rstudioapi")

# Check each package, install if missing
for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
  library(pkg, character.only = TRUE)
}

#-------------------------- Import Files and Paths ----------------------------#

# Set current directory to current folder of the script
current_folder = dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(current_folder)
project_folder = dirname(dirname(getwd()))

# Import dataset
path_csv = file.path(project_folder, "data", "2- Intermediate Data", "SOMO35.csv")
data = read.csv(path_csv, fileEncoding = "Latin1")
data = as.data.table(data)

# Read the IRIS shapefile from the INSEE
path_iris = file.path(project_folder, "data", "shapefiles", "Iris", "CONTOURS-IRIS.shp")
iris = st_read(path_iris)

# Read the Communes shapefile from the INSEE
path_communes = file.path(project_folder, "data", "shapefiles", "Communes", "communes-20220101.shp")
communes = st_read(path_communes)

# Read the Departements shapefile from the INSEE
path_departements = file.path(project_folder, "data", "shapefiles", "Departements", "departements-20180101.shp")
departements = st_read(path_departements)

# Read the Regions shapefile from the INSEE
path_regions = file.path(project_folder, "data", "shapefiles", "Regions", "regions-20180101.shp")
regions = st_read(path_regions)

# Path to folder where you want to save the indicator dataframe
path_export = file.path(project_folder, "data", "3- Formatted Data", "somo35.xlsx")


################################################################################
#               Convert Points into Polygons at Various Scales                 #
################################################################################


#---------------------------------------------------------------------
#  Convert our our lat / long into spatial point and change col name |
#---------------------------------------------------------------------

indicator = "SOMO35"

# Convert into spatial points 
sp_points = st_as_sf(data, coords = c("Longitude", "Latitude"), crs = 4326)

# Change names for loop below:
setnames(sp_points, old = "SOMO35.Subscore_x", new = "value")

# Aligning coordinate systems together
sp_points = st_transform(sp_points, st_crs(iris))


#-----------------------------------------------------------
#  Function definition for converting points into polygons |
#-----------------------------------------------------------

# Define a function to process polygons
process_polygons = function(sp_points, polygons, polygon_id, name_col, scale_name, iris_crs, indicator) {
  
  # Align coordinate systems
  polygons = st_transform(polygons, iris_crs)
  
  # Join spatial data with polygon shapefile, filter, remove NAs, and aggregate data
  data = as.data.table(st_join(sp_points, polygons))
  
  # Aggregate data
  data = data[!is.na(get(polygon_id)), .(
    code_insee = get(polygon_id), 
    nom = get(name_col), 
    mean_value = mean(value, na.rm = TRUE),
    niveau = scale_name
  ), by = polygon_id][, .SD[1L], by = polygon_id]
  
  # Rename columns and drop unnecessary ones
  data[, (indicator) := mean_value]
  
  # Remove the previous polygon 
  if (ncol(data)==6) {
    data[, c("mean_value", polygon_id) := NULL]
  } else if (ncol(data)==5) {
    data[, c("mean_value") := NULL]
  }
  
  return(data)
}

#--------------------------------------------------------
#  Apply function to our four scales and save indicator |
#--------------------------------------------------------

# Common coordinate reference system for alignment
iris_crs = st_crs(iris)
sp_points = st_transform(sp_points, iris_crs)

# Apply the function to each level
data_iris = process_polygons(sp_points, iris, "CODE_IRIS", "NOM_IRIS", "Iris", iris_crs, indicator)
data_communes = process_polygons(sp_points, communes, "insee", "nom", "Communes", iris_crs, indicator)
data_departements = process_polygons(sp_points, departements, "code_insee", "nom", "Departements", iris_crs, indicator)
data_regions = process_polygons(sp_points, regions, "code_insee", "nom", "Regions", iris_crs, indicator)

# Merge the dataset together in a "long" format
final_data = rbind(data_iris, data_communes, data_departements, data_regions)

# Save indicator
write_xlsx(final_data, path=path_export)



