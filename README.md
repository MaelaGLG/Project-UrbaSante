# Projet Urbasanté - ECOLAB

Ce projet est le résultat d'une collaboration entre le MSc&T "Data and Economics for Public Policy" (École Polytechnique, ENSAE & Telecom), et ECOLAB, le laboratoire d’innovation pour la transition écologique du Commissariat Général au Développement Durable.

Dans ce cadre, un challenge a été proposé aux étudiant.es du master : construire un outil d'observation et d'analyse des différents déterminants de santé en lien avec l'aménagement du territoire à une maille fine du territoire. 

## Constat 
En agissant sur les différents déterminants de santé, l'aménagement du territoire excerce une influence significative sur la santé des populations. Globalement, en intervenant sur l'environnement, les habitudes de vie et les comportements, il est estimé que l'aménagement du territoire peut affecter jusqu'à 60% de la santé d'un individu (Barton et al., 2015). Cependant, dans le contexte actuel de changement climatique, les services et le cadre de vie fournis par les écosystèmes urbains risquent de se détériorer considérablement, entraînant des conséquences sur la santé publique. Or, la santé et l'environnement sont souvent gérés de manière indépendante au sein des territoires, avec peu d'interaction entre les deux domaines. Pourtant, les avantages potentiels pour la santé publique sont significatifs. Selon Santé Publique France, près d'un tiers des cancers pourraient être évités en modifiant les habitudes de vie de la population. 

Face à ce constat, il est nécessaire d'accompagner les décideurs locaux en leur fournissant un outil de sensibilisation, afin de les aider à mieux appréhender la thématique santé-aménagement. L'objectif de l'outil est ainsi d'accompagner les collectivités locales dans la réalisation de diagnostics en santé- aménagement de leurs territoires, en proposant une restitution des différents déterminants de santé à travers une plateforme de données cartographiques mettant en lumière des indicateurs en lien avec la santé-aménagement à une maille fine du territoire et pour l'ensemble de la France métropolitaine.

## **Construction des Indicateurs de Santé-Environnement**

Nous avons compilé ou construit, à partir de différentes sources administratives, 29 indicateurs répartis entre 11 déterminants de santé-environnement. 

# Indicateurs de Déterminants Environnementaux et Sociaux

