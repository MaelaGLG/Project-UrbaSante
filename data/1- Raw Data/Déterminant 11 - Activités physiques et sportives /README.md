# Indicateur "Nombre d'Infrastructures Sportives Accessibles",

Cet indicateur fournit le nombre d'infrastructures sportives accessibles à 15 minutes. Pour chaque commune, les isochrones représentant les zones accessibles en voiture dans un rayon de 15 minutes ont été générées en utilisant l'Open Source Routing Machine. Ensuite, la somme du nombre d'infrastructures sportives présentes à l'intérieur de l'isochrone a été calculée. Sources : Recensement des équipements sportifs, espaces et sites de pratiques.

. https://www.data.gouv.fr/fr/datasets/recensement-des-equipements-sportifs-espaces-et-sites-de-pratiques/

Pour reconstruire cet indicateur, vous devez télécharger la Base Permanente des équipements 2021 sur le site de l'INSEE :  https://www.insee.fr/fr/metadonnees/source/operation/s2077/bases-donnees-ligne 

Vous devez également vérifié que les fichiers suivant sont bien dans les répertoirs correspondants: 
- `data/linking tables/liaison - carto communes/carto_communes.csv` (correspondant à un dataset des centroïdes des communes françaises, nécessaire pour calculer les isochrones).
- `data/linking tables/liaison - part_population_eloignee\table_passage_equipements_prox.xlsx` (correspondant à la table de passage des équipements de proximité, nécessaire pour sélectionner les équipements de proximité).

___

