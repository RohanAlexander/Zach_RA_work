//////////////////////// Preamble ////////////////////////

// Author: Rohan Alexander

// Contact: rohan.alexander@anu.edu.au 

/* 
Description: The point of this script is to clean data. At the moment the focus 
is on cleaning locations of origin. The location starts as a string that may have 
comma separators that may help. The initial split is done on the comma and that 
gets you a decent amount of the way. Some of the strings have the country first 
then the city (rather than the majority which are the opposite) so you need to 
swap those. Then some don't have a country, despite having a city or state and 
so those need to be cleaned. 

(This would actually be a really good problem for machine learning and it will be 
interesting to see if this can be implemented once this project is done and 
provided for others as an R package. Seems like a common problem for historians, 
and an extension of the package could be to specify your time period of interest 
so not all being pushed to modern.)
*/

// Running notes: Can run up to line 940 and it should all work. After that is working code or debris.

//////////////////////// Initial set up and load data ////////////////////////
clear all

//set more off, permanently
set more off

use "/hdir/0/monicah/Desktop/EIbrothers18921924.dta"

cd "/hdir/0/monicah/Desktop/All"

//////////////////////// Start separating the cities and countries ////////////////////////
//Separate origin based on the first comma
gen reversed = reverse(origin) 
split reversed, generate(reversed) parse(,) limit(2)
gen origin_country_from_reversed = reverse(reversed1) 
drop reversed
drop reversed1
drop reversed2

split origin, generate(origin) parse(,) limit(2)
rename origin1 origin_city
rename origin2 origin_country
drop origin_country

rename origin_country_from_reversed origin_country

//Deal with some horrible formatting inserted by the website
// ssc install charlist
// charlist origin_country
replace origin_city = subinstr(origin_city, char(160), "", .)
replace origin_country = subinstr(origin_country, char(160), "", .)
//replace origin_city = subinstr(origin_city, "Ã", "", .)
//replace origin_country = subinstr(origin_country, "Ã", "", .)
replace origin_city = subinstr(origin_city, ".", "", .)
replace origin_city = subinstr(origin_city, "'", " ", .)
replace origin_city = subinstr(origin_city, ";", " ", .)
replace origin_country = subinstr(origin_country, ".", "", .)
replace origin_country = subinstr(origin_country, ":", "", .)
replace origin_country = trim(origin_country)
replace origin_city = trim(origin_city)
replace origin_country = strproper(origin_country)
replace origin_city = strproper(origin_city)
replace origin = trim(origin)
replace ethnicity = strproper(ethnicity)

// Remove duplicates
replace impliedBirthYear = "Â 1889-1890" if impliedBirthYear=="Â 1?89-1890"
//duplicates report
//duplicates list
duplicates drop

// Deal with the IDs that have multiple ethnicities (these occur on different rows)
// First add a column that has the number of observations (ethnicities) that each ID has
by ID, sort: generate number_of_ethnicities = _N
// Add a column that suggests whether the observation is the first of that ID or not (e.g. using names instead of ID numbers: Rohan; Rohan; Alexander would be 1, 0, 1)
egen tag = tag(ID)
tabulate number_of_ethnicities if tag
//drop tag
// Add a column that is a counter by ID. e.g. "Rohan, Rohan, John, John, John, Zach, Martine" goes to "1, 2, 1, 2, 3, 1, 1"
sort ID
by ID: generate counter_by_ID = _n
// Second, iterate through the number of ethnicities to save separate dataframes based on the number of ethnicities
preserve
keep if (counter_by_ID == 2)
keep ID ethnicity
rename ethnicity second_ethnicity
save only_two
restore, preserve
keep if (counter_by_ID == 3)
keep ID ethnicity
rename ethnicity third_ethnicity
save only_three
restore, preserve
keep if (counter_by_ID == 4)
keep ID ethnicity
rename ethnicity fourth_ethnicity
save only_four
restore
keep if counter_by_ID == 1
// Third, do the merge
merge 1:1 ID using only_two
drop _merge
merge 1:1 ID using only_three
drop _merge
merge 1:1 ID using only_four
drop _merge
// Fourth, clean up
drop number_of_ethnicities tag counter_by_ID

//////////////////////// Typos in the cities names ////////////////////////
//Clean some typos in the cities names
replace origin_city = "Ascoli Piceno" if (origin_city == "Ascoli P") ///
	| (origin_city == "Ascoli Pi")
replace origin_city = "Bagni Di Lucca" if (origin_city == "Bagni Lucca")
replace origin_city = "Barcelona" if (origin_city == "Barcellona")
replace origin_city = "Belgium" if (origin_city == "Belgian")
replace origin_city = "Belgrade" if (origin_city == "Belgrad")
replace origin_city = "Bethlehem" if (origin_city == "Bethlem")
replace origin_city = "Binghamton" if (origin_city == "Binghampton")
replace origin_city = "Brest Lit" if (origin_city == "Brest Litowsk")
replace origin_city = "Brooklyn" if (origin_city == "B Klyn") ///
	| (origin_city == "Bklyn") | (origin_city == "Broklyn") ///
	| (origin_city == "B Lkyn") | (origin_city == "B?Klyn")
replace origin_city = "Buenos Aires" if (origin_city == "B Aires") ///
	| (origin_city == "Buenos Aries") | (origin_city == "B Aires") ///
	| (origin_city == "B Aries") | (origin_city == "B Ayres") ///
	| (origin_city == "BAires") | (origin_city == "Beunos Aires") ///
	| (origin_city == "Bs Aires") | (origin_city == "Bs Aires") ///
	| (origin_city == "Buenos Ayres") | (origin_city == "Buenes Aires") ///
	| (origin_city == "Buenois Aires") | (origin_city == "B/Aires") 
replace origin_city = "Cape Town" if (origin_city == "Capetown")
replace origin_city = "Charlotte Amelia" if (origin_city == "Charlotte Amaelia")
replace origin_city = "Copenhagen" if (origin_city == "Copenhagan")
replace origin_city = "Ekaterinoslaw" if (origin_city == "Ekaterinaslaw")
replace origin_city = "Filadelfia" if (origin_city == "Filadelpia")
replace origin_city = "Frankfurt" if (origin_city == "Frankfort") & (origin_country == "Germany")
replace origin_city = "Glasgow" if (origin_city == "Glagow") & (origin_country == "Scotland")
replace origin_city = "Guatemala City" if (origin_city == "Guatamala City") 
replace origin_city = "Johannesburg" if (origin_city == "Johannesberg")
replace origin_city = "Krakow" if (origin_city == "Krakaw")
replace origin_city = "New York City" if (origin_city == "NYC") ///
	| (origin_city == "N Y") | (origin_city == "NY") | (origin_city == "Ny") ///
	| (origin_city == "New York") | (origin_city == "N Y City") ///
	| (origin_city == "N York") | (origin_city == "New-York") ///
	| (origin_city == "Ny City")
replace origin_city = "Niagara Falls" if (origin_city == "Niagra Falls")
replace origin_city = "Philadelphia" if (origin_city == "Phila") | (origin_city == "Phila Pa") ///
	| (origin_city == "Phila Pa") | (origin_city == "Philad")
replace origin_city = "Pittsburg" if (origin_city == "Pittsburgh")
replace origin_city = "Rio de Janeiro" if (origin_city == "Rio") | (origin_city == "Rio De Janeiro") ///
	| (origin_city == "Rio Janeiro") | (origin_city == "Rio De J")
replace origin_city = "Roma" if (origin_city == "Rome")
replace origin_city = "Southampton" if (origin_city == "Southhampton")
replace origin_city = "Sweden" if (origin_city == "Sweeden")
replace origin_city = "Sydney" if (origin_city=="Sidney") | (origin_city=="Sydney/Australia") 
replace origin_city = "Trinidad and Tobago" if (origin_city == "Trinadad")
replace origin_city = "Vienna" if (origin_city == "Vienne") & (origin_country == "Austria")
replace origin_city = "United States" if (origin_city == "U S A") ///
	| (origin_city == "U S Born") | (origin_city == "US") ///
	| (origin_city == "America") | (origin_city == "Usa")



//////////////////////// Swap countries and cities as appropriate ////////////////////////
// Fix the cases where the country and the city have been swapped - swap the country and city columns
// drop origin_country_tmp
// drop origin_city_tmp
gen origin_country_tmp = origin_country
gen origin_city_tmp = origin_city

local countries_to_swap `" "United States" "Trinidad" "Sweden" "Cuba" "Switzerland" "Finland" "France" "'
local countries_to_swap `"`countries_to_swap' "Norway" "Greece" "Turkey" "Holland" "Scotland" "Barbados" "'
local countries_to_swap `"`countries_to_swap' "Germany" "Ireland" "Guatemala" "Russia" "Austria" "England" "'
local countries_to_swap `"`countries_to_swap' "Sicily" "Hungary" "Wales" "Belgium" "'
//display `"`countries_to_swap'"'

foreach country of local countries_to_swap {
	quietly replace origin_country_tmp = origin_city if (origin_city == "`country'") 
	quietly replace origin_city_tmp = origin_country if (origin_city == "`country'") 
}
// Clean up the variables
replace origin_country = origin_country_tmp
replace origin_city = origin_city_tmp
drop origin_country_tmp
drop origin_city_tmp



//////////////////////// Fix remaining messy countries (some of these are more than just typos - possible errors introduced here)

// The cities of all these countries need to be checked before going through with the change; tab origin_city if (origin_country == "COUNTRY"), sort
// Decide what to do with 'Russ' or 'S H S' or 'Wolyn' or 'Kiew'. Maybe add a flag or something to signal Zach to look into further then get rid of them in the table so they stop coming up.
replace origin_country = "Albania" if (origin_country == "Albany") ///
	| (origin_country == "Albanese") | (origin_country == "Albany") 
replace origin_country = "Argentina" if (origin_country == "Argentine") ///
	| (origin_country == "Angentina") | (origin_country == "Arg") ///
	| (origin_country == "ArgRep") | (origin_country == "ArgRepSoAm") ///
	| (origin_country == "ArgRepSoAmer") | (origin_country == "ArgRepublic") ///
	| (origin_country == "Argenetine") | (origin_country == "Argent") ///
	| (origin_country == "ArgentinaSoAm") | (origin_country == "ArgentineRep") ///
	| (origin_country == "Argentinia") | (origin_country == "Argentyna") ///
	| (origin_country == "Argt") | (origin_country == "Aurgentina") ///
	| (origin_country == "RepArg") | (origin_country == "RepArgSoAm") ///
	| (origin_country == "Arg Rep") | (origin_country == "Rep Arg")
replace origin_country = "Armania" if (origin_country == "Armeny") 
replace origin_country = "Austria" if (origin_country == "Asutria") ///
	| (origin_country=="Austrial") | (origin_country=="Austrian") ///
	| (origin_country=="Austriaa") | (origin_country=="Austrian") 
