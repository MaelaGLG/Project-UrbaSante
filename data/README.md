# Data
Ce dossier contient tous les fichiers de données nécessaires au projet, organisés selon les différentes étapes de traitement. Les données sont divisées en plusieurs dossiers en fonction de leur état, de la donnée brute à la version finale formatée utilisée dans l'application R Shiny.

## Structure des Dossiers

### Raw Data :

Contient les fichiers de données brutes organisés par déterminant. Pour les fichiers plus petits, les données sont directement stockées ici. Pour les fichiers plus volumineux, seules les instructions sur la façon de télécharger les bases de données nécessaires sont fournies.

### Intermediate Data : 
Contient les fichiers de données avec les indicateurs déjà créés. Ces fichiers ont subi un traitement initial et contiennent les résultats intermédiaires prêts pour un formatage ultérieur.

### Formatted Data : 
Contient les fichiers de données qui ont été nettoyés et formatés pour une utilisation finale. Chaque fichier correspond à un indicateur spécifique et est utilisé dans les scripts 3- Formatted --> Final du dossier src pour la fusion finale et l'intégration dans l'application R Shiny.

### Final Data : 
Contient la base de données finale avec tous les indicateurs, prête à être utilisée dans la dernière étape du projet.

### Linking Tables : 
Contient des tables supplémentaires utilisées pour certains indicateurs. Ces tables sont nécessaires pour effectuer des liaisons et des traitements supplémentaires des données.

### Shapefiles : 
Contient les shapefiles nécessaires à la création de la carte dans l'application R Shiny.

# Data 
This folder contains all the necessary data files for the project, organized across multiple stages of processing. The data is divided into different folders based on its current state, from raw data through to final formatted files used in the R Shiny app.

## Folder Structure
### Raw Data: 

Contains the raw data files organized by determinant. For smaller files, the data is directly stored here. For larger files, only instructions on how to download the required databases are provided.

### Intermediate Data: 

Contains data files with the indicators already created. These files have undergone initial processing and contain the intermediate results ready for further formatting.

### Formatted Data: 

Contains the data files that have been cleaned and formatted for final use. Each file corresponds to a specific indicator and is used in the 3- Formatted --> Final scripts in the src folder for final merging and inclusion in the R Shiny app.

### Final Data: 
Contains the final database with all the indicators, ready for use in the final stage of the project.

### Linking Tables: 
Contains additional tables used for some indicators. These tables are necessary for linking and further processing of the data.

### Shapefiles: 
Contains the shapefiles required to generate the map in the R Shiny app.


















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
