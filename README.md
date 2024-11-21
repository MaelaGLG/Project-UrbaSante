# Projet Urbasanté - ECOLAB

Ce projet est le résultat d'une collaboration entre le MSc&T "Data and Economics for Public Policy" (École Polytechnique, ENSAE & Telecom), et ECOLAB, le laboratoire d’innovation pour la transition écologique du Commissariat Général au Développement Durable.

Dans ce cadre, un challenge a été proposé aux étudiant.es du master : construire un outil d'observation et d'analyse des différents déterminants de santé en lien avec l'aménagement du territoire à une maille fine du territoire. 

## Constat 
En agissant sur les différents déterminants de santé, l'aménagement du territoire excerce une influence significative sur la santé des populations. Globalement, en intervenant sur l'environnement, les habitudes de vie et les comportements, il est estimé que l'aménagement du territoire peut affecter jusqu'à 60% de la santé d'un individu (Barton et al., 2015). Cependant, dans le contexte actuel de changement climatique, les services et le cadre de vie fournis par les écosystèmes urbains risquent de se détériorer considérablement, entraînant des conséquences sur la santé publique. Or, la santé et l'environnement sont souvent gérés de manière indépendante au sein des territoires, avec peu d'interaction entre les deux domaines. Pourtant, les avantages potentiels pour la santé publique sont significatifs. Selon Santé Publique France, près d'un tiers des cancers pourraient être évités en modifiant les habitudes de vie de la population. 

Face à ce constat, il est nécessaire d'accompagner les décideurs locaux en leur fournissant un outil de sensibilisation, afin de les aider à mieux appréhender la thématique santé-aménagement. L'objectif de l'outil est ainsi d'accompagner les collectivités locales dans la réalisation de diagnostics en santé- aménagement de leurs territoires, en proposant une restitution des différents déterminants de santé à travers une plateforme de données cartographiques mettant en lumière des indicateurs en lien avec la santé-aménagement à une maille fine du territoire et pour l'ensemble de la France métropolitaine.

## **Construction des Indicateurs de Santé-Environnement**

