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

# CHANGE DIRECTORY TO WHERE THE FILES ARE SAVED
getwd()
setwd("C:/Users/sofia/OneDrive/Documentos/Master/Ecolab")

# Read your data with the variable of interest from Excel
excel_data <- readxl::read_xlsx("Mosquitos by region.xlsx")

# Read your data with the variable of interest from Excel
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

# Save database
saveRDS(dengue_df, "dengue_df.rds")
