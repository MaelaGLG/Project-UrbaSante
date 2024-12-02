# Application R-Shiny App

L'outil R-Shiny App est concu pour accompagner les collectivités locales dans la réalisation de diagnostics en santé- aménagement de leurs territoires, en proposant une restitution des différents déterminants de santé à travers une plateforme de données cartographiques mettant en lumière des indicateurs en lien avec la santé-aménagement à une maille fine du territoire et pour l'ensemble de la France métropolitaine.

## Installation

Lors de l'exécution de l'outil de visualisation, assurez-vous que le fichier **"final_indicators.rds"** est bien présent dans le dossier "**data/4 - Final Data"**.

Vérifiez également que les fichiers shapefiles correspondant aux formes IRIS, communales, départementales et régionales, produits par l'INSEE, se trouvent dans le dossier **"data/Shapefiles"**. Ces shapefiles sont déjà présents, mais s'ils devaient être mis à jour avec de nouvelles versions, assurez-vous que les chemins (ou noms de fichiers) correspondent au script.

## Fonctionnement de l'application

Prenons un exemple pour expliciter le fonctionnement de l'application cartographique : 

1) Un utilisateur souhaite connaître l’indicateur de couvert forestier à l'echelle départementale à travers la France métropolitaine. L’utilisateur sélectionne donc :
 
* Choisir un déterminant : Température
* Choisir un indicateur : Couvert Forestier
* Choisir une échelle : Département

2) Un utilisateur souhaite connaître l’indicateur de couvert forestier à l'échelle communale (ex: Palaiseau). L’utilisateur sélectionne donc :
 
* Choisir un déterminant : Température
* Choisir un indicateur : Couvert Forestier
* Choisir une échelle : Communes
* Choisir département à visualiser : Essonne
* Choisir localisation : Palaiseau

La cartographie utilise un dégradé de couleurs pour représenter l'indicateur sélectionné à la résolution spatiale choisie. Les valeurs les plus basses (dans l'un des sept intervalles possibles) sont affichées en violet, et les valeurs les plus élevées en jaune.

___



# R-Shiny App

The R-Shiny App tool is designed to support local authorities in conducting health-diagnostic assessments and urban planning of their territories by providing an overview of various health determinants through a mapping data platform. This platform highlights indicators related to health and urban planning at a fine-grained territorial level across metropolitan France.

## Installation

When running the visualization tool, ensure that the file "final_indicators.rds" is present in the "data/4 - Final Data" folder.

Also, verify that the shapefiles for IRIS, municipal, departmental, and regional boundaries, produced by INSEE, are located in the "data/Shapefiles" folder. These shapefiles are already present, but if they need to be updated with new versions, make sure the paths (or file names) match the script.

## Usage Instructions

Let's take an example to explain how the mapping application works: 

1) A user wants to know the forest cover indicator at departmental level across mainland France. The user selects :
 
* Choose a determinant : Temperature
* Choose an indicator: Forest cover
* Choose a scale: Department

2) A user wants to know the forest cover indicator at the local level (e.g. Palaiseau). The user therefore selects :
 
* Choose a determinant : Temperature
* Choose an indicator: Forest cover
* Choose a scale: Communes
* Choose a department to view: Essonne
* Choose location: Palaiseau

The map uses a colour gradient to represent the selected indicator at the chosen spatial resolution. The lowest values (in one of the seven possible ranges) are displayed in purple, and the highest values in yellow.

