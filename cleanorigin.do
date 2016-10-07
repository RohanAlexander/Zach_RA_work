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

// Running notes: Can run up to line 950 and it should all work. After that is working code or debris.

//////////////////////// Initial set up and load data ////////////////////////
clear all

//set more off, permanently
set more off

//use "/hdir/0/monicah/Desktop/EIbrothers18921924.dta"
//cd "/hdir/0/monicah/Desktop/All"

use "/Users/rohanalexander/Desktop/EIbrothers18921924.dta"
cd "/Users/rohanalexander/Desktop"

//////////////////////// Start separating the cities and countries ////////////////////////
// Get rid of the special character
local variablelist `" "fullName" "origin" "ethnicity" "age" "impliedBirthYear" "arrivalDate" "ship" "port" "ID" "lname" "dateArrivedYear" "sex" "maritalStatus" "'
foreach var of local variablelist {
	replace `var' = subinstr(`var', char(160), "", .)
}

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
replace impliedBirthYear = "1889-1890" if impliedBirthYear=="1?89-1890"
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
rm only_two.dta
rm only_three.dta
rm only_four.dta


// Fix the IDs COME BACK HERE
//http://www.jewishgen.org/databases/EIDB/ellisgold.html
//destring ID, replace

//charlist ID

//l fullName if strpos(ID, "?")

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
replace origin_country = "Tunisia" if (origin_country == "Africa") & (origin_city == "Tunis")
replace origin_country = "Turkey" if (origin_country == "Turkey A") ///
	| (origin_country == "Turkey E") | (origin_country == "Turkish") ///
	| (origin_country == "Turk") | (origin_country == "Turky") ///
	| (origin_country == "Asia Minor") | (origin_country == "Costantinopoli") ///
	| (origin_country == "Turquey") | (origin_country == "Costantinopoli")



// Do the same as above, but use loops and locals instead - eh Statan.
local Albania `" "Albany" "Albanese" "Albany" "'
foreach town of local Albania {
	replace origin_country = "Albania" if (origin_country == "`town'")
}

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

local Argentina `" "Argentine" "Angentina" "Arg" "ArgRep" "ArgRepSoAm" "ArgRepSoAmer" "ArgRepublic" "Argenetine" "Argent" "ArgentinaSoAm" "ArgentineRep" "Argentinia" "Argentyna" "Argt" "Aurgentina" "RepArg" "RepArgSoAm" "Arg Rep" "Rep Arg" "'
foreach town of local Argentina {
	 replace origin_country = "Argentina" if (origin_country == "`town'")
}

local Armenia `" "Armania" "Armeny" "'
foreach town of local Armenia {
	quietly replace origin_country = "Armenia" if (origin_country == "`town'")
}

local Australia `" "Ballina" "Bronte" "Sydney" "Aus" "Aust" "'
foreach town of local Australia {
	quietly replace origin_country = "Australia" if (origin_country == "`town'")
}

local Austria `" "Boriphan" "Borislaw" "Austr" "Bukowina" "Graz" "Tirol" "Berndorf" "L Austria" "Rausaitz" "Freudenthal" "Karnten" "Tyrol" "Styria" "Vienna" "Wien" "'
foreach town of local Austria {
	replace origin_country = "Austria" if (origin_country == "`town'")
}

local Austria `" "Stanislaw" "Asutria" "Austrial" "Austrian" "Austriaa" "Austrian" "'
foreach town of local Austria {
	replace origin_country = "Austria" if (origin_country == "`town'")
}

local Bahamas `" "Nassau" "Bahamas" "'
foreach town of local Bahamas {
	replace origin_country = "The Bahamas" if (origin_country == "`town'")
}

local Bahrain `" "Ali" "'
foreach town of local Bahrain {
	quietly replace origin_country = "Bahrain" if (origin_country == "`town'")
}

local Belarus `" "Minsk" "Grodno" "Pinsk Reg" "Witebsk" "Mohilew" "Pinsk" "Pinsk R" "Pinsk Region" "Mohilew" "Bobruisk" "Sluck" "Brest Lit" "Sluzk" "Antopol" "Kobrin" "Beresina" "Grodna" "Mogilew" "Slutzk" "Slonim" "Homel" "'
foreach town of local Belarus {
	replace origin_country = "Belarus" if (origin_country == "`town'")
}

local Belgium `" "Belg" "Belguim" "Thielt" "Knocke" "Gent" "Nevele" "Belgian" "Verviers" "Beveren" "Jemappes" "Vracene" "Antwerpen" "Bassevelde" "Brussels" "Jumet" "Antwerp" "'
foreach town of local Belgium {
	replace origin_country = "Belgium" if (origin_country == "`town'")
}

local Bermuda `" "Bda" "'
foreach town of local Bermuda {
	replace origin_country = "Bermuda" if (origin_country == "`town'")
}

local BosniaAndHerzegovina `" "Resina" "Herzegovina" "'
foreach town of local BosniaAndHerzegovina {
	replace origin_country = "Bosnia and Herzegovina" if (origin_country == "`town'")
}

local Brazil `" "Brasil" "Rio" "Buenos Ayres" "Sao Paulo" "S Paulo" "B Aires" "Buenos Aires" "Rio De Janeiro" "Bonito" "Rio De Janerio" "San Paulo" "Rio De Janiero" "'
foreach town of local Brazil {
	quietly replace origin_country = "Brazil" if (origin_country == "`town'")
}

local Bulgaria `" "Kamenetz" "Bulgary" "'
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

local Croatia `" "Dabar" "Novi" "Istria" "Bunic" "Dalmacia" "Lissa" "Ogulin" "Castel S Giorgio" "Mrkopalj" "Fuzine" "'
foreach town of local Croatia {
	replace origin_country = "Croatia" if (origin_country == "`town'")
}

local Cuba `" "Cuban" "Habana" "Havana Cuba" "Havana" "'
foreach town of local Cuba {
	quietly replace origin_country = "Cuba" if (origin_country == "`town'")
}

local Cyprus `" "Nicosia" "Chypre" "'
foreach town of local Cyprus {
	quietly replace origin_country = "Cyprus" if (origin_country == "`town'")
}

local Czechoslovakia `" "Slov" "Csl" "Czech Republic" "Tchecoslovakia" "T Slov" "T Slovak" "Tcheco-Slovakie" "Tcheco-Slovaky" "Teplitz" "Pisek" "Krasna" "Krasno" "Pecky" "Plzen" "Radomysl" "Ledenice" "Prag" "'
foreach town of local Czechoslovakia {
	replace origin_country = "Czechoslovakia" if (origin_country == "`town'")
}

local Czechoslovakia `" "Czechslov" "Cz" "Cz Slo" "Cz Slovaky" "Czeckoslov" "Bohemia" "Moravia" "Cz Slov" "Czechoslovakia" "Cz Sl" "Slovakia" "Cz Slovak" "Czechosl" "Czecho Slovakia" "Czslov" "Czechosl" "Silesia" "Cz-Sl" "Czecho-Sl" "Czecho-Slovakia" "Cz Slovakia" "Morovia" "Czechoslov" "Cs-Sl" "Slovak" "Morovia" "Czsl" "C-Sl" "Czslovak" "Czeco-Sl" "Czecho Sl" "Czeckoslovakia" "Czec Slav" "Slovaky" "Czech" "Czecko Slovakia" "Czslovakia" "Tchecosl" "C Slovak" "Cecho-Slovakia" "C Slovakia" "Cechoslovakia" "Chechoslovakia" "Cz Slovia" "Cz Slow" "Czec Slov" "Czech Slov" "Czecho" "Czecho Slovak" "Czecho Slovakie" "Czecho-Slovak" "Czechos" "Czechoslavakia" "Czechoslovacia" "Czechoslovak" "Czecoe-Slov" "Czecslav" "Czekoslovakia"  "'
foreach town of local Czechoslovakia {
	replace origin_country = "Czechoslovakia" if (origin_country == "`town'")
}

local Denmark `" "Sealand" "Jutland" "Aalborg" "Hjorring" "Funen" "Bornholm" "Aadalen" "Aarhus" "Danemark" "Esbjerg" "Christiania" "Copenhagen" "'
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

local England `" "Hastings" "Dudley" "Gibraltar" "Derby" "Oldham" "Lpool" "L'Pool" "Curland" "Bristol" "Motherwell" "Bradford" "Durham" "Perth" "Newcastle" "Coatbridge" "Bolton" "Nottingham" "Hull" "Leeds" "Cornwall" "Wigan" "London England" "Southampton" "Barrow" "Norfolk" "Chesterfield" "Sussex" "Surrey" "Lancaster" "Tunstall" "Liverpool" "Manchester" "Liverpool/England" "Plymouth" "Hirst" "Leigh" "Burnley" "Sunderland" "Walsall" "Grimsby" "Preston" "Devon" "Norwich" "Acklington" "Stoke" "Burslem" "York" "Bacup" "Blackburn" "Sala" "Stafford" "Newcastle On Tyne" "Bootle" "Brighton" "Kidderminster" "Leicester" "Portsmouth" "Tipton" "Dover" "Emgland" "Ilford" "Kendal" "Rochdale" "Workington" "Ashington" "Barnsley" "Gateshead" "Shipley" "Englad" "'
foreach town of local England {
	replace origin_country = "England" if (origin_country == "`town'")
}

