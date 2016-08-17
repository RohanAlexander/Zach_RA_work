set more off

//Separate origin based on the first comma
split origin, generate(origin) parse(,) limit(2)
rename origin1 origin_city
rename origin2 origin_country

//Deal with some horrible formatting inserted by the website
replace origin_city = subinstr(origin_city, char(160), "", .)
//replace origin_city = subinstr(origin_city, "Â", "", .)
replace origin_city = subinstr(origin_city, ".", "", .)
replace origin_city = subinstr(origin_city, "'", " ", .)
replace origin_city = subinstr(origin_city, ";", " ", .)
replace origin_country = subinstr(origin_country, ".", "", .)
replace origin_country = subinstr(origin_country, ":", "", .)
replace origin_country = trim(origin_country)
replace origin_city = trim(origin_city)
replace origin_country = strproper(origin_country)
replace origin_city = strproper(origin_city)

//Clean some typos in the cities names
replace origin_city = "Ascoli Piceno" if (origin_city == "Ascoli P") | (origin_city == "Ascoli Pi")
replace origin_city = "Bagni Di Lucca" if (origin_city == "Bagni Lucca")
replace origin_city = "Barcelona" if (origin_city == "Barcellona")
replace origin_city = "Belgium" if (origin_city == "Belgian")
replace origin_city = "Belgrade" if (origin_city == "Belgrad")
replace origin_city = "Bethlehem" if (origin_city == "Bethlem")
replace origin_city = "Binghamton" if (origin_city == "Binghampton")
replace origin_city = "Brest Lit" if (origin_city == "Brest Litowsk")
replace origin_city = "Brooklyn" if (origin_city == "B Klyn") | (origin_city == "Bklyn") ///
	| (origin_city == "Broklyn") | (origin_city == "B Lkyn") | (origin_city == "B?Klyn")
replace origin_city = "Buenos Aires" if (origin_city == "B Aires") | (origin_city == "Buenos Aries") ///
	| (origin_city == "B Aires") | (origin_city == "B Aries") | (origin_city == "B Ayres") ///
	| (origin_city == "BAires") | (origin_city == "Beunos Aires") | (origin_city == "Bs Aires") ///
	| (origin_city == "Bs Aires") | (origin_city == "Buenos Ayres") | (origin_city == "Buenes Aires") ///
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
replace origin_city = "New York City" if (origin_city == "NYC") | (origin_city == "N Y") ///
	| (origin_city == "NY") | (origin_city == "Ny") | (origin_city == "New York") ///
	| (origin_city == "N Y City") | (origin_city == "N York") | (origin_city == "New-York") ///
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
replace origin_city = "USA" if (origin_city == "U S A") | (origin_city == "U S Born") | (origin_city == "US") ///
	| (origin_city == "America")

//Clean some typos and inconsistencies in the countries names
replace origin_country = "Argentina" if (origin_country == "Argentine") | (origin_country == "Angentina") ///
	| (origin_country == "Arg") | (origin_country == "ArgRep") | (origin_country == "ArgRepSoAm") ///
	| (origin_country == "ArgRepSoAmer") | (origin_country == "ArgRepublic") | (origin_country == "Argenetine") ///
	| (origin_country == "Argent") | (origin_country == "ArgentinaSoAm") | (origin_country == "ArgentineRep") ///
	| (origin_country == "Argentinia") | (origin_country == "Argentyna") | (origin_country == "Argt") ///
	| (origin_country == "Aurgentina") | (origin_country == "RepArg") | (origin_country == "RepArgSoAm")
replace origin_country = "Austria" if (origin_country=="Asutria") | (origin_country=="Austrial")
replace origin_country = "Australia" if (origin_country == "Aus") | (origin_country == "Aust") 
replace origin_country = "Belgium" if (origin_country=="Belg") | (origin_country=="Belguim")
replace origin_country = "Bermuda" if (origin_country=="Bda")
replace origin_country = "Colombia" if (origin_country=="Columbia")
replace origin_country = "Denmark" if (origin_country=="Denm") | (origin_country=="Den") ///
	| (origin_country=="Denmark USA") | (origin_country=="Hellerup")
replace origin_country = "England" if (origin_country=="Eng") | (origin_country == "Engl?Nd") ///
	| (origin_country == "English") | (origin_country == "Englanmd") | (origin_country == "Elgland") ///
	| (origin_country == "Gr Brit")
replace origin_country = "Germany" if (origin_country=="Germ") | (origin_country=="German") ///
	| (origin_country=="Germany A/M")
