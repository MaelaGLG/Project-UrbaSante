****This DO FILE creates the indicators related to the amount of pesticides bought by commune. The original file is by postal code and department, so a merge is done and some weights are added given that postal codes can be assigned to two communes at the same time. 
clear all

// Set the root directory
global project_path "../"

// Cambiar al directorio con los archivos de Excel
cd "$project_path/data/1- Raw Data/Déterminant 3 - Biodiversité/Pesticides"


// List all CSV files in the current directory
local archivos_csv : dir "." files "*.csv"
clear

// Iterate through each CSV file, import it, and save it as a Stata file
foreach archivo in `archivos_csv' {
    // Cargar cada archivo CSV y hacer el append
    import delimited "`archivo'"
    save "`archivo'.dta", replace
	clear 
}

//SUBSTANCE_AUVERGNE RHONE ALPES
use "BNVD_TRACABILITE_20221016_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2021.csv.dta", clear
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_AUVERGNE
save `SUBSTANCE_AUVERGNE', replace

clear
//BOURGOGNE
use "bnvd_tracabilite_20221016_achat_cp_substance_bourgogne franche comte_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_BOURGOGNE_2021
save `SUBSTANCE_BOURGOGNE_2021', replace

clear
//BRETAGNE
use "bnvd_tracabilite_20221016_achat_cp_substance_bretagne_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_BRETAGNE_2021
save `SUBSTANCE_BRETAGNE_2021', replace


clear
//Centre val de loire
use "bnvd_tracabilite_20221016_achat_cp_substance_centre val de loire_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_Centre_val_de_loire
save `SUBSTANCE_Centre_val_de_loire', replace


clear
//Corse
use "bnvd_tracabilite_20221016_achat_cp_substance_corse_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_corse
save `SUBSTANCE_corse', replace


clear
//Grand est
use "bnvd_tracabilite_20221016_achat_cp_substance_grand est_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_Grand
save `SUBSTANCE_Grand', replace


clear
//Guadeloupe
use "bnvd_tracabilite_20221016_achat_cp_substance_guadeloupe_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_Guadeloupe
save `SUBSTANCE_Guadeloupe', replace


clear
//Guyane
use "bnvd_tracabilite_20221016_achat_cp_substance_guyane_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_Guyane
save `SUBSTANCE_Guyane', replace


clear
//Hauts de france
use "bnvd_tracabilite_20221016_achat_cp_substance_hauts de france_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_Hauts
save `SUBSTANCE_Hauts', replace


clear
//ile de france
use "bnvd_tracabilite_20221016_achat_cp_substance_ile de france_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_ile
save `SUBSTANCE_ile', replace


clear
//la reunion
use "bnvd_tracabilite_20221016_achat_cp_substance_la reunion_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_la_reunion
save `SUBSTANCE_la_reunion', replace

clear
//martinique
use "bnvd_tracabilite_20221016_achat_cp_substance_martinique_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_martinique
save `SUBSTANCE_martinique', replace


clear
//mayotte
use "bnvd_tracabilite_20221016_achat_cp_substance_mayotte_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_mayotte
save `SUBSTANCE_mayotte', replace

clear
//normandie
use "bnvd_tracabilite_20221016_achat_cp_substance_normandie_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_normandie
save `SUBSTANCE_normandie', replace


clear
//nouvelle aquitaine
use "bnvd_tracabilite_20221016_achat_cp_substance_nouvelle aquitaine_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_nouvelle
save `SUBSTANCE_nouvelle', replace

clear
//occitanie
use "bnvd_tracabilite_20221016_achat_cp_substance_occitanie_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_occitanie
save `SUBSTANCE_occitanie', replace

clear
//pays de la loire
use "bnvd_tracabilite_20221016_achat_cp_substance_pays de la loire_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_pays
save `SUBSTANCE_pays', replace

clear
//provence alpes cote d azur
use "bnvd_tracabilite_20221016_achat_cp_substance_provence alpes cote d azur_2021.csv.dta"
// Drop observations where 'substance' is "nc"
drop if substance == "nc"

// Convert 'quantite_substance' to numeric if it's stored as a string
destring quantite_substance, replace

// Collapse the data by 'code_postal_acheteur' and 'classification', aggregating 'annee' and 'quantite_substance'
collapse annee (sum) quantite_substance , by(code_postal_acheteur classification)
tempfile SUBSTANCE_provence
save `SUBSTANCE_provence', replace

// Append the databases
use `SUBSTANCE_provence'
append using `SUBSTANCE_pays'
append using `SUBSTANCE_occitanie'
append using `SUBSTANCE_nouvelle'
append using `SUBSTANCE_normandie'
*append using `SUBSTANCE_mayotte' 
*append using `SUBSTANCE_martinique'
*append using `SUBSTANCE_la_reunion'
append using `SUBSTANCE_ile'
append using `SUBSTANCE_Hauts'
*append using `SUBSTANCE_Guyane'
*append using `SUBSTANCE_Guadeloupe'
append using `SUBSTANCE_Grand'
append using `SUBSTANCE_corse'
append using `SUBSTANCE_Centre_val_de_loire'
append using `SUBSTANCE_BRETAGNE_2021'
append using `SUBSTANCE_BOURGOGNE_2021'
append using `SUBSTANCE_AUVERGNE'