replace origin_country = "Australia" if (origin_country == "Aus") ///
	| (origin_country == "Aust") 
replace origin_country = "Belgium" if (origin_country == "Belg") ///
	| (origin_country=="Belguim")
replace origin_country = "Belarus" if (origin_country == "Minsk") ///
	| (origin_country == "Grodno") | (origin_country == "Pinsk Reg") ///
	| (origin_country == "Witebsk")	| (origin_country == "Mohilew") ///
	| (origin_country == "Pinsk")	| (origin_country == "Pinsk R") ///
	| (origin_country == "Pinsk Region")	| (origin_country == "Mohilew") 
// Should Bermuda be a country?
replace origin_country = "Bermuda" if (origin_country == "Bda")
replace origin_country = "Bosnia and Herzegovina" if (origin_country == "Herzegovina")
replace origin_country = "Brazil" if (origin_country == "Brasil")
replace origin_country = "Bulgaria" if (origin_country == "Bulgary")
replace origin_country = "Canada" if (origin_country == "Nfld") ///
	| (origin_country == "Newfoundland") | (origin_country == "Ont") ///
	| (origin_country == "Can") | (origin_country == "Ontario") ///
	| (origin_country == "Bc") | (origin_country == "Alberta") ///
	| (origin_country == "Nova Scotia") | (origin_country == "Alta")
replace origin_country = "Chile" if (origin_country == "Chili")
replace origin_country = "Colombia" if (origin_country == "Columbia")
replace origin_country = "Croatia" if (origin_country == "Dalmatia") ///
	| (origin_country == "Slavonia") | (origin_country == "Slavonia") ///
	| (origin_country == "Croatian") | (origin_country == "Slavonia")	
replace origin_country = "Curacao" if (origin_country == "Dwi")
// Reassemble the Czech Republic - IS THIS APPROPRIATE???
replace origin_country = "Czech Republic" if (origin_country == "Bohemia") ///
	| (origin_country == "Moravia") | (origin_country == "Cz Slov") ///
	| (origin_country == "Czechoslovakia") | (origin_country == "Cz Sl") ///
	| (origin_country == "Slovakia") | (origin_country == "Cz Slovak") ///
	| (origin_country == "Czechosl") | (origin_country == "Czecho Slovakia") ///
	| (origin_country == "Czslov") | (origin_country == "Czechosl") ///
	| (origin_country == "Silesia") | (origin_country == "Cz-Sl") ///
	| (origin_country == "Czecho-Sl") | (origin_country == "Czecho-Slovakia") ///
	| (origin_country == "Cz Slovakia") | (origin_country == "Morovia") ///
	| (origin_country == "Czechoslov") | (origin_country == "Cs-Sl") ///
	| (origin_country == "Slovak") | (origin_country == "Morovia") ///
	| (origin_country == "Czsl") | (origin_country == "C-Sl") ///
	| (origin_country == "Czslovak") | (origin_country == "Czeco-Sl") ///
	| (origin_country == "Czecho Sl") | (origin_country == "Czeckoslovakia") ///
	| (origin_country == "Czec Slav") | (origin_country == "Slovaky") ///
	| (origin_country == "Czech") | (origin_country == "Czecko Slovakia") ///
	| (origin_country == "Czslovakia") | (origin_country == "Tchecosl") ///
	| (origin_country == "C Slovak") | (origin_country == "Cecho-Slovakia") ///
	| (origin_country == "C Slovakia") | (origin_country == "Cechoslovakia") ///
	| (origin_country == "Chechoslovakia") | (origin_country == "Cz Slovia") ///
	| (origin_country == "Cz Slow") | (origin_country == "Czec Slov") ///
	| (origin_country == "Czech Slov") | (origin_country == "Czecho") ///
	| (origin_country == "Czecho Slovak") | (origin_country == "Czecho Slovakie") ///
	| (origin_country == "Czecho-Slovak") | (origin_country == "Czechos") ///
	| (origin_country == "Czechoslavakia") | (origin_country == "Czechoslovacia") ///
	| (origin_country == "Czechoslovak") | (origin_country == "Czecoe-Slov") ///
	| (origin_country == "Czecslav") | (origin_country == "Czekoslovakia") 
replace origin_country = "Denmark" if (origin_country == "Denm") ///
	| (origin_country == "Den") | (origin_country == "Denmark USA") ///
	| (origin_country == "Hellerup") | (origin_country == "Denmarc")
replace origin_country = "Dominican Republic" if (origin_country == "Santo Domingo") ///
	| (origin_country == "Dr") | (origin_country == "Dom Rep") ///
	| (origin_country == "Sto Domingo") | (origin_country == "Dom Rep")
replace origin_country = "Egypt" if (origin_country == "Africa") & ((origin_city == "Alexandria") | (origin_city == "Cairo"))
replace origin_country = "Egypt" if (origin_country == "Egypte") ///
	| (origin_country == "Alexandria") | (origin_country == "Egypte") 
// Guernsey and Isle Of Man probably shouldn't be in England (although putting it in Great Britain would be okay)
replace origin_country = "England" if (origin_country == "Eng") ///
	| (origin_country == "Engl?Nd") | (origin_country == "English") ///
	| (origin_country == "Englanmd") | (origin_country == "Elgland") ///
	| (origin_country == "Gr Brit") | (origin_country == "Kent") ///
	| (origin_country == "Guernsey") | (origin_country == "London")	///
	| (origin_country == "Cheshire") | (origin_country == "Isle Of Man")	
replace origin_country = "El Salvador" if (origin_country == "Salvador")
replace origin_country = "Finland" if (origin_country == "Aland")
// Galicia is a legit historical area even though not a country anymore, but should not be separate to Galicy
replace origin_country = "Galicia" if (origin_country == "Galicy") ///
	| (origin_country == "Galizia") | (origin_country == "Galacia") ///
	| (origin_country == "E Galicia") | (origin_country == "Gal")	
// Should Steiermark be in Germany?
replace origin_country = "Germany" if (origin_country == "Germ") ///
	| (origin_country == "German") | (origin_country == "Germany A/M") ///
	| (origin_country == "Ger") | (origin_country == "Steiermark")
replace origin_country = "Greece" if (origin_country == "Greek") ///
	| (origin_country == "Attica") | (origin_country == "Greek") 
replace origin_country = "Guatemala" if (origin_country == "Guatamala") ///
	| (origin_country == "Guat") | (origin_country == "Guatamla") ///
	| (origin_country == "Central America") // Note Central America was checked to make sure there weren't other countries in there
replace origin_country = "Guyana" if (origin_country == "Demerara") ///
	| (origin_country == "B Guiana") | (origin_country == "Demerara")
replace origin_country = "Hungary" if (origin_country == "Hung") ///
	| (origin_country == "Hungaria") | (origin_country == "Ungary")	
replace origin_country = "Ireland" if (origin_country == "Iireland") ///
	| (origin_country == "Co Kerry") | (origin_country == "Ire") ///
	| (origin_country == "Co Cork") | (origin_country == "Cork")
// Reconstruct Italy from the Italian states
replace origin_country = "Italy" if (origin_country == "Palermo") ///
	| (origin_country == "Caserta") | (origin_country == "Salerno") ///
	| (origin_country == "Cosenza") | (origin_country == "Sicily") ///
	| (origin_country == "Messina") | (origin_country == "Avellino") ///
	| (origin_country == "Bari") | (origin_country == "Girgenti") ///
	| (origin_country == "Trapani") | (origin_country == "Napoli") ///
	| (origin_country == "Catanzaro") | (origin_country == "Potenza") ///
	| (origin_country == "Roma") | (origin_country == "Catania") ///
	| (origin_country == "Aquila") | (origin_country == "Siracusa") ///
	| (origin_country == "Benevento") | (origin_country == "Campobasso") ///
	| (origin_country == "Chieti") | (origin_country == "Foggia") ///
	| (origin_country == "Lucca") | (origin_country == "Caltanissetta") ///
	| (origin_country == "Genova") | (origin_country == "Udine") ///
	| (origin_country == "Teramo") | (origin_country == "Naples") ///
	| (origin_country == "Pesaro") | (origin_country == "Reggio C") ///
	| (origin_country == "Torino") | (origin_country == "Reggio") ///
	| (origin_country == "Treviso") | (origin_country == "Vicenza") ///
	| (origin_country == "Alessandria") | (origin_country == "Aguila") ///
	| (origin_country == "Ancona") | (origin_country == "Novara") ///
	| (origin_country == "Perugia") | (origin_country == "Parma") ///
	| (origin_country == "South Sicily") | (origin_country == "Sicily") ///
	| (origin_country == "Calabria") | (origin_country == "Milano") ///
	| (origin_country == "Reggio Cal") | (origin_country == "Firenze") ///
	| (origin_country == "Belluno") | (origin_country == "Caltanisetta") ///
	| (origin_country == "Pisa") | (origin_country == "Pavia") ///
	| (origin_country == "C Basso") | (origin_country == "Lecce") ///
	| (origin_country == "Italian") | (origin_country == "South Italy") ///
	| (origin_country == "Itlay") | (origin_country == "Modena") ///
	| (origin_country == "Bologna") | (origin_country == "Verona") ///
	| (origin_country == "Trento") | (origin_country == "Piacenza") ///
	| (origin_country == "Potensa") | (origin_country == "Brescia") ///
	| (origin_country == "Como") | (origin_country == "Ascoli") ///
	| (origin_country == "Ita") | (origin_country == "Bergamo") ///
	| (origin_country == "Forli") | (origin_country == "Cuneo") ///
	| (origin_country == "Rome") | (origin_country == "Cosensa") ///
	| (origin_country == "Rovigo") | (origin_country == "Genoa") ///
	| (origin_country == "Reggiol") | (origin_country == "Cbasso") ///
	| (origin_country == "Molise") | (origin_country == "Sondrio") ///
	| (origin_country == "Ascoli P") | (origin_country == "Ital") ///
	| (origin_country == "So Italy") | (origin_country == "Caltaniss") ///
	| (origin_country == "Salermo") | (origin_country == "Gergenti") ///
	| (origin_country == "Agusta") | (origin_country == "Arezzo") ///
	| (origin_country == "Arellino") | (origin_country == "Arezzo")
replace origin_country = "Italy" if (origin_country == "Italy Italy") ///
	| (origin_country == "It") | (origin_country == "Italia")
replace origin_country = "Jamaica" if (origin_country == "Ja") ///
	| (origin_country == "Jamacia")
replace origin_country = "Latvia" if (origin_country == "Lettonia") ///
	| (origin_country == "Lettland") | (origin_country == "Livland")
replace origin_country = "Lebanon" if (origin_country == "Liban") ///
	| (origin_country == "Syrie Asian Turkey") | (origin_country == "Liban") 