local Estonia `" "Esthonia" "'
foreach town of local Estonia {
	quietly replace origin_country = "Estonia" if (origin_country == "`town'")
}

local Finland `" "Finl" "Ylistaro" "Hango" "'
foreach town of local Finland {
	quietly replace origin_country = "Finland" if (origin_country == "`town'")
}

local France `" "Francais" "Fwi" "Lens" "Corbara" "Gran" "French" "Elsass" "Villetta" "Pire" "Lussin" "Massa C" "Arcis" "Lyon" "Montigny" "Avion" "Taverna" "Auzi" "Decazeville" "Piana" "Tassy" "Belfort" "Corse" "Gard" "Marchienne" "Lille" "St Medard" "Taurien" "Strassburg" "Besseges" "Lievin" "Brest" "Marseilles" "Marseille" "Roubaix" "Paris" "Martinique" "'
foreach town of local France {
	quietly replace origin_country = "France" if (origin_country == "`town'")
}

local Galicia `" "Jawidcze" "Shaptza" "'
foreach town of local Galicia {
	replace origin_country = "Galicia" if (origin_country == "`town'")
}

local Georgia `" "Batoum" "'
foreach town of local Georgia {
	quietly replace origin_country = "Georgia" if (origin_country == "`town'")
}

local Germany `" "Bruch" "Munchen" "Rohrbach" "Dusseldorf" "Bavaria" "Solingen" "Gelsenkirchen" "Oberhausen" "Sande" "Warsow" "Zernigow" "Elberfeld" "Hannover" "Altona" "Frankfurt" "Bergdorf" "Dronthjem" "Nikolajew" "Flensburg" "Neuburg" "Beyreuth" "Chemnitz" "Harburg" "Neustadt" "Schonberg" "Worms" "Beyruth" "Kolna" "Sulz" "Mannheim" "Landau" "Essen" "Kassel" "Leipzig" "Bremen" "Berlin" "Hamburg" "Dresden" "'
foreach town of local Germany {
	quietly replace origin_country = "Germany" if (origin_country == "`town'")
}

local Germany `" "Neudorf" "'
foreach town of local Germany {
	replace origin_country = "Germany" if (origin_country == "`town'")
}

local Greece `" "Tripolitza" "Archipelago" "Piracus" "Kenouria" "Pirie" "Pyrus" "Sparte" "Argos" "Tripolis" "Pireo" "Piraeus" "Piree" "Sparta" "Athens" "Xania" "Piraens" "Icaria" "Smyrna" "Castoria" "Grecia" "Crete" "Mantinia" "Grevena" "Laconia" "Corinthia" "Patras" "Chios" "Epire" "Florina" "Sparti" "Corinth" "Corinthe" "Le Piree" "Leonidion" "Creta" "Elgin" "Megalopolis" "Syra" "'
foreach town of local Greece {
	replace origin_country = "Greece" if (origin_country == "`town'")
}

local Guyana `" "British Guiana" "'
foreach town of local Guyana {
	replace origin_country = "Guyana" if (origin_country == "`town'")
}

local Haiti `" "Port Au Prince" "Hayti" "'
foreach town of local Haiti {
	quietly replace origin_country = "Haiti" if (origin_country == "`town'")
}

local Hungary `" "Hungar" "Ungarn" "Budapest" "'
foreach town of local Hungary {
	quietly replace origin_country = "Hungary" if (origin_country == "`town'")
}

local Ireland `" "Monaghan" "Castlerea" "Galway" "Kilrush" "Clonmel" "Listowel" "Cavan" "Dingle" "Drogheda" "Kerry" "Tralee" "Tipperary" "Waterford" "Ballinrobe" "Killarney" "Thurles" "Leitrim" "Ballyjamesduff" "Co Galway" "Kenmare" "Killaloe" "Swinford" "Bantry" "Castleisland" "Kildare" "Longford" "Sligo" "Donegal" "Limerick" "Dublin" "Tyrone" "'
foreach town of local Ireland {
	replace origin_country = "Ireland" if (origin_country == "`town'")
}

local Israel `" "Jaffa" "Jerusalem" "'
foreach town of local Israel {
	quietly replace origin_country = "Israel" if (origin_country == "`town'")
}

