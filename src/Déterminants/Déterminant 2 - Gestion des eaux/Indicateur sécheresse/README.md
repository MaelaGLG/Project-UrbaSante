EcoLab2 Notebook

Description

The EcoLab2.ipynb notebook performs geospatial analysis on environmental zones in France, analyzing the duration and severity of droughts within specified geographic areas. The analysis uses data from GeoJSON and shapefiles, calculates risk weights based on alert levels, and visualizes results on a map of France.

Contents

Data Loading and Extraction:

Loads data from a GeoJSON file (zones_arretes_en_vigueur.geojson) containing properties and geometries of regulated zones.
Extracts specific attributes (id_arrete, id_zone, nom_zone, statut_arrete, geometry, etc.) and saves them to a CSV file for further processing.
Data Analysis:

Calculates the validity duration of each zone by computing the difference in days between debut_validite_arrete (start date) and fin_validite_arrete (end date).
Counts occurrences of unique alert levels (e.g., "Vigilance", "Alerte", etc.) and displays the frequency of each level.

Risk Weight Calculation:

Assigns weights to different alert levels:
Vigilance: 0.25
Alerte renforcée: 0.5
Crise: 1
Calculates a weighted risk score based on alert levels for each zone, considering the number of days each alert level is active.
Aggregates risk weights by id_zone to provide a composite score for each area.
Geospatial Data Processing:

Reads a shapefile (all_zones.shp) containing France’s administrative boundaries.
Ensures coordinate reference systems (CRS) are consistent across datasets.
Converts DataFrame to GeoDataFrame and performs spatial joins to associate id_zone data with specific geographic regions in France.

Mapping and Visualization:

Overlays the calculated risk weights onto a map of France using geopandas and matplotlib.
Generates maps showing the distribution of alert days by id_zone, with color-coding to indicate different risk levels.
Zooms in on the main areas of interest (e.g., Metropolitan France) to improve visualization.
Centroid and Coordinate Extraction:

Calculates centroids for each id_zone to capture representative points.
Extracts and saves centroid coordinates along with risk weights to a CSV file for further analysis.
For multi-polygon areas, processes each polygon and its interior rings separately to extract all relevant coordinates with risk weights.

Requirements

To run this notebook, you need:

Python 3
Jupyter Notebook or Google Colab
Libraries:
pandas and geopandas for data manipulation and geospatial analysis
shapely for geometry operations
matplotlib for visualization

Usage

Place the necessary files:

GeoJSON file: zones_arretes_en_vigueur.geojson
Shapefile: all_zones.shp
These files can be found in the "raw" folder inside the Data files or downloadable:
https://www.data.gouv.fr/fr/datasets/donnee-secheresse-propluvia/

Run the notebook cells sequentially to load, process, analyze, and visualize the data.
The final maps and data outputs will display the distribution and intensity of alert zones across France.

Output Files

zones_data.csv: Contains the extracted properties for each regulated zone.
France_regional.csv: Includes calculated validity days for each zone.
coordinates_and_risk.csv: Saves centroid coordinates and associated risk weights for each zone.

Notes

CRS Consistency: Ensure that all geospatial files are in the same CRS (e.g., EPSG:4326) to avoid errors during spatial joins.
Risk Weight Calculation: The risk weight is based on a custom scale. Adjust the distance_categories and weights as needed.
Visualization: Modify the minx, miny, maxx, and maxy values in the plotting section if the map view needs adjustment.