Nous avons compilé ou construit, à partir de différentes sources administratives, 29 indicateurs répartis entre 11 déterminants de santé-environnement. 
| **Déterminant**                        | **Indicateur**                             | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|----------------------------------------|--------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Qualité de l'air**                   | Qualité de l'Air (ATMO score)              | L'indicateur ATMO fournit au niveau de la France, à une résolution minimale d'Iris (INSEE), le pourcentage de jours de l'année avec un score ATMO au-delà de 3 sur 6 dans une fourchette de 0 % à 100 % pour l'année de référence 2023. L'extraction des données a été faite à partir de données provenant du site Geod'Ai.                                                                                                                                                                                                                                                                                         |
| **Qualité de l'air**                   | Indicateur Ozone (SOMO35)                  | L'indicateur SOMO35 fournit au niveau de la France, à une résolution minimale d'Iris (INSEE), la somme annuelle de concentrations journalières de O3 supérieures à 35ppb pour l'année de référence 2023. L'extraction des données a été faite à partir de données provenant du site Geod'Ai.                                                                                                                                                                                                                                                                               |
| **Gestion des eaux**                   | Qualité des Eaux Souterraines              | Les installations de stockage et cuves sont unifiées dans une base de données. Les scores sont attribués pour une zone de 1 km autour des sites avec une pondération basée sur la proximité des zones habitées : un poids plein pour les sites à moins de 250 m, réduit de moitié entre 250 et 500 m, etc. Le score final est calculé sur cette base pondérée (2020).                                                                                                                                                                                                                                                |
| **Gestion des eaux**                   | Sécheresse                                 | Cet indicateur mesure le risque de sécheresse en France pour 2024, avec une résolution minimale par commune. Il pondère le nombre de jours en alerte de sécheresse, vigilance renforcée ou crise. Les données sont issues d'observations météorologiques détaillées (data.gouv).                                                                                                                                                                                                                                                                                            |
| **Biodiversité**                       | Dengue                                     | Cet indicateur mesure le nombre de cas de dengue par million d'habitants par région, du 1er mai au 8 décembre 2023.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| **Biodiversité**                       | Pesticides CMR                             | L'indicateur des quantités de pesticides CMR achetées fournit au niveau de la France, à une résolution minimale au niveau des communes (INSEE), le total des substances en kilogrammes achetées par commune selon les catégories regroupant les substances. Les données ont été recueillies par code postal ; pour les obtenir par commune, des pondérations ont été attribuées aux communes partageant le même code postal. L'extraction des données a été effectuée à partir de sources officielles dédiées.                                                                                                                                 |
| **Biodiversité**                       | Pesticides Env. A                          | L'indicateur des quantités de pesticides Env A achetées fournit au niveau de la France, à une résolution minimale au niveau des communes (INSEE), le total des substances en kilogrammes achetées par commune selon les catégories regroupant les substances. Les données ont été recueillies par code postal ; pour les obtenir par commune, des pondérations ont été attribuées aux communes partageant le même code postal. L'extraction des données a été effectuée à partir de sources officielles dédiées.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **Biodiversité**                       | Pesticides Env. B                          | L'indicateur des quantités de pesticides Env B achetées fournit au niveau de la France, à une résolution minimale au niveau des communes (INSEE), le total des substances en kilogrammes achetées par commune selon les catégories regroupant les substances. Les données ont été recueillies par code postal ; pour les obtenir par commune, des pondérations ont été attribuées aux communes partageant le même code postal. L'extraction des données a été effectuée à partir de sources officielles dédiées.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **Biodiversité**                       | Pesticides Santé A                         | L'indicateur des quantités de pesticides Santé A achetées fournit au niveau de la France, à une résolution minimale au niveau des communes (INSEE), le total des substances en kilogrammes achetées par commune selon les catégories regroupant les substances. Les données ont été recueillies par code postal ; pour les obtenir par commune, des pondérations ont été attribuées aux communes partageant le même code postal. L'extraction des données a été effectuée à partir de sources officielles dédiées.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **Biodiversité**                       | Pesticides Santé Autres                    | L'indicateur des quantités de pesticides Autre achetées fournit au niveau de la France, à une résolution minimale au niveau des communes (INSEE), le total des substances en kilogrammes achetées par commune selon les catégories regroupant les substances. Les données ont été recueillies par code postal ; pour les obtenir par commune, des pondérations ont été attribuées aux communes partageant le même code postal. L'extraction des données a été effectuée à partir de sources officielles dédiées.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **Température**                        | Couvert Forestier                          | L'indicateur de couverture forestière fournit au niveau de la France, à une résolution minimale d'Iris (INSEE), le niveau de densité du couvert forestier dans une fourchette de 0 % à 100 % pour l'année de référence 2018. L'extraction des données a été faite à partir de rasters satellites provenant du site Copernicus.                                                                                                                                                                                                                                            |
| **Température**                        | Surface Imperméable                        | L'indicateur de densité d'imperméabilisation fournit au niveau de la France, à une résolution minimale d'Iris (INSEE), le niveau de densité d'imperméabilisation à travers le pays dans une fourchette de 0 % à 100 % pour l'année de référence 2018. L'extraction des données a été réalisée à partir de rasters satellites provenant du site Copernicus.                                                                                                                                                                                                                   |
| **Pollution lumineuse/luminosité**     | Radiance                                   | L'indicateur de radiance mesure la luminosité artificielle du ciel nocturne en microcandelas par mètre carré (mcd/m^2), offrant une évaluation du ratio entre l'éclairage artificiel et la luminosité naturelle du ciel à travers la France. Cet indicateur propose des valeurs allant de 0 à 11, allant de zones exemptes de pollution lumineuse à des régions où la pollution lumineuse surpasse de 11 fois les niveaux naturels, pour l'année de référence 2015. Les données sont issues du satellite NASA VIIRS.                                                                                       |
| **Sécurité**                           | Coups et Blessures Volontaires            | L'indicateur mesure le taux de coups et blessures volontaires sur personnes de 15 ans ou plus, aussi bien dans le cadre familial qu’en dehors de ce cadre, pour l'année 2022. Les données sont issues du Service statistique ministériel de la sécurité intérieure (SSMSI).                                                                                                                                                                                                                                                                                                  |
| **Sécurité**                           | Vols Sans Violence Contre des Personnes   | L'indicateur mesure le taux de vols sans violence contre des personnes, pour l'année 2022. Les données sont issues du Service statistique ministériel de la sécurité intérieure (SSMSI).                                                                                                                                                                                            |
| **Sécurité**                           | Cambriolages de Logement                  | L'indicateur mesure le taux de cambriolages de logement formellement reportés, pour l'année 2022. Les données sont issues du Service statistique ministériel de la sécurité intérieure (SSMSI).                                                                                                 |
| **Sécurité**                           | Usage de Stupéfiants                      | L'indicateur mesure le taux d'usage de stupéfiants, pour l'année 2022. Les données sont issues du Service statistique ministériel de la sécurité intérieure (SSMSI).                            |
| **Accès à l'emploi, aux services et aux équipements** | Eloignement des Equipements de Proximité | Taux de personne ayant accès aux équipements de proximité en 2021: composée de 30 équipements dont la banque, le plombier, l’électricien, le salon de coiffure, le restaurant, l’agence immobilière, la boulangerie, l’école élémentaire, le médecin omnipraticien, le terrain de tennis, le terrain de grands jeux, etc. Données issues des indicateurs territoriaux de développement durable (INSEE). |
| **Accès à l'emploi, aux services et aux équipements** | Eloignement des Equipements Intermédiaires | Taux de personne ayant accès aux équipements intermédiaires en 2021: composée de 34 équipements dont le vétérinaire, la gendarmerie, le supermarché, la station service, le collège, le service d’aide des personnes âgées, la garde enfants d’âge préscolaire, la gare, le bassin de natation, etc. Données issues des indicateurs territoriaux de développement durable (INSEE). |
| **Accès à l'emploi, aux services et aux équipements** | Eloignement des Equipements Supérieurs | Taux de personne ayant accès aux équipements supérieurs en 2021: composée de 35 équipements tels que l’hôpital, l’hypermarché, le lycée, l’université, le bureau de poste, la bibliothèque, les services publics du secteur bancaire, etc. Données issues des indicateurs territoriaux de développement durable (INSEE). |
| **Accès à l'emploi, aux services et aux équipements** | Equipement de Proximité Accessibles | Cet indicateur fournit le taux d'équipement de proximité accessibles à 6 minutes en voiture en 2021. Pour chaque commune, les isochrones représentant les zones accessibles en voiture dans un rayon de 6 minutes ont été générées en utilisant l'Open Source Routing Machine. Ensuite, le taux de services de proximité présents à l'intérieur de l'isochrone a été calculé (Base Permanente des Equipements INSEE). |
| **Accès à l'emploi, aux services et aux équipements** | Cyclabilité de la Voirie | Cet indicateur représente la part des voiries cyclables par rapport aux voiries automobiles totales pour l'année 2022. Données issues des indicateurs territoriaux de développement durable (INSEE). |
| **Activité physique et sportive** | Nombre d'Infrastructures Sportives Accessibles | Cet indicateur fournit le nombre d'infrastructures sportives accessibles à 15 minutes. Pour chaque commune, les isochrones représentant les zones accessibles en voiture dans un rayon de 15 minutes ont été générées en utilisant l'Open Source Routing Machine. Ensuite, la somme du nombre d'infrastructures sportives présentes à l'intérieur de l'isochrone a été calculée. Sources : Recensement des équipements sportifs, espaces et sites de pratiques. |
| **Alimentation** | Part des Surfaces Agricoles Biologiques | Part des surfaces agricoles biologiques arrivées au terme de leur conversion dans la surface agricole biologique totale. Source : Observatoire des Territoires. |
| **Habitat** | Part des Résidences Principales Suroccupées | Part des résidences principales (hors studio de 1 personne) suroccupées. Source : Insee, Recensement de la population (RP 2020). |
| **Revenu** | Part des pers. âgées de - de 25 | Part (en %) de la population âgée de moins de 25 ans pour l'année 2020. Les données sont issues de l'INSEE, Recensement de la population (RP 2020). |
| **Revenu** | Part des pers. âgées de 25 à 64 | Part (en %) de la population âgée de plus de 25 ans et moins de 64 ans pour l'année 2020. Les données sont issues de l'INSEE, Recensement de la population (RP 2020). |
| **Revenu** | Part des pers. âgées de 65 | Part (en %) de la population âgée de plus de 64 ans pour l'année 2020. Les données sont issues de l'INSEE, Recensement de la population (RP 2020). |




