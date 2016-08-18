// Author: Rohan Alexander
// Contact: rohan.alexander@anu.edu.au 
// Description: TO ADD


//////////////////////// Initial set up and load data
clear all

set more off, permanently

use "/hdir/0/monicah/Desktop/EIbrothers18921924.dta"


//////////////////////// Start separating the cities and countries
//Separate origin based on the first comma
split origin, generate(origin) parse(,) limit(2)
rename origin1 origin_city
rename origin2 origin_country

//Deal with some horrible formatting inserted by the website
replace origin_city = subinstr(origin_city, char(160), "", .)
//replace origin_city = subinstr(origin_city, "�", "", .)
replace origin_city = subinstr(origin_city, ".", "", .)
replace origin_city = subinstr(origin_city, "'", " ", .)
replace origin_city = subinstr(origin_city, ";", " ", .)
replace origin_country = subinstr(origin_country, ".", "", .)
replace origin_country = subinstr(origin_country, ":", "", .)
replace origin_country = trim(origin_country)
replace origin_city = trim(origin_city)
replace origin_country = strproper(origin_country)
replace origin_city = strproper(origin_city)


//////////////////////// Typos in the cities names
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


//////////////////////// Swap countries and cities as appropriate
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
//drop is_country_flag

//////////////////////// Fix remaining messy countries (some of these are more than just typos - possible errors introduced here)
// Use this to list the countries that need to be looked at
// tab origin_country if missing(is_country_flag), sort
// The cities of all these countries need to be checked before going through with the change; tab origin_city if (origin_country == "COUNTRY"), sort
// Decide what to do with 'Russ' or 'S H S' or 'Wolyn' or 'Kiew'. Maybe add a flag or something to signal Zach to look into further then get rid of them in the table so they stop coming up.
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
replace origin_country = "Austria" if (origin_country == "Asutria") ///
	| (origin_country=="Austrial")
replace origin_country = "Australia" if (origin_country == "Aus") ///
	| (origin_country == "Aust") 
replace origin_country = "Belgium" if (origin_country == "Belg") ///
	| (origin_country=="Belguim")
replace origin_country = "Belarus" if (origin_country == "Minsk") ///
	| (origin_country == "Grodno") | (origin_country == "Pinsk Reg") ///
	| (origin_country == "Witebsk")	
replace origin_country = "Bermuda" if (origin_country == "Bda")
replace origin_country = "Canada" if (origin_country == "Nfld") ///
	| (origin_country == "Newfoundland") | (origin_country == "Ont") ///
	| (origin_country == "Can")
replace origin_country = "Chile" if (origin_country == "Chili")
replace origin_country = "Colombia" if (origin_country == "Columbia")
replace origin_country = "Croatia" if (origin_country == "Dalmatia")
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
	| (origin_country == "Czec Slav") | (origin_country == "Czeckoslovakia") 
replace origin_country = "Denmark" if (origin_country == "Denm") ///
	| (origin_country=="Den") | (origin_country == "Denmark USA") ///
	| (origin_country == "Hellerup")
replace origin_country = "Egypt" if (origin_country == "Africa") & ((origin_city == "Alexandria") | (origin_city == "Cairo"))
replace origin_country = "England" if (origin_country == "Eng") ///
	| (origin_country == "Engl?Nd") | (origin_country == "English") ///
	| (origin_country == "Englanmd") | (origin_country == "Elgland") ///
	| (origin_country == "Gr Brit")
// Galicia is a legit historical area even though not a country anymore, but should not be separate to Galicy
replace origin_country = "Galicia" if (origin_country == "Galicy") ///
	| (origin_country == "Galizia") | (origin_country == "Galacia") ///
	| (origin_country == "E Galicia") | (origin_country == "Gal")	
replace origin_country = "Germany" if (origin_country == "Germ") ///
	| (origin_country == "German") | (origin_country == "Germany A/M") ///
	| (origin_country == "Ger")
replace origin_country = "Guatemala" if (origin_country == "Guatamala") ///
	| (origin_country == "Guat") | (origin_country == "Guatamla") ///
	| (origin_country == "Central America") // Note Central America was checked to make sure there weren't other countries in there
replace origin_country = "Guyana" if (origin_country == "Demerara") 
replace origin_country = "Hungary" if (origin_country == "Hung") ///
	| (origin_country == "Hungaria") 
replace origin_country = "Ireland" if (origin_country == "Iireland") ///
	| (origin_country == "Co Kerry") | (origin_country == "Ire")
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
	| (origin_country == "Bologna") | (origin_country == "Verona")
replace origin_country = "Italy" if (origin_country == "Italy Italy") ///
	| (origin_country == "It") | (origin_country == "Italia")
replace origin_country = "Jamaica" if (origin_country == "Ja") ///
	| (origin_country == "Jamacia")
replace origin_country = "Lithuania" if (origin_country == "Kowno") ///
	| (origin_country == "Wilna") | (origin_country == "Lith") ///
	| (origin_country == "Lietuva") | (origin_country == "Wilno") 
replace origin_country = "Lithuania" if (origin_country == "Lithuan") 
replace origin_country = "Moldova" if (origin_country == "Bessarabia")
replace origin_country = "Netherlands" if (origin_country == "Netherland") ///
	| (origin_country == "Holland") | (origin_country == "Netherl") ///
	| (origin_country == "Holl")
replace origin_country = "Norway" if (origin_country == "Nor")
replace origin_country = "Palestine" if (origin_country == "Palestina") ///
	| (origin_country == "Palistine")
replace origin_country = "Panama" if (origin_country == "Republic Of Panama") ///
	| (origin_country == "R Of P")