local Italy `" "Balestrate" "Bientina" "Caserto" "Castellamonte" "Esperia" "Falerna" "Isernia" "Mineo" "S Vito" "Tirolo" "Accadia" "Carlopoli" "Ceccano" "Celico" "Cervino" "Cropani" "Lascari" "Lauro" "Lucera" "Marcianise" "Perito" "Roccamonfina" "Rovito" "S Marco" "Sassari" "Sicignano" "Alvignano" "Caltavuturo" "Camposano" "Casacalenda" "Castelpetroso" "Cicciano" "Deliceto" "Lacedonia" "Larino" "Licata" "Lida" "Ottone" "Pisciotta" "Poggioreale" "Ponza" "Atessa" "Castelfranci" "Castellana" "Castrovillari" "Conflenti" "Formia" "Gangi" "Lettere" "Mendicino" "Montemiletto" "Montesano" "Palmero" "Pizzone" "S Leucio" "Salemi" "Venosa" "Asti" "Atella" "Augri" "Campochiaro" "Casandrino" "Corio" "Dragoni" "Fivizzano" "Librizzi" "Matera" "Mercogliano" "Mignano" "Monteroduni" "Ortucchio" "Pellaro" "Pescia" "Pignola" "Pratola" "R Calabria" "S Arsenio" "S Biase" "Solopaca" "Te" "Agropoli" "Bagnoli" "Bianchi" "Bracigliano" "Caivano" "Casamicciola" "Castellabate" "Cinisi" "Forino" "Forio" "Gimigliano" "Guardiagrele" "Mazzara" "Mesfina" "Milan" "Montefusco" "Oriolo" "Palazzo Adriano" "Palena" "Roccadaspide" "Rometta" "S Elia" "S Lorenzo" "S Stefano C" "Sermide" "Sersale" "Siderno" "Ascoli Piceno" "Baragiano" "Bonefro" "Carbonara" "Catansaro" "Coreglia" "Gesso" "Montefalcione" "Ortona" "Pacentro" "Palerno" "Plati" "Riesi" "S Andrea" "Serrastretta" "Spinoso" "Vittorio" "Baranello" "Barletta" "Bedonia" "Bisaccia" "Bucciano" "Campobosso" "Caramanico" "Casenza" "Cassino" "Celenza" "Fontechiari" "Galdo" "Galizien" "Geraci" "Gioia Del Colle" "Maranola" "Medicina" "Moschiano" "Petina" "Reggio Calab" "S Mauro" "Salemo" "Secondigliano" "Senerchia" "Sicely" "Terlizzi" "Trani" "Vacri" "Valperga" "Asiago" "Campofiorito" "Carrara" "Castrogiovanni" "Ferrazzano" "Fossalto" "Frosinone" "Gildone" "Giovinazzo" "Graguano" "Introdacqua" "Ischia" "Italyy" "Longano" "Marano" "Marcellinara" "Marliana" "Militello" "Minori" "Modugno" "Monopoli" "Morolo" "Pastena" "Riccio" "Ruviano" "S Maria" "S Mauro Forte" "S Pier Niceto" "S Prisco" "Sepino" "Valguarnera" "Varsi" "Venezia" "Villanova" "Acireale" "Castellano" "Catona" "Forenza" "Francavilla" "Frigento" "Grumo App" "Itri" "Locana" "Lucito" "Mantova" "Montagano" "Montecalvo" "Montelepre" "Paduli" "Palomonte" "Penne" "Petrizzi" "Pietramelara" "Pietraperzia" "Postiglione" "Pozzilli" "Reggio E" "Resultano" "Riposto" "Rocca" "Roccapalumba" "S Angelo Lombardi" "S Antonio" "S Paolina" "Salle" "Siano" "Sperlinga" "St Domingo" "St Martins" "Viareggio" "Viggiano" "Alberobello" "Altamura" "Biella" "Briano" "Busso" "Caggiano" "Calascio" "Calvello" "Campolieto" "Candela" "Casagiove" "Casalnuovo" "Cattanissetta" "Ceppaloni" "Cerreto" "Cesaro" "Cigliano" "Corleto Pert" "Galluccio" "Giffone" "Grammichele" "Grotteria" "Guarcino" "Laviano" "Linguaglossa" "Lioni" "Macerata" "Norcia" "Orentano" "Piedimonte" "Pietradefusi" "Pietraroia" "Polizzi Generosa" "S Angelo L" "S Giorgio" "Sstefano" "Tricarico" "Trieste" "Tufino" "Arienzo" "Auletta" "Auronzo" "Bagnara" "Bernalda" "Bucchianico" "Calascibetta" "Carpineto" "Castelforte" "Ceraso" "Felitto" "Ficarazzi" "Formicola" "Grimaldi" "Italy South" "Limatola" "Manziana" "Messino" "Oliveto Citra" "Opi" "Ottati" "Pietrastornina" "Pistoia" "Polistena" "Pontecorvo" "Posada" "Recale" "Ripabottoni" "Roccarainola" "S Antimo" "S Bartolomeo" "S Croce" "Scigliano" "Sermide Mantova" "Toretto" "Tramonti" "Tursi" "Vallata" "Varese" "Acerno" "Arpaia" "Arzano" "Ascea" "Avezzano" "Caltanisfetta" "Campobano" "Campobapo" "Capannori" "Cartoceto" "Chiavari" "Cortale" "Forio D'Ischia" "Gratteri" "Grumo Appula" "Liveri" "Longobucco" "Marlia" "Martone" "Moiano" "Molina" "Monastero" "Monte S Angelo" "Montemagno" "Montemarciano" "North Italy" "Ofena" "Palermo Sicily" "Paternopoli" "Patrica" "Pedara" "Pellezzano" "Perano" "Pescasseroli" "Piaggine" "Po" "Rapino" "Rapolla" "Roccamontepiano" "Roccaraso" "S Agata Dei Goti" "S Agnello" "S Eusanio" "S Felice" "S Gregorio" "S Gregorio M" "S Nicola" "Sala Consilina" "San Donato" "St Margherita" "Striano" "Strongoli" "Toschan" "Troina" "Vairano" "Amorosi" "Arce" "Arpino" "Barrea" "Bettola" "Borgia" "Boscoreale" "Brusciano" "Brusnengo" "Calatafini" "Canicatti" "Cardito" "Casapulla" "Castel Di Sangro" "Castelfrentano" "Castelli" "Castelmorrone" "Caulonia" "Cento" "Cesa" "Cicily" "Cimina" "Compiano" "Corigliano" "Corleto" "Cuggiono" "Cusano" "Falcone" "Fermini" "Flumeri" "Foglizzo" "Forno" "Geraci Siculo" "Grosseto" "Lapio" "Leonforte" "Livorno" "Molinella" "Montalto" "N Italy" "Pisticci" "Pomigliano" "Pontremoli" "Rapone" "Rosarno" "Rutino" "S Costantino" "S Cristina" "S Mango" "S Vincenzo" "Sannicandro" "Scisciano" "Settefrati" "Summonte" "Trevico" "Triggiano" "Varazze" "Vergato" "Vico Garganico" "Villa S Giovanni" "Acquasanta" "Aidone" "Aliano" "Anagni" "Augusto" "Bancino" "Berceto" "Bisaquino" "Calatabiano" "Cantalupo" "Capriglia" "Casola" "Casteltermini" "Catanjaro" "Cattolica" "Cefalie" "Cercepiccola" "Cerisano" "Cerzeto" "Cicagna" "Contrada" "Cupello" "Duronia" "Ferentino" "Gesualdo" "Gioiosa" "Grottaminarda" "Grumo" "Laureana" "Lizzano" "Mirto" "Modica" "Montemarano" "Monticelli" "Montorio" "Morreale" "Neirone" "Nocera Inf" "Noto" "Padova" "Paglieta" "Paola" "Pastorano" "Pomarico" "Raiano" "Ripi" "Roccalumera" "S Arcangelo" "S Demetrio" "S Donato N" "S Nicandro" "Salerni" "Scofati" "Seiacca" "Soverato" "Spezzano" "Torre Del Greco" "Turin" "Valva" "Vittoria" "Corleone" "S Stefano" "S Agata" "S Margherita" "S Fele" "S Flavia" "S Cataldo" "S Ninfa" "S Angelo" "S Fratello" "S Donato" "S Giovanni" "S Caterina" "S Salvatore" "S Valentino" "S Pietro" "S Guiseppe" "S Martino" "S Egidio" "S Giuseppe" "Cerda" "Marineo" "Lercara" "Bagheria" "Campagna" "Menfi" "Avigliano" "Roman" "Sarno" "Ribera" "Trabia" "Cefalu" "Caccamo" "Lipari" "Valledolmo" "Sambuca" "Alcamo" "Vinchiaturo" "Camporeale" "Polizzi" "Castelvetrano" "Terrasini" "Toritto" "Melfi" "Partanna" "Marsala" "Marigliano" "Vicari" "Castellammare" "Gagliano" "Maddaloni" "Amalfi" "Padula" "Cervinara" "Caiazzo" "Riccia" "Sassano" "Scafati" "Alimena" "Collesano" "Minturno" "Ventimiglia" "Teora" "Montella" "Bisacquino" "Massa" "Atripalda" "Vallelunga" "Gerace" "Afragola" "Ariano" "Melilli" "Misilmeri" "Serradifalco" "Vico Equense" "Agerola" "Borgetto" "Castelbuono" "Milazzo" "Positano" "Teano" "Bolognetta" "Decollatura" "Serino" "Carini" "Saviano" "Stigliano" "Partinico" "Scilla" "Montemaggiore" "Pagani" "Acerra" "Andretta" "Venafro" "Angri" "Craco" "Eboli" "Montedoro" "Rionero" "Vasto" "Buccino" "Faeto" "Castiglione" "Nocera" "Capua" "Collelongo" "Gragnano" "Morcone" "Castellamare" "Agnone" "Bovino" "Castrofilippo" "Bivona" "Muro Lucano" "Sulmona" "Pontelandolfo" "Tegiano" "Biccari" "Ciminna" "Greci" "Mistretta" "Sanfele" "Carovilli" "Petralia" "Calitri" "Castelfranco" "Grotte" "Pettorano" "Regalbuto" "Atrani" "Caltabellotta" "Castroreale" "Ragusa" "Marianopoli" "Montecorvino" "Burgio" "Aversa" "Calabritto" "Faicchio" "Frosolone" "Sciara" "Sorrento" "Amantea" "Baucina" "Bellona" "Caposele" "Prizzi" "Agira" "Fisciano" "Casoli" "Salandra" "Troia" "Verbicaro" "Calatafimi" "Gallico" "Monreale" "Montalbano" "Poggiomarino" "Ricigliano" "Accettura" "Airola" "Alberona" "Alfedena" "Fanano" "Fornelli" "Giarre" "Maschito" "Monteforte" "Panni" "Rogliano" "Apice" "Gasperina" "Montevago" "Popoli" "Senigallia" "Spadafora" "Cassano" "Cimitile" "Ferrara" "Godrano" "Lanciano" "Nusco" "Palo Del Colle" "Resuttano" "Avella" "Boiano" "Castelvetere" "Giuliana" "Laurenzana" "Marzano" "Pachino" "Palmi" "Pollica" "Rende" "Ruoti" "Stella Cilento" "Villafranca" "Capestrano" "Cianciana" "Fano" "San Fele" "Villafrati" "Aprigliano" "Capaccio" "Carleone" "Carolei" "Celano" "Montese" "Picerno" "Saponara" "Solofra" "Veroli" "Alatri" "Anzi" "Barga" "Boscotrecase" "Casabona" "Centola" "Ferrandina" "Mussomeli" "Procida" "Sturno" "Ateleta" "Baiano" "Balvano" "Bitonto" "Domanico" "Moliterno" "Oliveto" "Orsara" "Platania" "Polermo" "Racalmuto" "Reggio Calabria" "Sciacca" "Termini" "'
foreach town of local Italy {
	quietly replace origin_country = "Italy" if (origin_country == "`town'")
}

local Italy `" "Palermo" "Caserta" "Salerno" "Cosenza" "Sicily" "Messina" "Avellino" "Bari" "Girgenti" "Trapani" "Napoli" "Catanzaro" "Potenza" "Roma" "Catania" "Aquila" "Siracusa" "Benevento" "Campobasso" "Chieti" "Foggia" "Lucca" "Caltanissetta" "Genova" "Udine" "Teramo" "Naples" "Pesaro" "Reggio C" "Torino" "Reggio" "Treviso" "Vicenza" "Alessandria" "Aguila" "Ancona" "Novara" "Perugia" "Parma" "South Sicily" "Sicily" "Calabria" "Milano" "Reggio Cal" "Firenze" "Belluno" "Caltanisetta" "Pisa" "Pavia" "C Basso" "Lecce" "Italian" "South Italy" "Itlay" "Modena" "Bologna" "Verona" "Trento" "Piacenza" "Potensa" "Brescia" "Como" "Ascoli" "Ita" "Bergamo" "Forli" "Cuneo" "Rome" "Cosensa" "Rovigo" "Genoa" "Reggiol" "Cbasso" "Molise" "Sondrio" "Ascoli P" "Ital" "So Italy" "Caltaniss" "Salermo" "Gergenti" "Agusta" "Arezzo" "Arellino" "Arezzo" "'
foreach town of local Italy {
	quietly replace origin_country = "Italy" if (origin_country == "`town'")
}