replace origin_country = "Lithuania" if (origin_country == "Kowno") ///
	| (origin_country == "Wilna") | (origin_country == "Lith") ///
	| (origin_country == "Lietuva") | (origin_country == "Wilno") ///
	| (origin_country == "Lithauen") | (origin_country == "Lituania") 
replace origin_country = "Lithuania" if (origin_country == "Lithuan") ///
	| (origin_country == "Lithania") | (origin_country == "Lithaua") ///
	| (origin_country == "Lithaunia") | (origin_country == "Lithuanian")
replace origin_country = "Luxembourg" if (origin_country == "Luxemburg") 
replace origin_country = "Mexico" if (origin_country == "Mex") 
replace origin_country = "Moldova" if (origin_country == "Bessarabia") ///
	| (origin_country == "Besarabia") | (origin_country == "Bessarabia")
replace origin_country = "Netherlands" if (origin_country == "Netherland") ///
	| (origin_country == "Holland") | (origin_country == "Netherl") ///
	| (origin_country == "Holl") | (origin_country == "Dutch") ///
	| (origin_country == "Neth") | (origin_country == "Dutch") 	
replace origin_country = "Norway" if (origin_country == "Nor") ///
	| (origin_country == "Norw")
replace origin_country = "Palestine" if (origin_country == "Palestina") ///
	| (origin_country == "Palistine")
replace origin_country = "Panama" if (origin_country == "Republic Of Panama") ///
	| (origin_country == "R Of P") | (origin_country == "C Z") ///
	| (origin_country == "Canal Zone") | (origin_country == "C Z")
replace origin_country = "Poland" if (origin_country == "Lomza") ///
	| (origin_country == "Danzig") | (origin_country == "Suwalk") ///
	| (origin_country == "Plock") | (origin_country == "Warschau")	
replace origin_country = "Portugal" if (origin_country == "St Michael'S") ///
	| (origin_country == "St Michaels") | (origin_country == "Madeira") ///
	| (origin_country == "Azores") | (origin_country == "Terceira")	///
	| (origin_country == "Flores") | (origin_country == "Azores (St Michaels)")	///
	| (origin_country == "Azores Terceira") | (origin_country == "Azores (St Michaels)")
replace origin_country = "Puerto Rico" if (origin_country == "P R") ///
	| (origin_country == "Pr") | (origin_country == "P R") 
replace origin_country = "Romania" if (origin_country == "Roumania.") ///
	| (origin_country == "Roumany") | (origin_country == "Roumania") ///
	| (origin_country == "Roum") | (origin_country == "Roumanian") ///
	| (origin_country == "Rumania") | (origin_country == "Rouman") ///
	| (origin_country == "Rumenia") | (origin_country == "Rouman")
replace origin_country = "Russia" if (origin_country == "Samara") ///
	| (origin_country == "Russian") | (origin_country == "Saratow") ///
	| (origin_country == "Russiaa") | (origin_country == "Saratow") 
replace origin_country = "Saint Kitts and Nevis" if (origin_country == "St Kitts") ///
	| (origin_country == "B W I") | (origin_country == "St Kitts") 
replace origin_country = "Scotland" if (origin_country == "Scot") ///
	| (origin_country == "Glasgow") | (origin_country == "Scot")
replace origin_country = "Serbia" if (origin_country == "Servia") 
replace origin_country = "South Africa" if (origin_country == "So Africa") ///
	| (origin_country == "S Africa") | (origin_country == "S Afr") ///
	| (origin_country == "S Af") | (origin_country == "S'Africa") ///
	| (origin_country == "So Afrika")
replace origin_country = "South Africa" if (origin_country == "Africa") & ((origin_city == "Johannesburg") | (origin_city == "Cape Town"))
replace origin_country = "Slovenia" if (origin_country == "Carniola") ///
	| (origin_country == "Krain")
// Make Shs and S H S consistent - NOT SURE WHAT IT'S MEANT TO BE
replace origin_country = "S H S" if (origin_country == "Shs")
replace origin_country = "Spain" if (origin_country == "Alicante") ///
	| (origin_country == "Barcelona") | (origin_country == "Alicante")
replace origin_country = "Sweden" if (origin_country == "Swe") ///
	| (origin_country == "Swed") | (origin_country == "Swe")
replace origin_country = "Switzerland" if (origin_country == "Switzserland") ///
	| (origin_country == "Switz") | (origin_country == "Swiss") ///
	| (origin_country == "Switzerl") | (origin_country == "Switzer")	
replace origin_country = "Syria" if (origin_country == "Syrie") ///
	| (origin_country == "Syrian") | (origin_country == "Syrie") 
replace origin_country = "Trinidad and Tobago" if (origin_country == "Trinidad") ///
	| (origin_country == "Bwi") | (origin_country == "Trinidad") 
replace origin_country = "Tunisia" if (origin_country == "Africa") & (origin_city == "Tunis")
replace origin_country = "Turkey" if (origin_country == "Turkey A") ///
	| (origin_country == "Turkey E") | (origin_country == "Turkish") ///
	| (origin_country == "Turk") | (origin_country == "Turky") ///
	| (origin_country == "Asia Minor") | (origin_country == "Costantinopoli") ///
	| (origin_country == "Turquey") | (origin_country == "Costantinopoli")
replace origin_country = "Ukraine" if (origin_country == "Cherson") ///
	| (origin_country == "Podol") | (origin_country == "Poltawa") ///
	| (origin_country == "Ukrainia") | (origin_country == "Kiev")
// Change country of origin from various US states to United States
replace origin_country = "United States" if (origin_country == "Ny") ///
	| (origin_country == "Pa") | (origin_country == "Ill") ///
	| (origin_country == "Mass") | (origin_country == "Nj") ///
	| (origin_country == "N Y") | (origin_country == "Ohio") ///
	| (origin_country == "New York") | (origin_country == "Conn") ///
	| (origin_country == "Mich") | (origin_country == "Minn") ///
	| (origin_country == "Wisc") | (origin_country == "N J") ///
	| (origin_country == "Wash") | (origin_country == "Cal") ///
	| (origin_country == "Ind") | (origin_country == "Iowa")	
replace origin_country = "United States" if (origin_country == "USA (Casamicclole Ischia") ///
	| (origin_country == "USA Or Castellanimare Golfo") | (origin_country == "USA Or Santiago de Cuba") ///
	| (origin_country == "U S A") | (origin_country == "US") ///
	| (origin_country == "U S") | (origin_country == "USA Mass") ///
	| (origin_country == "United States") | (origin_country == "United States Of America") ///
	| (origin_country == "America") | (origin_country == "U.S.A. (Lenola") ///
	| (origin_country == "U S Of A") | (origin_country == "NY USA  Jettenback") ///
	| (origin_country == "NY USA  Jettenback") | (origin_country == "Usa") ///
	| (origin_country == "Us") | (origin_country == "USA") ///
	| (origin_country == "Ny Usa") | (origin_country == "Mont") ///
	| (origin_country == "Col") | (origin_country == "St Thomas") ///
	| (origin_country == "Mo") | (origin_country == "Texas") ///
	| (origin_country == "Il") | (origin_country == "W Va")	///
	| (origin_country == "Ills") | (origin_country == "O")	///
	| (origin_country == "Pa Usa") | (origin_country == "Mass Usa")	///
	| (origin_country == "Ri") | (origin_country == "St Croix") ///
	| (origin_country == "Illinois") | (origin_country == "Nebr") ///
	| (origin_country == "Ore") | (origin_country == "Michigan") ///
	| (origin_country == "Pennsylvania") | (origin_country == "New Jersey") ///
	| (origin_country == "Oh") | (origin_country == "Ill Usa") ///
	| (origin_country == "Indiana") | (origin_country == "Wis") ///	
	| (origin_country == "Brooklyn") | (origin_country == "Ca") ///
	| (origin_country == "Calif") | (origin_country == "California") ///
	| (origin_country == "Nj Usa") | (origin_country == "Utah") ///
	| (origin_country == "Vi") | (origin_country == "Wyo") ///
	| (origin_country == "Nh") | (origin_country == "Ma") ///
	| (origin_country == "Mich Usa") | (origin_country == "Minnesota") ///
	| (origin_country == "Montana") | (origin_country == "Nyork")
replace origin_country = "Venezuela" if (origin_country == "Venez")
replace origin_country = "Wales" if (origin_country=="Swales")


// Do the same as above, but use loops and locals instead - eh Statan.

local Algeria `" "Konstantin" "'
foreach town of local Algeria {
	quietly replace origin_country = "Algeria" if (origin_country == "`town'")
}

local AntiguaAndBarbuda `" "Antigua" "'
foreach town of local AntiguaAndBarbuda {
	quietly replace origin_country = "Antigua and Barbuda" if (origin_country == "`town'")
}

local Argentina `" "Rosario" "Entre Rios" "B' Aires" "Caraffa" "Monte" "'
foreach town of local Argentina {
	quietly replace origin_country = "Argentina" if (origin_country == "`town'")
}

local Armenia `" "Armania" "'
foreach town of local Armenia {
	quietly replace origin_country = "Armenia" if (origin_country == "`town'")
}

local Australia `" "Ballina" "Bronte" "Sydney" "'
foreach town of local Australia {
	quietly replace origin_country = "Australia" if (origin_country == "`town'")
}

local Austria `" "Graz" "Tirol" "Berndorf" "L Austria" "Rausaitz" "Freudenthal" "Karnten" "Tyrol" "Styria" "Vienna" "Wien" "'
foreach town of local Austria {
	quietly replace origin_country = "Austria" if (origin_country == "`town'")
}

local Bahrain `" "Ali" "'
foreach town of local Bahrain {
	quietly replace origin_country = "Bahrain" if (origin_country == "`town'")
}


local Belarus `" "Bobruisk" "Sluck" "Brest Lit" "Sluzk" "Antopol" "Kobrin" "Beresina" "Grodna" "Mogilew" "Slutzk" "Slonim" "Homel" "'
foreach town of local Belarus {
	quietly replace origin_country = "Belarus" if (origin_country == "`town'")
}

local Belgium `" "Thielt" "Knocke" "Gent" "Nevele" "Belgian" "Verviers" "Beveren" "Jemappes" "Vracene" "Antwerpen" "Bassevelde" "Brussels" "Jumet" "Antwerp" "'
foreach town of local Belgium {
	quietly replace origin_country = "Belgium" if (origin_country == "`town'")
}

local BosniaAndHerzegovina `" "Resina" "'
foreach town of local BosniaAndHerzegovina {
	quietly replace origin_country = "Bosnia and Herzegovina" if (origin_country == "`town'")
}

local Brazil `" "Rio" "Buenos Ayres" "Sao Paulo" "S Paulo" "B Aires" "Buenos Aires" "Rio De Janeiro" "Bonito" "Rio De Janerio" "San Paulo" "Rio De Janiero" "'
foreach town of local Brazil {
	quietly replace origin_country = "Brazil" if (origin_country == "`town'")
}