replace origin_country = "Guatemala" if (origin_country=="Guatamala") | (origin_country=="Guat") ///
	| (origin_country=="Guatamla") | (origin_country=="Central America") // Note Central America was checked to make sure there weren't other countries in there
replace origin_country = "Italy" if (origin_country == "Italy Italy") | (origin_country == "South Sicily") ///
	| (origin_country == "Sicily") | (origin_country == "It")
replace origin_country = "Ireland" if (origin_country == "Iireland")
replace origin_country = "Jamaica" if (origin_country == "Ja") | (origin_country == "Jamacia")
replace origin_country = "Lithuania" if (origin_country == "Lithuan") 
replace origin_country = "Norway" if (origin_country == "Nor")
replace origin_country = "Palestine" if (origin_country == "Palestina") | (origin_country == "Palistine")
replace origin_country = "Panama" if (origin_country == "Republic Of Panama") | (origin_country == "R Of P")
replace origin_country = "Romania" if (origin_country == "Roumania.") | (origin_country == "Roumany") ///
	| (origin_country == "Roumania")
replace origin_country = "Serbia" if (origin_country == "Servia")
replace origin_country = "South Africa" if (origin_country=="So Africa") | (origin_country=="S Africa") ///
	| (origin_country == "S Afr") | (origin_country=="S Af") | (origin_country=="S'Africa") ///
	| (origin_country == "So Afrika")
replace origin_country = "Turkey" if (origin_country == "Turkey A")
replace origin_country = "Switzerland" if (origin_country == "Switzserland") | (origin_country == "Switz") ///
	| (origin_country == "Switzerl")
replace origin_country = "United States" if (origin_country == "USA (Casamicclole Ischia") ///
	| (origin_country == "USA Or Castellanimare Golfo") | (origin_country == "USA Or Santiago de Cuba") ///
	| (origin_country == "U S A") | (origin_country == "US") | (origin_country == "U S") ///
	| (origin_country == "USA Mass") | (origin_country == "United States") | (origin_country == "United States Of America") ///
	| (origin_country == "America") | (origin_country == "U.S.A. (Lenola") | (origin_country == "U S Of A") ///
	| (origin_country == "NY USA  Jettenback") | (origin_country == "NY USA  Jettenback") | (origin_country == "Usa") ///
	| (origin_country == "Us") | (origin_country == "USA")
replace origin_country = "Wales" if (origin_country=="Swales")

//Fix the cases where the country and the city have been swapped - swap the country and city columns
// drop origin_country_tmp
// drop origin_city_tmp
gen origin_country_tmp = origin_country
gen origin_city_tmp = origin_city

local countries_to_swap `" "United States" "Trinidad" "Sweden" "Cuba" "Switzerland" "Finland" "France" "'
local countries_to_swap `"`countries_to_swap' "Norway" "Greece" "Turkey" "Holland" "Scotland" "Barbados" "'
local countries_to_swap `"`countries_to_swap' "Germany" "Ireland" "Guatemala" "Russia" "Austria" "England" "'
local countries_to_swap `"`countries_to_swap' "Sicily" "Hungary" "Wales" "Belgium" "'

display `"`countries_to_swap'"'

foreach country of local countries_to_swap {
	replace origin_country_tmp = origin_city if (origin_city == "`country'") 
	replace origin_city_tmp = origin_country if (origin_city == "`country'") 
}

replace origin_country = origin_country_tmp
replace origin_city = origin_city_tmp
drop origin_country_tmp
drop origin_city_tmp

// Fix remaining messy countries; 
tab origin_country, sort
// The cities of all these countries need to be checked before going through with the change; tab origin_city if (origin_country == "COUNTRY"), sort
// Galicia is a legit historical area even though not a country anymore, but should not be separate to Galicy
replace origin_country = "Galicia" if (origin_country == "Galicy") 
// Reassemble the Czech Republic
replace origin_country = "Czech Republic" if (origin_country == "Bohemia") | (origin_country == "Moravia") ///
	| (origin_country == "Cz Slov") | (origin_country == "Czechoslovakia") ///
	| (origin_country == "Slovakia") | (origin_country == "Cz Slovak") 
// Change country of origin from Nfld to Canada
replace origin_country = "Canada" if (origin_country == "Nfld") 
// Change country of origin from various US states to United States
replace origin_country = "United States" if (origin_country == "Ny") | (origin_country == "Pa") ///
	| (origin_country == "Ill") | (origin_country == "Mass") | (origin_country == "Nj")
