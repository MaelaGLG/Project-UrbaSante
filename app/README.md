# Application R-Shiny App

L'outil R-Shiny App est concu pour accompagner les collectivités locales dans la réalisation de diagnostics en santé- aménagement de leurs territoires, en proposant une restitution des différents déterminants de santé à travers une plateforme de données cartographiques mettant en lumière des indicateurs en lien avec la santé-aménagement à une maille fine du territoire et pour l'ensemble de la France métropolitaine.

## Installation

Lors de l'exécution de l'outil de visualisation, veuillez vous assurer que vous avez téléchargé le fichier des indicateurs dans votre répertoire et que le chemin d'accès au fichier dans le code est modifié en fonction du chemin d'accès contenant ce fichier.

L'outil de visualisation a été conçu en R, il utilise le package Rshiny. Par conséquent, avant d'exécuter et d'éditer le code, assurez-vous que les paquets suivants sont installés (Veuillez-exécuter le fichier installation_de_paquets) :

install.packages("raster")
install.packages("sp")
install.packages("tmap")
install.packages("sf")
install.packages("dplyr")
install.packages("here")
install.packages("readr")
install.packages("readxl")
install.packages("shiny")
install.packages("leaflet")
install.packages("RColorBrewer")
install.packages("rmapshaper")
install.packages("shinythemes")

En outre, veuillez vous assurer que les fichiers de forme IRIS, communaux, départementaux et régionaux produits par l'INSEE se trouvent dans votre répertoire de travail. Ceux-ci se trouvent dans le dossier shapefiles (Note : pour plus d'informations sur la structure, veuillez consulter la section sur la structure des fichiers ci-dessous).

## Conseils d'utilisation

Prenons un exemple pour expliciter l'utilisation de l'outil. Un utilisateur souhaite connaître l’indicateur de couvert forestier à l'echelle départementale à travers la France métropolitaine. 

L’utilisateur sélectionne donc :
 
* Choisir un déterminant : Température
* Choisir un indicateur : Couvert Forestier
* Choisir une échelle : Departement

Et si un utilisateur souhaite connaître l’indicateur de couvert forestier à l'echelle communale dans un département (par example L'Essonne) et puis focaliser sur une commune (Palaiseau). 

L’utilisateur sélectionne donc :
 
* Choisir un déterminant : Température
* Choisir un indicateur : Couvert Forestier
* Choisir une échelle : Communes
* Choisir département à visualiser : Essonne
* Choisir localisation : Palaiseau

## Coordonnées

Si vous trouvez des erreurs dans le code, ou vous avez des améliorations à nous suggérer, n'hésitez pas à nous contacter en utilisant les courriels suivants : 

Awadalla Carreño Alfonso - alfonso.awadalla-carreno@polytechnique.edu
Jade Sillere - jade.sillere@polytechnique.edu
Julian Rojas - julian.rojas@polytechnique.edu
Maela Guillaume-Le-Gall - maela.guillaume-le-gall@polytechnique.edu
Sofia Vaca - sofia.vaca@polytechnique.edu