local Italy `" "Palerino" "S Lupo" "Montrone" "Motta" "Isola" "Capriati Volt" "Cegiano" "Canamo" "Capna" "Bella" "Trenta" "Vietri" "Oliveto Citro" "Melissa" "Marsiconnovo" "Delianova" "Alessand" "Basso" "Foggio" "Tenanni" "Tennini" "Cava" "Frabia" "Riva" "Solmona" "Aleamo" "Ceora" "Crapani" "S Fili" "Stella" "Ferenini" "Campagua"  "Sercara"  "Naro" "Sciacea" "Caltanis" "Cotenza" "Erapani" "Montebello" "Baghena" "Gallo" "Lago" "Maida" "Rodi" "Roseto" "Canna" "Rose"  "Gallina" "Vita" "Ansonia" "Ottaiano" "Sora" "Calliano" "Tarsia" "Paterno" "Monteleone" "Potenzo" "Valledolino" "Prata" "Tusa" "Contessa" "Laurenzano" "Parenti" "Bancina" "Alia" "Patti" "S Giuseppe Tato" "S Angelo Lomb" "'
foreach town of local Italy {
	replace origin_country = "Italy" if (origin_country == "`town'")
}

local Italy `" "S Arpino" "S Benedetto" "S Cosmo" "S Gennaro" "S Italy" "S Lucia" "S Lucia Del Mela" "S Marghenta" "S Pietro Apostolo" "S Potito" "S Sebastiano" "Monte S Giuliano" "S Anna" "S Biagio" "S Biagio Platani" "S Croce Camerina" "S Feli" "S Frabello" "S Germano" "S Gregorio Magno" "S Margheritz" "S Ninta" "S Agata Militello" "S Antinio" "S Bellino" "S Carlo" "S Ferdinando" "S Flavio" "S Giovanni Teatino" "S Land" "S Louis Rhine" "S Massimo" "S Pietro Apost" "S Rufo" "S Stefano Ca" "S Stefano Camastra" "Serra S Bruno" "Castel S Lorenzo" "Rocca S Felice" "S Alessio" "S Angelo A Cupolo" "S Angelo Ldi" "S Antino" "S Asia" "S Calogero" "S Cassiano" "S Colombano" "S Fete" "S Flaira" "S Gio Persiceto" "S Giovanni Fiore" "S Giuliano" "S Manro" "S Margherita B" "S Maria Vico" "S Mario" "S Mauso" "S Michele" "S Pietro In Guarano" "S Polo Maten" "S Sofia D'Epiro" "S Sosti" "S Stefano Cam" "S Niufa" "S Omero" "S Severo" "S Stefano Av" "Monte S Giavonio" "S Agata M"  "'
foreach town of local Italy {
	replace origin_country = "Italy" if (origin_country == "`town'")
}

local Italy `" "Itali" "Villa Franca" "Villabate" "Villafrate" "Villareggia" "Villa Vallelonga" "Villamagna" "Villarosa" "Villavallelonga" "Villavallelonga Aguila" "Campobatto" "Campobopo" "Campoli" "Campob" "Campolito" "Bari Italy" "Italy; Us" "Italy S" "Italyly" "Calogna Italy" "Italy)" "Palermo Italy" "Montefiascone" "Montefredane" "Montefredano" "Montelongo" "Montenero" "Montepagano" "Monteforte T" "Montegallo" "Montello" "Montemaggiori" "Monteneg" "Monterago" "Ruvo Del Monte" "Montedero" "Montefaleone" "Montemaggio" "Montemeletto" "Montemonaco" "Montenerodomo" "Valledohno" "Valle D'Olino" "Valledolma" "Vallelanga" "Siciliy" "Sicilia" "Alessandria Sicily" "'
foreach town of local Italy {
	replace origin_country = "Italy" if (origin_country == "`town'")
}

local Italy `" "S Agata Goti" "S Buono" "S Giovanni In Fiore" "S Giuseppe Iato" "S Maria A Vico" "S Polo Matese" "S Salvo" "'
foreach town of local Italy {
	replace origin_country = "Italy" if (origin_country == "`town'")
}

local Iran `" "Persia" "'
foreach town of local Iran {
	replace origin_country = "Iran" if (origin_country == "`town'")
}

local Jamaica `" "Kingston" "'
foreach town of local Jamaica {
	quietly replace origin_country = "Jamaica" if (origin_country == "`town'")
}

local Latvia `" "Mitan" "Dwinsk" "Libau" "Mitau" "'
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

local Malta `" "Oe" "'
foreach town of local Malta {
	replace origin_country = "Malta" if (origin_country == "`town'")
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

local Netherlands `" "Osch" "Schoondyke"  "Terseke" "Haarlem" "Beerta" "Krabbendyke" "Holand" "Middelburg" "Utrecht" "Apeldoorn" "Ede" "Ulrum" "Bolsward" "Groede" "Wolvega" "Elburg" "Nes" "Oostwold" "Winschoten" "Delft" "Goes" "Harlinger" "Helder" "N Beerta" "Ouddorp" "Almelo" "Uden" "Groningen" "Amsterdam" "The Hague" "Rotterdam" "A'Dam" "'
foreach town of local Netherlands {
	replace origin_country = "Netherlands" if (origin_country == "`town'")
}

local Netherlands `" "Amsterdam Holland" "Netherland" "Holland" "Netherl" "Holl" "Dutch" "Neth" "Dutch" "'
foreach town of local Netherlands {
	replace origin_country = "Netherlands" if (origin_country == "`town'")
}

local NewZealand `" "Queenstown" "'
foreach town of local NewZealand {
	quietly replace origin_country = "New Zealand" if (origin_country == "`town'")
}

local NorthernIreland `" "Down" "Armagh" "Derry" "Antrim" "Belfast" "Fermanagh" "Ballinaloob" "Londonderry" "'
foreach town of local NorthernIreland {
	quietly replace origin_country = "Northern Ireland" if (origin_country == "`town'")
}

local Norway `" "Porsgrund" "Chrsand" "Staranger" "Christiansund" "Christiana"  "Fredriksstad" "Moss" "Sandefjord" "Gjovik" "Fredrikstad" "Aalesund" "Kragero" "Telemarken" "Eidsberg" "Flekkefjord" "Hadeland" "Stavange" "Elverum" "Hangesund" "Horten" "Oksnes" "Biri" "Drobak" "Risor" "Lillesand" "Tonsberg" "Drontheim" "Trondhjem" "Grimstad" "Larvik" "Farsund" "Mandal" "Kristiansund" "Drammen" "Skien" "Throndhjem" "Christiansand" "Kristiania" "Bergen" "Stavanger" "Arendal" "'
foreach town of local Norway {
	replace origin_country = "Norway" if (origin_country == "`town'")
}

local Panama `" "Rp" "Colon" "'
foreach town of local Panama {
	quietly replace origin_country = "Panama" if (origin_country == "`town'")
}

local Poland `" "Pol" "Kozlow" "Ostrow" "Konin" "Bielostok" "Gnesen" "Gorlice" "Jaslo" "Mielec" "Ostrowo" "Bielsk" "Janowo" "Polish" "Czernigow" "Sanok" "Krakow" "Lipno" "Radom" "Ulanow" "Brzozow" "Dabrowa" "Plotzk" "Polanka" "Przemysl" "Dukla" "Suwolk" "Bobrka" "Dembica" "Dombrowo" "Gron" "Kolno" "Tarnobrzeg" "Janowitz" "Kolbuszow" "Kolbuszowa" "Serby" "Sokolow" "Gliniany" "Godowa" "Kotowka" "Laszki" "Nowogrod" "Ostrolenka" "Przemyol" "Salino" "Sieniawa" "Stettin" "Mlawa" "Bialystock" "Tarnow" "Krakau" "Lublin" "Suwalki" "Lodz" "Bialystok" "Warsaw" "Warschaw" "Warshaw" "Warshau" "Warschan" "'
foreach town of local Poland {
	quietly replace origin_country = "Poland" if (origin_country == "`town'")
}

local Poland `" "Pos" "'
foreach town of local Poland {
	replace origin_country = "Poland" if (origin_country == "`town'")
}

local Portugal `" "Stmichaels" "St George" "Alvito" "Fayal" "Funchal" "'
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

local Romania `" "Jossy" "Jessy" "Bacan" "Galati" "Bucharest" "Piatra" "Dorohoi" "Arad" "Roamania" "Craova" "Iassy" "Rumanian" "Focsani" "Bukarest" "Bacau" "Botosani" "Galatz" "Berlad" "Braila" "Jassy" "Bucarest" "'
foreach town of local Romania {
	replace origin_country = "Romania" if (origin_country == "`town'")
}

