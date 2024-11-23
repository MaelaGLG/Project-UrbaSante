# Procédure pour Construire les Indicateurs

## Explications

Les scripts **`Couvert Forestier Indicator.R`** et **`Surfaces Impermeables Indicator.R`** génèrent des indicateurs à partir de données raster (images géoréférencées) dans un format structuré. Le même modèle de script est utilisé pour les deux indicateurs, et la procédure détaillée pour les construire est décrite ci-dessous.

## Étapes pour Construire Chaque Indicateur

1.  **Télécharger les Données Nécessaires**\
    Téléchargez les données associées à l’indicateur spécifique. Consultez le fichier README situé à :\
    `./data/1- Raw Data/Déterminant 4 - Temperature/Couvert Forestier` ou `Surfaces Impermeables`.

2.  **Télécharger les Shapefiles pour Chaque Échelle**\
    Assurez-vous d’avoir téléchargé les shapefiles nécessaires pour toutes les échelles (iris, communes, départements, régions).\
    Les instructions pour les télécharger se trouvent dans le README du dossier correspondant sous :\
    `./data/shapefiles`.

3.  **Exécuter le Script**\
    Ouvrez le script approprié (**`Couvert Forestier Indicator.R`** ou **`Surfaces Impermeables Indicator.R`**).\
    Vérifiez que tous les chemins spécifiés au début du script sont corrects.\
    Exécutez le script pour générer l’indicateur.

4.  **Répétez pour l’Autre Indicateur**\
    Suivez les étapes ci-dessus pour chaque indicateur.

------------------------------------------------------------------------

# Procedure to Build Indicators

## Explanations

The scripts **`Couvert Forestier Indicator.R`** and **`Surfaces Impermeables Indicator.R`** generate indicators from raster data (georeferenced images) in a structured format. The same script template is used for both indicators, and the detailed procedure for building them is outlined below.

## Steps to Build Each Indicator

1.  **Download the Required Data**\
    Retrieve the data associated with the specific indicator. Refer to the README file located in:\
    `./data/1- Raw Data/Déterminant 4 - Temperature/Couvert Forestier` or `Surfaces Impermeables`.

2.  **Download Shapefiles for Each Scale**\
    Ensure you have downloaded the necessary shapefiles for all scales (e.g., iris, communes, départements, regions).\
    Instructions for downloading shapefiles can be found in the README of the corresponding folder under:\
    `./data/shapefiles`.

3.  **Run the Script**\
    Open the appropriate script (**`Couvert Forestier Indicator.R`** or **`Surfaces Impermeables Indicator.R`**).\
    Verify that all file paths specified at the beginning of the script are correct.\
    Execute the script to generate the indicator.

4.  **Repeat for the Other Indicator**\
    Follow the above steps for each indicator.
