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

SOUTERRAINE_weights.csv: Contains adjusted weighted scores for pollution sites, considering site conditions and distance from population centers.

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

-------------------------------------------------------------------------------------------------------------------

Cahier EcoLab1

Description 

Ce cahier, EcoLab1.ipynb, est conçu pour traiter des données environnementales à partir de fichiers JSON et GeoJSON. Le code extrait des informations pertinentes sur les sites pollués, les fusionne avec des données spatiales, et calcule des scores pondérés basés sur la pollution et la proximité avec les centres de population. Il utilise des techniques d'analyse géospatiale pour évaluer les facteurs de risque environnementaux.

Contenu

Extraction des données

Extrait des champs spécifiques tels que code_activite_icpe, origine_pollution, type_pollution, produits, etat_site et code_insee à partir du fichier JSON contenant les descriptions des sites.
Sauvegarde les données extraites dans un fichier CSV pour une analyse ultérieure.

Analyse des données

Compte les valeurs uniques pour etat_site (état de chaque site) et calcule leurs occurrences.
Définit des pondérations basées sur l'état des sites pollués et calcule un score pondéré en fonction des conditions des sites.

Analyse 

Extrait les coordonnées géographiques (x et y) à partir d’un fichier GeoJSON.
Fusionne ces données spatiales avec les données de pollution précédemment extraites en utilisant le champ code_insee comme clé.
Reprojette les données dans un système de coordonnées projeté pour des mesures de distance précises.
Calcule les distances entre chaque site et les centres de population proches, et attribue des pondérations basées sur ces distances.
Produit un score agrégé en combinant les conditions des sites et leur proximité avec les centres de population.

Résultats

Données extraites en CSV (extracted_data.csv) : Contient les champs pertinents du fichier JSON, tels que code_activite_icpe, origine_pollution, type_pollution, produits, etat_site et code_insee.

Compte des valeurs uniques de etat_site (Affichage des résultats) : Montre les différentes valeurs de etat_site (conditions des sites) et le nombre d'occurrences pour chacune. Utile pour comprendre la répartition des états des sites.

Score pondéré (Affichage des résultats) : Un score calculé basé sur les valeurs de etat_site, en utilisant des pondérations définies. Ce score représente la condition générale des sites pollués en fonction de leur statut de surveillance.

Données fusionnées en CSV (merged_data.csv) : Combine les informations des sites extraites avec les données spatiales (coordonnées et code_insee) provenant du fichier GeoJSON. Ce fichier constitue l'ensemble de données principal pour une analyse approfondie.

Score agrégé final (Affichage des résultats) : Un score unique représentant le risque environnemental, calculé en combinant les conditions des sites (etat_site) avec des pondérations basées sur la distance aux centres de population. Ce score final permet d'évaluer l'impact environnemental global.

SOUTERRAINE_weights.csv : Contient les scores pondérés ajustés pour les sites pollués, en tenant compte des conditions des sites et de leur distance par rapport aux centres de population.

Prérequis

Pour exécuter ce cahier, vous aurez besoin de :

Python 3
Jupyter Notebook ou Jupyter Lab
Bibliothèques :
json pour le traitement des fichiers JSON
csv pour le traitement des fichiers CSV
pandas pour la manipulation des données
geopandas et shapely pour l'analyse géospatiale

Utilisation

Placez le fichier JSON (BASOL.json) et le fichier GeoJSON (icpe.geojson) dans le même répertoire que le cahier ou ajustez les chemins des fichiers si nécessaire. Ces fichiers sont inclus dans le dossier "raw" des fichiers de données. Vous pouvez également trouver les données ici :

BASOL :
https://www.data.gouv.fr/fr/datasets/base-des-sols-pollues/
ICPE :
https://www.data.gouv.fr/fr/datasets/base-des-installations-classees-icpe/

Exécutez les cellules du cahier dans l'ordre pour traiter les données, calculer les scores et analyser les relations géospatiales. Les résultats finaux, y compris le score pondéré ajusté, seront affichés, et les données fusionnées seront sauvegardées dans merged_data.csv.

Remarques

Assurez-vous que le système de coordonnées est correctement défini lors de l'utilisation des données spatiales. Le code utilise EPSG:2154 comme exemple de système de coordonnées projeté pour des calculs de distance précis.
Ajustez les distance_categories et distance_weights dans le code pour refléter les seuils de distance réels pertinents pour votre analyse.

