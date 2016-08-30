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


//////////////////////// Initial set up and load data ////////////////////////
clear all

//set more off, permanently
set more off
//set more off, permanently

use "/hdir/0/monicah/Desktop/EIbrothers18921924.dta"


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
//replace origin_city = subinstr(origin_city, "Â", "", .)
//replace origin_country = subinstr(origin_country, "Â", "", .)
replace origin_city = subinstr(origin_city, ".", "", .)
replace origin_city = subinstr(origin_city, "'", " ", .)
replace origin_city = subinstr(origin_city, ";", " ", .)
replace origin_country = subinstr(origin_country, ".", "", .)
replace origin_country = subinstr(origin_country, ":", "", .)
replace origin_country = trim(origin_country)
replace origin_city = trim(origin_city)
replace origin_country = strproper(origin_country)
replace origin_city = strproper(origin_city)



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
replace origin_city = "USA" if (origin_city == "U S A") ///
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

// Create a flag indicating whether the origin_country is a country
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

// display `"`list_of_countries'"'
// Iterate through the list of countries and add a flag if it's not a country.  
foreach country of local list_of_countries {
	quietly replace is_country_flag = 1 if (origin_country == "`country'") 
}


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
// Reassemble Yugoslavia - IS THIS APPROPRIATE??? - (SR Bosnia and Herzegovina, SR Croatia, SR Macedonia, SR Montenegro, SR Slovenia, and SR Serbia)
replace origin_country = "Yugoslavia" if (origin_country == "Jugoslavia") ///
	| (origin_country == "Yougoslavia") | (origin_country == "Jugosl") ///
	| (origin_country == "Jugoslav") | (origin_country == "Yougosl") ///
	| (origin_country == "Yugo-Slav") | (origin_country == "Jugo Slavia") ///
	| (origin_country == "Jugo-Sl") | (origin_country == "Yugo-Sl") ///
	| (origin_country == "Yugo Slavish") | (origin_country == "Jugoslv") ///
	| (origin_country == "J Slav") | (origin_country == "Jougosl") ///
	| (origin_country == "Yugoslav") | (origin_country == "Jugo Slav") ///
	| (origin_country == "Yugosl") | (origin_country == "Yugo-Slavia") ///
	| (origin_country == "Yugo Sl") | (origin_country == "Yugo-Slavia") 
	
// Should we reassemble Great Britain or better separated?	
// Not sure what to do with Russ vs Rus	
// Need to separate the different countries caught up in So Am and So Amer
// Have left Prussia as a country, not sure if want to integrate into Germany or leave separate
// Come back to: Curland, Austr, Pos, Massa, Pol, Styria, Ta, Rssia, Rusfia, Csl, T A, Ekaterinoslaw, GR, Istria, Slov, A, Archipelago, Archipelagos, Va, Austria Hungary, B'Da
// W I is West Indies, but need to look at where to put them
// Bukowina is split between Romania and Ukraine these days - not sure how to deal with that

// Use this to list the countries that need to be looked at
// 
egen x = count(1), by(origin_country)
gsort -x origin_country

tab origin_country if x > 25 & x < 61 & !missing(x) & missing(is_country_flag), sort
tab origin_city if origin_country == "Paris"




