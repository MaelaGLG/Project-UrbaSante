
# Indicator "Pesticides bought by commune "
This indicator measures the kilograms of pesticides purchased by individual communes, with separate indicators provided for each type of pesticide. The original dataset was organized by postal codes. To convert this information into commune-level data, a mapping dataset linking postal codes to communes was utilized. It is important to note that some postal codes correspond to multiple communes. In such cases, weighted allocations were applied to ensure accurate distribution of data.

# Necessary data to run the code
To recreate this indicator, you need to download the purchased pesticides by postal code database (.zip) from:
https://www.data.gouv.fr/fr/datasets/achats-de-pesticides-par-code-postal/
You must then unzip the folder and save it in the corresponding directory: `data/1- Raw Data/ 
Déterminant 3 - Biodiversité/Pesticides/´


You must also ensure the following file is in the corresponding directory:

- `data/linking tables/liaison - postal code communes/base-officielle-codes-postaux.xlsx` (corresponding to a dataset of the postal code assigned to each French commune, necessary to have the indicator by commune)

## The script has 3 sections
1) Import the department files and collapse them by classification of the pesticide and postal code 
2) Append the department files in only one file
3) Merge the mapping dataset that links postal codes to communes
4) Apply weights on the postal codes that have more than one commune assigned. 

# Indicateur "Achats de pesticides par commune"
Cet indicateur mesure les kilogrammes de pesticides achetés par chaque commune, avec des indicateurs distincts pour chaque type de pesticide. La base de données initiale était organisée par codes postaux. Pour convertir ces informations au niveau des communes, un ensemble de données reliant les codes postaux aux communes a été utilisé. Il est important de noter que certains codes postaux correspondent à plusieurs communes. Dans ces cas, des pondérations ont été appliquées pour assurer une répartition précise des données.

# Données nécessaires pour exécuter le code
Pour recréer cet indicateur, vous devez télécharger la base de données des achats de pesticides par code postal (.zip) depuis :
https://www.data.gouv.fr/fr/datasets/achats-de-pesticides-par-code-postal/
Vous devez ensuite décompresser le dossier et le sauvegarder dans le répertoire correspondant :
data/1- Raw Data/ Déterminant 3 - Biodiversité/Pesticides/
Vous devez également vous assurer que le fichier suivant est présent dans le répertoire correspondant :
•	data/linking tables/liaison - postal code communes/base-officielle-codes-postaux.xlsx
(correspondant à un jeu de données des codes postaux attribués à chaque commune française, nécessaire pour obtenir l'indicateur par commune)

# Le script comprend 4 sections :
1.	Importer les fichiers départementaux et les regrouper par classification des pesticides et code postal.
2.	Fusionner les fichiers départementaux en un seul fichier.
3.	Joindre le jeu de données de correspondance qui relie les codes postaux aux communes.
4.	Appliquer des pondérations pour les codes postaux associés à plusieurs communes.




# Indicateur « Dengue
Cet indicateur fournit le taux de dengue par million d'habitants par région. 

# Données nécessaires à l'exécution du code
Pour recréer cet indicateur, il faut se rendre sur la page de Santé Publique France :
https://www.santepubliquefrance.fr/maladies-et-traumatismes/maladies-a-transmission-vectorielle/chikungunya/articles/donnees-en-france-metropolitaine/chikungunya-dengue-et-zika-donnees-de-la-surveillance-renforcee-en-france-hexagonale-2024
Vous devez ensuite enregistrer les données sous le nom de « Dengue » et les placer dans le répertoire correspondant : `data/1- Raw Data/Déterminant 3 - Biodiversité/ `.

Vous devez également vous assurer que les fichiers suivants se trouvent dans les répertoires correspondants :
- `data/tableaux de liaison/liaison - population_regions/fr_population.region.departement.xlsx` (correspondant à un jeu de données de la population par région nécessaire au calcul de l'indicateur).
- 
# Indicator "Dengue"
This indicator provides the dengue per million habitants rate by region. 

# Necessary data to run the code
To recreate this indicator, you need to visit the Santé Publique France page:
https://www.santepubliquefrance.fr/maladies-et-traumatismes/maladies-a-transmission-vectorielle/chikungunya/articles/donnees-en-france-metropolitaine/chikungunya-dengue-et-zika-donnees-de-la-surveillance-renforcee-en-france-hexagonale-2024
You must then save the data as “Dengue” and place it in the corresponding directory: `data/1- Raw Data/Déterminant 3 - Biodiversité/ `.

You must also ensure the following files are in the corresponding directories:
- `data/linking tables/liaison - population_regions/fr_population.region.departement.xlsx` (corresponding to a dataset of the population by region necessary for calculating the indicator).


