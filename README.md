# Projet Urbasanté - ECOLAB

Ce projet est le résultat d'une collaboration entre le MSc&T "Data and Economics for Public Policy" (École Polytechnique, ENSAE & Telecom), et ECOLAB, le laboratoire d’innovation pour la transition écologique du Commissariat Général au Développement Durable.

Dans ce cadre, un challenge a été proposé aux étudiant.es du master : construire un outil d'observation et d'analyse des différents déterminants de santé en lien avec l'aménagement du territoire à une maille fine du territoire. 

## Constat 
En agissant sur les différents déterminants de santé, l'aménagement du territoire excerce une influence significative sur la santé des populations. Globalement, en intervenant sur l'environnement, les habitudes de vie et les comportements, il est estimé que l'aménagement du territoire peut affecter jusqu'à 60% de la santé d'un individu (Barton et al., 2015). Cependant, dans le contexte actuel de changement climatique, les services et le cadre de vie fournis par les écosystèmes urbains risquent de se détériorer considérablement, entraînant des conséquences sur la santé publique. Or, la santé et l'environnement sont souvent gérés de manière indépendante au sein des territoires, avec peu d'interaction entre les deux domaines. Pourtant, les avantages potentiels pour la santé publique sont significatifs. Selon Santé Publique France, près d'un tiers des cancers pourraient être évités en modifiant les habitudes de vie de la population. 

Face à ce constat, il est nécessaire d'accompagner les décideurs locaux en leur fournissant un outil de sensibilisation, afin de les aider à mieux appréhender la thématique santé-aménagement. L'objectif de l'outil est ainsi d'accompagner les collectivités locales dans la réalisation de diagnostics en santé- aménagement de leurs territoires, en proposant une restitution des différents déterminants de santé à travers une plateforme de données cartographiques mettant en lumière des indicateurs en lien avec la santé-aménagement à une maille fine du territoire et pour l'ensemble de la France métropolitaine.

## **Construction des Indicateurs de Santé-Environnement**

Nous avons compilé ou construit, à partir de différentes sources administratives, 29 indicateurs répartis entre 11 déterminants de santé-environnement. 


| Déterminant de Santé-Environnement          | Indicateur                               | Description                                             | Année |
|---------------------------------------------|------------------------------------------|---------------------------------------------------------|-------|
| Qualité de l'air                            | atmo                                     | Pourcentage de jours avec un ATMO score au-delà de 3/6 | 2022  |
| Qualité de l'air                            | somo35                                   | Score SOMO35                                           | 2022  |
| Gestion des eaux                            | Qualite des eaux souterraines           | Score correspondant à la somme des site pondérés        | 2020  |
| Gestion des eaux                            | secheresse                               | Risque pondérée de secheresse                          | 2024  |
| Biodiversité                                | mosquitos_pop                            | Dengue cases per million inhabitants                   |       |
| Biodiversité                                | pest_cmr                                 | Quantités de pesticides CMR achetés (kg)               | 2021  |
| Biodiversité                                | pest_env_a                               | Quantités de pesticides Env A achetés (kg)             | 2021  |
| Biodiversité                                | pest_env_b                               | Quantités de pesticides Env B achetés (kg)             | 2021  |
| Biodiversité                                | pest_sante_a                             | Quantités de pesticides Sante A achetés (kg)           | 2021  |
| Biodiversité                                | pest_sante_autres                        | Quantités de pesticides Autre (hors CMR, Env A, Env B et Sante A achetés) (kg) | 2021 |
| Température                                 | Couvert Forestier                        | Taux de couverture forestière                          | 2018  |
| Température                                 | surface_imperm                           | Taux de surface imperméabilisée                         | 2018  |
| Pollution lumineuse/luminosité              | Radiance                                 | Niveau de radiance                                      | 2015  |
| Sécurité                                    | Coupsetblessuresvolontaires             | Coups et blessures volontaires (taux)                   | 2022  |
| Sécurité                                    | Volssansviolencecontredespe             | Vols sans violence contre des personnes (taux)          | 2022  |
| Sécurité                                    | Cambriolagesdelogementtaux              | Cambriolages de logement (taux)                         | 2022  |
| Sécurité                                    | Usagedestupéfiantstaux2022              | Usage de stupéfiants (taux)                             | 2022  |
| Accès à l'emploi, aux services et aux équipements | equip_interm                        | Part de la population éloignée des équipements intermédiaires | 2021 |
| Accès à l'emploi, aux services et aux équipements | equip_proxim                        | Part de la population éloignée des équipements de proximité | 2021 |
| Accès à l'emploi, aux services et aux équipements | equip_sup                           | Part de la population éloignée des équipements supérieurs | 2021 |
| Accès à l'emploi, aux services et aux équipements | pourcentage_equip                   | Taux d'équipement de proximité accessibles             |       |
| Accès à l'emploi, aux services et aux équipements | Cyclabilitévoirie                   | Taux de la cyclabilité de la voirie                     |       |
| Accès à l'emploi, aux services et aux équipements | Cyclabilitévoirieavecvoirie          | Taux de la cyclabilité de la voirie (voirie 30)         |       |
| Activite physiques et sportives             | n_infra_sportive                        | Nombre d'infrastructure sportives accessibles           |       |
| Alimentation                                | part_surfconvterm                       | Part des surfaces agricoles biologiques                 |       |
| Habitat                                     | Partdesrésidencesprincipales            | Part des résidences principales suroccupées            |       |
| Revenu                                      | age_moins_25                            | Part des pers. âgées de - de 25 ans                     | 2020  |
| Revenu                                      | age_entre_25_64                        | Part des pers. âgées de 25 à 64 ans                     | 2020  |
| Revenu                                      | age_plus_65                             | Part des pers. âgées de 65 ans ou +                     | 2020  |


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
│   ├── 1- Raw Data <- raw data files organized by determinant
│   ├── 2- Intermediate Data  <- data files with the indicators already created
│   ├── 3- Formatted Data  <- data files that have been cleaned and formatted for final use
│   ├── 4- Final Data  <- final database with all the indicators
│   ├── linking tables  <- additional tables used for processing some indicators
│   └── shapefiles  <-xx
├── src <- Source code for use in this project.
│   ├── 1- Row --> Intermediate <- Scripts that process raw data and generate indicators.
│   ├── 2 - Interemediate --> Formatted <--  Scripts that process additional geographical formatting for specific indicators
│   └── 3 - Formatted --> Final <-- Script responsible for ensuring uniform formatting across all indicators
└── app <- Script to run the app
```

### **Contributions**

Si vous souhaitez contribuer à ce projet, merci de bien vouloir nous contacter:

Awadalla Carreño Alfonso - alfonso.awadalla-carreno@polytechnique.edu
Jade Sillere - jade.sillere@polytechnique.edu
Julian Rojas - julian.rojas@polytechnique.edu
Maela Guillaume-Le-Gall - maela.guillaume-le-gall@polytechnique.edu
Sofia Vaca - sofia.vaca@polytechnique.edu

### **Remerciements**

Nous tenons à remercier l'équipe d'ECOLAB pour avoir proposé ce défi et pour toute l'aide apportée au cours du développement de cet outil. Nous remercions en particulier Paul Grignon et Theo Sigiscar pour le temps qu'ils nous ont consacré et les conseils qu'ils nous ont prodigués tout au long de ce projet. Par ailleurs, ce projet a été réalisé dans le cadre du MSc&T in Data and Economics for Public Policy et nous tenons à remercier nos directeurs de master, Pierre Boyer et Franck Malherbet, pour avoir organisé ce challenge avec ECOLAB et pour leur soutien constant.