local Russia `" "Yassy" "Podolsk" "Rusjia" "Saratov" "Alexandrow" "Severin" "Jekaterinoslaw" "Ekaterinoslaw" "Rssia" "Rusfia" "'
foreach town of local Russia {
	replace origin_country = "Russia" if (origin_country == "`town'")
}

local Russia `" "Selz" "Rus" "Petersburg"  "Kamenitz" "Koretz" "Halbstadt" "Bialostok" "Czerkas" "Kalish" "Kovna" "Sarotow" "Wilma" "Elisawetgrad" "Norka" "Russ" "'
foreach town of local Russia {
	replace origin_country = "Russia" if (origin_country == "`town'")
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

local Sweden `" "Mora" "Bergsjo" "Gefle" "Gottenburg" "Motala" "Ragunda" "Vermland" "Gotland" "Gottenberg" "Orebro" "Sunne" "Yathenburg" "Pitea" "Swedenn" "Vasa" "Arvika" "Lund" "Norrkoping" "Gothenberg" "Helsingborg" "Goteborg" "Malmo" "Gothenburg" "Stockholm" "Swedem" "'
foreach town of local Sweden {
	replace origin_country = "Sweden" if (origin_country == "`town'")
}

local Switzerland `" "Corino" "Switserland" "Switzerld" "Coritto" "Sessa" "Rorbach" "Ebnat" "St Gallen" "Campo" "Adlisweil" "Biel" "Bern" "Castelgrande" "Berne" "Basel" "Campofelice" "Zurich" "Switzland" "'
foreach town of local Switzerland {
	quietly replace origin_country = "Switzerland" if (origin_country == "`town'")
}

local Syria `" "Damas" "Aleppo" "Syria Ta" "Syria A" "Damascus" "'
foreach town of local Syria {
	quietly replace origin_country = "Syria" if (origin_country == "`town'")
}

local Syria `" "Begrouth" "Ta" "T A" "'
foreach town of local Syria {
	replace origin_country = "Syria" if (origin_country == "`town'")
}

local TrinidadAndTobago `" "T'Dad" "'
foreach town of local TrinidadAndTobago {
	quietly replace origin_country = "Trinidad and Tobago" if (origin_country == "`town'")
}

local TrinidadAndTobago `" "Trinidad" "Bwi" "Trinidad" "'
foreach town of local TrinidadAndTobago {
	replace origin_country = "Trinidad and Tobago" if (origin_country == "`town'")
}

local Tunisia `" "Tunis" "Monastir" "Tunisi" "Tunisie" "'
foreach town of local Tunisia {
	quietly replace origin_country = "Tunisia" if (origin_country == "`town'")
}

local Turkey `" "Asia" "Alexandrette" "Bitlis" "Han" "Turchia" "Turkeuy" "Mersina" "Smyrne" "Samsoun" "Constantinople" "'
foreach town of local Turkey {
	quietly replace origin_country = "Turkey" if (origin_country == "`town'")
}

local Ukraine `" "Cherson" "Podol" "Poltawa" "Ukrainia" "Kiev" "Wolyn" "Elisabethgrad" "Proskurow" "Husiatyn" "Rohatyn" "Uman" "Busk" "Podhajce" "Gorodok" "Ostrog" "Zitomir" "Fastow" "Horodenka" "Drohsbicz" "Kowel" "Tarutino" "Bilek" "Charkow" "Jezupol" "Klostitz" "Poltava" "Smela" "Ukrania" "Bolechow" "Boryslaw" "Rowne" "Sarata" "Bachmut" "Balta" "Sitomir" "Tschernembl" "Brzezany" "Buczacz" "Romny" "Skalat" "Smila" "Soroky" "Belz" "Sambor" "Stanislau" "Tarnopol" "Czernowitz" "Kieff" "Kolomea" "Brody" "Stryj" "Rowno" "Kiew" "Lemberg" "Riga" "Odessa" "'
foreach town of local Ukraine {
	replace origin_country = "Ukraine" if (origin_country == "`town'")
}

local USA `" "La" "Chicago" "Claims Us Born" "Irvine" "New York City" "Amerika" "U S Born" "Filadelfia" "N York" "Hawaii" "Neb" "New York Usa" "Ny City" "Philadelphia" "Us Citizen" "San Jose" "Puerto Rico" "Us Born" "USA" "U S Citizen" "Ct" "Va" "'
foreach town of local USA {
	replace origin_country = "United States" if (origin_country == "`town'")
}

local USA `" "Ia" "Ny" "Pa" "Ill" "Mass" "Nj" "N Y" "Ohio" "New York" "Conn" "Mich" "Minn" "Wisc" "N J" "Wash" "Cal" "Ind" "Iowa" "USA (Casamicclole Ischia" "USA Or Castellanimare Golfo" "USA Or Santiago de Cuba" "U S A" "US" "U S" "USA Mass" "United States" "United States Of America" "America" "U.S.A. (Lenola" "U S Of A" "NY USA  Jettenback" "NY USA  Jettenback" "Usa" "Us" "USA" "Ny Usa" "Mont" "Col" "St Thomas" "Mo" "Texas" "Il" "W Va" "Ills" "O" "Pa Usa" "Mass Usa" "Ri" "St Croix" "Illinois" "Nebr" "Ore" "Michigan" "Pennsylvania" "New Jersey" "Oh" "Ill Usa" "Indiana" "Wis" "Brooklyn" "Ca" "Calif" "California" "Nj Usa" "Utah" "Vi" "Wyo" "Nh" "Ma" "Mich Usa" "Minnesota" "Montana" "Nyork"  "'
foreach town of local USA {
	replace origin_country = "United States" if (origin_country == "`town'")
}

local USA `" "Usa)" "Cal Usa" "Conn Usa" "Ohio Usa" "Us Of A" "'
foreach town of local USA {
	replace origin_country = "United States" if (origin_country == "`town'")
}

local Venezuela `" "Venez" "Ven" "'
foreach town of local Venezuela {
	replace origin_country = "Venezuela" if (origin_country == "`town'")
}

local Wales `" "Swales" "Morriston" "Swansea" "Llanelly" "Cardiff" "Glamorgan" "S Wales" "Abertillery" "Port Talbot" "'
foreach town of local Wales {
	quietly replace origin_country = "Wales" if (origin_country == "`town'")
}

local WestIndies `" "West Ind" "W Ind" "W Indies" "'
foreach town of local WestIndies {
	replace origin_country = "West Indies" if (origin_country == "`town'")
}

local Yugoslavia `" "Jugo Slovakia" "J-Sl" "Yougo-Slav" "Yougoslav" "Yougo-Slavia" "Jugo-Slavia" "Y Slavia" "Yugo Slav" "Yougo-Sl" "Yugo Slavia" "Y Slav" "Jugo-Slav" "Bosnia" "Yugoslavia" "Jugoslavia" "Yougoslavia" "Jugosl" "Jugoslav" "Yougosl" "Yugo-Slav" "Jugo Slavia" "Jugo-Sl" "Yugo-Sl" "Yugo Slavish" "Jugoslv" "J Slav" "Jougosl" "Yugoslav" "Jugo Slav" "Yugosl" "Yugo-Slavia" "Yugo Sl" "Yugo-Slavia" "Y Slove" "Y-Slavia" "Yougo Slovaky" "Tcheco-Slovac" "'
foreach town of local Yugoslavia {
	quietly replace origin_country = "Yugoslavia" if (origin_country == "`town'")
}





//////////////////
// Change the decision to be based on origin instead of origin_country

local Angola `" "Moxico, Africa" "'
foreach town of local Angola {
	replace origin_country = "Angola" if (origin == "`town'")
}

local Algeria `" "Algeri, Algeri, Africa" "Algiers, Africa" "'
foreach town of local Algeria {
	replace origin_country = "Algeria" if (origin == "`town'")
}

local Argentina `" "Buenos Aires, Arg. Rep., S. Amer." "B. Aires, S. Amer." "Buenos Aires, Argentina, S. Amer." "Buenos Ayres, Argentine, S. Amer." "B'Aires, So. Amer." "Buenos Aires, Rep. Arg., So. Amer." "Buenos Aries, Rep. Arg., So. Amer" "B. Aires, So. Amer." "B.A., Argentina, So. Amer." "Buenos Aires, Argentina, So Amer" "Buenos Aires, Argentine, So. Amer." "Buenos Aires, Rep. Arg., So. Amer" "Buenos Aires, So. Amer." "B. Aires, So. America" "Buenos Aires, Argentina, So. America" "Buenos Aires, So. America" "B. Aires, S. America" "Buenos Aires, S. America" "B. Aires, S. America" "Buenos Aires, S. America" "B. Aires, Argentine, S. Am." "B. Aries, S. Am." "Baradero, Argentina, So. America" "Campana, Arg, So Amer" "Buenos Ayers, South America" "Pv. Aires, South America" "'
foreach town of local Argentina {
	replace origin_country = "Argentina" if (origin == "`town'")
}