replace origin_country = "Portugal" if (origin_country == "St Michael'S") ///
	| (origin_country == "St Michaels") | (origin_country == "Madeira") ///
	| (origin_country == "Azores") | (origin_country == "Terceira")	
replace origin_country = "Romania" if (origin_country == "Roumania.") ///
	| (origin_country == "Roumany") | (origin_country == "Roumania") ///
	| (origin_country == "Roum") | (origin_country == "Roumanian") ///
	| (origin_country == "Rumania") | (origin_country == "Rouman")
replace origin_country = "Russia" if (origin_country == "Samara") ///
	| (origin_country == "Russian") 
replace origin_country = "Scotland" if (origin_country == "Scot") 
replace origin_country = "Serbia" if (origin_country == "Servia") 
replace origin_country = "South Africa" if (origin_country == "So Africa") ///
	| (origin_country == "S Africa") | (origin_country == "S Afr") ///
	| (origin_country == "S Af") | (origin_country == "S'Africa") ///
	| (origin_country == "So Afrika")
replace origin_country = "South Africa" if (origin_country == "Africa") & ((origin_city == "Johannesburg") | (origin_city == "Cape Town"))
replace origin_country = "Slovenia" if (origin_country == "Carniola")
// Make Shs and S H S consistent - NOT SURE WHAT IT'S MEANT TO BE
replace origin_country = "S H S" if (origin_country == "Shs")
replace origin_country = "Switzerland" if (origin_country == "Switzserland") ///
	| (origin_country == "Switz") | (origin_country == "Swiss") ///
	| (origin_country == "Switzerl")
replace origin_country = "Trinidad and Tobago" if (origin_country == "Trinidad")
replace origin_country = "Tunisia" if (origin_country == "Africa") & (origin_city == "Tunis")
replace origin_country = "Turkey" if (origin_country == "Turkey A") ///
	| (origin_country == "Turkey E") | (origin_country == "Turkish") ///
	| (origin_country == "Turk")
replace origin_country = "Ukraine" if (origin_country == "Cherson")
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
	| (origin_country == "Ny Usa") | (origin_country == "USA")
replace origin_country = "Venezuela" if (origin_country == "Venez")
replace origin_country = "Wales" if (origin_country=="Swales")
// Reassemble Yugoslavia - IS THIS APPROPRIATE??? - (SR Bosnia and Herzegovina, SR Croatia, SR Macedonia, SR Montenegro, SR Slovenia, and SR Serbia)
replace origin_country = "Yugoslavia" if (origin_country == "Jugoslavia") ///
	| (origin_country == "Yougoslavia") | (origin_country == "Jugosl") ///
	| (origin_country == "Jugoslav") | (origin_country == "Yougosl") ///
	| (origin_country == "Yugo-Slav") | (origin_country == "Jugo Slavia") ///
	| (origin_country == "Jugo-Slav") | (origin_country == "Yugo-Sl") 
	
	
	       











////////UP TO HERE - CLEAN THESE ONES NEXT
tab origin_city if (origin_country == ""), sort

                      Mohilew |         50        0.09       62.80
                      Co Cork |         49        0.09       62.88
                      Prussia |         49        0.09       62.97
                      Slovaky |         49        0.09       63.05
                      Brescia |         46        0.08       63.13
                       Albany |         45        0.08       63.21
                       Trento |         44        0.08       63.29
                     Piacenza |         43        0.07       63.36
                      Potensa |         43        0.07       63.44
                        Austr |         42        0.07       63.51
                      Bergamo |         42        0.07       63.58
                         Mont |         42        0.07       63.65
                          Pos |         42        0.07       63.73
                Santo Domingo |         42        0.07       63.80
                          Col |         41        0.07       63.87
                    St Thomas |         41        0.07       63.94
                        Greek |         40        0.07       64.01
                        Turky |         40        0.07       64.08
                           Mo |         39        0.07       64.15
                         Como |         38        0.07       64.22
                         Ills |         38        0.07       64.28
                     Slavonia |         38        0.07       64.35
                          Swe |         38        0.07       64.41
                          Bwi |         37        0.06       64.48
                        Cuneo |         36        0.06       64.54
                        Dutch |         36        0.06       64.60
                        So Am |         36        0.06       64.67
                       Ungary |         36        0.06       64.73
                        Forli |         35        0.06       64.79
                        Lomza |         35        0.06       64.85
                            O |         35        0.06       64.91
                          Pol |         35        0.06       64.97
                        Syrie |         35        0.06       65.03
                     Bukowina |         34        0.06       65.09
                           Il |         34        0.06       65.15
                      Jugoslv |         34        0.06       65.21
                    Luxemburg |         34        0.06       65.27
                       Pa Usa |         34        0.06       65.33
                       Styria |         34        0.06       65.39
                           Ta |         34        0.06       65.45
                      Cosensa |         33        0.06       65.50
                       Danzig |         33        0.06       65.56
                      Poltawa |         33        0.06       65.62
                           Ri |         33        0.06       65.68
                      Jugo-Sl |         32        0.06       65.73
                         Neth |         32        0.06       65.79
                     St Croix |         32        0.06       65.84
                       Suwalk |         32        0.06       65.90
                          W I |         32        0.06       65.95
                         W Va |         32        0.06       66.01
                        Czech |         31        0.05       66.06
                       J Slav |         31        0.05       66.12
                     Lithauen |         31        0.05       66.17
                         Rome |         31        0.05       66.23
                 Yugo Slavish |         31        0.05       66.28
                       Brasil |         30        0.05       66.33
                      Bulgary |         30        0.05       66.38
                     Mass Usa |         30        0.05       66.44
                       Rovigo |         30        0.05       66.49
                        Rssia |         30        0.05       66.54
                        Texas |         30        0.05       66.59











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
