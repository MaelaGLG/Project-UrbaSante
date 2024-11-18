# Répertoire des scripts
Ce répertoire contient tous les scripts utilisés dans le projet. Ces scripts couvrent des tâches telles que le traitement des données, la création, le formatage et la fusion des indicateurs. 

Les scripts sont classés dans trois dossiers principaux, chacun représentant une étape spécifique du processus de traitement des données. Vous trouverez ci-dessous un aperçu de l'objectif et de la structure de chaque dossier :

# 1- Raw --> Intermediate
Objectif :
Ce dossier contient des scripts qui traitent les données brutes et génèrent des indicateurs.

Structure :
Le dossier est organisé en sous-dossiers, chacun correspondant à un déterminant spécifique.
Chaque dossier de déterminant contient des scripts responsables de la création d'indicateurs pour ce déterminant. Ces scripts traitent les données brutes, génèrent les indicateurs et les exportent.

# 2- Intermediate --> Formatted
Objectif :
Les scripts de ce dossier gèrent le formatage supplémentaire d'indicateurs spécifiques, comme la conversion de points de latitude/longitude en polygones à différentes échelles.

Structure :
Chaque indicateur nécessitant un formatage supplémentaire dispose d'un script dédié dans ce dossier.

# 3- Formatted --> Final
Objectif :
Ce dossier contient le script chargé d'assurer un formatage uniforme de tous les indicateurs et de les fusionner dans un ensemble de données final.

Structure :
Ce dossier contient un script unique qui effectue le traitement final et la fusion.

# Comment l'utiliser :
Vous pouvez reproduire l'application en utilisant l'une des deux approches suivantes :

# A. Partir des données formatées
Si vous avez déjà des données formatées, utilisez le script dans le dossier  '3- Formatted --> Final' pour fusionner tous les indicateurs.

# B. Partir des données brutes
1. Préparer les données brutes :

Assurez-vous que tous les ensembles de données brutes sont disponibles et correspondent au format d'entrée attendu pour les scripts du dossier '1- Raw --> Intermediate'.

2. Générez des indicateurs :
Exécutez les scripts dans le dossier '1- Raw --> Intermediate'. pour créer les indicateurs nécessaires.

3. Formatez des indicateurs spécifiques :
Utilisez les scripts du dossier '2. Intermediate → Formatted' pour appliquer un formatage supplémentaire aux indicateurs qui le nécessitent.

4. Fusionnez et finalisez :
Exécutez le script dans le dossier « 3. Formatted → Final » pour fusionner tous les indicateurs formatés dans l'ensemble de données final.

# Scripts Directory
This directory contains all the scripts used in the project. These scripts cover tasks such as data processing, creation, formatting and merging of the indicators. 

The scripts are categorized into three main folders, each representing a specific stage in the data processing pipeline. Below is an overview of each folder’s purpose and structure:


# 1- Raw --> Intermediate
Purpose:
This folder contains scripts that process raw data and generate indicators.

Structure:
The folder is organized into subfolders, each corresponding to a specific determinant.
Each determinant folder contains scripts responsible for creating indicators for that determinant. These scripts process the raw data, generate the indicators, and export them.

# 2- Intermediate --> Formatted
Purpose:
Scripts in this folder handle additional formatting for specific indicators, such as converting latitude/longitude points into polygons at various scales.

Structure:
Each indicator requiring extra formatting has a dedicated script in this folder.

# 3- Formatted --> Final
Purpose:
This folder contains the script responsible for ensuring uniform formatting across all indicators and merging them into a final dataset.

Structure:
This folder contains a single script that performs the final processing and merging.

# How to Use:
You can replicate the app using one of two approaches:

# A. Start from the formated data
If you already have formatted data, use the script in the "3. Formatted → Final" folder to merge all the indicators.

# B. Starting from the raw data
1. Prepare the raw data:
Ensure all raw datasets are available and match the expected input format for the scripts in the "1. Raw → Intermediate" folder.

2. Generate indicators:
Run the scripts in the "1. Raw → Intermediate" folder to create the necessary indicators.

3. Format specific indicators:
Use the scripts in the "2. Intermediate → Formatted" folder to apply additional formatting to indicators that require it.

4. Merge and finalize:
Execute the script in the "3. Formatted → Final" folder to merge all the formatted indicators into the final dataset.