/*
use "SUBSTANCE_AUVERGNE RHONE ALPES_2021.dta"
append using "SUBSTANCE_BOURGOGNE_2021.dta"
append using "SUBSTANCE_BRETAGNE_2021.dta"
append using "SUBSTANCE_Centre val de loire.dta"
append using "SUBSTANCE_corse.dta"
append using "SUBSTANCE_Grand est.dta"
*append using "SUBSTANCE_Guadeloupe.dta"
*append using "SUBSTANCE_Guyane.dta"
append using "SUBSTANCE_Hauts de france.dta"
append using "SUBSTANCE_ile de france.dta"
*append using "SUBSTANCE_la reunion.dta"
*append using "SUBSTANCE_martinique.dta"
*append using "SUBSTANCE_mayotte.dta"
append using "SUBSTANCE_normandie.dta"
append using "SUBSTANCE_nouvelle aquitaine.dta"
append using "SUBSTANCE_occitanie.dta"
append using "SUBSTANCE_pays de la loire.dta"
append using "SUBSTANCE_provence alpes cote d azur.dta"
*/
// Convert 'code_postal_acheteur' to a string, create 'codePostal' variable
tostring code_postal_acheteur, replace
rename code_postal_acheteur codePostal 

// Apply conditionals to 'codePostal'
replace codePostal = "00" + codePostal if length(codePostal) == 3
replace codePostal = "0" + codePostal if length(codePostal) == 4

collapse annee (sum) quantite_substance , by(codePostal classification)

**Reshape the database
drop annee
sort classification
encode classification, gen(classification_id)
drop classification
reshape wide quantite_substance, i(codePostal) j(classification_id) 
rename quantite_substance1 quantity_pesticides_Autre
rename quantite_substance2 quantity_pesticides_CMR
rename quantite_substance3 quantity_pesticides_EnvA
rename quantite_substance4 quantity_pesticides_EnvB
rename quantite_substance5 quantity_pesticides_Sante_A

// Save the dataset with aggregated data
save "Pesticides by classification.dta", replace


// Create weights and add the relation between code communes and postal codes
clear
import excel "base-officielle-codes-postaux.xlsx", sheet("base-officielle-codes-postaux") firstrow
gen codePostal_str = string(code_postal)
duplicates tag code_commune_insee, generate(dupvar)
drop if dupvar>0
drop dupvar code_postal libelle_d_acheminement ligne_5 _geopoint
* Count the communes by postal codes to create weights 
sort codePostal_str
rename codePostal_str codePostal 
duplicates tag codePostal, generate(num_communes_per_postal)
replace num_communes_per_postal=num_communes_per_postal+1
gen weight = (1/num_communes_per_postal)
save "communes-departement-region.dta", replace

use "Pesticides by classification.dta", clear
duplicates r codePostal
merge 1:m codePostal using "communes-departement-region.dta" 
sort codePostal
keep if _merge==3

**Apply the weights
local vars quantity_pesticides_Autre quantity_pesticides_CMR quantity_pesticides_EnvA quantity_pesticides_EnvB quantity_pesticides_Sante_A
foreach var of local vars {
    replace `var' = `var' * weight
}

**Save and format
**Communes
rename code_commune_insee code_insee
keep quantity_pesticides_Autre quantity_pesticides_CMR quantity_pesticides_EnvA quantity_pesticides_EnvB quantity_pesticides_Sante_A code_insee 
order code_insee
g scale="Communes"
tempfile Communes
save `Communes', replace

*Departements
gen code_dpto = substr(code_insee, 1, 2)
collapse quantity_pesticides_Autre quantity_pesticides_CMR quantity_pesticides_EnvA quantity_pesticides_EnvB quantity_pesticides_Sante_A, by (code_dpto)
rename code_dpto code_insee
duplicates r code
g scale="Departement"
tempfile Departement
save `Departement', replace

**Region
import delimited "Code dpto code region", clear 
rename code_depto code_insee
merge 1:1 code_insee using `Departement'
keep if _merge==3
collapse quantity_pesticides_Autre quantity_pesticides_CMR quantity_pesticides_EnvA quantity_pesticides_EnvB quantity_pesticides_Sante_A, by(code_reg)
rename code_reg code_insee
tostring code_insee, replace
gen scale="Regions"
duplicates r code
tempfile Region
save `Region', replace

**Union of all
append using `Departement'
append using `Communes'

**Save file
export excel using "$project_path/data/3- Formatted Data/pesticides.xlsx", replace firstrow(variables)