local BritishGuiana `" "British Guiana" "'
foreach town of local BritishGuiana {
	quietly replace origin_country = "British Guiana" if (origin_country == "`town'")
}

local Bulgaria `" "Kamenetz" "'
foreach town of local Bulgaria {
	quietly replace origin_country = "Bulgaria" if (origin_country == "`town'")
}

local Canada `" "Wasa" "Terranova" "Toronto" "Montreal" "Halifax" "Airdrie" "'
foreach town of local Canada {
	quietly replace origin_country = "Canada" if (origin_country == "`town'")
}

local Chile `" "Santiago" "'
foreach town of local Chile {
	quietly replace origin_country = "Chile" if (origin_country == "`town'")
}

local Colombia `" "Salento" "Barranquilla" "Bogota" "'
foreach town of local Colombia {
	quietly replace origin_country = "Colombia" if (origin_country == "`town'")
}

local Croatia `" "Istria" "Bunic" "Dalmacia" "Lissa" "Ogulin" "Castel S Giorgio" "Mrkopalj" "Fuzine" "'
foreach town of local Croatia {
	quietly replace origin_country = "Croatia" if (origin_country == "`town'")
}

local Cuba `" "Cuban" "Habana" "Havana Cuba" "Havana" "'
foreach town of local Cuba {
	quietly replace origin_country = "Cuba" if (origin_country == "`town'")
}

local Cyprus `" "Nicosia" "Chypre" "'
foreach town of local Cyprus {
	quietly replace origin_country = "Cyprus" if (origin_country == "`town'")
}

local Czechoslovakia `" "Tchecoslovakia" "T Slov" "T Slovak" "Tcheco-Slovakie" "Tcheco-Slovaky" "Teplitz" "Pisek" "Krasna" "Krasno" "Pecky" "Plzen" "Radomysl" "Ledenice" "Prag" "'
foreach town of local Czechoslovakia {
	quietly replace origin_country = "Czech Republic" if (origin_country == "`town'")
}

local Denmark `" "Aalborg" "Hjorring" "Funen" "Bornholm" "Aadalen" "Aarhus" "Danemark" "Esbjerg" "Christiania" "Copenhagen" "'
foreach town of local Denmark {
	quietly replace origin_country = "Denmark" if (origin_country == "`town'")
}

local DominicanRepublic `" "Sto Dgo" "'
foreach town of local DominicanRepublic {
	quietly replace origin_country = "Dominican Republic" if (origin_country == "`town'")
}

local Egypt `" "Cario" "Alexandrie" "'
foreach town of local Egypt {
	quietly replace origin_country = "Egypt" if (origin_country == "`town'")
}

local ElSalvador `" "San Salvador" "'
foreach town of local ElSalvador {
	quietly replace origin_country = "El Salvador" if (origin_country == "`town'")
}

local England `" "Gibraltar" "Derby" "Oldham" "Lpool" "L'Pool" "Curland" "Bristol" "Motherwell" "Bradford" "Durham" "Perth" "Newcastle" "Coatbridge" "Bolton" "Nottingham" "Hull" "Leeds" "Cornwall" "Wigan" "London England" "Southampton" "Barrow" "Norfolk" "Chesterfield" "Sussex" "Surrey" "Lancaster" "Tunstall" "Liverpool" "Manchester" "Liverpool/England" "Plymouth" "Hirst" "Leigh" "Burnley" "Sunderland" "Walsall" "Grimsby" "Preston" "Devon" "Norwich" "Acklington" "Stoke" "Burslem" "York" "Bacup" "Blackburn" "Sala" "Stafford" "Newcastle On Tyne" "Bootle" "Brighton" "Kidderminster" "Leicester" "Portsmouth" "Tipton" "Dover" "Emgland" "Ilford" "Kendal" "Rochdale" "Workington" "Ashington" "Barnsley" "Gateshead" "Shipley" "Englad" "'
foreach town of local England {
	quietly replace origin_country = "England" if (origin_country == "`town'")
}

local Estonia `" "Esthonia" "'
foreach town of local Estonia {
	quietly replace origin_country = "Estonia" if (origin_country == "`town'")
}

local Finland `" "Finl" "Ylistaro" "Hango" "'
foreach town of local Finland {
	quietly replace origin_country = "Finland" if (origin_country == "`town'")
}

local France `" "Corbara" "Gran" "French" "Elsass" "Villetta" "Pire" "Lussin" "Massa C" "Arcis" "Lyon" "Montigny" "Avion" "Taverna" "Auzi" "Decazeville" "Piana" "Tassy" "Belfort" "Corse" "Gard" "Marchienne" "Lille" "St Medard" "Taurien" "Strassburg" "Besseges" "Lievin" "Brest" "Marseilles" "Marseille" "Roubaix" "Paris" "Martinique" "'
foreach town of local France {
	quietly replace origin_country = "France" if (origin_country == "`town'")
}

local Georgia `" "Batoum" "'
foreach town of local Georgia {
	quietly replace origin_country = "Georgia" if (origin_country == "`town'")
}

local Germany `" "Bruch" "Munchen" "Rohrbach" "Dusseldorf" "Bavaria" "Solingen" "Gelsenkirchen" "Oberhausen" "Sande" "Warsow" "Zernigow" "Elberfeld" "Hannover" "Altona" "Frankfurt" "Bergdorf" "Dronthjem" "Nikolajew" "Flensburg" "Neuburg" "Beyreuth" "Chemnitz" "Harburg" "Neustadt" "Schonberg" "Worms" "Beyruth" "Kolna" "Sulz" "Mannheim" "Landau" "Essen" "Kassel" "Leipzig" "Bremen" "Berlin" "Hamburg" "Dresden" "'
foreach town of local Germany {
	quietly replace origin_country = "Germany" if (origin_country == "`town'")
}

local Greece `" "Sparte" "Argos" "Tripolis" "Pireo" "Piraeus" "Piree" "Sparta" "Athens" "Xania" "Piraens" "Icaria" "Smyrna" "Castoria" "Grecia" "Crete" "Mantinia" "Grevena" "Laconia" "Corinthia" "Patras" "Chios" "Epire" "Florina" "Sparti" "Corinth" "Corinthe" "Le Piree" "Leonidion" "Creta" "Elgin" "Megalopolis" "Syra" "'
foreach town of local Greece {
	quietly replace origin_country = "Greece" if (origin_country == "`town'")
}

local Haiti `" "Port Au Prince" "Hayti" "'
foreach town of local Haiti {
	quietly replace origin_country = "Haiti" if (origin_country == "`town'")
}

local Hungary `" "Ungarn" "Budapest" "'
foreach town of local Hungary {
	quietly replace origin_country = "Hungary" if (origin_country == "`town'")
}

local Ireland `" "Castlerea" "Galway" "Kilrush" "Clonmel" "Listowel" "Cavan" "Dingle" "Drogheda" "Kerry" "Tralee" "Tipperary" "Waterford" "Ballinrobe" "Killarney" "Thurles" "Leitrim" "Ballyjamesduff" "Co Galway" "Kenmare" "Killaloe" "Swinford" "Bantry" "Castleisland" "Kildare" "Longford" "Sligo" "Donegal" "Limerick" "Dublin" "'
foreach town of local Ireland {
	quietly replace origin_country = "Ireland" if (origin_country == "`town'")
}

local Israel `" "Jaffa" "Jerusalem" "'
foreach town of local Israel {
	quietly replace origin_country = "Israel" if (origin_country == "`town'")
}

