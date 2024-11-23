#----------------------------------- INFO -------------------------------------#
# Author : Alfonso AWADALLA 
# Date	: November 2024
# Descr	: Generate a spatial point dataframe from one or more raster files
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

#------------------------------- Import Data ----------------------------------#

# Set current directory to current folder of the script
current_folder = dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(current_folder)

# Path to raster files
path = "..../data/1- Raw Data/Déterminant 5- Pollution Lumineuse/Radiance" # path to folder containing all the geospatial tiff files
files = list.files(path, pattern="*.tif$", full.names=TRUE)

# Path to France shapefile
path_shp = "..../data/Shapefiles/path/to/fr_100km.shp"
france = st_read(path_shp)

# Read the IRIS shapefile from the INSEE
path_iris = "..../data/Shapefiles/path/to/CONTOURS-IRIS.shp"
iris = st_read(path_iris)

# Read the Communes shapefile from the INSEE
path_communes = "..../data/Shapefiles/path/to/communes-20220101.shp"
communes = st_read(path_communes)

# Read the Departements shapefile from the INSEE
path_departements = "..../data/Shapefiles/path/to/departements-20180101.shp"
departements = st_read(path_departements)

# Read the Regions shapefile from the INSEE
path_regions = "..../data/Shapefiles/path/to/regions-20180101.shp"
regions = st_read(path_regions)

# Path to folder where you want to save the indicator dataframe
path_export = "..../data/3- Formatted Data/radiance.xlsx"


################################################################################
#                     STEP 1 - Importing Raster Data                           #
################################################################################

#-----------------------------------------------
#  Procedure when there is only one .tiff file |
#-----------------------------------------------

if (length(files)==1) {
  
  # Import raster file
  r = raster(files)
  
  # Transform France's coordinates to match the raster
  france = st_transform(france, crs = crs(r))
  
  # Crop and mask the raster to France
  france_raster_masked = mask(crop(r, extent(france)), france)
  
  # Resample raster: calculate new resolution and aggregate
  target_factor = 1
  resampled_raster = aggregate(france_raster_masked, 
                               fact = sqrt(target_factor), 
                               fun = mean)
  
  # Convert Resampled Raster to Points and create a Spatial Points Data Frame
  sp_points = st_as_sf(SpatialPointsDataFrame(
      coords = rasterToPoints(resampled_raster, na.rm = TRUE)[, 1:2],  # Extract coordinates
      data = data.frame(value = rasterToPoints(resampled_raster, na.rm = TRUE)[, 3]),  # Extract values
      proj4string = crs(r)  # Coordinate reference system
    ))
  
#----------------------------------------------------
#  Procedure when there is more than one .tiff file |
#----------------------------------------------------
  
} else if (length(files)>1) {
 
  # Initialize an empty list to store points
  all_points = list()
  
  # Process Each Raster File
  for (file in files) {
    r = raster(file)
    
    # Resample raster: calculate new resolution and aggregate
    target_factor = 5000
    resampled_raster = aggregate(r, 
                                  fact = sqrt(target_factor), 
                                  fun = mean)  
    
    # Filter out values above 100 (representing 'sea' pixels)
    resampled_raster[resampled_raster > 100] = NA
    
    # Convert Resampled Raster to Points and store them
    all_points[[file]] = rasterToPoints(resampled_raster, na.rm = TRUE)
  }
  
  # Combine all points into one data frame
  combined_points = do.call(rbind, all_points)
  
  # Create a Spatial Points Data Frame
  sp_points = st_as_sf(SpatialPointsDataFrame(
    coords = combined_points[, 1:2],  # Extract coordinates (x, y)
    data = data.frame(value = combined_points[, 3]),  # Extract values
    proj4string = crs(r)  # Coordinate reference system
  ))
}


################################################################################
#          STEP 2 - Convert Points into Polygons at Various Scales             #
################################################################################


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




