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
These files can be found in the "raw" folder inside the Data files (except all_zones.shp) or downloadable:
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

-------------------------------------------------------------------------------------------------------------------

Cahier EcoLab2

Description

Le cahier EcoLab2.ipynb réalise une analyse géospatiale sur les zones environnementales en France, en étudiant la durée et la gravité des épisodes de sécheresse dans des zones géographiques spécifiques. L’analyse utilise des données provenant de fichiers GeoJSON et shapefiles, calcule des pondérations de risque basées sur les niveaux d’alerte, et visualise les résultats sur une carte de la France.

Contenu

Chargement et extraction des données

Charge les données d’un fichier GeoJSON (zones_arretes_en_vigueur.geojson) contenant les propriétés et les géométries des zones réglementées.
Extrait des attributs spécifiques (tels que id_arrete, id_zone, nom_zone, statut_arrete, geometry, etc.) et les sauvegarde dans un fichier CSV pour traitement ultérieur.

Analyse des données

Calcule la durée de validité de chaque zone en mesurant la différence en jours entre debut_validite_arrete (date de début) et fin_validite_arrete (date de fin).
Compte les occurrences des niveaux d’alerte uniques (par exemple, "Vigilance", "Alerte", etc.) et affiche leur fréquence.

Calcul des pondérations de risque

Attribue des pondérations aux différents niveaux d’alerte :
Vigilance : 0,25
Alerte renforcée : 0,5
Crise : 1
Calcule un score de risque pondéré basé sur les niveaux d’alerte pour chaque zone, en prenant en compte le nombre de jours où chaque niveau d’alerte est actif.
Agrège les pondérations de risque par id_zone pour fournir un score composite pour chaque zone.
Traitement des données géospatiales

Lit un shapefile (all_zones.shp) contenant les limites administratives de la France.
S’assure que les systèmes de référence des coordonnées (CRS) sont cohérents entre les ensembles de données.
Convertit un DataFrame en GeoDataFrame et effectue des jointures spatiales pour associer les données id_zone à des régions géographiques spécifiques en France.

Cartographie et visualisation

Superpose les pondérations de risque calculées sur une carte de la France en utilisant geopandas et matplotlib.
Génère des cartes montrant la distribution des jours d’alerte par id_zone, avec un code couleur indiquant différents niveaux de risque.
Effectue un zoom sur les principales zones d’intérêt (par exemple, la France métropolitaine) pour améliorer la visualisation.

Extraction des centroïdes et des coordonnées

Calcule les centroïdes pour chaque id_zone afin d’obtenir des points représentatifs.
Extrait et sauvegarde les coordonnées des centroïdes avec les pondérations de risque dans un fichier CSV pour une analyse ultérieure.
Pour les zones multi-polygones, traite chaque polygone et ses anneaux intérieurs séparément pour extraire toutes les coordonnées pertinentes avec leurs pondérations de risque.

Prérequis

Pour exécuter ce cahier, vous aurez besoin de :

Python 3
Jupyter Notebook ou Google Colab
Bibliothèques :
pandas et geopandas pour la manipulation des données et l’analyse géospatiale
shapely pour les opérations géométriques
matplotlib pour la visualisation
Utilisation

Placez les fichiers nécessaires dans le même répertoire que le cahier :

Fichier GeoJSON : zones_arretes_en_vigueur.geojson
Shapefile : all_zones.shp
Ces fichiers peuvent être trouvés dans le dossier "raw" des fichiers de données (sauf all_zones.shp) ou téléchargés ici: https://www.data.gouv.fr/fr/datasets/donnee-secheresse-propluvia/
Exécutez les cellules du cahier dans l’ordre pour charger, traiter, analyser et visualiser les données. Les cartes finales et les résultats seront affichés, et les fichiers de sortie sauvegardés.

Fichiers de sortie

zones_data.csv : Contient les propriétés extraites pour chaque zone réglementée.
France_regional.csv : Inclut le nombre de jours de validité calculé pour chaque zone.
coordinates_and_risk.csv : Sauvegarde les coordonnées des centroïdes et les pondérations de risque associées pour chaque zone.

Remarques

Cohérence des CRS : Assurez-vous que tous les fichiers géospatiaux utilisent le même CRS (par exemple, EPSG:4326) pour éviter les erreurs lors des jointures spatiales.
Calcul des pondérations de risque : Le poids du risque est basé sur une échelle personnalisée. Ajustez les catégories de distance et les pondérations si nécessaire.
Visualisation : Modifiez les valeurs minx, miny, maxx et maxy dans la section de cartographie si la vue de la carte nécessite des ajustements.