local Italy `" "Balestrate" "Bientina" "Caserto" "Castellamonte" "Esperia" "Falerna" "Isernia" "Mineo" "S Vito" "Tirolo" "Accadia" "Carlopoli" "Ceccano" "Celico" "Cervino" "Cropani" "Lascari" "Lauro" "Lucera" "Marcianise" "Perito" "Roccamonfina" "Rovito" "S Marco" "Sassari" "Sicignano" "Alvignano" "Caltavuturo" "Camposano" "Casacalenda" "Castelpetroso" "Cicciano" "Deliceto" "Lacedonia" "Larino" "Licata" "Lida" "Ottone" "Pisciotta" "Poggioreale" "Ponza" "Atessa" "Castelfranci" "Castellana" "Castrovillari" "Conflenti" "Formia" "Gangi" "Lettere" "Mendicino" "Montemiletto" "Montesano" "Palmero" "Pizzone" "S Leucio" "Salemi" "Venosa" "Asti" "Atella" "Augri" "Campochiaro" "Casandrino" "Corio" "Dragoni" "Fivizzano" "Librizzi" "Matera" "Mercogliano" "Mignano" "Monteroduni" "Ortucchio" "Pellaro" "Pescia" "Pignola" "Pratola" "R Calabria" "S Arsenio" "S Biase" "Solopaca" "Te" "Agropoli" "Bagnoli" "Bianchi" "Bracigliano" "Caivano" "Casamicciola" "Castellabate" "Cinisi" "Forino" "Forio" "Gimigliano" "Guardiagrele" "Mazzara" "Mesfina" "Milan" "Montefusco" "Oriolo" "Palazzo Adriano" "Palena" "Roccadaspide" "Rometta" "S Elia" "S Lorenzo" "S Stefano C" "Sermide" "Sersale" "Siderno" "Ascoli Piceno" "Baragiano" "Bonefro" "Carbonara" "Catansaro" "Coreglia" "Gesso" "Montefalcione" "Ortona" "Pacentro" "Palerno" "Plati" "Riesi" "S Andrea" "Serrastretta" "Spinoso" "Vittorio" "Baranello" "Barletta" "Bedonia" "Bisaccia" "Bucciano" "Campobosso" "Caramanico" "Casenza" "Cassino" "Celenza" "Fontechiari" "Galdo" "Galizien" "Geraci" "Gioia Del Colle" "Maranola" "Medicina" "Moschiano" "Petina" "Reggio Calab" "S Mauro" "Salemo" "Secondigliano" "Senerchia" "Sicely" "Terlizzi" "Trani" "Vacri" "Valperga" "Asiago" "Campofiorito" "Carrara" "Castrogiovanni" "Ferrazzano" "Fossalto" "Frosinone" "Gildone" "Giovinazzo" "Graguano" "Introdacqua" "Ischia" "Italyy" "Longano" "Marano" "Marcellinara" "Marliana" "Militello" "Minori" "Modugno" "Monopoli" "Morolo" "Pastena" "Riccio" "Ruviano" "S Maria" "S Mauro Forte" "S Pier Niceto" "S Prisco" "Sepino" "Valguarnera" "Varsi" "Venezia" "Villanova" "Acireale" "Castellano" "Catona" "Forenza" "Francavilla" "Frigento" "Grumo App" "Itri" "Locana" "Lucito" "Mantova" "Montagano" "Montecalvo" "Montelepre" "Paduli" "Palomonte" "Penne" "Petrizzi" "Pietramelara" "Pietraperzia" "Postiglione" "Pozzilli" "Reggio E" "Resultano" "Riposto" "Rocca" "Roccapalumba" "S Angelo Lombardi" "S Antonio" "S Paolina" "Salle" "Siano" "Sperlinga" "St Domingo" "St Martins" "Viareggio" "Viggiano" "Alberobello" "Altamura" "Biella" "Briano" "Busso" "Caggiano" "Calascio" "Calvello" "Campolieto" "Candela" "Casagiove" "Casalnuovo" "Cattanissetta" "Ceppaloni" "Cerreto" "Cesaro" "Cigliano" "Corleto Pert" "Galluccio" "Giffone" "Grammichele" "Grotteria" "Guarcino" "Laviano" "Linguaglossa" "Lioni" "Macerata" "Norcia" "Orentano" "Piedimonte" "Pietradefusi" "Pietraroia" "Polizzi Generosa" "S Angelo L" "S Giorgio" "Sstefano" "Tricarico" "Trieste" "Tufino" "Arienzo" "Auletta" "Auronzo" "Bagnara" "Bernalda" "Bucchianico" "Calascibetta" "Carpineto" "Castelforte" "Ceraso" "Felitto" "Ficarazzi" "Formicola" "Grimaldi" "Italy South" "Limatola" "Manziana" "Messino" "Oliveto Citra" "Opi" "Ottati" "Pietrastornina" "Pistoia" "Polistena" "Pontecorvo" "Posada" "Recale" "Ripabottoni" "Roccarainola" "S Antimo" "S Bartolomeo" "S Croce" "Scigliano" "Sermide Mantova" "Toretto" "Tramonti" "Tursi" "Vallata" "Varese" "Acerno" "Arpaia" "Arzano" "Ascea" "Avezzano" "Caltanisfetta" "Campobano" "Campobapo" "Capannori" "Cartoceto" "Chiavari" "Cortale" "Forio D'Ischia" "Gratteri" "Grumo Appula" "Liveri" "Longobucco" "Marlia" "Martone" "Moiano" "Molina" "Monastero" "Monte S Angelo" "Montemagno" "Montemarciano" "North Italy" "Ofena" "Palermo Sicily" "Paternopoli" "Patrica" "Pedara" "Pellezzano" "Perano" "Pescasseroli" "Piaggine" "Po" "Rapino" "Rapolla" "Roccamontepiano" "Roccaraso" "S Agata Dei Goti" "S Agnello" "S Eusanio" "S Felice" "S Gregorio" "S Gregorio M" "S Nicola" "Sala Consilina" "San Donato" "St Margherita" "Striano" "Strongoli" "Toschan" "Troina" "Vairano" "Amorosi" "Arce" "Arpino" "Barrea" "Bettola" "Borgia" "Boscoreale" "Brusciano" "Brusnengo" "Calatafini" "Canicatti" "Cardito" "Casapulla" "Castel Di Sangro" "Castelfrentano" "Castelli" "Castelmorrone" "Caulonia" "Cento" "Cesa" "Cicily" "Cimina" "Compiano" "Corigliano" "Corleto" "Cuggiono" "Cusano" "Falcone" "Fermini" "Flumeri" "Foglizzo" "Forno" "Geraci Siculo" "Grosseto" "Lapio" "Leonforte" "Livorno" "Molinella" "Montalto" "N Italy" "Pisticci" "Pomigliano" "Pontremoli" "Rapone" "Rosarno" "Rutino" "S Costantino" "S Cristina" "S Mango" "S Vincenzo" "Sannicandro" "Scisciano" "Settefrati" "Summonte" "Trevico" "Triggiano" "Varazze" "Vergato" "Vico Garganico" "Villa S Giovanni" "Acquasanta" "Aidone" "Aliano" "Anagni" "Augusto" "Bancino" "Berceto" "Bisaquino" "Calatabiano" "Cantalupo" "Capriglia" "Casola" "Casteltermini" "Catanjaro" "Cattolica" "Cefalie" "Cercepiccola" "Cerisano" "Cerzeto" "Cicagna" "Contrada" "Cupello" "Duronia" "Ferentino" "Gesualdo" "Gioiosa" "Grottaminarda" "Grumo" "Laureana" "Lizzano" "Mirto" "Modica" "Montemarano" "Monticelli" "Montorio" "Morreale" "Neirone" "Nocera Inf" "Noto" "Padova" "Paglieta" "Paola" "Pastorano" "Pomarico" "Raiano" "Ripi" "Roccalumera" "S Arcangelo" "S Demetrio" "S Donato N" "S Nicandro" "Salerni" "Scofati" "Seiacca" "Soverato" "Spezzano" "Torre Del Greco" "Turin" "Valva" "Vittoria" "Corleone" "S Stefano" "S Agata" "S Margherita" "S Fele" "S Flavia" "S Cataldo" "S Ninfa" "S Angelo" "S Fratello" "S Donato" "S Giovanni" "S Caterina" "S Salvatore" "S Valentino" "S Pietro" "S Guiseppe" "S Martino" "S Egidio" "S Giuseppe" "Cerda" "Marineo" "Lercara" "Bagheria" "Campagna" "Menfi" "Avigliano" "Roman" "Sarno" "Ribera" "Trabia" "Cefalu" "Caccamo" "Lipari" "Valledolmo" "Sambuca" "Alcamo" "Vinchiaturo" "Camporeale" "Polizzi" "Castelvetrano" "Terrasini" "Toritto" "Melfi" "Partanna" "Marsala" "Marigliano" "Vicari" "Castellammare" "Gagliano" "Maddaloni" "Amalfi" "Padula" "Cervinara" "Caiazzo" "Riccia" "Sassano" "Scafati" "Alimena" "Collesano" "Minturno" "Ventimiglia" "Teora" "Montella" "Bisacquino" "Massa" "Atripalda" "Vallelunga" "Gerace" "Afragola" "Ariano" "Melilli" "Misilmeri" "Serradifalco" "Vico Equense" "Agerola" "Borgetto" "Castelbuono" "Milazzo" "Positano" "Teano" "Bolognetta" "Decollatura" "Serino" "Carini" "Saviano" "Stigliano" "Partinico" "Scilla" "Montemaggiore" "Pagani" "Acerra" "Andretta" "Venafro" "Angri" "Craco" "Eboli" "Montedoro" "Rionero" "Vasto" "Buccino" "Faeto" "Castiglione" "Nocera" "Capua" "Collelongo" "Gragnano" "Morcone" "Castellamare" "Agnone" "Bovino" "Castrofilippo" "Bivona" "Muro Lucano" "Sulmona" "Pontelandolfo" "Tegiano" "Biccari" "Ciminna" "Greci" "Mistretta" "Sanfele" "Carovilli" "Petralia" "Calitri" "Castelfranco" "Grotte" "Pettorano" "Regalbuto" "Atrani" "Caltabellotta" "Castroreale" "Ragusa" "Marianopoli" "Montecorvino" "Burgio" "Aversa" "Calabritto" "Faicchio" "Frosolone" "Sciara" "Sorrento" "Amantea" "Baucina" "Bellona" "Caposele" "Prizzi" "Agira" "Fisciano" "Casoli" "Salandra" "Troia" "Verbicaro" "Calatafimi" "Gallico" "Monreale" "Montalbano" "Poggiomarino" "Ricigliano" "Accettura" "Airola" "Alberona" "Alfedena" "Fanano" "Fornelli" "Giarre" "Maschito" "Monteforte" "Panni" "Rogliano" "Apice" "Gasperina" "Montevago" "Popoli" "Senigallia" "Spadafora" "Cassano" "Cimitile" "Ferrara" "Godrano" "Lanciano" "Nusco" "Palo Del Colle" "Resuttano" "Avella" "Boiano" "Castelvetere" "Giuliana" "Laurenzana" "Marzano" "Pachino" "Palmi" "Pollica" "Rende" "Ruoti" "Stella Cilento" "Villafranca" "Capestrano" "Cianciana" "Fano" "San Fele" "Villafrati" "Aprigliano" "Capaccio" "Carleone" "Carolei" "Celano" "Montese" "Picerno" "Saponara" "Solofra" "Veroli" "Alatri" "Anzi" "Barga" "Boscotrecase" "Casabona" "Centola" "Ferrandina" "Mussomeli" "Procida" "Sturno" "Ateleta" "Baiano" "Balvano" "Bitonto" "Domanico" "Moliterno" "Oliveto" "Orsara" "Platania" "Polermo" "Racalmuto" "Reggio Calabria" "Sciacca" "Termini" "'
foreach town of local Italy {
	quietly replace origin_country = "Italy" if (origin_country == "`town'")
}

local Jamaica `" "Kingston" "'
foreach town of local Jamaica {
	quietly replace origin_country = "Jamaica" if (origin_country == "`town'")
}

local Latvia `" "Dwinsk" "Libau" "Mitau" "'
foreach town of local Latvia {
	quietly replace origin_country = "Latvia" if (origin_country == "`town'")
}

local Lebanon `" "Beyrout" "Bayrouth" "Beyrourh" "Beyronth" "Beyrsuth" "Beyrut" "Beyrouth" "'
foreach town of local Lebanon {
	quietly replace origin_country = "Lebanon" if (origin_country == "`town'")
}

local Libya `" "Tripoli" "'
foreach town of local Libya {
	quietly replace origin_country = "Libya" if (origin_country == "`town'")
}

local Lithuania `" "Vilna" "Olita" "Kowna" "Tauroggen" "Galina" "Mariampol" "Schaulen" "Laibach" "Kovno" "'
foreach town of local Lithuania {
	quietly replace origin_country = "Lithuania" if (origin_country == "`town'")
}

local Luxembourg `" "Luxemb" "'
foreach town of local Luxembourg {
	quietly replace origin_country = "Luxembourg" if (origin_country == "`town'")
}

local Mexico `" "Vera Cruz" "Merida" "Mexico City" "'
foreach town of local Mexico {
	quietly replace origin_country = "Mexico" if (origin_country == "`town'")
}

local Moldova `" "Soroki" "Kischinef" "Kischinew" "Glucksthal" "Cania" "'
foreach town of local Moldova {
	quietly replace origin_country = "Moldova" if (origin_country == "`town'")
}

local Montenegro `" "Montenegrin" "Niksic" "Bar" "'
foreach town of local Montenegro {
	quietly replace origin_country = "Montenegro" if (origin_country == "`town'")
}

local Morocco `" "Galaz" "'
foreach town of local Morocco {
	quietly replace origin_country = "Morocco" if (origin_country == "`town'")
}

local Netherlands `" "Haarlem" "Beerta" "Krabbendyke" "Holand" "Middelburg" "Utrecht" "Apeldoorn" "Ede" "Ulrum" "Bolsward" "Groede" "Wolvega" "Elburg" "Nes" "Oostwold" "Winschoten" "Delft" "Goes" "Harlinger" "Helder" "N Beerta" "Ouddorp" "Almelo" "Uden" "Groningen" "Amsterdam" "The Hague" "Rotterdam" "'
foreach town of local Netherlands {
	quietly replace origin_country = "Netherlands" if (origin_country == "`town'")
}