local Argentina `" "Buenos Aires, Arg., S. A." "Buenos Aires, Argentina, S. A." "Buenos Aires, Argentine, So Am" "Buenos Aires, Rep. Arg., So. Am." "B. Aires, Arg. Rep, So Am" "Buenos Aires, Arg. Rep., So. Am." "Buenos Aires, Argentina, So. Am." "B. Aires, Arg Rep, So Am" "B. Aires, Argentina, So. Am." "Buenos Aires, Argentina, So Am" "Buenos Aires, Argentine, So. Am." "B'Aires, Arg., So. Am." "B. Aries, So. Am." "B. Ayres, Arges., So. Am." "B. Ayres, So. Am." "Beunos Aires, Argentine, So. Am." "Buenos Aires, Argentine, So. Am" "Buenos Aires, Argentinia, So. Am." "Buenos Aires, So. Am." "Buenos Ayres, Argentina, So Am" "Buenos Ayres, Argentine, Republic, S.." "Buenosaires, Argentina, So. Am." "Ansonia, Argentine, So. Am." "Mendoza, Arg. Rep., So. Am." "Mendoza, Argentine, So. Am." "Rosario, Arg. Rep., So. Am." "Costilie, Rep. Arg., So. Am." "'
foreach town of local Argentina {
	replace origin_country = "Argentina" if (origin == "`town'")
}

local Bahamas `" "Nassau N.P., Bahama Island, W.I." "Inagua, Bahamas, W.I." "Nassau N. P.. Bahamas, W.I." "'
foreach town of local Bahamas {
	replace origin_country = "The Bahamas" if (origin == "`town'")
}

local Barbados `" "St. Michael, W. I." "Christchurch, Barbadoes, W.I." "Bridgtown, Barbados, W.I." "Alex. Court, Barbados, W.I." "Christs Church, Barbados, W.I." "B'town, Barbados, W.I." "Christ Church, Barbados, W. I." "Christ Ch, Barbados, W. I." "St. Thomas, Barbados, W. I." "Bridgetown, Barbados, W. Ind." "Hastings, Barbados, W. Ind." "'
foreach town of local Barbados {
	replace origin_country = "Barbados" if (origin == "`town'")
}

local Bermuda `" "St. Georges, Bermuda, W.I." "Paget, Bermuda, W.I." "Bermuda, W.I." "Hamilton, Bermuda, W.I." "Somerset, Bermuda, W.I." "Someset, Bermuda, W.I." "Hamilton, Bermuda, W I" "Hamilton, Bermuda, W. I." "Hamilton, Bermuda, W. Ind." "Pembroke, Bermuda, W. Ind" "Paget, Bermuda, W. Ind." "Warwick, Bermuda, W. Ind" "'
foreach town of local Bermuda {
	replace origin_country = "Bermuda" if (origin == "`town'")
}

local Bolivia `" "La Paz, Bolivia, So. Am." "Uyuni, Bolivia, So. Am." "'
foreach town of local Bolivia {
	replace origin_country = "Bolivia" if (origin == "`town'")
}

local Bolivia `" "Riberalto, Bolivia, So A" "Cochabamba, Bolivia, S. A." "Ormro, Bolivia, S. America" "Ormro, Bolivia, S. America" "'
foreach town of local Bolivia {
	replace origin_country = "Bolivia" if (origin == "`town'")
}

local Brazil `" "Manaos, Brazil, So. Amer." "Curyteba, Brazil, So. Amer." "Rio De Janeiro, Brazil, So. Amer." "S Paulo, Brazil, So Amer" "Sao Paulo, Brazil, So Amer." "Recife, Brasil, So. Amer." "Rio de Janeiro, Brazil, So Amer" "Rio de Janeiro, South America" "Rio Janiero, Brazil, So. America" "Rio, S. Am." "Sao Paulo, South America" "Sao Paulo, So. Amer." "Sta. Catherina, Brazil, So. Amer." "Catharena, South America" "'
foreach town of local Brazil {
	replace origin_country = "Brazil" if (origin == "`town'")
}

local Brazil `" "Brazil, S. A." "Sao Paulo, Brazil, So. Am." "Rio de Janeiro, Brazil, So. Am." "Santos, Brazil, So. Am." "Parana, Brazil, So Am" "Petropolis, Brazil, So. Am." "Sao Paulo, Brazil, So Am" "Rio, Brazil, So. Am." "Maranhai, Brazil, So. Am." "Minas, Brazil, So. Am." "Rio de Janeiro, Brazil, So Am" "Santos Brazil, So. Am." "M. Grossa, Brazil, So. Am." "Para, Brazil, So Am" "Parana, Brazil, So. Am." "Santa Catrina, Brazil, So Am" "Sao Paolo, Brazil, So. Am." "St Paulo, Brazil, So. Am." "Rio De Janeiro, So. Am." "Rio De Janerio, Brazil, So. Am." "San Paolo, So. Am." "S. Paulo, So. Am." "Sao Paulo, So. Am." "Sao, Paulo, So. Am." "San Paulo, So Am" "San Paulo, So. Am." "'
foreach town of local Brazil {
	replace origin_country = "Brazil" if (origin == "`town'")
}

local Chile `" "Iquique, Chile, So. Am." "Santiago, Chili, So. Am." "Valparaiso, Chile, So. Am" "Valparaiso, Chili, So. Am." "'
foreach town of local Chile {
	replace origin_country = "Chile" if (origin == "`town'")
}

local Chile `" "Valpariso, Chile, S.A." "Iquique, Chile, So. America" "Valparaiso, Chile, So America" "Santiago, Chile, So. Amer." "Santiago, So. America" "'
foreach town of local Chile {
	replace origin_country = "Chile" if (origin == "`town'")
}

local Colombia `" "Barranquilla, Colombia, So. Amer." "Bogota, Colombia, So. Amer." "Cartagena, Colomb., So. Amer." "Bogota, Columgia, S. Amer." "Columbia, South America" "Cartagena, S. Amer." "Sta. Maria, Col., S. Amer." "'
foreach town of local Colombia {
	replace origin_country = "Colombia" if (origin == "`town'")
}

local Colombia `" "Bogota, Colombia, So. A." "Bogota, Colombia, S. A." "Bogota, Columgia, S.A." "Iquique, Chile, So. Am." "Santiago, Chili, So. Am." "Cucuta, Colombia, So Am" "Bogota, Colombia, So Am" "Barranquilla, Colombia, So Am" "Bogata, Colombia, So. Am." "Bogota, Columbia, So. Am." "Cartagena, Colombia, So. Am." "Girardot, Colombia, So Am" "Medellin, Columb., So. Am." "Popayan, Colombia, So Am" "Sogamoso, Colombia, So. Am." "Tumaco, Columbia, So. Am." "Bogota, So. Am." "'
foreach town of local Colombia {
	replace origin_country = "Colombia" if (origin == "`town'")
}

local Congo `" "Luebo, Africa" "'
foreach town of local Congo {
	replace origin_country = "Congo" if (origin == "`town'")
}

local CostaRica `" "San Jose, Costa Rica, So. Am." "'
foreach town of local CostaRica {
	replace origin_country = "CostaRica" if (origin == "`town'")
}

local Cuba `" "Holguin, W. I." "Cienfuegos, W.I." "Havana, W I" "Santiago, Cuba, WI" "Baracoa, Cuba, WI" "Chaparra, Cuba, WI" "Havana, Cuba, WI" "Havana, W.I." "Havana, Cuba, W.I." "Havana, Cuba, W. I." "Bayate, Cuba, W. I." "Havana, Cuba, W. Ind." "Havana, Cuba, W Ind." "Santiago, Cuba, W Ind" "Camaguey, Cuba, W. Ind." "'
foreach town of local Cuba {
	replace origin_country = "Cuba" if (origin == "`town'")
}

local Curacao `" "Curacao, So Am" "Curacao, D.W.I., W.I." "'
foreach town of local Curacao {
	replace origin_country = "Curacao" if (origin == "`town'")
}

local Denmark `" "Jutland" "'
foreach town of local Denmark {
	replace origin_country = "Denmark" if (origin == "`town'")
}

local DominicanRepublic `" "S. F. de Macoris, R. D., W. I." "Navarette, Dom. Rep., W.I." "Santo Domingo, WI" "Plo Plata, Dom. Rep., W. I." "Pto Plata, St. Dom., W. I." "Pto Plata, W. I." "Sanchez, D.R., W. Ind." "'
foreach town of local DominicanRepublic {
	replace origin_country = "Dominican Republic" if (origin == "`town'")
}

