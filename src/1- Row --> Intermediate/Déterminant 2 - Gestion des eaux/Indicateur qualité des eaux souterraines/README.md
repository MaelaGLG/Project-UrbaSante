EcoLab1 Notebook

### Description ###

This notebook, EcoLab1.ipynb, is designed to process environmental data from JSON and GeoJSON files. The code extracts relevant information about pollution sites, merges it with spatial data, and calculates weighted scores based on pollution and proximity to population centers. It uses geospatial analysis techniques to assess environmental risk factors.

 ### Contents ###

### Data Extraction ###

Extracts specific fields such as code_activite_icpe, origine_pollution, type_pollution, produits, etat_site, and code_insee from the JSON file containing site descriptions.
Saves extracted data into a CSV file for further analysis.

### Data Analysis ###

Counts unique values for etat_site (state of each site) and calculates occurrences.
Defines weights based on the state of pollution sites, and calculates a weighted score based on site conditions.
Geospatial 

### Analysis ###

Extracts geographical coordinates (x and y) from a GeoJSON file.
Merges this spatial data with the previously extracted pollution data using the code_insee field as a key.
Reprojects the data into a projected coordinate system for accurate distance measurement.
Calculates distances from each site to nearby population centers and assigns distance-based weights.
Computes an aggregated score by combining site conditions and proximity to population centers.

### Output ###

Extracted Data in CSV (extracted_data.csv): Contains relevant fields from the JSON file, such as code_activite_icpe, origine_pollution, type_pollution, produits, etat_site, and code_insee.

Unique etat_site Counts (Printed Output): Shows the different values of etat_site (site conditions) and the number of occurrences for each. Useful for understanding the distribution of site statuses.

Weighted Score (Printed Output): A calculated score based on the etat_site values, using defined weights. This represents the general condition of pollution sites based on their monitoring status.

Merged Data in CSV (merged_data.csv): Combines extracted site information with spatial data (coordinates and code_insee) from the GeoJSON file. This file is the primary dataset for further analysis.

Final Aggregated Score (Printed Output):A single score representing environmental risk, calculated by combining site conditions (etat_site) with distance-based weights to population centers. This final score can help assess overall environmental impact.

### Requirements ###

To run this notebook, you will need:

Python 3
Jupyter Notebook or Jupyter Lab

Libraries:
json for JSON file handling
csv for CSV file handling
pandas for data manipulation
geopandas and shapely for geospatial analysis

Usage

Place the JSON file (BASOL.json) and GeoJSON file (icpe.geojson) in the same directory as the notebook or adjust file paths as needed. These files are included in the "raw" folder within the Data files.
The data can also be found:
BASOL :
https://www.data.gouv.fr/fr/datasets/base-des-sols-pollues/
ICPE :
https://www.data.gouv.fr/fr/datasets/base-des-installations-classees-icpe/

Run the notebook cells sequentially to process the data, calculate scores, and analyze geospatial relationships.
The final results, including the weighted adjusted score, will be printed, and the merged data will be saved to merged_data.csv.

Notes

Ensure that the coordinate system is appropriately defined when working with spatial data. The code uses EPSG:2154 as an example of a projected CRS for accurate distance calculations.
Adjust the distance_categories and distance_weights in the code to reflect real-world distance thresholds relevant to your analysis.

