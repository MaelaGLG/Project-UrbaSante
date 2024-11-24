# IN THIS SCRIPT WE WANT TO GENERATE THE INDICATOR DENGUE CASES PER MILLION HABITANTS
# Install packages
install.packages(c("sf", "dplyr", "leaflet", "readxl", "tmap", "openxlsx", "writexl"))

# Load required libraries
library(openxlsx)
library(sf)
library(dplyr)
library(leaflet)
library(readxl)
library(tmap) 
library(writexl)

#------------------------------- Import Data ----------------------------------#

# Set current directory to current folder of the script
current_folder = dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(current_folder)

# Path to France shapefile
path = "..../data/shapefiles/France/fr_100km.shp"
france = st_read(path_shp)

# Path to folder where you want to save the indicator dataframe
path_export = "..../data/3- Formatted Data/Dengue.xlsx"

# Import data of the cases of mosquitos by region
excel_data <- readxl::read_xlsx("Mosquitos by region.xlsx")

# Import population data 
population_data <- readxl::read_xlsx("fr_population.region.departement.xlsx")

# Convert the "code" column in population and mosquitos data to character
excel_data$code <- as.character(excel_data$code)
population_data$code <- as.character(population_data$code)

# Join
mosquitos_df <- left_join(population_data, excel_data, by = "code")

#Create the indicator: dengue per million habitants
mosquitos_df$pop_millions <- mosquitos_df$`1er janvier 2024 (p)` / 1000000
mosquitos_df$dengue_pop <- mosquitos_df$Dengue / mosquitos_df$pop_millions

# Filter variables
dengue_df <- mosquitos_df %>% select(code, dengue_pop)

#Format dataframe 
dengue_df$scale <- "Regions"
dengue_df <- dengue_df %>% rename(code_insee = code)

# Save indicator
write_xlsx(dengue_df, path=path_export)
