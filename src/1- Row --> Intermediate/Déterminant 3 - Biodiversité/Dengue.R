#----------------------------------- INFO -------------------------------------#
# Author : Sofia Vaca
# Date	: November 2024
# Descr	: Generate an indicator of Dengue cases per million habitants
#------------------------------------------------------------------------------#


#----------------------------- Import Libraries -------------------------------#

packages <- c("sf", "dplyr", "leaflet", "readxl", "tmap", "openxlsx", "writexl")

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

# Path to dengue database
path = "..../data/1- Raw Data/Déterminant 3 - Biodiversité/Denge" # path to folder containing the database

# Path to folder where you want to save the indicator dataframe
path_export = "..../data/3- Formatted Data/Dengue.xlsx"

# Path to folder with the population excel 
path_population = "..../data/linking tables/liaison - population_regions/fr_population.region.departement.xlsx" # path to folder containing the database

# Path to the Excel file with mosquito data
excel_file_path <- file.path(path, "Mosquitos by region.xlsx")

# Import data of the cases of mosquitos by region
excel_data <- readxl::read_xlsx(excel_file_path)

# Import population data 
population_data <- readxl::read_xlsx(path_population)

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