local NewZealand `" "Queenstown" "'
foreach town of local NewZealand {
	quietly replace origin_country = "New Zealand" if (origin_country == "`town'")
}

local NorthernIreland `" "Down" "Armagh" "Derry" "Antrim" "Belfast" "Fermanagh" "Ballinaloob" "Londonderry" "'
foreach town of local NorthernIreland {
	quietly replace origin_country = "Northern Ireland" if (origin_country == "`town'")
}

local Norway `" "Fredriksstad" "Moss" "Sandefjord" "Gjovik" "Fredrikstad" "Aalesund" "Kragero" "Telemarken" "Eidsberg" "Flekkefjord" "Hadeland" "Stavange" "Elverum" "Hangesund" "Horten" "Oksnes" "Biri" "Drobak" "Risor" "Lillesand" "Tonsberg" "Drontheim" "Trondhjem" "Grimstad" "Larvik" "Farsund" "Mandal" "Kristiansund" "Drammen" "Skien" "Throndhjem" "Christiansand" "Kristiania" "Bergen" "Stavanger" "Arendal" "'
foreach town of local Norway {
	quietly replace origin_country = "Norway" if (origin_country == "`town'")
}

local Panama `" "Colon" "'
foreach town of local Panama {
	quietly replace origin_country = "Panama" if (origin_country == "`town'")
}

local Poland `" "Kozlow" "Ostrow" "Konin" "Bielostok" "Gnesen" "Gorlice" "Jaslo" "Mielec" "Ostrowo" "Bielsk" "Janowo" "Polish" "Czernigow" "Sanok" "Krakow" "Lipno" "Radom" "Ulanow" "Brzozow" "Dabrowa" "Plotzk" "Polanka" "Przemysl" "Dukla" "Suwolk" "Bobrka" "Dembica" "Dombrowo" "Gron" "Kolno" "Tarnobrzeg" "Janowitz" "Kolbuszow" "Kolbuszowa" "Serby" "Sokolow" "Gliniany" "Godowa" "Kotowka" "Laszki" "Nowogrod" "Ostrolenka" "Przemyol" "Salino" "Sieniawa" "Stettin" "Mlawa" "Bialystock" "Tarnow" "Krakau" "Lublin" "Suwalki" "Lodz" "Bialystok" "Warsaw" "Warschaw" "Warshaw" "Warshau" "Warschan" "'
foreach town of local Poland {
	quietly replace origin_country = "Poland" if (origin_country == "`town'")
}

local Portugal `" "Alvito" "Fayal" "Funchal" "'
foreach town of local Portugal {
	quietly replace origin_country = "Portugal" if (origin_country == "`town'")
}

local Prussia `" "Posen" "'
foreach town of local Prussia {
	quietly replace origin_country = "Prussia" if (origin_country == "`town'")
}

local PuertoRico `" "San Juan" "Porto Rico" "Pto Rico" "'
foreach town of local PuertoRico {
	quietly replace origin_country = "Puerto Rico" if (origin_country == "`town'")
}

local Romania `" "Galati" "Bucharest" "Piatra" "Dorohoi" "Arad" "Roamania" "Craova" "Iassy" "Rumanian" "Focsani" "Bukarest" "Bacau" "Botosani" "Galatz" "Berlad" "Braila" "Jassy" "Bucarest" "'
foreach town of local Romania {
	quietly replace origin_country = "Romania" if (origin_country == "`town'")
}

local Russia `" "Yassy" "Podolsk" "Rusjia" "Saratov" "Alexandrow" "Severin" "Jekaterinoslaw" "Ekaterinoslaw" "Rssia" "Rusfia" "'
foreach town of local Russia {
	quietly replace origin_country = "Russia" if (origin_country == "`town'")
}

local Scotland `" "Shotts" "Dunfermline" "Baillieston" "Kilsyth" "Govan" "Stevenston" "Arbroath" "Rutherglen" "Elderslie" "Ggow" "Wishaw" "Kilmarnock" "Bellshill" "Edinbro" "Larkhall" "Greenock" "Edinburgh" "Paisley" "Aberdeen" "Dundee" "Birmingham" "Sheffield" "Morrone" "Cambuslang" "Carfin" "Dalry" "Ayr" "Craigneuk" "Inverness" "Kirkcaldy" "Stewarton" "Uddingston" "Helensburgh" "Holytown" "Saltcoats" "Stranraer" "Bathgate" "Dumbarton" "Dunoon" "Fraserburgh" "Linlithgow" "Shettleston" "Tayport" "Forfar" "Gourock" "Kelty" "Springburn" "'
foreach town of local Scotland {
	quietly replace origin_country = "Scotland" if (origin_country == "`town'")
}

local Senegal `" "Sagata" "'
foreach town of local Senegal {
	quietly replace origin_country = "Senegal" if (origin_country == "`town'")
}

local Serbia `" "Ruma" "Apatin" "'
foreach town of local Serbia {
	quietly replace origin_country = "Serbia" if (origin_country == "`town'")
}

local Slovakia `" "Sciana" "Chotin" "Sloviaka" "Cslovakia" "Eperjes" "Locse" "Iglo" "Podolin" "'
foreach town of local Slovakia {
	quietly replace origin_country = "Slovakia" if (origin_country == "`town'")
}

local Slovenia `" "Lucia" "Pirce" "Gradno" "Laibach" "'
foreach town of local Slovenia {
	quietly replace origin_country = "Slovenia" if (origin_country == "`town'")
}

local SolomonIslands `" "Ulawa" "'
foreach town of local SolomonIslands {
	quietly replace origin_country = "Solomon Islands" if (origin_country == "`town'")
}

local SouthAfrica `" "Kurland" "Seafati" "Kowns" "Talsen" "'
foreach town of local SouthAfrica {
	quietly replace origin_country = "South Africa" if (origin_country == "`town'")
}

local Spain `" "Soria" "Palma Camp" "Guardia" "Guardia L" "Montoro" "Banzas" "Ceramo" "Malaga" "S Cipriano" "Canlonia" "Castello" "Madrid" "Galisia" "Palma" "Polla" "Barcellona" "'
foreach town of local Spain {
	quietly replace origin_country = "Spain" if (origin_country == "`town'")
}

local StateofPalestine `" "Palestinia" "Palestine" "'
foreach town of local StateofPalestine {
	quietly replace origin_country = "Palestinian Territories" if (origin_country == "`town'")
}

local Sudan `" "Leban" "'
foreach town of local Sudan {
	quietly replace origin_country = "Sudan" if (origin_country == "`town'")
}

local Suriname `" "Surinam" "'
foreach town of local Suriname {
	quietly replace origin_country = "Suriname" if (origin_country == "`town'")
}

local Sweden `" "Bergsjo" "Gefle" "Gottenburg" "Motala" "Ragunda" "Vermland" "Gotland" "Gottenberg" "Orebro" "Sunne" "Yathenburg" "Pitea" "Swedenn" "Vasa" "Arvika" "Lund" "Norrkoping" "Gothenberg" "Helsingborg" "Goteborg" "Malmo" "Gothenburg" "Stockholm" "Swedem" "'
foreach town of local Sweden {
	quietly replace origin_country = "Sweden" if (origin_country == "`town'")
}

local Switzerland `" "Corino" "Switserland" "Switzerld" "Coritto" "Sessa" "Rorbach" "Ebnat" "St Gallen" "Campo" "Adlisweil" "Biel" "Bern" "Castelgrande" "Berne" "Basel" "Campofelice" "Zurich" "Switzland" "'
foreach town of local Switzerland {
	quietly replace origin_country = "Switzerland" if (origin_country == "`town'")
}

local Syria `" "Aleppo" "Syria Ta" "Syria A" "Damascus" "'
foreach town of local Syria {
	quietly replace origin_country = "Syria" if (origin_country == "`town'")
}

local TheBahamas `" "Nassau" "'
foreach town of local TheBahamas {
	quietly replace origin_country = "The Bahamas" if (origin_country == "`town'")
}

local TrinidadAndTobago `" "T'Dad" "'
foreach town of local TrinidadAndTobago {
	quietly replace origin_country = "Trinidad and Tobago" if (origin_country == "`town'")
}

local Tunisia `" "Tunis" "Monastir" "Tunisi" "Tunisie" "'
foreach town of local Tunisia {
	quietly replace origin_country = "Tunisia" if (origin_country == "`town'")
}

local Turkey `" "Alexandrette" "Bitlis" "Han" "Turchia" "Turkeuy" "Mersina" "Smyrne" "Samsoun" "Constantinople" "'
foreach town of local Turkey {
	quietly replace origin_country = "Turkey" if (origin_country == "`town'")
}

local Ukraine `" "Proskurow" "Husiatyn" "Rohatyn" "Uman" "Busk" "Podhajce" "Gorodok" "Ostrog" "Zitomir" "Fastow" "Horodenka" "Drohsbicz" "Kowel" "Tarutino" "Bilek" "Charkow" "Jezupol" "Klostitz" "Poltava" "Smela" "Ukrania" "Bolechow" "Boryslaw" "Rowne" "Sarata" "Bachmut" "Balta" "Sitomir" "Tschernembl" "Brzezany" "Buczacz" "Romny" "Skalat" "Smila" "Soroky" "Belz" "Sambor" "Stanislau" "Tarnopol" "Czernowitz" "Kieff" "Kolomea" "Brody" "Stryj" "Rowno" "Kiew" "Lemberg" "Riga" "Odessa" "'
foreach town of local Ukraine {
	quietly replace origin_country = "Ukraine" if (origin_country == "`town'")
}

local USA `" "Chicago" "Claims Us Born" "Irvine" "New York City" "Amerika" "U S Born" "Filadelfia" "N York" "Hawaii" "Neb" "New York Usa" "Ny City" "Philadelphia" "Us Citizen" "San Jose" "Puerto Rico" "Us Born" "USA" "U S Citizen" "Ct" "Va" "'
foreach town of local USA {
	quietly replace origin_country = "United States" if (origin_country == "`town'")
}

local Venezuela `" "Ven" "'
foreach town of local Venezuela {
	quietly replace origin_country = "Venezuela" if (origin_country == "`town'")
}

local Wales `" "Morriston" "Swansea" "Llanelly" "Cardiff" "Glamorgan" "S Wales" "Abertillery" "Port Talbot" "'
foreach town of local Wales {
	quietly replace origin_country = "Wales" if (origin_country == "`town'")
}

local WestIndies `" "W Indies" "'
foreach town of local WestIndies {
	quietly replace origin_country = "West Indies" if (origin_country == "`town'")
}

