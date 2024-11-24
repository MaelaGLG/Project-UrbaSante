# Indicateur "Nombre d'Infrastructures Sportives Accessibles"

Cet indicateur fournit le nombre d'infrastructures sportives accessibles à 15 minutes. Pour chaque commune, les isochrones représentant les zones accessibles en voiture dans un rayon de 15 minutes ont été générées en utilisant l'Open Source Routing Machine. Ensuite, la somme du nombre d'infrastructures sportives présentes à l'intérieur de l'isochrone a été calculée. 

Pour reconstruire cet indicateur, vous devez télécharger la Base Recensement des équipements sportifs, espaces et sites de pratiques :  https://www.data.gouv.fr/fr/datasets/recensement-des-equipements-sportifs-espaces-et-sites-de-pratiques/ 

Vous devez ensuite nommmer le fichier "equipements_sportifs.csv" et le déposer dans le fichier correspondant : `data/1- Raw Data/Déterminant 11 - Activités physiques et sportives`

Vous devez également vérifié que le fichier suivant est bien dans le répertoir correspondant: 
- `data/linking tables/liaison - carto communes/carto_communes.csv` (correspondant à un dataset des centroïdes des communes françaises, nécessaire pour calculer les isochrones).
___

# Indicator "Number of Accessible Sports Facilities"
This indicator provides the number of sports facilities accessible within a 15-minute drive. For each municipality, isochrones representing areas accessible by car within a 15-minute radius were generated using the Open Source Routing Machine. Then, the total number of sports facilities within the isochrone was calculated.

To recreate this indicator, you need to download the Sports Facilities, Spaces, and Practice Sites Census Database from:
https://www.data.gouv.fr/en/datasets/recensement-des-equipements-sportifs-espaces-et-sites-de-pratiques/

You must then rename the file to "equipements_sportifs.csv"  and place it in the corresponding directory: `data/1- Raw Data/Déterminant 11 - Activités physiques et sportives`


You must also ensure the following file is in the corresponding directory:

- `data/linking tables/liaison - carto communes/carto_communes.csv` (corresponding to a dataset of French municipality centroids, necessary for calculating the isochrones).