Les indicateurs de l'application cartographique proviennent soit directement de sites administratifs, auquel cas la source utilisée est indiquée dans le dossier "data" dans le fichier du déterminant correspondant. Pour les indicateurs construits, la méthodologie et les étapes de reproduction sont détaillées dans les codes disponibles (R, Stata ou Python) dans le dossier "scr".


### **L'Application Cartographique**


Avant d'exécuter l'outil en utilisant`./app/R-Shiny App`, assurez-vous d'avoir téléchargé les fichiers nécessaires en lisant le README associé à ce dossier.

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


Si vous trouvez des erreurs dans le code, ou vous avez des améliorations à nous suggérer, n'hésitez pas à nous contacter en utilisant les courriels suivants :

- Alfonso Awadalla-Carreño- alfonso.awadalla-carreno@polytechnique.edu
- Jade Sillere - jade.sillere@polytechnique.edu
- Julian Rojas - julian.rojas@polytechnique.edu
- Maela Guillaume-Le Gall - maela.guillaume-le-gall@polytechnique.edu
- Sofia Vaca - sofia.vaca@polytechnique.edu

### **Remerciements**

Nous tenons à remercier l'équipe d'ECOLAB pour avoir proposé ce défi et pour toute l'aide apportée au cours du développement de cet outil. Nous remercions en particulier Paul Grignon et Theo Sigiscar pour le temps qu'ils nous ont consacré et les conseils qu'ils nous ont prodigués tout au long de ce projet. Par ailleurs, ce projet a été réalisé dans le cadre du MSc&T in Data and Economics for Public Policy et nous tenons à remercier nos directeurs de master, Pierre Boyer et Franck Malherbet, pour avoir organisé ce challenge avec ECOLAB et pour leur soutien constant.

