# Application R-Shiny App

L'outil R-Shiny App est concu pour accompagner les collectivités locales dans la réalisation de diagnostics en santé- aménagement de leurs territoires, en proposant une restitution des différents déterminants de santé à travers une plateforme de données cartographiques mettant en lumière des indicateurs en lien avec la santé-aménagement à une maille fine du territoire et pour l'ensemble de la France métropolitaine.

## Installation

Lors de l'exécution de l'outil de visualisation, assurez-vous que le fichier **"final_indicators.rds"** est bien présent dans le dossier "**data/4 - Final Data"**.

Vérifiez également que les fichiers shapefiles correspondant aux formes IRIS, communales, départementales et régionales, produits par l'INSEE, se trouvent dans le dossier **"data/Shapefiles"**. Ces shapefiles doivent être téléchargés directement en ligne en suivant les instructions des fichiers README fournis avec chaque shapefile.

Enfin, modifiez manuellement les chemins d'accès à ces données au début du script de l'application.



# R-Shiny App

The R-Shiny App tool is designed to support local authorities in conducting health-diagnostic assessments and urban planning of their territories by providing an overview of various health determinants through a mapping data platform. This platform highlights indicators related to health and urban planning at a fine-grained territorial level across metropolitan France.

## Installation

When running the visualization tool, ensure that the file "final_indicators.rds" is present in the "data/4 - Final Data" folder.

Also, verify that the shapefiles for IRIS, municipal, departmental, and regional boundaries, produced by INSEE, are located in the "data/Shapefiles" folder. These shapefiles should be downloaded directly online by following the instructions in the README files included with each shapefile.

Finally, manually update the paths to these data at the beginning of the script.

## Usage Instructions

Let’s take an example to explain how to use the tool. A user wants to know the forest cover indicator at the departmental level across metropolitan France.

The user selects:

-   Choose a determinant: Temperature

-   Choose an indicator: Forest Cover

-   Choose a scale: Department

If a user wants to know the forest cover indicator at the municipal level in a department (e.g., Essonne) and then focus on a specific municipality (e.g., Palaiseau), they would select:

-   Choose a determinant: Temperature

-   Choose an indicator: Forest Cover

-   Choose a scale: Municipalities

-   Choose department to visualize: Essonne

-   Choose location: Palaiseau