// Reassemble Yugoslavia - IS THIS APPROPRIATE??? - (SR Bosnia and Herzegovina, SR Croatia, SR Macedonia, SR Montenegro, SR Slovenia, and SR Serbia)
local Yugoslavia `" "Jugo Slovakia" "J-Sl" "Yougo-Slav" "Yougoslav" "Yougo-Slavia" "Jugo-Slavia" "Y Slavia" "Yugo Slav" "Yougo-Sl" "Yugo Slavia" "Y Slav" "Jugo-Slav" "Bosnia" "Yugoslavia" "Jugoslavia" "Yougoslavia" "Jugosl" "Jugoslav" "Yougosl" "Yugo-Slav" "Jugo Slavia" "Jugo-Sl" "Yugo-Sl" "Yugo Slavish" "Jugoslv" "J Slav" "Jougosl" "Yugoslav" "Jugo Slav" "Yugosl" "Yugo-Slavia" "Yugo Sl" "Yugo-Slavia" "Y Slove" "Y-Slavia" "Yougo Slovaky" "Tcheco-Slovac" "'
foreach town of local Yugoslavia {
	quietly replace origin_country = "Yugoslavia" if (origin_country == "`town'")
}

//////////////////
// Change the decision to be based on origin instead of origin_country
local Barbados `" "Â Christ Church, Barbados, W. I." "Â Christ Ch, Barbados, W. I." "Â St. Thomas, Barbados, W. I." "Â Bridgetown, Barbados, W. Ind." "Â Hastings, Barbados, W. Ind." "'
foreach town of local Barbados {
	replace origin_country = "Barbados" if (origin == "`town'")
}

local Bermuda `" "Â Hamilton, Bermuda, W I" "Â Hamilton, Bermuda, W. I." "Â Hamilton, Bermuda, W. Ind." "Â Pembroke, Bermuda, W. Ind" "Â Paget, Bermuda, W. Ind." "Â Warwick, Bermuda, W. Ind" "'
foreach town of local Bermuda {
	replace origin_country = "Bermuda" if (origin == "`town'")
}

local Cuba `" "Â Havana, Cuba, W. I." "Â Bayate, Cuba, W. I." "Â Havana, Cuba, W. Ind." "Â Havana, Cuba, W Ind." "Â Santiago, Cuba, W Ind" "Â Camaguey, Cuba, W. Ind." "'
foreach town of local Cuba {
	replace origin_country = "Cuba" if (origin == "`town'")
}

local Denmark `" "Â Jutland" "'
foreach town of local Denmark {
	replace origin_country = "Denmark" if (origin == "`town'")
}

local DominicanRepublic `" "Â Plo Plata, Dom. Rep., W. I." "Â Pto Plata, St. Dom., W. I." "Â Pto Plata, W. I." "Â Sanchez, D.R., W. Ind." "'
foreach town of local DominicanRepublic {
	replace origin_country = "Dominican Republic" if (origin == "`town'")
}

local Italy `" "Â Nicastro", "Â Acri", "Â Villarosa", "Â Campobello", "Â Naso", "Â Alife" "'
foreach town of local Italy {
	replace origin_country = "Italy" if (origin == "`town'")
}

local Jamaica `" "Â Kingston, Jamaica, W. I." "Â Devon, Jamaica, W. I." "Â Port Antonio, Jamaica, W. I." "Â Runaway Bay, Jamaica, W Ind" "Â Kingston, Jamaica , W. Ind." "Â Kingston, Ja., W. Ind." "Â Kingston, W. Ind." "'
foreach town of local Jamaica {
	replace origin_country = "Jamaica" if (origin == "`town'")
}

local Malawi `" "Â Blantyre" "'
foreach town of local Malawi {
	replace origin_country = "Malawi" if (origin == "`town'")
}

local Portugal `" "Â Belmonte" "'
foreach town of local Portugal {
	replace origin_country = "Portugal" if (origin == "`town'")
}

local Switzerland `" "Â Altavilla" "'
foreach town of local Switzerland {
	replace origin_country = "Switzerland" if (origin == "`town'")
}

local TheBahamas `" "Â Nassau, Bahamas, W. Ind." "'
foreach town of local TheBahamas {
	replace origin_country = "The Bahamas" if (origin == "`town'")
}

local TrinidadAndTobago `" "Â Port of Spain, Trinidad, W. Ind." "Â Belmont, Trinidad, W. Ind." "Â Port of Spain, Trindad, W. Ind." "Â Port of Spain, W Ind." "Â Port of Spain, W. I." "'
foreach town of local TrinidadAndTobago {
	replace origin_country = "Trinidad and Tobago" if (origin == "`town'")
}













//////////////////// This is the working code to work out what to clean
// Create a flag indicating whether the origin_country is a modern country
// CHANGE THIS TO REFER TO ZACH'S IPUMS LIST
// Instruction: So the goal is to create bpl codes for each observation. The bpl codes are from IPUMS USA and are by country of birth, which should answer some of your questions (e.g. Prussia goes to Germany, Sicily to Italy, etc.). The historical regions are usually coded at a more aggregated level. See https://usa.ipums.org/usa-action/variables/BPL#codes_section (not the detailed codes).
// Things get tricky when dealing with World War I boundary changes in eastern Europe, especially because we're going to be relying on the 1920, 1930 and 1940 Census. Before I have aggregated countries up to pre World War I boundaries. First, I would get them into modern BPL codes and we can decide how to aggregate them later, unless you think something else is better.
// Initial list is from http://m.state.gov/mc17517.htm, but with United States added, and some formatting ', ,, - removed. After that there are a few countries that were added (see the final line of the macro) because they are reasonable as historical countries
// drop is_country_flag
gen is_country_flag = .
local list_of_countries `" "Afghanistan" "Albania" "Algeria" "Andorra" "Angola" "Antigua and Barbuda" "Argentina" "Armenia" "Aruba" "Australia" "Austria" "Azerbaijan" "Bahamas" "Bahrain" "Bangladesh" "Barbados" "Belarus" "Belgium" "Belize" "Benin" "Bhutan" "Bolivia" "'
local list_of_countries `" `list_of_countries' "Bosnia and Herzegovina" "Botswana" "Brazil" "Brunei" "Bulgaria" "Burkina Faso" "Burma" "Burundi" "Cambodia" "Cameroon" "Canada" "Cabo Verde" "Central African Republic" "Chad" "Chile" "China" "Colombia" "Comoros" "Congo" "Congo" "Costa Rica"  "'
local list_of_countries `" `list_of_countries' "Cote d Ivoire" "Croatia" "Cuba" "Curacao" "Cyprus" "Czech Republic" "Denmark" "Djibouti" "Dominica" "Dominican Republic" "Ecuador" "Egypt" "El Salvador" "Equatorial Guinea" "Eritrea" "Estonia" "Ethiopia" "Fiji" "Finland" "France" "Gabon" "Gambia" "'
local list_of_countries `" `list_of_countries' "Georgia" "Germany" "Ghana" "Greece" "Grenada" "Guatemala" "Guinea" "Guinea Bissau" "Guyana" "Haiti" "Holy See" "Honduras" "Hong Kong" "Hungary" "Iceland" "India" "Indonesia" "Iran" "Iraq" "Ireland" "Israel" "Italy" "Jamaica" "Japan" "Jordan" "Kazakhstan" "'
local list_of_countries `" `list_of_countries' "Kenya" "Kiribati" "Noth Korea" "South Korea" "Kosovo" "Kuwait" "Kyrgyzstan" "Laos" "Latvia" "Lebanon" "Lesotho" "Liberia" "Libya" "Liechtenstein" "Lithuania" "Luxembourg" "Macau" "Macedonia" "Madagascar" "Malawi" "Malaysia" "Maldives" "Mali" "Malta" "'
local list_of_countries `" `list_of_countries' "Marshall Islands" "Mauritania" "Mauritius" "Mexico" "Micronesia" "Moldova" "Monaco" "Mongolia" "Montenegro" "Morocco" "Mozambique" "Namibia" "Nauru" "Nepal" "Netherlands" "Netherlands Antilles" "New Zealand" "Nicaragua" "Niger" "Nigeria" "North Korea" "'
local list_of_countries `" `list_of_countries' "Norway" "Oman" "Pakistan" "Palau" "Palestinian Territories" "Panama" "Papua New Guinea" "Paraguay" "Peru" "Philippines" "Poland" "Portugal" "Qatar" "Romania" "Russia" "Rwanda" "Saint Kitts and Nevis" "Saint Lucia" "Saint Vincent and the Grenadines" "Samoa" "'
local list_of_countries `" `list_of_countries' "San Marino" "Sao Tome and Principe" "Saudi Arabia" "Senegal" "Serbia" "Seychelles" "Sierra Leone" "Singapore" "Sint Maarten" "Slovakia" "Slovenia" "Solomon Islands" "Somalia" "South Africa" "South Korea" "South Sudan" "Spain" "Sri Lanka" "Sudan" "Suriname" "'
local list_of_countries `" `list_of_countries' "Swaziland" "Sweden" "Switzerland" "Syria" "Taiwan" "Tajikistan" "Tanzania" "Thailand" "Timor Leste" "Togo" "Tonga" "Trinidad and Tobago" "Tunisia" "Turkey" "Turkmenistan" "Tuvalu" "Uganda" "Ukraine" "United Arab Emirates" "United Kingdom" "Uruguay" "Uzbekistan" "Vanuatu" "Venezuela" "Vietnam" "Yemen" "Zambia" "Zimbabwe" "'
local list_of_countries `" `list_of_countries' "United States" "Galicia" "'

// Use this to list the countries that need to be looked at
// drop country_frequency
egen country_frequency = count(1), by(origin_country)
gsort -country_frequency origin_country

// Get a list of rows to clean
tab origin_country if country_frequency > 10 & missing(is_country_flag), sort

// Use this to get the data that you need in order to fix origin
foreach country of local LookingAt {
	tab origin if origin_country == "`country'", sort
}

foreach country of local LookingAt {
	tab origin if origin_country == "`country'", sort
	tab origin_city if origin_country == "`country'", sort
	tab ethnicity if origin_country == "`country'"
}