// Change country of origin from an Italian state to Italy
replace origin_country = "Italy" if (origin_country == "Palermo") | (origin_country == "Caserta") ///
	| (origin_country == "Salerno") | (origin_country == "Cosenza") | (origin_country == "Sicily") ///
	| (origin_country == "Messina") | (origin_country == "Avellino") | (origin_country == "Bari") ///
	| (origin_country == "Girgenti") | (origin_country == "Trapani") | (origin_country == "Napoli") ///
	| (origin_country == "Catanzaro") | (origin_country == "Potenza") | (origin_country == "Roma") ///
	| (origin_country == "Catania") | (origin_country == "Aquila") | (origin_country == "Siracusa") ///
	| (origin_country == "Benevento") | (origin_country == "Campobasso") | (origin_country == "Chieti") ///
	| (origin_country == "Foggia") | (origin_country == "Lucca") | (origin_country == "Chieti") ///
// Reassemble Yugoslavia (SR Bosnia and Herzegovina, SR Croatia, SR Macedonia, SR Montenegro, SR Slovenia, and SR Serbia)
replace origin_country = "Yugoslavia" if (origin_country == "Jugoslavia") | (origin_country == "Yougoslavia")
// Change Minsk to Belarus
replace origin_country = "Belarus" if (origin_country == "Minsk")
// Fix the name of Trinidad
replace origin_country = "Trinidad and Tobago" if (origin_country == "Trinidad")
// Fix the name of Romania
replace origin_country = "Romania" if (origin_country == "Roum")
// Fix the name of Hungary
replace origin_country = "Hungary" if (origin_country == "Hung")
// Fix the name of Lithuania
replace origin_country = "Lithuania" if (origin_country == "Kowno")



tab origin_city if (origin_country == ""), sort


////////UP TO HERE - CLEAN THESE ONES NEXT
                       Russ |        231        0.07       88.51
                        Chile |        230        0.07       88.58
                Caltanissetta |        227        0.07       88.65
                          N Y |        226        0.07       88.72
                       Panama |        220        0.07       88.79
                        Udine |        218        0.07       88.86
                   Montenegro |        206        0.07       88.93
                       Czslov |        200        0.06       88.99
                     Turkey E |        200        0.06       89.05
                       Teramo |        187        0.06       89.11
                         Ohio |        179        0.06       89.17
                       Pesaro |        178        0.06       89.23
                          Shs |        178        0.06       89.28
                     New York |        176        0.06       89.34
                 South Africa |        175        0.06       89.40
                         Conn |        169        0.05       89.45
                      Rumania |        165        0.05       89.50
                       Jugosl |        160        0.05       89.55
                     Reggio C |        160        0.05       89.60
                        Egypt |        159        0.05       89.65
                      Silesia |        159        0.05       89.70
                       Torino |        158        0.05       89.75
                   Costa Rica |        156        0.05       89.80
                        Cz Sl |        154        0.05       89.85
                       Genova |        153        0.05       89.90
                        Wolyn |        152        0.05       89.95
                     Bulgaria |        151        0.05       90.00
                      Treviso |        147        0.05       90.04
                    Palestine |        146        0.05       90.09
                     Jugoslav |        145        0.05       90.14
                     Czechosl |        143        0.05       90.18
                        Wilna |        143        0.05       90.23
                    Macedonia |        141        0.04       90.27
                   Netherland |        140        0.04       90.32
                       Reggio |        139        0.04       90.36
                        S H S |        139        0.04       90.40
                        Haiti |        135        0.04       90.45
                  Alessandria |        131        0.04       90.49
              Czecho Slovakia |        127        0.04       90.53
                         Mich |        127        0.04       90.57
                      Armenia |        125        0.04       90.61
                         Kiew |        124        0.04       90.65
                      Vicenza |        121        0.04       90.69
                      Galizia |        120        0.04       90.72
                       Africa |        119        0.04       90.76
                       Persia |        118        0.04       90.80
                         Holl |        114        0.04       90.83
                        Cz-Sl |        113        0.04       90.87
                         Lith |        113        0.04       90.91
                        Malta |        113        0.04       90.94
                       Samara |        113        0.04       90.98
                       Ancona |        112        0.04       91.01
                       Aguila |        111        0.04       91.05
                       Grodno |        109        0.03       91.08
                       Novara |        107        0.03       91.12
                       Naples |        103        0.03       91.15
                       Rouman |        103        0.03       91.18
                     Slovenia |        103        0.03       91.22
                      Albania |        100        0.03       91.25






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
