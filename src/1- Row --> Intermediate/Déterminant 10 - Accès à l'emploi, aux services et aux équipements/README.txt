# Indicateur "Equipement de Proximité Accessibles",

Cet indicateur fournit le taux d'équipement de proximité accessibles à 6 minutes en voiture en 2021. Pour chaque commune, les isochrones représentant les zones accessibles en voiture dans un rayon de 6 minutes ont été générées en utilisant l'Open Source Routing Machine. Ensuite, le taux de services de proximité présents à l'intérieur de l'isochrone a été calculé (Base Permanente des Equipements INSEE).

Pour reconstruire cet indicateur, vous devez télécharger la Base Permanente des équipements 2021 sur le site de l'INSEE :  https://www.insee.fr/fr/metadonnees/source/operation/s2077/bases-donnees-ligne 

Vous devez également vérifié que les fichiers suivant sont bien dans les répertoirs correspondants: 
- `data/linking tables/liaison - carto communes/carto_communes.csv` (correspondant à un dataset des centroïdes des communes françaises, nécessaire pour calculer les isochrones).
- `data/linking tables/liaison - part_population_eloignee\table_passage_equipements_prox.xlsx` (correspondant à la table de passage des équipements de proximité, nécessaire pour sélectionner les équipements de proximité).

___


# Indicator "Accessible Proximity Equipment"
This indicator provides the rate of proximity equipment accessible within a 6-minute drive in 2021. For each municipality, isochrones representing areas accessible by car within a 6-minute radius were generated using the Open Source Routing Machine. Then, the rate of proximity services present within the isochrone was calculated (Permanent Equipment Database by INSEE).

To recreate this indicator, you need to download the 2021 Permanent Equipment Database from the INSEE website:
https://www.insee.fr/en/metadonnees/source/operation/s2077/bases-donnees-ligne

You must also ensure the following files are in the corresponding directories:
- `data/linking tables/liaison - carto communes/carto_communes.csv` (corresponding to a dataset of French municipality centroids, necessary for calculating the isochrones).
- `data/linking tables/liaison - part_population_eloignee/table_passage_equipements_prox.xlsx` (corresponding to the linking table for proximity equipment, necessary for selecting proximity services).