| **Déterminant**                        | **Indicateur**                             | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|----------------------------------------|--------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Qualité de l'air**                   | Qualité de l'Air (ATMO score)              | L'indicateur ATMO fournit au niveau de la France, à une résolution minimale d'Iris (INSEE), le pourcentage de jours de l'année avec un score ATMO au-delà de 3 sur 6 dans une fourchette de 0 % à 100 % pour l'année de référence 2023. L'extraction des données a été faite à partir de données provenant du site Geod'Ai.                                                                                                                                                                                                                                                                                         |
| **Qualité de l'air**                   | Indicateur Ozone (SOMO35)                  | L'indicateur SOMO35 fournit au niveau de la France, à une résolution minimale d'Iris (INSEE), la somme annuelle de concentrations journalières de O3 supérieures à 35ppb pour l'année de référence 2023. L'extraction des données a été faite à partir de données provenant du site Geod'Ai.                                                                                                                                                                                                                                                                               |
| **Gestion des eaux**                   | Qualité des Eaux Souterraines              | Les installations de stockage et cuves sont unifiées dans une base de données. Les scores sont attribués pour une zone de 1 km autour des sites avec une pondération basée sur la proximité des zones habitées : un poids plein pour les sites à moins de 250 m, réduit de moitié entre 250 et 500 m, etc. Le score final est calculé sur cette base pondérée (2020).                                                                                                                                                                                                                                                |
| **Gestion des eaux**                   | Sécheresse                                 | Cet indicateur mesure le risque de sécheresse en France pour 2024, avec une résolution minimale par commune. Il pondère le nombre de jours en alerte de sécheresse, vigilance renforcée ou crise. Les données sont issues d'observations météorologiques détaillées (data.gouv).                                                                                                                                                                                                                                                                                            |
| **Biodiversité**                       | Dengue                                     | Cet indicateur mesure le nombre de cas de dengue par million d'habitants par région, du 1er mai au 8 décembre 2023.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| **Biodiversité**                       | Pesticides CMR                             | L'indicateur des quantités de pesticides CMR achetées fournit au niveau de la France, à une résolution minimale au niveau des communes (INSEE), le total des substances en kilogrammes achetées par commune selon les catégories regroupant les substances. Les données ont été recueillies par code postal ; pour les obtenir par commune, des pondérations ont été attribuées aux communes partageant le même code postal. L'extraction des données a été effectuée à partir de sources officielles dédiées.                                                                                                                                 |
| **Biodiversité**                       | Pesticides Env. A                          |L'indicateur des quantités de pesticides Env A achetées fournit au niveau de la France, à une résolution minimale au niveau des communes (INSEE), le total des substances en kilogrammes achetées par commune selon les catégories regroupant les substances. Les données ont été recueillies par code postal ; pour les obtenir par commune, des pondérations ont été attribuées aux communes partageant le même code postal. L'extraction des données a été effectuée à partir de sources officielles dédiées.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **Biodiversité**                       | Pesticides Env. B                          |L'indicateur des quantités de pesticides Env B achetées fournit au niveau de la France, à une résolution minimale au niveau des communes (INSEE), le total des substances en kilogrammes achetées par commune selon les catégories regroupant les substances. Les données ont été recueillies par code postal ; pour les obtenir par commune, des pondérations ont été attribuées aux communes partageant le même code postal. L'extraction des données a été effectuée à partir de sources officielles dédiées.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **Biodiversité**                       | Pesticides Santé A                         |L'indicateur des quantités de pesticides Santé A achetées fournit au niveau de la France, à une résolution minimale au niveau des communes (INSEE), le total des substances en kilogrammes achetées par commune selon les catégories regroupant les substances. Les données ont été recueillies par code postal ; pour les obtenir par commune, des pondérations ont été attribuées aux communes partageant le même code postal. L'extraction des données a été effectuée à partir de sources officielles dédiées.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **Biodiversité**                       | Pesticides Santé Autres                          |L'indicateur des quantités de pesticides Autre achetées fournit au niveau de la France, à une résolution minimale au niveau des communes (INSEE), le total des substances en kilogrammes achetées par commune selon les catégories regroupant les substances. Les données ont été recueillies par code postal ; pour les obtenir par commune, des pondérations ont été attribuées aux communes partageant le même code postal. L'extraction des données a été effectuée à partir de sources officielles dédiées.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **Température**                        | Couvert Forestier                          | L'indicateur de couverture forestière fournit au niveau de la France, à une résolution minimale d'Iris (INSEE), le niveau de densité du couvert forestier dans une fourchette de 0 % à 100 % pour l'année de référence 2018. L'extraction des données a été faite à partir de rasters satellites provenant du site Copernicus.                                                                                                                                                                                                                                            |
| **Température**                        | Surface Imperméable                        | L'indicateur de densité d'imperméabilisation fournit au niveau de la France, à une résolution minimale d'Iris (INSEE), le niveau de densité d'imperméabilisation à travers le pays dans une fourchette de 0 % à 100 % pour l'année de référence 2018. L'extraction des données a été réalisée à partir de rasters satellites provenant du site Copernicus.                                                                                                                                                                                                                   |
| **Pollution lumineuse/luminosité**     | Radiance                                   | L'indicateur de radiance mesure la luminosité artificielle du ciel nocturne en microcandelas par mètre carré (mcd/m^2), offrant une évaluation du ratio entre l'éclairage artificiel et la luminosité naturelle du ciel à travers la France. Cet indicateur propose des valeurs allant de 0 à 11, allant de zones exemptes de pollution lumineuse à des régions où la pollution lumineuse surpasse de 11 fois les niveaux naturels, pour l'année de référence 2015. Les données sont issues du satellite NASA VIIRS.                                                                                       |

| **Sécurité**                           | Coups et Blessures Volontaires            | L'indicateur mesure le taux de coups et blessures volontaires sur personnes de 15 ans ou plus, aussi bien dans le cadre familial qu’en dehors de ce cadre, pour l'anée 2022. Les données sont issues du Service statistique ministériel de la sécurité intérieure (SSMSI).                                                                                                                                                                                                                                                                                                  |
 |
| **Sécurité**                           | Vols Sans Violence Contre des Personnes            | L'indicateur mesure le taux de vols sans violence contre des personnes, pour l'anée 2022. Les données sont issues du Service statistique ministériel de la sécurité intérieure (SSMSI).                                                                                                                                                                                                                                                                                                  |
 |