////////UP TO HERE - CLEAN THESE ONES NEXT
tab origin if (origin_country == "Glasgow"), sort

                                 Beyrouth |      1,981        3.02       54.93
                                Glasgow |      1,033        1.57       60.83
                                 Odessa |        771        1.17       62.01
                                Bermuda |        679        1.03       63.04
                              Liverpool |        592        0.90       63.94
                                Sciacca |        572        0.87       64.81
                                  Paris |        558        0.85       65.66
                                 Havana |        529        0.81       66.47
                            Christiania |        509        0.78       67.24
                                  Jassy |        508        0.77       68.02
                               Bucarest |        437        0.67       68.68
                              Rotterdam |        404        0.62       69.30
                                  Hango |        395        0.60       69.90
                             Gothenburg |        394        0.60       70.50
                                 Bergen |        390        0.59       71.09
                                Termini |        359        0.55       71.64
                                Belfast |        347        0.53       72.17
                                  So Am |        342        0.52       72.69
                             Copenhagen |        335        0.51       73.20
                                   Kiew |        330        0.50       73.70
                                  S H S |        317        0.48       74.19
                                  Libau |        296        0.45       74.64
                             Manchester |        290        0.44       75.08
                                   Russ |        272        0.41       75.49
                                  Piree |        250        0.38       75.87
                                Jutland |        243        0.37       76.24
                                   Lodz |        218        0.33       76.58
                              Stavanger |        213        0.32       76.90
                               Corleone |        195        0.30       77.20
                                     Wi |        186        0.28       77.48
                                Tripoli |        183        0.28       77.76
                                 Sparta |        181        0.28       78.03
                              S Stefano |        178        0.27       78.31
                                  Cerda |        177        0.27       78.58
                                 Dundee |        175        0.27       78.84
                                S Agata |        172        0.26       79.10
                                 Berlin |        165        0.25       79.36
                                Lemberg |        164        0.25       79.61
                                Marineo |        163        0.25       79.85
                                 Galatz |        158        0.24       80.09
                                Antwerp |        157        0.24       80.33
                                  Wolyn |        156        0.24       80.57
                             Birmingham |        155        0.24       80.81
                              Palestine |        153        0.23       81.04
                               Hamilton |        150        0.23       81.27
                                Lercara |        144        0.22       81.49
                               Bagheria |        142        0.22       81.70
                              Bialystok |        142        0.22       81.92
                               Campagna |        141        0.21       82.14
                                 Dublin |        141        0.21       82.35
                                So Amer |        141        0.21       82.56
                                  Leeds |        140        0.21       82.78
                              Stockholm |        138        0.21       82.99
                                Donegal |        137        0.21       83.20
                                  Menfi |        134        0.20       83.40
                             Marseilles |        133        0.20       83.60
                              Amsterdam |        132        0.20       83.80
                              Edinburgh |        131        0.20       84.00
                              Sao Paulo |        129        0.20       84.20
                                  Fayal |        128        0.19       84.40
                           S Margherita |        128        0.19       84.59
                              Avigliano |        125        0.19       84.78
                               Belmonte |        124        0.19       84.97
                                Paisley |        124        0.19       85.16
                                Nicosia |        123        0.19       85.35
                                Hamburg |        122        0.19       85.53
                               Nicastro |        122        0.19       85.72
                                  Roman |        121        0.18       85.90
                                  Sarno |        121        0.18       86.09
                                 Africa |        120        0.18       86.27
                                 Ribera |        120        0.18       86.45
                                 Trabia |        119        0.18       86.63
                                 Cefalu |        117        0.18       86.81
                                Arendal |        116        0.18       86.99
                                  Derry |        116        0.18       87.16
                                Caccamo |        115        0.18       87.34
                                 Lipari |        115        0.18       87.51
                             Valledolmo |        114        0.17       87.69
                                Sambuca |        113        0.17       87.86
                                 Antrim |        112        0.17       88.03
                                 Persia |        108        0.16       88.20
                              Sheffield |        106        0.16       88.36
                               Aberdeen |        103        0.16       88.51
                                Suwalki |        102        0.16       88.67
                               Budapest |        101        0.15       88.82
                                 Tyrone |        101        0.15       88.98
                                 Warsaw |        101        0.15       89.13
                                 Alcamo |         99        0.15       89.28
                              Altavilla |         99        0.15       89.43
                                  Patti |         99        0.15       89.58
                                   Riga |         99        0.15       89.73
                             Kristiania |         98        0.15       89.88
                              Villarosa |         98        0.15       90.03
                                 S Fele |         97        0.15       90.18
                                   Wien |         94        0.14       90.32
                               S Flavia |         93        0.14       90.47
                                    W I |         93        0.14       90.61
                                   Acri |         92        0.14       90.75
                             Camporeale |         92        0.14       90.89
                                 Berlad |         91        0.14       91.03
                                  Malmo |         91        0.14       91.16
                                Polizzi |         91        0.14       91.30
                                 Braila |         90        0.14       91.44
                                  W Ind |         90        0.14       91.58
                           Buenos Aires |         89        0.14       91.71
                          Castelvetrano |         89        0.14       91.85
                              Terrasini |         89        0.14       91.98
                                   Alia |         86        0.13       92.11
                               Greenock |         86        0.13       92.25
                                Toritto |         86        0.13       92.38
                             Campobello |         85        0.13       92.51
                               Kingston |         85        0.13       92.64
                               Larkhall |         85        0.13       92.77
                                  Melfi |         85        0.13       92.89
                               Partanna |         85        0.13       93.02
                                Marsala |         84        0.13       93.15
                                  Xania |         83        0.13       93.28
                               Cornwall |         82        0.12       93.40
                             Marigliano |         82        0.12       93.53
                                 Vicari |         82        0.12       93.65
                                Piraeus |         81        0.12       93.78
                                    Rus |         81        0.12       93.90
                                  Bella |         80        0.12       94.02
                              S Cataldo |         80        0.12       94.14
                               Warschaw |         80        0.12       94.27
                                 Zurich |         80        0.12       94.39
                                S Paulo |         79        0.12       94.51
                                     Ta |         79        0.12       94.63
                          Castellammare |         78        0.12       94.75
                               Gagliano |         78        0.12       94.87
                                 Armagh |         77        0.12       94.98
                              Maddaloni |         77        0.12       95.10
                                  Pireo |         77        0.12       95.22
                                  Rowno |         77        0.12       95.33
                                 Amalfi |         76        0.12       95.45
                              Groningen |         76        0.12       95.57
                                 Padula |         76        0.12       95.68
                              Cervinara |         74        0.11       95.79
                                      U |         74        0.11       95.91
                               Blantyre |         73        0.11       96.02
                                Caiazzo |         73        0.11       96.13
                                   Prag |         72        0.11       96.24
                                 Riccia |         71        0.11       96.35
                              Marseille |         70        0.11       96.45
                                Sassano |         70        0.11       96.56
                                Scafati |         70        0.11       96.67
                                Alimena |         69        0.11       96.77
                          Christiansand |         69        0.11       96.88
                                 Vienna |         69        0.11       96.98
                               Bradford |         68        0.10       97.09
                              Collesano |         68        0.10       97.19
                               Minturno |         68        0.10       97.29
                                Prussia |         68        0.10       97.40
                            Ventimiglia |         68        0.10       97.50
                            Campofelice |         67        0.10       97.60
                                  Teora |         67        0.10       97.70
                                 Bremen |         66        0.10       97.81
                                 Lublin |         66        0.10       97.91
                               Montella |         66        0.10       98.01
                    Non Immigrant Alien |         66        0.10       98.11
                             Bisacquino |         65        0.10       98.21
                                  Massa |         65        0.10       98.30
                              Atripalda |         64        0.10       98.40
                                Cardiff |         63        0.10       98.50
                                S Ninfa |         63        0.10       98.59
                             Vallelunga |         63        0.10       98.69
                                  Brest |         62        0.09       98.78
                                 Gerace |         62        0.09       98.88
                                 Lievin |         62        0.09       98.97
                                  Norka |         62        0.09       99.07
                               S Angelo |         62        0.09       99.16
                                Samsoun |         62        0.09       99.26
                               Afragola |         61        0.09       99.35
                                 Ariano |         61        0.09       99.44
                                Melilli |         61        0.09       99.54
                              Misilmeri |         61        0.09       99.63
                             Motherwell |         61        0.09       99.72
                                   Naso |         61        0.09       99.81
                           Serradifalco |         61        0.09       99.91
                           Vico Equense |         61        0.09      100.00
                                Agerola |         60        0.42        0.42
                               Borgetto |         60        0.42        0.84
                            Castelbuono |         60        0.42        1.26
                                Milazzo |         60        0.42        1.69
                               Positano |         60        0.42        2.11
                                  Teano |         60        0.42        2.53
                                  Alife |         59        0.41        2.94
                             Bolognetta |         59        0.41        3.36
                            Decollatura |         59        0.41        3.77
                          Ekaterinoslaw |         59        0.41        4.19
                                 Serino |         59        0.41        4.60
                            Southampton |         59        0.41        5.01
                               Llanelly |         58        0.41        5.42
                                    T A |         58        0.41        5.83
                                Bancina |         57        0.40        6.23
                               Besseges |         57        0.40        6.63
                                 Carini |         57        0.40        7.03
                                 Dwinsk |         57        0.40        7.43
                                Saviano |         57        0.40        7.83
                              Stigliano |         57        0.40        8.23
                              Partinico |         56        0.39        8.62
                            Puerto Rico |         56        0.39        9.02
                                 Scilla |         56        0.39        9.41
                                Bristol |         55        0.39        9.80
                              Johnstone |         55        0.39       10.18
                          Montemaggiore |         55        0.39       10.57
                                 Pagani |         55        0.39       10.95
                                 Acerra |         54        0.38       11.33
                               Andretta |         54        0.38       11.71
                                   Nola |         54        0.38       12.09
                                Airdrie |         53        0.37       12.46
                                Augusta |         53        0.37       12.84
                         Constantinople |         53        0.37       13.21
                                Edinbro |         53        0.37       13.58
                                Neudorf |         53        0.37       13.95
                             Nottingham |         53        0.37       14.32
                              Stanislaw |         53        0.37       14.70
                                Venafro |         53        0.37       15.07
                               Warschan |         53        0.37       15.44
                                  Angri |         52        0.37       15.81
                             Barcellona |         52        0.37       16.17
                                  Craco |         52        0.37       16.54
                                  Eboli |         52        0.37       16.90
                                   Meta |         52        0.37       17.27
                              Montedoro |         52        0.37       17.63
                                Rionero |         52        0.37       18.00
                             S Fratello |         52        0.37       18.36
                                  Vasto |         52        0.37       18.73
                                  Brody |         51        0.36       19.09
                                Buccino |         51        0.36       19.44
                                  Faeto |         51        0.36       19.80
                                  Jaffa |         51        0.36       20.16
                                 Krakau |         51        0.36       20.52
                               Tripolis |         51        0.36       20.88
                            Castiglione |         50        0.35       21.23
                                Chrsand |         50        0.35       21.58
                                  Elena |         50        0.35       21.93
                                  Jumet |         50        0.35       22.28
                                 Nocera |         50        0.35       22.63
                                  Cania |         49        0.34       22.98
                                  Capua |         49        0.34       23.32
                             Collelongo |         49        0.34       23.66
                                   Down |         49        0.34       24.01
                               Gragnano |         49        0.34       24.35
                                Morcone |         49        0.34       24.70
                           Castellamare |         48        0.34       25.03
                                Leipzig |         48        0.34       25.37
                            West Indies |         48        0.34       25.71
                                 Agnone |         47        0.33       26.04
                                 Bovino |         47        0.33       26.37
                          Castrofilippo |         47        0.33       26.70
                                Curland |         47        0.33       27.03
                                 Salina |         47        0.33       27.36
                                  Argos |         46        0.32       27.68
                                 Bivona |         46        0.32       28.00
                                   Hull |         46        0.32       28.33
                                Kolomea |         46        0.32       28.65
                               Limerick |         46        0.32       28.97
                              Mirabella |         46        0.32       29.30
                            Muro Lucano |         46        0.32       29.62
                               S Donato |         46        0.32       29.94
                              St Helens |         46        0.32       30.26
                                Sulmona |         46        0.32       30.59
                                  Homel |         45        0.32       30.90
                                  Kieff |         45        0.32       31.22
                          Pontelandolfo |         45        0.32       31.54
                                    Rio |         45        0.32       31.85
                             S Giovanni |         45        0.32       32.17
                                Tegiano |         45        0.32       32.48
                               Villalba |         45        0.32       32.80
                                      B |         44        0.31       33.11
                                Biccari |         44        0.31       33.42
                               Botosani |         44        0.31       33.73
                                Ciminna |         44        0.31       34.04
                                  Greci |         44        0.31       34.34
                                  Kovno |         44        0.31       34.65
                              Mistretta |         44        0.31       34.96
                             S Caterina |         44        0.31       35.27
                               San Jose |         44        0.31       35.58
                                Sanfele |         44        0.31       35.89
                                  Wigan |         44        0.31       36.20
                              Bellshill |         43        0.30       36.50
                                 Beyrut |         43        0.30       36.80
                              Carovilli |         43        0.30       37.10
                                Cermini |         43        0.30       37.41
                             Coatbridge |         43        0.30       37.71
                                Laibach |         43        0.30       38.01
                         London England |         43        0.30       38.31
                               Petralia |         43        0.30       38.61
                                  Polla |         43        0.30       38.92
                                  South |         43        0.30       39.22
                                  Austr |         42        0.29       39.51
                                Calitri |         42        0.29       39.81
                           Castelfranco |         42        0.29       40.10
                                 Grotte |         42        0.29       40.40
                             Kilmarnock |         42        0.29       40.69
                              Pettorano |         42        0.29       40.99
                                    Pos |         42        0.29       41.28
                              Regalbuto |         42        0.29       41.58
                                 Slonim |         42        0.29       41.87
                                 Tarnow |         42        0.29       42.17
                                 Atrani |         41        0.29       42.45
                          Caltabellotta |         41        0.29       42.74
                            Castroreale |         41        0.29       43.03
                                 Ragusa |         41        0.29       43.32
                         Rio De Janeiro |         41        0.29       43.61
                                Roubaix |         41        0.29       43.89
                                     Sa |         41        0.29       44.18
                                  Jossy |         40        0.28       44.46
                            Marianopoli |         40        0.28       44.74
                           Montecorvino |         40        0.28       45.02
                                Suwalky |         40        0.28       45.31
                             Throndhjem |         40        0.28       45.59
                                   Tusa |         40        0.28       45.87
                                 Wishaw |         40        0.28       46.15
                                  Bacau |         39        0.27       46.42
                                 Bolton |         39        0.27       46.70
                                 Burgio |         39        0.27       46.97
                             Czernowitz |         39        0.27       47.24
                               Goteborg |         39        0.27       47.52
                                 L'Pool |         39        0.27       47.79
                                Warshaw |         39        0.27       48.07
                                 Aversa |         38        0.27       48.33
                                 Batoum |         38        0.27       48.60
                             Calabritto |         38        0.27       48.87
                                Dresden |         38        0.27       49.13
                               Faicchio |         38        0.27       49.40
                              Frosolone |         38        0.27       49.67
                                 Sciara |         38        0.27       49.93
                               Sorrento |         38        0.27       50.20
                             Strassburg |         38        0.27       50.47
                                Warshau |         38        0.27       50.73
                                Amantea |         37        0.26       50.99
                                Baucina |         37        0.26       51.25
                                Bellona |         37        0.26       51.51
                               Caposele |         37        0.26       51.77
                               Contessa |         37        0.26       52.03
                                   Lago |         37        0.26       52.29
                             Laurenzano |         37        0.26       52.55
                                    Pol |         37        0.26       52.81
                                 Prizzi |         37        0.26       53.07
                             Rutherglen |         37        0.26       53.33
                                  Skien |         37        0.26       53.59
                                 Slutzk |         37        0.26       53.85
                                  Agira |         36        0.25       54.10
                           Buenos Ayres |         36        0.25       54.36
                               Fisciano |         36        0.25       54.61
                             Glucksthal |         36        0.25       54.86
                                Parenti |         36        0.25       55.12
                                 Sparte |         36        0.25       55.37
                                 Casoli |         35        0.25       55.61
                                Drammen |         35        0.25       55.86
                                 Dudley |         35        0.25       56.11
                                Halifax |         35        0.25       56.35
                              Jerusalem |         35        0.25       56.60
                              Jugo-Slav |         35        0.25       56.84
                                 Kassel |         35        0.25       57.09
                              Kischinew |         35        0.25       57.33
                           Kristiansund |         35        0.25       57.58
                                  Lpool |         35        0.25       57.83
                                 Mandal |         35        0.25       58.07
                                 Oldham |         35        0.25       58.32
                            S Salvatore |         35        0.25       58.56
                               Salandra |         35        0.25       58.81
                                Swansea |         35        0.25       59.05
                               Tarnopol |         35        0.25       59.30
                                  Troia |         35        0.25       59.55
                              Verbicaro |         35        0.25       59.79
                               Bukarest |         34        0.24       60.03
                             Calatafimi |         34        0.24       60.27
                                Farsund |         34        0.24       60.51
                                Gallico |         34        0.24       60.75
                                 Larvik |         34        0.24       60.99
                                 Merida |         34        0.24       61.22
                               Monreale |         34        0.24       61.46
                             Montalbano |         34        0.24       61.70
                           Poggiomarino |         34        0.24       61.94
                                  Prata |         34        0.24       62.18
                             Ricigliano |         34        0.24       62.42
                              Accettura |         33        0.23       62.65
                                 Airola |         33        0.23       62.88
                               Alberona |         33        0.23       63.11
                               Alfedena |         33        0.23       63.35
                                  Basel |         33        0.23       63.58
                                      C |         33        0.23       63.81
                                 Fanano |         33        0.23       64.04
                               Fornelli |         33        0.23       64.27
                                 Giarre |         33        0.23       64.50
                               Maschito |         33        0.23       64.74
                             Monteforte |         33        0.23       64.97
                              Newcastle |         33        0.23       65.20
                                  Panni |         33        0.23       65.43
                                  Pirie |         33        0.23       65.66
                               Rogliano |         33        0.23       65.89
                                Sealand |         33        0.23       66.13
                                  Apice |         32        0.22       66.35
                               Arbroath |         32        0.22       66.58
                                 Athens |         32        0.22       66.80
                                  Berne |         32        0.22       67.02
                             Bialystock |         32        0.22       67.25
                           Castelgrande |         32        0.22       67.47
                                Esbjerg |         32        0.22       67.70
                                  Essen |         32        0.22       67.92
                              Gasperina |         32        0.22       68.15
                               Grimstad |         32        0.22       68.37
                                 Landau |         32        0.22       68.60
                                   Lens |         32        0.22       68.82
                                  Maida |         32        0.22       69.05
                              Montevago |         32        0.22       69.27
                                 Popoli |         32        0.22       69.50
                             Senigallia |         32        0.22       69.72
                              Spadafora |         32        0.22       69.95
                              Stanislau |         32        0.22       70.17
                             Stevenston |         32        0.22       70.40
                                  A'Dam |         31        0.22       70.61
                             Alexandrie |         31        0.22       70.83
                                   Bern |         31        0.22       71.05
                                Cassano |         31        0.22       71.27
                               Cimitile |         31        0.22       71.48
                                  Derby |         31        0.22       71.70
                                Ferrara |         31        0.22       71.92
                                Godrano |         31        0.22       72.14
                                  Govan |         31        0.22       72.35
                            Helsingborg |         31        0.22       72.57
                               Lanciano |         31        0.22       72.79
                            Mexico City |         31        0.22       73.01
                                  Nusco |         31        0.22       73.23
                         Palo Del Colle |         31        0.22       73.44
                              Resuttano |         31        0.22       73.66
                            S Valentino |         31        0.22       73.88
                                 Smyrne |         31        0.22       74.10
                             So America |         31        0.22       74.31
                              The Hague |         31        0.22       74.53
                              Trondhjem |         31        0.22       74.75
                            Valledolino |         31        0.22       74.97
                                 Alvito |         30        0.21       75.18
                                 Avella |         30        0.21       75.39
                                 Boiano |         30        0.21       75.60
                               Bukowina |         30        0.21       75.81
                           Castelvetere |         30        0.21       76.02
                               Damascus |         30        0.21       76.23
                              Drontheim |         30        0.21       76.44
                              Gibraltar |         30        0.21       76.65
                               Giuliana |         30        0.21       76.86
                              Harlingen |         30        0.21       77.07
                             Laurenzana |         30        0.21       77.28
                                Marzano |         30        0.21       77.49
                                Mogilew |         30        0.21       77.71
                                Pachino |         30        0.21       77.92
                                  Palmi |         30        0.21       78.13
                                Pollica |         30        0.21       78.34
                                  Rende |         30        0.21       78.55
                                   Rodi |         30        0.21       78.76
                                  Rssia |         30        0.21       78.97
                                  Ruoti |         30        0.21       79.18
                               S Pietro |         30        0.21       79.39
                                   Slov |         30        0.21       79.60
                         Stella Cilento |         30        0.21       79.81
                               Tonsberg |         30        0.21       80.02
                                   Uden |         30        0.21       80.23
                            Villafranca |         30        0.21       80.44
                             Capestrano |         29        0.20       80.65
                              Cianciana |         29        0.20       80.85
                                 Dolina |         29        0.20       81.05
                                   Fano |         29        0.20       81.26
                                Focsani |         29        0.20       81.46
                                 Grodna |         29        0.20       81.67
                                 Kandel |         29        0.20       81.87
                              Lillesand |         29        0.20       82.07
                             Monteleone |         29        0.20       82.28
                                  Perth |         29        0.20       82.48
                                Potenzo |         29        0.20       82.68
                                   Rose |         29        0.20       82.89
                                 Rusfia |         29        0.20       83.09
                                      S |         29        0.20       83.29
                             S Guiseppe |         29        0.20       83.50
                              S Martino |         29        0.20       83.70
                                 Sambor |         29        0.20       83.91
                               San Fele |         29        0.20       84.11
                                  Sligo |         29        0.20       84.31
                             Villafrati |         29        0.20       84.52
                                 Almelo |         28        0.20       84.71
                             Aprigliano |         28        0.20       84.91
                                   Belz |         28        0.20       85.11
                               Beresina |         28        0.20       85.30
                                 Bogota |         28        0.20       85.50
                               Capaccio |         28        0.20       85.70
                               Carleone |         28        0.20       85.89
                                Carolei |         28        0.20       86.09
                                 Celano |         28        0.20       86.29
                             Gothenberg |         28        0.20       86.48
                                  Kassa |         28        0.20       86.68
                                 Kobrin |         28        0.20       86.88
                                  Leith |         28        0.20       87.07
                               Longford |         28        0.20       87.27
                                  Mlawa |         28        0.20       87.47
                                Montese |         28        0.20       87.66
                                  Palma |         28        0.20       87.86
                                Picerno |         28        0.20       88.06
                                 S Amer |         28        0.20       88.25
                               Santiago |         28        0.20       88.45
                               Saponara |         28        0.20       88.65
                                Solofra |         28        0.20       88.84
                                 Styria |         28        0.20       89.04
                                  Tyrol |         28        0.20       89.24
                                 Veroli |         28        0.20       89.43
                                 Alatri |         27        0.19       89.62
                                Antopol |         27        0.19       89.81
                                   Anzi |         27        0.19       90.00
                                B Aires |         27        0.19       90.19
                                  Barga |         27        0.19       90.38
                           Boscotrecase |         27        0.19       90.57
                               Casabona |         27        0.19       90.76
                                Centola |         27        0.19       90.95
                                 Durham |         27        0.19       91.14
                             Ferrandina |         27        0.19       91.33
                                  Havre |         27        0.19       91.52
                                Kilsyth |         27        0.19       91.71
                                  Makow |         27        0.19       91.90
                               Monaghan |         27        0.19       92.09
                              Mussomeli |         27        0.19       92.28
                                Paterno |         27        0.19       92.47
                                  Posen |         27        0.19       92.66
                                Procida |         27        0.19       92.84
                                      R |         27        0.19       93.03
                                 Roseto |         27        0.19       93.22
                                    S A |         27        0.19       93.41
                                 Sturno |         27        0.19       93.60
                                 Tarsia |         27        0.19       93.79
                                      A |         26        0.18       93.98
                                Ateleta |         26        0.18       94.16
                                 Baiano |         26        0.18       94.34
                            Baillieston |         26        0.18       94.52
                                Balvano |         26        0.18       94.71
                                Bitonto |         26        0.18       94.89
                                 Bosnia |         26        0.18       95.07
                                  Canna |         26        0.18       95.25
                                    Csl |         26        0.18       95.44
                                  Damas |         26        0.18       95.62
                               Domanico |         26        0.18       95.80
                            Dunfermline |         26        0.18       95.98
                            Havana Cuba |         26        0.18       96.17
                         Jekaterinoslaw |         26        0.18       96.35
                               Mannheim |         26        0.18       96.53
                              Moliterno |         26        0.18       96.71
                              Morriston |         26        0.18       96.90
                                Oliveto |         26        0.18       97.08
                                 Orsara |         26        0.18       97.26
                                Ouddorp |         26        0.18       97.44
                               Platania |         26        0.18       97.63
                                Polermo |         26        0.18       97.81
                              Racalmuto |         26        0.18       97.99
                        Reggio Calabria |         26        0.18       98.17
                                  Risor |         26        0.18       98.36
                               S Egidio |         26        0.18       98.54
                             S Giuseppe |         26        0.18       98.72
                                 Shotts |         26        0.18       98.90
                                   Sora |         26        0.18       99.09
                                 Speier |         26        0.18       99.27
                                  Stryj |         26        0.18       99.45
                                Us Born |         26        0.18       99.63
                            Vinchiaturo |         26        0.18       99.82
                               Vittoria |         26        0.18      100.00
----------------------------------------+-----------------------------------




/////// DEBRIS //////////

// This will fill empty countries based on given cities, for instance, if the city was Sydney then it would fill Australia, but the relationship needs to be unique, which requires lots of cleaning.

// Chagne the formatting
encode origin_city, gen(n_origin_city)
encode origin_country, gen(n_origin_country)

// Find the ones that are not unique
capture ssc install egenmore
drop countries
bys origin_city: egen countries = nvals(origin_country)
// Look for: countries>1

// Do the actual filling
net from http://www.sealedenvelope.com/
xfill origin_country, i(n_origin_city)