___
# Urbasanté Project - ECOLAB

This project is the result of a collaboration between the MSc&T "Data and Economics for Public Policy" (École Polytechnique, ENSAE & Télécom Paris) and ECOLAB, the innovation lab for ecological transition under the French General Commission for Sustainable Development.

As part of this collaboration, a challenge was proposed to the master's students: to build a tool for observing and analyzing various health determinants linked to land-use planning at a granular territorial level.

## Assessment

Land-use planning significantly impacts public health by addressing various health determinants. By influencing the environment, lifestyles, and behaviors, it is estimated that land-use planning can affect up to 60% of an individual’s health (Barton et al., 2015). However, in the current context of climate change, the services and living conditions provided by urban ecosystems are at risk of significant deterioration, with consequences for public health. 

Yet, health and environmental management are often handled independently in local territories, with little interaction between the two fields. This separation overlooks substantial potential benefits for public health. According to Santé Publique France, nearly one-third of cancers could be avoided by modifying population lifestyles.

Given this, there is a need to assist local decision-makers by providing an awareness-raising tool to help them better understand the health-land-use interface. The objective of the tool is to help local governments conduct health-land-use diagnostics of their territories by providing visualizations of various health determinants through a geospatial data platform. This platform highlights health-land-use indicators at a fine territorial resolution across mainland France.

## **Building the Health-Environment Indicators**

We compiled or developed 29 indicators across 11 health-environment determinants from various administrative sources.