| **Sécurité**                           | Cambriolages de Logement            | L'indicateur mesure le taux de cambriolages de logement formellement reportés, pour l'anée 2022. Les données sont issues du Service statistique ministériel de la sécurité intérieure (SSMSI).                                                                                                                                                                                                                                                                                                 |
|
| **Sécurité**                           |      Usage de Stupéfiants       | L'indicateur mesure le taux d'usage de stupéfiants, pour l'anée 2022. Les données sont issues du Service statistique ministériel de la sécurité intérieure (SSMSI).                                                                                                                                                                                             |
| **Activité physique et sportive**      | Nombre d'Infrastructures Sportives Accessibles | Cet indicateur fournit le nombre d'infrastructures sportives accessibles à 15 minutes. Pour chaque commune, les isochrones représentant les zones accessibles en voiture dans un rayon de 15 minutes ont été générées en utilisant l'Open Source Routing Machine. Ensuite, la somme du nombre d'infrastructures sportives présentes à l'intérieur de l'isochrone a été calculée. Sources : Recensement des équipements sportifs, espaces et sites de pratiques.                                                                                                                                          |
| **Revenu**                             | Part des pers. âgées de 25 à 64            | Part (en %) de la population âgée de plus de 25 ans et moins de 64 ans pour l'année 2020. Les données sont issues de l'INSEE, Recensement de la population (RP 2020).                                                                                                                                                                                                                                                                                                                                                                                                     |

*Note : Ceci est un extrait. Le tableau complet peut être ajouté en fonction du contenu complet requis.*


Les indicateurs de l'application cartographique proviennent soit directement de sites administratifs, auquel cas la source utilisée est indiquée dans le dossier "data" dans le fichier du déterminant correspondant. Pour les indicateurs construits, la méthodologie et les étapes de reproduction sont détaillées dans les codes disponibles (R, Stata ou Python) dans le dossier "scr".


### **L'Application Cartographique**

Lors de l'exécution de l'outil de visualisation, veuillez vous assurer que vous avez téléchargé le fichier des indicateurs dans votre répertoire et que le chemin d'accès au fichier dans le code est modifié en fonction du chemin d'accès contenant ce fichier. L'outil de visualisation a été conçu en R, il utilise le package Rshiny.

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


### **Limites de l'outil**


Certaines données sont manquantes pour certains indicateurs, notamment au niveau IRIS, en raison du secret statistique lié à une faible population dans la maille d’analyse. Par ailleurs, une expertise ou une connaissance locale du territoire peut révéler des anomalies dues à des collectes de données incomplètes lors des étapes préalables à la construction des indicateurs. Ces anomalies peuvent également découler d’une faible population ou d’un volume insuffisant de données dans la maille d’analyse, ce qui peut biaiser certains indicateurs.


### **Structure des fichiers**
```
├── README.md <- The top-level README for developers using this project.
├── LICENSE <- Licence for the repository (by default, MIT)
├── app <- Scripts to run the app│
├── data
│   ├── 1- Raw Data <- Raw data files organized by determinant
│   ├── 2- Intermediate Data  <- Data files with the indicators already created
│   ├── 3- Formatted Data  <- Data files that have been cleaned and formatted for final use
│   ├── 4- Final Data  <- Final database with all the indicators
│   ├── linking tables  <- Additional tables used for processing some indicators
│   └── shapefiles  <- Shapefiles required to generate some indicators and the R Shiny map.
├── src <- Source code for use in this project.
│   ├── 1- Row --> Intermediate <- Scripts that process raw data and generate indicators.
│   ├── 2 - Interemediate --> Formatted <--  Scripts that process additional geographical formatting for specific indicators
│   └── 3 - Formatted --> Final <-- Script responsible for ensuring uniform formatting across all indicators
└── app <- Script to run the app
```

### **Contributions**

Si vous souhaitez contribuer à ce projet, merci de bien vouloir nous contacter:

Alfonso Awadalla-Carreño- alfonso.awadalla-carreno@polytechnique.edu
Jade Sillere - jade.sillere@polytechnique.edu
Julian Rojas - julian.rojas@polytechnique.edu
Maela Guillaume-Le Gall - maela.guillaume-le-gall@polytechnique.edu
Sofia Vaca - sofia.vaca@polytechnique.edu

### **Remerciements**

Nous tenons à remercier l'équipe d'ECOLAB pour avoir proposé ce défi et pour toute l'aide apportée au cours du développement de cet outil. Nous remercions en particulier Paul Grignon et Theo Sigiscar pour le temps qu'ils nous ont consacré et les conseils qu'ils nous ont prodigués tout au long de ce projet. Par ailleurs, ce projet a été réalisé dans le cadre du MSc&T in Data and Economics for Public Policy et nous tenons à remercier nos directeurs de master, Pierre Boyer et Franck Malherbet, pour avoir organisé ce challenge avec ECOLAB et pour leur soutien constant.