local Ecuador `" "Guayaquil, Ecuador, S. Amer." "Esmeraldas, Ecuador, S. Amer." "Guayaquil, Ecuador, So. Amer." "'
foreach town of local Ecuador {
	replace origin_country = "Ecuador" if (origin == "`town'")
}

local ElSalvador `" "San Salvador, S. Amer." "'
foreach town of local ElSalvador {
	replace origin_country = "El Salvador" if (origin == "`town'")
}

local Egypt `" "Cario, Africa" "Alescandria, Africa" "Aleseandia, Africa" "Alessandria, Africa" "Alexandrie, Africa" "Cairon, Egypte, Africa" "Cairon, Egypt, Africa" "Camp., Port Said, Africa" "Camp, Port Said, Africa" "'
foreach town of local Egypt {
	replace origin_country = "Egypt" if (origin == "`town'")
}

local Guyana `" "Georgetown, Brit. Guiana, So. Amer." "'
foreach town of local Guyana {
	replace origin_country = "Guyana" if (origin == "`town'")
}

local Guyana `" "Georgetown, Demerara, S.A." "Georgetown, Demerara, So. Am." "Demerara, So. Am." "Georgetown, Br. Gu., So. Am." "Georgetown, British Guiana, So. Am." "'
foreach town of local Guyana {
	replace origin_country = "Guyana" if (origin == "`town'")
}

local Grenada `" "St. George's, W.I." "St. Georges, W.I." "'
foreach town of local Grenada {
	replace origin_country = "Grenada" if (origin == "`town'")
}

//CHECK THE ONES THAT AREN'T CHANGING - MAYBE LEADING SPACES?
local Italy `" "Nicastro" "Belmonte" "Altavilla" "Villarosa" "Campobello" "Bella" "Mirabella" "Salina" "Villalba" "Cermini" "Augusta" "Nola" "Meta" "Elena" "Nicastro", "Acri", "Campobello", "Naso", "Alife" "'
foreach town of local Italy {
	replace origin_country = "Italy" if (origin == "`town'")
}

local Jamaica `" "Santiago, W.I." "Kingston, W.I." "Santiago, W. I." "Kingston, Jamaica, W.I." "Mandlville, Jamiaca, W.I." "Jamaican, W.I." "Linstead, Jamaica, W.I." "Kingston, Jamaica, W. I." "Devon, Jamaica, W. I." "Port Antonio, Jamaica, W. I." "Runaway Bay, Jamaica, W Ind" "Kingston, Jamaica , W. Ind." "Kingston, Ja., W. Ind." "Kingston, W. Ind." "'
foreach town of local Jamaica {
	replace origin_country = "Jamaica" if (origin == "`town'")
}

local Kenya `" "Kenya, Africa" "'
foreach town of local Kenya {
	replace origin_country = "Kenya" if (origin == "`town'")
}

local Libya `" "Tripolis, Africa" "'
foreach town of local Libya {
	replace origin_country = "Libya" if (origin == "`town'")
}

local Malawi `" "Blantyre" "'
foreach town of local Malawi {
	replace origin_country = "Malawi" if (origin == "`town'")
}

local Nicaragua `" "Managua, Nicaragua, C. Am." "Granada, Nicaragua, C. Am." "'
foreach town of local Nicaragua {
	replace origin_country = "Nicaragua" if (origin == "`town'")
}

local Norway `" "Chrsand" "'
foreach town of local Norway {
	replace origin_country = "Norway" if (origin == "`town'")
}

local Panama `" "Panama, S. Am." "'
foreach town of local Panama {
	replace origin_country = "Panama" if (origin == "`town'")
}

local Panama `" "Gatun, Panama, So A" "Panama City, R. of P., C. Amer." "Panama, C. Amer." "Colon, Panama, C Amer" "Panama City, Panama, C Amer" "Panama, Panama, C. Amer." "Colon, Panama, C. Am." "Panama, Panama, C. Am." "Colon, R. of P., C. Amer." "Colon, Rep of Pan, C. Am." "Panama, Panama, S. A." "Colon, Panama, So Am." "'
foreach town of local Panama {
	replace origin_country = "Panama" if (origin == "`town'")
}

local Paraguay `" "Asuncion, So. Am." "'
foreach town of local Paraguay {
	replace origin_country = "Paraguay" if (origin == "`town'")
}

local Paraguay `" "Para, S. America" "Para, S. America" "Paragagay, South America" "'
foreach town of local Paraguay {
	replace origin_country = "Paraguay" if (origin == "`town'")
}

local Peru `" "Lima, Peru, S. Am." "Lima, Peru, So America" "Cuzco, Peru, So. Amer." "Chiclayo, Peru, So. Amer." "Lima, Peru, So. Amer." "Peru, So Amer" "Callao, S. Am." "'
foreach town of local Peru {
	replace origin_country = "Peru" if (origin == "`town'")
}

local Peru `" "Arequipa, Peru, S.A." "Catacaos, Peru, So. Am." "Arequipa, Peru, So. Am." "Arequipa, Peru, So Am" "Barranco, Peru, So. Am." "Lima, Peru, So. Am." "Cuzco, Peru, So Am" "Cuzco, Peru, So. Am." "Cerro de Pasco, Peru, So Am" "'
foreach town of local Peru {
	replace origin_country = "Peru" if (origin == "`town'")
}

local Portugal `" "Belmonte" "'
foreach town of local Portugal {
	replace origin_country = "Portugal" if (origin == "`town'")
}

local Russia `" "Kulm" "Kischenew" "Mir" "'
foreach town of local Russia {
	replace origin_country = "Russia" if (origin == "`town'")
}

local SaintKittsandNevis `" "St. Kitts, B.W.I., W.I." "St. Kitts, W.I." "'
foreach town of local  SaintKittsandNevis {
	replace origin_country = "Saint Kitts and Nevis" if (origin == "`town'")
}

local SaudiArabia `" "Madena, Africa" "'
foreach town of local SaudiArabia {
	replace origin_country = "Saudi Arabia" if (origin == "`town'")
}

local Scotland `" "Johnstone" "'
foreach town of local Scotland {
	replace origin_country = "Scotland" if (origin == "`town'")
}

local SouthAfrica `" "Bone, Africa" "Cape Horn, S. A." "Cape Colony, Africa" "Durban, Africa" "Potchofetrom, Africa" "Wellington, Cape Colony, Africa" "'
foreach town of local SouthAfrica {
	replace origin_country = "South Africa" if (origin == "`town'")
}

local Suriname `" "Paramante, Burinam, So. Amer." "Paramaraso, Suraname, So. Amer." "Paramaribo, So Amer"  "'
foreach town of local Suriname {
	replace origin_country = "Suriname" if (origin == "`town'")
}

local TrinidadAndTobago `" "Port of Spain, W.I." "Port of Spain, W. I." "Port of Spain, Trinidad, W.I." "Port-of-Spain, Trinidad, W.I." "'
foreach town of local TrinidadAndTobago {
	replace origin_country = "Trinidad and Tobago" if (origin == "`town'")
}

local Tunisia `" "Bezerte, Africa" "Djebel Ressas, Africa" "'
foreach town of local Tunisia {
	replace origin_country = "Tunisia" if (origin == "`town'")
}

local Tunisia `" "Eunis, Africa" "Funis, Fimisia, Africa" "Tunisi, Africa" "Tunisia, Africa" "Tunisy, Africa" "Besaville, Tunisie, Africa" "Bizerte, Tunisie, Africa" "Bozerte, Tunis, Africa" "'
foreach town of local Tunisia {
	replace origin_country = "Tunisia" if (origin == "`town'")
}

local US `" "St. Thomas, D. W. I., W. I." "Charlotte Amelia, St. Thomas, W. I." "'
foreach town of local US {
	replace origin_country = "United States" if (origin == "`town'")
}

local Uruguay `" "Monte Video, So. Amer." "'
foreach town of local Uruguay {
	replace origin_country = "Uruguay" if (origin == "`town'")
}

local Venezuela `" "Carupano, Venezuela, S. Am." "Pt. Cabello, Venezuela, South America" "Bolivar, Venezuela, S. Amer." "Caracas, So. Amer." "'
foreach town of local Venezuela {
	replace origin_country = "Venezuela" if (origin == "`town'")
}

local Venezuela `" "Caracas, VLA, C Amer" "Caracas, Venezuela, S. A." "Caracas, S A" "Caracas, Venezuela, S.A" "Maracaibo, Venezuela, S.A." "Caracas, Venezuela, So. Am." "Caracas, Venezuela, So Am" "Valencia, Venezuela, So. Am." "Coracas, Venezuela, So. Am." "Maracaibo, Venezuela, So. Am." "Marguerita Island, Venezuela, So. Am." "Merida, Venez, So. Am." "Merida, Venezuela, So Am" "Maracaibo, Venezuela, So Am" "'
foreach town of local Venezuela {
	replace origin_country = "Venezuela" if (origin == "`town'")
}