| **Determinant**                        | **Indicator**                             | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                             |
|----------------------------------------|--------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Air Quality**                        | Air Quality (ATMO Score)                  | The ATMO indicator provides the percentage of days in the year with an ATMO score above 3 (on a scale of 0 to 6) at the IRIS (INSEE) resolution for mainland France in 2023. Data was sourced from Geod’Ai.                                                                                                                                                                                                                                |
| **Air Quality**                        | Ozone Indicator (SOMO35)                  | The SOMO35 indicator measures the annual sum of daily O3 concentrations exceeding 35 ppb at the IRIS resolution for mainland France in 2023. Data was sourced from Geod’Ai.                                                                                                                                                                                                                         |
| **Water Management**                   | Groundwater Quality                       | This indicator consolidates storage tanks into a unified database. Scores are assigned within a 1 km radius around sites, weighted by proximity to inhabited areas (e.g., full weight for sites within 250m, halved between 250m and 500m). The final score is calculated based on this weighted approach (2020).                                                                                                                                |
| **Water Management**                   | Drought                                   | This indicator assesses drought risk in mainland France for 2024 at the municipal resolution. It weights the number of days under drought alerts, reinforced vigilance, or crisis levels. Data was sourced from detailed meteorological observations (data.gouv).                                                                                                                                     |
| **Biodiversity**                       | Dengue                                    | This indicator measures the number of dengue cases per million inhabitants per region from May 1 to December 8, 2023.                                                                                                                                                                                                                                                                                                                      |
| **Biodiversity**                       | Pesticides CMR                            | This indicator reports the total kilograms of CMR-category pesticides purchased per municipality in France, aggregated from postal code data and weighted among municipalities sharing the same code. Data was sourced from official records.                                                                                                                                                                                                 |
| **Temperature**                        | Forest Cover                              | This indicator provides forest cover density at the IRIS resolution (0%-100%) for mainland France in 2018, using satellite rasters from the Copernicus platform.                                                                                                                                                                                                                                                                           |
| **Temperature**                        | Impervious Surfaces                       | This indicator provides the density of impervious surfaces at the IRIS resolution (0%-100%) for mainland France in 2018, using satellite rasters from the Copernicus platform.                                                                                                                                                                                                                                                              |
| **Light Pollution/Luminosity**         | Radiance                                  | This indicator measures artificial night sky brightness (in microcandelas per square meter) across France, ranging from 0 to 11 times natural light levels (2015). Data was sourced from NASA’s VIIRS satellite.                                                                                                                                                                                                                            |
| **Security**                           | Intentional Assaults                      | This indicator measures the rate of intentional assaults on individuals aged 15 or older (domestic and non-domestic) in 2022. Data was sourced from the Ministry of the Interior’s statistical department (SSMSI).                                                                                                                                                                                                                          |
| **Access to Employment, Services, and Amenities** | Access to Local Amenities            | This indicator measures the percentage of people with access to local amenities (e.g., banks, bakeries, elementary schools) within their municipality in 2021. Data was sourced from INSEE’s sustainable territorial development indicators.                                                                                                                                                       |
| **Physical Activity**                  | Accessible Sports Facilities              | This indicator measures the number of sports facilities accessible within a 15-minute drive for each municipality. Isochrones were generated using the Open Source Routing Machine, and data was aggregated from the Sports Facilities Census.                                                                                                                                                                                             |
| **Housing**                            | Overcrowded Main Residences               | This indicator reports the percentage of overcrowded main residences (excluding one-person studios) as of 2020. Data was sourced from INSEE’s Population Census.                                                                                                                                                                                                                                                                            |

Indicators are either directly sourced from administrative datasets (with the source listed in the "data" folder) or constructed (with detailed methodologies in R, Stata, or Python scripts available in the "src" folder).

## **The Cartographic Application**

Before running the tool (`./app/R-Shiny App`), ensure the necessary files are downloaded, as outlined in the associated README.

### Example Use Cases:

1. A user wants to view the forest cover indicator at the departmental level across mainland France.  
   - **Select determinant**: Temperature  
   - **Select indicator**: Forest Cover  
   - **Select scale**: Department  

2. A user wants to view the forest cover indicator for Palaiseau at the municipal level.  
   - **Select determinant**: Temperature  
   - **Select indicator**: Forest Cover  
   - **Select scale**: Municipality  
   - **Select department**: Essonne  
   - **Select location**: Palaiseau  

The map uses a color gradient to represent the selected indicator at the chosen spatial resolution, with lower values in purple and higher values in yellow.

## **Limitations of the Tool**

Some indicators lack data at the IRIS level due to statistical confidentiality concerns in sparsely populated areas. Local expertise may also uncover anomalies caused by incomplete data collection during the indicator construction process.

## **File Structure**

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

## **Contributions**

If you find errors or have suggestions, please contact:

- Alfonso Awadalla-Carreño: alfonso.awadalla-carreno@polytechnique.edu  
- Jade Sillere: jade.sillere@polytechnique.edu  
- Julian Rojas: julian.rojas@polytechnique.edu  
- Maela Guillaume-Le Gall: maela.guillaume-le-gall@polytechnique.edu  
- Sofia Vaca: sofia.vaca@polytechnique.edu  

## **Acknowledgments**

We thank the ECOLAB team for proposing this challenge and supporting the development of this tool, particularly Paul Grignon and Theo Sigiscar. This project was part of the MSc&T in Data and Economics for Public Policy, we would like to express our sincere thanks to program directors Pierre Boyer and Franck Malherbet for organizing this collaboration and their ongoing support.