// Look at these next:
                                So Am |        265        0.65       84.62
                                  S H S |        242        0.60       85.22
                                   Russ |        222        0.55       85.76
                                     Wi |        150        0.37       86.13
                                  Wolyn |        138        0.34       86.48
                                So Amer |        107        0.26       86.74
                               Hamilton |        100        0.25       86.99
                                 Africa |         99        0.24       87.23
                                  Patti |         97        0.24       87.47
                                 Tyrone |         95        0.23       87.71
                                 Persia |         94        0.23       87.94
                                Prussia |         87        0.21       88.15
                                   Alia |         86        0.21       88.37
                                  Bella |         80        0.20       88.56
                                    Rus |         73        0.18       88.74
                                      U |         68        0.17       88.91
                                  Norka |         58        0.14       89.06
                                Bancina |         57        0.14       89.20
                                   Nola |         54        0.13       89.33
                                Augusta |         53        0.13       89.46
                                   Meta |         52        0.13       89.59
                                  Elena |         50        0.12       89.71
                                Neudorf |         48        0.12       89.83
                                     Ta |         48        0.12       89.95
                            West Indies |         48        0.12       90.07
                                 Salina |         47        0.12       90.18
                              Mirabella |         46        0.11       90.30
                    Non Immigrant Alien |         46        0.11       90.41
                              Stanislaw |         46        0.11       90.53
                                    T A |         45        0.11       90.64
                               Villalba |         45        0.11       90.75
                                Cermini |         43        0.11       90.85
                                  South |         43        0.11       90.96
                                Chrsand |         42        0.10       91.06
                              Johnstone |         42        0.10       91.17
                                      B |         41        0.10       91.27
                                  Jossy |         40        0.10       91.37
                                    Pos |         40        0.10       91.47
                                   Tusa |         40        0.10       91.57
                               Contessa |         37        0.09       91.66
                             Laurenzano |         37        0.09       91.75
                                Parenti |         36        0.09       91.84
                              St Helens |         36        0.09       91.93
                                    Pol |         35        0.09       92.01
                                  Austr |         34        0.08       92.10
                                     Sa |         34        0.08       92.18
                                  Pirie |         33        0.08       92.26
                                 Dudley |         32        0.08       92.34
                                   Lago |         32        0.08       92.42
                                   Lens |         32        0.08       92.50
                                  Maida |         32        0.08       92.58
                                  Prata |         32        0.08       92.66
                                Suwalky |         32        0.08       92.74
                                  A'Dam |         31        0.08       92.81
                                      C |         31        0.08       92.89
                            Valledolino |         31        0.08       92.97
                              Harlingen |         30        0.07       93.04
                                   Rodi |         30        0.07       93.12
                                 Kandel |         29        0.07       93.19
                             Monteleone |         29        0.07       93.26
                                Potenzo |         29        0.07       93.33
                                   Rose |         29        0.07       93.40
                                      S |         29        0.07       93.47
                               Bukowina |         28        0.07       93.54
                                  Kassa |         28        0.07       93.61
                                   Slov |         28        0.07       93.68
                                Paterno |         27        0.07       93.75
                                      R |         27        0.07       93.81
                                 Roseto |         27        0.07       93.88
                                 Tarsia |         27        0.07       93.95
                                  Canna |         26        0.06       94.01
                                   Sora |         26        0.06       94.08
                                 Speier |         26        0.06       94.14
                                 Dolina |         25        0.06       94.20
                                    S A |         25        0.06       94.26
                            The Bahamas |         25        0.06       94.33
                                    Csl |         24        0.06       94.39
                                  Havre |         24        0.06       94.44
                                   Kulm |         24        0.06       94.50
                               Monaghan |         24        0.06       94.56
                                Ansonia |         23        0.06       94.62
                                      M |         23        0.06       94.68
                                  Makow |         23        0.06       94.73
                                  Pyrus |         23        0.06       94.79
                                 S Amer |         23        0.06       94.85
                                    W I |         23        0.06       94.90
                                  Frank |         22        0.05       94.96
                                Terseke |         22        0.05       95.01
                                Gallina |         21        0.05       95.07
                               Ottaiano |         21        0.05       95.12
                                Sealand |         21        0.05       95.17
                                      A |         20        0.05       95.22
                                  Damas |         20        0.05       95.27
                                Samsonn |         20        0.05       95.32
                              St George |         20        0.05       95.37
                                   Vita |         20        0.05       95.42
                               Caltanis |         19        0.05       95.46
                                Cotenza |         19        0.05       95.51
                          Elisabethgrad |         19        0.05       95.56
                                Erapani |         19        0.05       95.60
                              Kischenew |         19        0.05       95.65
                                  Leith |         19        0.05       95.70
                             Schoondyke |         19        0.05       95.74
                             So America |         19        0.05       95.79
                          South America |         19        0.05       95.84
                               West Ind |         19        0.05       95.89
                                 Aleamo |         18        0.04       95.93
                                  Ceora |         18        0.04       95.97
                                Crapani |         18        0.04       96.02
                               Ferenini |         18        0.04       96.06
                               Kenouria |         18        0.04       96.11
                                    Mir |         18        0.04       96.15
                                   Mora |         18        0.04       96.20
                              Rosenberg |         18        0.04       96.24
                                 S Fili |         18        0.04       96.29
                                 Stella |         18        0.04       96.33
                                     Sw |         18        0.04       96.37
                                 C Amer |         17        0.04       96.42
                             Christiana |         17        0.04       96.46
                                  Dabar |         17        0.04       96.50
                                Piracus |         17        0.04       96.54
                               Ponewesh |         17        0.04       96.58
                                Sercara |         17        0.04       96.63
                             Stmichaels |         17        0.04       96.67
                                  Bacan |         16        0.04       96.71
                               Borislaw |         16        0.04       96.75
                               Campagua |         16        0.04       96.79
                                     Gr |         16        0.04       96.83
                                  Jessy |         16        0.04       96.87
                                      L |         16        0.04       96.91
                               Maryhill |         16        0.04       96.95
                                  Mitan |         16        0.04       96.99
                                   Naro |         16        0.04       97.02
                                Sciacea |         16        0.04       97.06
                                   Selz |         16        0.04       97.10
                                Baghena |         15        0.04       97.14
                               Calliano |         15        0.04       97.18
                                  Gallo |         15        0.04       97.22
                                  Gilly |         15        0.04       97.25
                               Jawidcze |         15        0.04       97.29
                                     La |         15        0.04       97.33
                             Montebello |         15        0.04       97.36
                                      W |         15        0.04       97.40
                                  Basso |         14        0.03       97.43
                               Burnbank |         14        0.03       97.47
                                     By |         14        0.03       97.50
                                Czerkas |         14        0.03       97.54
                                 Foggio |         14        0.03       97.57
                                 Grodns |         14        0.03       97.61
                                Harpoot |         14        0.03       97.64
                                     Ia |         14        0.03       97.68
                               Johnston |         14        0.03       97.71
                                 Kalish |         14        0.03       97.75
                                  Kovna |         14        0.03       97.78
                                     Rp |         14        0.03       97.82
                        S Giuseppe Tato |         14        0.03       97.85
                                Sarotow |         14        0.03       97.88
                              Staranger |         14        0.03       97.92
                                Tenanni |         14        0.03       97.95
                                Tennini |         14        0.03       97.99
                             Tripolitza |         14        0.03       98.02
                                  Wilma |         14        0.03       98.06
                                   Asia |         13        0.03       98.09
                                   Cava |         13        0.03       98.12
                          Christiansund |         13        0.03       98.15
                           Elisawetgrad |         13        0.03       98.19
                                 Frabia |         13        0.03       98.22
                                 Hungar |         13        0.03       98.25
                                 Jersey |         13        0.03       98.28
                                   Kolb |         13        0.03       98.31
                                 Korono |         13        0.03       98.35
                                     Oe |         13        0.03       98.38
                                   Osch |         13        0.03       98.41
                                   Pico |         13        0.03       98.44
                                Resicza |         13        0.03       98.48
                                   Riva |         13        0.03       98.51
                                   S Am |         13        0.03       98.54
                          S Angelo Lomb |         13        0.03       98.57
                                Solmona |         13        0.03       98.60
                              Tavricien |         13        0.03       98.64
                                  W Ind |         13        0.03       98.67
                               Wilkomir |         13        0.03       98.70
                               Alessand |         12        0.03       98.73
                            Archipelago |         12        0.03       98.76
                               Begrouth |         12        0.03       98.79
                                Beresin |         12        0.03       98.82
                               Boriphan |         12        0.03       98.85
                              Delianova |         12        0.03       98.88
                               Francais |         12        0.03       98.91
                                    Fwi |         12        0.03       98.94
                                 Glogon |         12        0.03       98.97
                               Hastings |         12        0.03       99.00
                           Marsiconnovo |         12        0.03       99.03
                                Melissa |         12        0.03       99.06
                                   Novi |         12        0.03       99.09
                          Oliveto Citro |         12        0.03       99.12
                              S America |         12        0.03       99.14
                                   So A |         12        0.03       99.17
                             Trebizonde |         12        0.03       99.20
                                 Trenta |         12        0.03       99.23
                                 Vietri |         12        0.03       99.26
                              Witkowitz |         12        0.03       99.29
                                     Al |         11        0.03       99.32
                                   Alva |         11        0.03       99.35
                              Bialostok |         11        0.03       99.37
                         British Guiana |         11        0.03       99.40
                                   C Am |         11        0.03       99.43
                                 Canamo |         11        0.03       99.46
                                  Capna |         11        0.03       99.48
                          Capriati Volt |         11        0.03       99.51
                                Cegiano |         11        0.03       99.54
                                Galston |         11        0.03       99.57
                                      H |         11        0.03       99.59
                                     Ha |         11        0.03       99.62
                              Halbstadt |         11        0.03       99.65
                                  Isola |         11        0.03       99.67
                               Kamenitz |         11        0.03       99.70
                                 Koretz |         11        0.03       99.73
                             Kronenthal |         11        0.03       99.76
                               Montrone |         11        0.03       99.78
                                  Motta |         11        0.03       99.81
                                Newport |         11        0.03       99.84
                                Niksich |         11        0.03       99.86
                               Palerino |         11        0.03       99.89
                             Petersburg |         11        0.03       99.92
                              Porsgrund |         11        0.03       99.95
                                 S Lupo |         11        0.03       99.97
                                Shaptza |         11        0.03      100.00








// Get a count of the total number of rows that are reasonable
tab origin_country if !missing(is_country_flag) | !missing(is_reasonable_flag)


//////////////////// DECISIONS
// Should we reassemble Great Britain or better separated?	
// Not sure what to do with Russ vs Rus	
// Need to separate the different countries caught up in So Am and So Amer
// Have left Prussia as a country, not sure if want to integrate into Germany or leave separate
// Come back to: Curland, Austr, Pos, Massa, Pol, Styria, Ta, Rssia, Rusfia, Csl, T A, Ekaterinoslaw, GR, Istria, Slov, A, Archipelago, Archipelagos, Austria Hungary, B'Da
// W I is West Indies, but need to look at where to put them
// Bukowina is split between Romania and Ukraine these days - not sure how to deal with that
////////////////////



/////// DEBRIS //////////

// This will fill empty countries based on given cities, for instance, if the city was Sydney then it would fill Australia, but the relationship needs to be unique, which requires lots of cleaning.

// Change the formatting
encode origin_city, gen(n_origin_city)
encode origin_country, gen(n_origin_country)

// Find the ones that are not unique
capture ssc install egenmore
//drop countries
bys origin_city: egen countries = nvals(origin_country)
// Look for: countries>1

tab countries, sort

tab origin_city if countries == 1 & missing(origin_country), sort

// Do the actual filling
net from http://www.sealedenvelope.com/
xfill origin_country, i(n_origin_city)








