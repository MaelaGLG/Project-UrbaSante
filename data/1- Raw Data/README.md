# Données brutes
Ce dossier contient les données brutes du projet, organisées par déterminant.

Les petits fichiers de données ont été inclus directement dans leur dossier déterminant respectif. Pour les fichiers plus importants, les bases de données proprement dites ne sont pas stockées ici. Au lieu de cela, un fichier README a été fourni pour chaque indicateur, contenant des instructions détaillées sur la façon de télécharger les bases de données requises.

# Raw Data
This folder contains the raw data for the project, organized by determinant.

For smaller data files, they have been included directly in their respective determinant folder. For larger files, the actual databases are not stored here. Instead, a README file has been provided for each indicator, containing detailed instructions on how to download the required databases.



Here is the list of processed incators and their raw and intermediate sources : 

Determinant 10 - Accès à l'emploi, aux services et aux équipements
processed : nb_equipements_prox_communes
raw : bpe21_ensemble_xy -> Source before processed : Base permanente des équipements 2021
https://www.insee.fr/fr/metadonnees/source/operation/s2077/bases-donnees-ligne
intermediate : To process the data, you need to use pass-through tables to select ‘proximity’, ‘intermediate’ or ‘superior’ services. These were downloaded from the same site as before and are in the ‘intermediate’ file.

Determinant 11 - Activité physiques et sportives
processed : nb_equipements_sport_communes
raw : equipements_sportifs -> Source before processed : Recensement des équipements sportifs, espaces et sites de pratiques. 
https://www.data.gouv.fr/fr/datasets/recensement-des-equipements-sportifs-espaces-et-sites-de-pratiques/




Here is the list of raw indicators (no processing required) and their sources :

Déterminant 9 - Sécurité 
Indicators found on "Statistiques locales" website
- indicateurs_securité__depart
- indicateurs_securité_communes
- indicateurs_securité_regions 
https://statistiques-locales.insee.fr/#c=indicator&view=map3

Determinant 10 - Accès à l'emploi, aux services et aux équipements
Indicators found on "Statistiques locales" website
- indicateurs_eloignement_communes
- indicateurs_eloignement_depart
- indicateurs_eloignement_regions
https://statistiques-locales.insee.fr/#c=indicator&view=map3

Indicator found on "Vélo et territoires" website
- taux_cyclabilité_2022_commune
https://www.velo-territoires.org/actualite/2022/05/11/indicateur-de-cyclabilite/#


Déterminant 12 - Alimentation
Indicator found on the Observatoire des Territoires website : 
- taux_parcelles_bio_2020_communes
http://prod1-as-datar.integra.fr/part-des-surfaces-agricoles-biologiques-arrivees-au-terme-de-leur-conversion-dans-la-surface-0

Determinant 13 - Habitat
Indicators found on "Statistiques locales" website
- suroccupation_logement_communes
- suroccupation_logement_depart
- suroccupation_logement_regions 
https://statistiques-locales.insee.fr/#c=indicator&view=map3

Determinant 14 - Revenu
Indicators found on "Statistiques locales" website
- mixité_générationnelle_commmunes
- mixité_générationnelle_départ
- mixité_générationnelle_regions
https://statistiques-locales.insee.fr/#c=indicator&view=map3
