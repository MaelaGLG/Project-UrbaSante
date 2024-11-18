# Scripts Directory
This folder contains the scripts used in the project. These scripts perform different tasks, including data processing, creation of indicators, formatting and developing an R Shiny App. 

The scripts are organized into three main folders, each serving a specific role in the data processing pipeline. Below is a breakdown of each folder’s purpose:

# 1- Row --> Intermediate
Purpose: This folder contains the scripts that process the raw data and create the indicators. 

Structure: The folder is organized by folders for each determinant, where each determinant folder has the scripts used for the creation of the indicators of this determinant. Each script creates the indicator and exports it. 

# 2- Intermediate --> Formatted
Purpose: This folder contains the scripts that format the indicators that needed extra formatting. This extra formatting was mainly for latitude/longitude data, were converting points into polygons at various scales was necessary.

Structure: Each indicator that needed an extra formatting has its own script.  

# 3- Formatted --> Final
Purpose: This folder contains the script that ensures that all the indicators have the same formatting and merges them.  

Structure: There is only one script in the folder. 

# How to Use:
To replicate the app there are two possible ways: 

# A. Start from the formated data
Start from the "3- Formatted --> Final" folder that formats and merges all the indicators created. 

# B. Starting from the raw data
1. Start with the raw data: Ensure that you have the different raw datasets ready in the format expected by the scripts in the 1- Row --> Intermediate folder.

2. Process the raw data: Run the scripts in the 1- Row --> Intermediate folder to create the indicators.

3. Format the indicators: After generating the indicators, use the scripts in the 2- Intermediate --> Formatted folder to format the ones that need an extra formatting.

4. Final processing: Run the scripts in the 3- Formatted --> Final folder to merge all the formatted data and produce the final dataset.