////////////////

local COME_BACK_TO_THESE `" "Wi" "Sa" "Africa" "Witkowitz" "Al"  "Newport" "Niksich" "Kronenthal" "Ha" "Galston" "H" "Alva" "Trebizonde" "Glogon" "Beresin" "Burnbank" "By" "Grodns" "Harpoot" "Johnston" "Jersey" "Kolb" "Korono" "Pico" "Resicza" "Tavricien" "Wilkomir" "Leith" "Sudan" "Sw" "W" "Gilly" "L" "Maryhill" "Gr" "Ponewesh" "Rosenberg" "Non Immigrant Alien" "St Helens" "Suwalky" "C" "Harlingen" "Speier" "Dolina" "Kandel"  "S" "Kassa" "R" "Havre" "M" "Makow"  "Frank" "A"  "Samsonn"  "South" "B" "S H S" "Hamilton" "U" "'
foreach town of local COME_BACK_TO_THESE {
	replace origin_country = "COME_BACK_TO_THESE" if (origin_country == "`town'")
}







////////////////
//drop IPUMS_country
gen IPUMS_country = origin_country

local IPUMS_conversion `" "Senegal" "Algeria" "Morocco" "Malawi" "Egypt" "South Africa" "Tunisia" "Libya" "'
foreach town of local IPUMS_conversion {
	replace IPUMS_country = "AFRICA" if (IPUMS_country == "`town'")
}

local IPUMS_conversion `" "Australia" "New Zealand" "'
foreach town of local IPUMS_conversion {
	replace IPUMS_country = "Australia and New Zealand" if (IPUMS_country == "`town'")
}

local IPUMS_conversion `" "Dominican Republic" "Bahamas" "Haiti" "Barbados" "Trinidad and Tobago" "Jamaica" "Bermuda" "Saint Kitts and Nevis" "'
foreach town of local IPUMS_conversion {
	replace IPUMS_country = "Americas, n.s." if (IPUMS_country == "`town'")
}

local IPUMS_conversion `" "Panama" "Honduras" "Grenada" "The Bahamas" "C Am" "C Amer" "W I" "Wi" "Antigua and Barbuda" "Nicaragua" "Costa Rica" "Guatemala" "Panama" "El Salvador" "'
foreach town of local IPUMS_conversion {
	replace IPUMS_country = "Central America" if (IPUMS_country == "`town'")
}

local IPUMS_conversion `" "Galicia" "Jawidcze" "Shaptza" "'
foreach town of local IPUMS_conversion {
	replace IPUMS_country = "Eastern Europe, ns" if (IPUMS_country == "`town'")
}

local IPUMS_conversion `" "Israel" "Palestinian Territories" "'
foreach town of local IPUMS_conversion {
	replace IPUMS_country = "Israel/Palestine" if (IPUMS_country == "`town'")
}

local IPUMS_conversion `" "Northern Ireland" "'
foreach town of local IPUMS_conversion {
	replace IPUMS_country = "Northern Europe, ns" if (IPUMS_country == "`town'")
}

local IPUMS_conversion `" "Selz" "Dabar" "Mir" "Kischenew" "Georgia" "Slov" "Kulm" "Jossy" "Stanislaw" "Rus" "Macedonia" "Bosnia and Herzegovina" "Wolyn" "Moldova" "Montenegro" "Slovakia" "Slovenia" "Armenia" "Serbia" "Russia" "Ukraine" "Croatia" "Belarus" "Prussia" "'
foreach town of local IPUMS_conversion {
	replace IPUMS_country = "Other USSR/Russia" if (IPUMS_country == "`town'")
}

local IPUMS_conversion `" "So A" "Guyana" "Sa" "Suriname" "Curacao" "Guyana" "So America" "S Am" "S A" "S America" "S Amer" "Bolivia" "So Amer" "So Am" "Uruguay" "Ecuador" "Brazil" "Argentina" "Colombia" "Venezuela" "Peru" "Chile" "'
foreach town of local IPUMS_conversion {
	replace IPUMS_country = "SOUTH AMERICA" if (IPUMS_country == "`town'")
}

// Nice spelling IPUMS
local IPUMS_conversion `" "Switzerland" "'
foreach town of local IPUMS_conversion {
	replace IPUMS_country = "Swizterland" if (IPUMS_country == "`town'")
}

////////////////






//////////////////// This is the working code to work out what to clean
// Create a flag indicating whether the country is an IPUMS country
// Instruction: So the goal is to create bpl codes for each observation. The bpl codes are from IPUMS USA and are by country of birth, which should answer some of your questions (e.g. Prussia goes to Germany, Sicily to Italy, etc.). The historical regions are usually coded at a more aggregated level. See https://usa.ipums.org/usa-action/variables/BPL#codes_section (not the detailed codes).
// Things get tricky when dealing with World War I boundary changes in eastern Europe, especially because we're going to be relying on the 1920, 1930 and 1940 Census. Before I have aggregated countries up to pre World War I boundaries. First, I would get them into modern BPL codes and we can decide how to aggregate them later, unless you think something else is better.
// drop is_country_flag
// drop is_IPUMS_flag
gen is_IPUMS_flag = .
local list_of_countries `" "United States" "Guam" "Puerto Rico" "U.S. Virgin Islands" "Canada" "St. Pierre and Miquelon" "Atlantic Islands" "North America, ns" "Mexico" "Central America" "Cuba" "West Indies" "Americas, n.s." "South America" "Denmark" "Finland" "Iceland" "Lapland, n.s." "Norway" "Sweden" "England" "Scotland" "Wales" "United Kingdom, ns" "Ireland" "Northern Europe, ns" "Belgium" "France" "Liechtenstein" "Luxembourg" "Monaco" "Netherlands" "Swizterland" "Western Europe, ns" "Albania" "Andorra" "Gibraltar" "Greece" "Italy" "Malta" "Portugal" "San Marino" "Spain" "Vatican City" "Southern Europe, ns" "Austria" "Bulgaria" "Czechoslovakia" "Germany" "Hungary" "Poland" "Romania" "Yugoslavia" "Central Europe, ns" "Eastern Europe, ns" "Estonia" "Latvia" "Lithuania" "Baltic States, ns" "Other USSR/Russia" "Europe, ns" "China" "Japan" "Korea" "East Asia, ns" "Brunei" "Cambodia (Kampuchea)" "Indonesia" "Laos" "Malaysia" "Philippines" "Singapore" "Thailand" "Vietnam" "Southeast Asia, ns" "Afghanistan" "India" "Iran" "Maldives" "Nepal" "Bahrain" "Cyprus" "Iraq" "Iraq/Saudi Arabia" "Israel/Palestine" "Jordan" "Kuwait" "Lebanon" "Oman" "Qatar" "Saudi Arabia" "Syria" "Turkey" "United Arab Emirates" "Yemen Arab Republic (North)" "Yemen, PDR (South)" "Persian Gulf States, n.s." "Middle East, ns" "Southwest Asia, nec/ns" "Asia Minor, ns" "South Asia, nec" "Asia, nec/ns" "Africa" "Australia and New Zealand" "Pacific Islands" "Antarctica, ns/nec" "Abroad (unknown) or at sea" "Other n.e.c." "Missing/blank" "SOUTH AMERICA" "AFRICA"  "'
// Iterate through the list of countries and add a flag if it's not a country.  
foreach country of local list_of_countries {
	quietly replace is_IPUMS_flag = 1 if (IPUMS_country == "`country'") 
}

// Use this to list the countries that need to be looked at
// drop country_frequency
egen country_frequency = count(1), by(origin_country)
gsort -country_frequency origin_country

// Get a list of rows to clean
tab IPUMS_country if country_frequency > 9 & missing(is_IPUMS_flag), sort

tab origin_country if country_frequency > 10, sort

tab IPUMS_country if country_frequency > 10, sort

// Use this to get the data that you need in order to fix origin

local LookingAt `"  "'
foreach country of local LookingAt {
	//tab origin if origin_country == "`country'", sort
	//tab origin_city if origin_country == "`country'", sort
	tab ethnicity if origin_country == "`country'"
}
 



 




/////// DEBRIS //////////

// This will fill empty countries based on given cities, for instance, if the city was Sydney then it would fill Australia, but the relationship needs to be unique, which requires lots of cleaning.

// Change the formatting
//encode origin_city, gen(n_origin_city)
//encode origin_country, gen(n_origin_country)

// Find the ones that are not unique
//capture ssc install egenmore
//drop countries
//bys origin_city: egen countries = nvals(origin_country)
// Look for: countries>1

//tab countries, sort

//tab origin_city if countries == 1 & missing(origin_country), sort

// Do the actual filling
//net from http://www.sealedenvelope.com/
//xfill origin_country, i(n_origin_city)
