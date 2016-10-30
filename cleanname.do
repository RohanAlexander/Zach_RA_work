//////////////////////// Initial set up and load data ////////////////////////
clear all

//set more off, permanently
set more off

//use "/hdir/0/monicah/Desktop/EIbrothers18921924.dta"
//cd "/hdir/0/monicah/Desktop/All"


use "/Users/rohanalexander/Desktop/zachdata/fnametoclean.dta"
cd "/Users/rohanalexander/Desktop"


/*
cd "C:\Users\Zach\Google Drive\EI18921924\Stata_files\brothers"

use "EIbrothers18921924.dta"
*/



/*This file cleans and created two new variables. First is the 
standardized name, which removes nicknames and dimunitives. Second is the
Anglicized name, which should convert the original name to the nearest
Americanized name*/


/*Clean names that appear more than ten times*/

gen ameriname=fname



/*Top American names in 1930s https://www.ssa.gov/oact/babynames/decades/names1930s.html */

/*Joseph - 
URL: http://www.behindthename.com/name/joseph
"See all Relations": http://www.behindthename.com/name/joseph/related*/

/*Equivalents*/
local Joseph `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Joseph" "Joses" "Ioseph" "Ioses" "Yosef" "Ioseph" "Yosif" "Josep" "Josip" "Joöko" "Joso" "Jozo" "Josef" "Josef" "Josephus" "Jozef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Joseph" "Jo" "Joe" "Joey" "Jojo" "Jozefo" "Giuseppe" "Jocjo" "Joosep" "Jooseppi" "Juuso" "Joseph" "XosÈ" "Ioseb" "Soso" "Josef" "Joseph" "Jo" "Sepp" "Seppel" "Iosif" "Yosef" "Josephus" "JÛzsef" "JÛska" "JÛzsi" "Seosamh" "Iosephus" "Jazeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josef" "JosËp" "JÛzef" "JosÈ" "ZÈ" "ZezÈ" "Iosif"  "Iosif" "Osip" "SeÚsaidh" "Josif" "Jozef" "Josip" "Joûef" "Joûe" "JosÈ" "Pepe" "Pepito" "Josef" "Yusuf" "Yosyp" "Yusup" "Yussel" "Giuseppe" "'
foreach variant of local Joseph {
 replace ameriname="Joseph" if fname=="`variant'"
}

/*Dimunitives and Short Forms*/
local Joseph `" "Joses" "Joöko" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Jocjo" "Juuso" "Soso" "Jo" "Sepp" "Seppel" "JÛska" "JÛzsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "ZÈ" "ZezÈ" "Joûe" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Joseph {
 replace ameriname="Joseph" if fname=="`diminutive'"
}

/*Anthony - http://www.behindthename.com/name/antonio*/

local Anthony `" "Antoine" "Antonius" "Andoni" "Andon" "Antoni" "Anton" "Anton" "Anton" "Anthony" "Antono" "Anton" "Anton" "Antoine" "AntÛn" "Anton" "Antonios" "Anakoni" "Antal" "Anton" "Antonio" "Antoon" "Antanas" "Andon" "Anton" "Antoni" "AntÙnio" "AntÛnio" "Anton" "Anton" "Antonije" "Anton" "Antonio" "Anton" "Anton" "Antwan" "Antton" "Anton" "Antonijo" "Antonie" "Antony" "Anttoni" "Antonis" "Anton" "Antonio" "Antonius" "Antun" "Antoon" "'
foreach variant of local Anthony {
 replace ameriname="Anthony" if fname=="`variant'"
}


local Anthony `" "Doncho" "Antonino" "Ante" "Teun" "Tony" "Ancjo" "Tınis" "Toni" "Akoni" "TÛni" "Antonello" "Doncho" "Toninho" "Anto" "Tone" "ToÒo" "Anto" "Teunis" "Tonino" "Tonci" "Theun" "Tonio" "Tonci" "Theunis" "Toni" "Ton" "Toon" "'
foreach diminutive of local Anthony {
 replace ameriname="Anthony" if fname=="`diminutive'"
}


/* Next to clean 

Francesco	7861
Giovanni	7125
John	6151
Salvatore	5884
Vincenzo	5429
Luigi	4550
Guiseppe	4326
Domenico	4122
Jan	3887
Michele	3754
Pietro	3509
William	3326
James	3265
Angelo	3179


*/

set more off
/*Abe "No equivalents"*/

/*Abe "No diminutives"*/

local Abraham `" "Ebrahim" "Ibraheem" "Ibrahim" "Abraam" "Avraham" "Abraham" "Ibragim" "Aabraham" "Abram" "Ábrahám" "Abramo" "Avraamu" "Abraão" "İbrahim" "Ibrahima" "'
foreach variant of local Abraham {
	replace ameriname = "Abraham" if fname == "`variant'"
}

local Abraham `" "Ibro" "Braam" "Bram" "Abe" "Aapo" "Avi" "'
foreach diminutive of local Abraham {
	replace ameriname = "Abraham" if fname == "`diminutive'"
}

/*Abrahm "No equivalents"*/

/*Abrahm "No diminutives"*/

/*Abram "No equivalents"*/

/*Abram "No diminutives"*/

local Achille `" "Achille" "Achilles" "Achilleus" "'
foreach variant of local Achille {
	replace ameriname = "Achille" if fname == "`variant'"
}

/*Achille "No diminutives"*/

local Adam `" "Adam" "Aatami" "Akamu" "Ádám" "Ádhamh" "Adamo" "Adomas" "Adamu" "Adão" "Adán" "Adem" "'
foreach variant of local Adam {
	replace ameriname = "Adam" if fname == "`variant'"
}

local Adam `" "Addy" "'
foreach diminutive of local Adam {
	replace ameriname = "Adam" if fname == "`diminutive'"
}

local Adolf `" "Adalwolf" "Adolf" "Adolphus" "Adolph" "Aadolf" "Adolphe" "Adolfo" "'
foreach variant of local Adolf {
	replace ameriname = "Adolf" if fname == "`variant'"
}

local Adolf `" "Alf" "Dolph" "Aatto" "Aatu" "Atte" "Adde" "Ade" "Aike" "Ale" "Alke" "Alle" "Atse" "Dölf" "Dulf" "Adolfito" "Fito" "'
foreach diminutive of local Adolf {
	replace ameriname = "Adolf" if fname == "`diminutive'"
}

local Adolfo `" "Adalwolf" "Adolf" "Adolphus" "Adolph" "Aadolf" "Adolphe" "Adolfo" "'
foreach variant of local Adolfo {
	replace ameriname = "Adolfo" if fname == "`variant'"
}

local Adolfo `" "Alf" "Dolph" "Aatto" "Aatu" "Atte" "Adde" "Ade" "Aike" "Ale" "Alke" "Alle" "Atse" "Dölf" "Dulf" "Adolfito" "Fito" "'
foreach diminutive of local Adolfo {
	replace ameriname = "Adolfo" if fname == "`diminutive'"
}

local Adriaan `" "Hadrianus" "Adrià" "Adrijan" "Jadran" "Adrian" "Adriaan" "Adrianus" "Arjan" "Adrien" "Hadrien" "Hadrian" "Adorján" "Adrián" "Adriano" "'
foreach variant of local Adriaan {
	replace ameriname = "Adriaan" if fname == "`variant'"
}

local Adriaan `" "Jadranko" "Ad" "Arie" "Aris" "'
foreach diminutive of local Adriaan {
	replace ameriname = "Adriaan" if fname == "`diminutive'"
}

local Agostino `" "Augustinus" "Agustí" "Augustin" "Augustín" "Augustijn" "Augustine" "Austen" "Austin" "Austyn" "Ágoston" "Agostino" "Augustinas" "Augustyn" "Agostinho" "Avguštin" "Agustín" "Awstin" "'
foreach variant of local Agostino {
	replace ameriname = "Agostino" if fname == "`variant'"
}

local Agostino `" "Dino" "Tin" "Stijn" "Tijn" "Auke" "'
foreach diminutive of local Agostino {
	replace ameriname = "Agostino" if fname == "`diminutive'"
}

local Albert `" "Adalberht" "Adalbert" "Albert" "Albertus" "Æþelbeorht" "Æðelberht" "Adelbert" "Ethelbert" "Alpertti" "Aubert" "Alberte" "Albrecht" "Adalberto" "Alberto" "Albaer" "Albertas" "'
foreach variant of local Albert {
	replace ameriname = "Albert" if fname == "`variant'"
}

local Albert `" "Abe" "Bert" "Brecht" "Elbert" "Al" "Bertie" "Delbert" "Altti" "Pertti" "Abbe" "Baer" "Bèr" "'
foreach diminutive of local Albert {
	replace ameriname = "Albert" if fname == "`diminutive'"
}

local Alberto `" "Adalberht" "Adalbert" "Albert" "Albertus" "Æþelbeorht" "Æðelberht" "Adelbert" "Ethelbert" "Alpertti" "Aubert" "Alberte" "Albrecht" "Adalberto" "Alberto" "Albaer" "Albertas" "'
foreach variant of local Alberto {
	replace ameriname = "Alberto" if fname == "`variant'"
}

local Alberto `" "Abe" "Bert" "Brecht" "Elbert" "Al" "Bertie" "Delbert" "Altti" "Pertti" "Abbe" "Baer" "Bèr" "'
foreach diminutive of local Alberto {
	replace ameriname = "Alberto" if fname == "`diminutive'"
}

local Albin `" "Albinus" "Albin" "Aubin" "Albino" "'
foreach variant of local Albin {
	replace ameriname = "Albin" if fname == "`variant'"
}

/*Albin "No diminutives"*/

local Aldo `" "Aldo" "'
foreach variant of local Aldo {
	replace ameriname = "Aldo" if fname == "`variant'"
}

/*Aldo "No diminutives"*/

local Alessandro `" "Aleksander" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Alexandre" "Alexandr" "Aleksandro" "Aleksanteri" "Aleksandre" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aleksandru" "Sikandar" "Eskandar" "Alexandru" "Alasdair" "Alastair" "Alistair" "Alister" "Alejandro" "İskender" "Oleksander" "Oleksandr" "'
foreach variant of local Alessandro {
	replace ameriname = "Alessandro" if fname == "`variant'"
}

local Alessandro `" "Skender" "Sasho" "Àlex" "Sandi" "Saša" "Aleš" "Alex" "Sander" "Lex" "Xander" "Al" "Alec" "Sandy" "Zander" "Aleĉjo" "Ale" "Samppa" "Santeri" "Santtu" "Sacha" "Sandro" "Sascha" "Sándor" "Sanyi" "Aca" "Ace" "Aco" "Aleks" "Olek" "Xande" "Xandinho" "Sandu" "Sanya" "Sasha" "Shura" "Ally" "Sawney" "Sašo" "Sender" "'
foreach diminutive of local Alessandro {
	replace ameriname = "Alessandro" if fname == "`diminutive'"
}

local Alex `" "Aleksander" "Skender" "Alexander" "Alexandra" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Aleksandra" "Aleksandrina" "Sasho" "Àlex" "Alexandre" "Sanda" "Sandi" "Sandra" "Saša" "Aleš" "Alexandr" "Alex" "Sander" "Lex" "Xander" "Xandra" "Al" "Alec" "Alexa" "Alexina" "Ali" "Allie" "Ally" "Alyx" "Lexa" "Lexi" "Lexie" "Lexine" "Lexy" "Sandie" "Sandy" "Sondra" "Zander" "Zandra" "Aleĉjo" "Aleksandro" "Ale" "Aleksanteri" "Samppa" "Santeri" "Santtu" "Sacha" "Aleksandre" "Sandro" "Sascha" "Sándor" "Szandra" "Alastar" "Alastríona" "Aleksandrs" "Aleksandras" "Aca" "Ace" "Aco" "Sashka" "Aleksandru" "Sikandar" "Eskandar" "Aleks" "Ola" "Olek" "Xande" "Xandinho" "Sandu" "Sanya" "Sasha" "Shura" "Alasdair" "Alastair" "Alistair" "Alister" "Saundra" "Sawney" "Sašo" "Alejandra" "Alejandro" "İskender" "Lesya" "Oleksander" "Oleksandr" "Oleksandra" "Sender" "'
foreach variant of local Alex {
	replace ameriname = "Alex" if fname == "`variant'"
}

local Alex `" "Lexa" "Sandie" "Sandy" "Sanyi" "MASCULINE FORMS" "Aleksander" "Skender" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Sasho" "Àlex" "Alexandre" "Sandi" "Saša" "Aleš" "Alexandr" "Sander" "Lex" "Xander" "Al" "Alec" "Zander" "Aleĉjo" "Aleksandro" "Ale" "Aleksanteri" "Samppa" "Santeri" "Santtu" "Sacha" "Aleksandre" "Sandro" "Sascha" "Sándor" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aca" "Ace" "Aco" "Aleksandru" "Sikandar" "Eskandar" "Aleks" "Olek" "Xande" "Xandinho" "Alexandru" "Sandu" "Sanya" "Sasha" "Shura" "Alasdair" "Alastair" "Alistair" "Alister" "Ally" "Sawney" "Sašo" "Alejandro" "İskender" "Oleksander" "Oleksandr" "Sender" "'
foreach diminutive of local Alex {
	replace ameriname = "Alex" if fname == "`diminutive'"
}

local Alexander `" "Aleksander" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Alexandre" "Alexandr" "Aleksandro" "Aleksanteri" "Aleksandre" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aleksandru" "Sikandar" "Eskandar" "Alexandru" "Alasdair" "Alastair" "Alistair" "Alister" "Alejandro" "İskender" "Oleksander" "Oleksandr" "'
foreach variant of local Alexander {
	replace ameriname = "Alexander" if fname == "`variant'"
}

local Alexander `" "Skender" "Sasho" "Àlex" "Sandi" "Saša" "Aleš" "Alex" "Sander" "Lex" "Xander" "Al" "Alec" "Sandy" "Zander" "Aleĉjo" "Ale" "Samppa" "Santeri" "Santtu" "Sacha" "Sandro" "Sascha" "Sándor" "Sanyi" "Aca" "Ace" "Aco" "Aleks" "Olek" "Xande" "Xandinho" "Sandu" "Sanya" "Sasha" "Shura" "Ally" "Sawney" "Sašo" "Sender" "'
foreach diminutive of local Alexander {
	replace ameriname = "Alexander" if fname == "`diminutive'"
}

/*Alf "No equivalents"*/

/*Alf "No diminutives"*/

/*Alfio "No equivalents"*/

/*Alfio "No diminutives"*/

local Alfons `" "Adalfuns" "Alfons" "Hadufuns" "Hildefons" "Alphonso" "Alphonzo" "Alphonse" "Afonso" "Alphonsus" "Alfonso" "Alonzo" "Alfonz" "Alonso" "Ildefonso" "'
foreach variant of local Alfons {
	replace ameriname = "Alfons" if fname == "`variant'"
}

local Alfons `" "Fons" "Funs" "Funske" "Lon" "Lonnie" "Lonny" "'
foreach diminutive of local Alfons {
	replace ameriname = "Alfons" if fname == "`diminutive'"
}

local Alfonso `" "Adalfuns" "Alfons" "Hadufuns" "Hildefons" "Alphonso" "Alphonzo" "Alphonse" "Afonso" "Alphonsus" "Alfonso" "Alonzo" "Alfonz" "Alonso" "Ildefonso" "'
foreach variant of local Alfonso {
	replace ameriname = "Alfonso" if fname == "`variant'"
}

local Alfonso `" "Fons" "Funs" "Funske" "Lon" "Lonnie" "Lonny" "'
foreach diminutive of local Alfonso {
	replace ameriname = "Alfonso" if fname == "`diminutive'"
}

local Alfred `" "Ælfræd" "Alfred" "Alfréd" "Alfredo" "Alfredas" "'
foreach variant of local Alfred {
	replace ameriname = "Alfred" if fname == "`variant'"
}

local Alfred `" "Alf" "Alfie" "Fred" "Fredo" "'
foreach diminutive of local Alfred {
	replace ameriname = "Alfred" if fname == "`diminutive'"
}

local Alfredo `" "Ælfræd" "Alfred" "Alfréd" "Alfredo" "Alfredas" "'
foreach variant of local Alfredo {
	replace ameriname = "Alfredo" if fname == "`variant'"
}

local Alfredo `" "Alf" "Alfie" "Fred" "Fredo" "'
foreach diminutive of local Alfredo {
	replace ameriname = "Alfredo" if fname == "`diminutive'"
}

local Allan `" "Alan" "Alen" "Allan" "Allen" "Allyn" "Alain" "Ailín" "Alun" "'
foreach variant of local Allan {
	replace ameriname = "Allan" if fname == "`variant'"
}

local Allan `" "Al" "'
foreach diminutive of local Allan {
	replace ameriname = "Allan" if fname == "`diminutive'"
}

local Alois `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Alois {
	replace ameriname = "Alois" if fname == "`variant'"
}

local Alois `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Alois {
	replace ameriname = "Alois" if fname == "`diminutive'"
}

local Alter `" "Alter" "'
foreach variant of local Alter {
	replace ameriname = "Alter" if fname == "`variant'"
}

/*Alter "No diminutives"*/

local Amedeo `" "Amédée" "Amadeo" "Amedeo" "Amadeus" "Amadej" "'
foreach variant of local Amedeo {
	replace ameriname = "Amedeo" if fname == "`variant'"
}

/*Amedeo "No diminutives"*/

/*Americo "No equivalents"*/

/*Americo "No diminutives"*/

local Anders `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Anders {
	replace ameriname = "Anders" if fname == "`variant'"
}

local Anders `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Anders {
	replace ameriname = "Anders" if fname == "`diminutive'"
}

local Andras `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andras {
	replace ameriname = "Andras" if fname == "`variant'"
}

local Andras `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andras {
	replace ameriname = "Andras" if fname == "`diminutive'"
}

local Andre `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andre {
	replace ameriname = "Andre" if fname == "`variant'"
}

local Andre `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andre {
	replace ameriname = "Andre" if fname == "`diminutive'"
}

/*Andrea "No equivalents"*/

/*Andrea "No diminutives"*/

local Andreas `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andreas {
	replace ameriname = "Andreas" if fname == "`variant'"
}

local Andreas `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andreas {
	replace ameriname = "Andreas" if fname == "`diminutive'"
}

local Andrej `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andrej {
	replace ameriname = "Andrej" if fname == "`variant'"
}

local Andrej `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andrej {
	replace ameriname = "Andrej" if fname == "`diminutive'"
}

local Andrew `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andrew {
	replace ameriname = "Andrew" if fname == "`variant'"
}

local Andrew `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andrew {
	replace ameriname = "Andrew" if fname == "`diminutive'"
}

local Angel `" "Deangelo" "Aingeru" "Angel" "Àngel" "Anđelko" "Anđelo" "Anděl" "Anxo" "Engel" "Angelos" "Angelo" "Angiolo" "Angelus" "Anghel" "Ángel" "Anshel" "'
foreach variant of local Angel {
	replace ameriname = "Angel" if fname == "`variant'"
}

local Angel `" "Angelino" "Angjelko" "'
foreach diminutive of local Angel {
	replace ameriname = "Angel" if fname == "`diminutive'"
}

local Angelo `" "Deangelo" "Aingeru" "Angel" "Àngel" "Anđelko" "Anđelo" "Anděl" "Anxo" "Engel" "Angelos" "Angelo" "Angiolo" "Angelus" "Anghel" "Ángel" "Anshel" "'
foreach variant of local Angelo {
	replace ameriname = "Angelo" if fname == "`variant'"
}

local Angelo `" "Angelino" "Angjelko" "'
foreach diminutive of local Angelo {
	replace ameriname = "Angelo" if fname == "`diminutive'"
}

/*Aniello "No equivalents"*/

/*Aniello "No diminutives"*/

local Antal `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antal {
	replace ameriname = "Antal" if fname == "`variant'"
}

local Antal `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antal {
	replace ameriname = "Antal" if fname == "`diminutive'"
}

local Anton `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Anton {
	replace ameriname = "Anton" if fname == "`variant'"
}

local Anton `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Anton {
	replace ameriname = "Anton" if fname == "`diminutive'"
}

local Antoni `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antoni {
	replace ameriname = "Antoni" if fname == "`variant'"
}

local Antoni `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antoni {
	replace ameriname = "Antoni" if fname == "`diminutive'"
}

local Antonia `" "Antonia" "Antonija" "Antonie" "Antía" "Antónia" "Antônia" "'
foreach variant of local Antonia {
	replace ameriname = "Antonia" if fname == "`variant'"
}

local Antonia `" "Latonya" "Donka" "Antica" "Antonela" "Nela" "Tonka" "Teuna" "Antonette" "Nia" "Toni" "Tonia" "Tonya" "Toini" "Antoinette" "Toinette" "Antonella" "Antonietta" "Nella" "Tonina" "MASCULINE FORMS" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Doncho" "Antoni" "Ante" "Anto" "Antonijo" "Antonio" "Antun" "Tonći" "Tonči" "Antonie" "Antoon" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Anthony" "Antony" "Tony" "Anĉjo" "Antono" "Tõnis" "Anttoni" "Antón" "Antonios" "Antonis" "Akoni" "Anakoni" "Antal" "Tóni" "Antonello" "Tonino" "Tonio" "Antanas" "Antonij" "Antônio" "António" "Toninho" "Antonije" "Tone" "Toño" "'
foreach diminutive of local Antonia {
	replace ameriname = "Antonia" if fname == "`diminutive'"
}

local Antonin `" "Antoninus" "Antonín" "Antonin" "Antonino" "'
foreach variant of local Antonin {
	replace ameriname = "Antonin" if fname == "`variant'"
}

local Antonin `" "Nino" "'
foreach diminutive of local Antonin {
	replace ameriname = "Antonin" if fname == "`diminutive'"
}

local Antonino `" "Antoninus" "Antonín" "Antonin" "Antonino" "'
foreach variant of local Antonino {
	replace ameriname = "Antonino" if fname == "`variant'"
}

local Antonino `" "Nino" "'
foreach diminutive of local Antonino {
	replace ameriname = "Antonino" if fname == "`diminutive'"
}

local Antonio `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antonio {
	replace ameriname = "Antonio" if fname == "`variant'"
}

local Antonio `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antonio {
	replace ameriname = "Antonio" if fname == "`diminutive'"
}

local Antonios `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antonios {
	replace ameriname = "Antonios" if fname == "`variant'"
}

local Antonios `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antonios {
	replace ameriname = "Antonios" if fname == "`diminutive'"
}

/*Arcangelo "No equivalents"*/

/*Arcangelo "No diminutives"*/

local Archibald `" "Archembald" "Ercanbald" "Archibald" "'
foreach variant of local Archibald {
	replace ameriname = "Archibald" if fname == "`variant'"
}

local Archibald `" "Archie" "'
foreach diminutive of local Archibald {
	replace ameriname = "Archibald" if fname == "`diminutive'"
}

local Arie `" "Hadrianus" "Adrià" "Adrijan" "Jadran" "Jadranko" "Adrian" "Ad" "Arie" "Aris" "Adrien" "Hadrien" "Hadrian" "Adorján" "Adrián" "Adriano" "'
foreach variant of local Arie {
	replace ameriname = "Arie" if fname == "`variant'"
}

/*Arie "No diminutives"*/

local Armando `" "Hariman" "Herman" "Hermanus" "Hermanni" "Armand" "Hermann" "Ármann" "Armando" "Ermanno" "German" "'
foreach variant of local Armando {
	replace ameriname = "Armando" if fname == "`variant'"
}

local Armando `" "Harm" "Mannes" "Maan" "'
foreach diminutive of local Armando {
	replace ameriname = "Armando" if fname == "`diminutive'"
}

/*Arne "No equivalents"*/

/*Arne "No diminutives"*/

local Arnold `" "Arnold" "Arnau" "Arend" "Arnoud" "Arnout" "Arnaud" "Arnaldo" "Arnt" "'
foreach variant of local Arnold {
	replace ameriname = "Arnold" if fname == "`variant'"
}

local Arnold `" "Aart" "Arno" "Arn" "Arnie" "Ane" "Anne" "Arke" "Arndt" "Arne" "Nöl" "Nölke" "'
foreach diminutive of local Arnold {
	replace ameriname = "Arnold" if fname == "`diminutive'"
}

local Aron `" "Haroun" "Harun" "Aaron" "Aharon" "Aron" "Aaren" "Arron" "Áron" "Aarón" "'
foreach variant of local Aron {
	replace ameriname = "Aron" if fname == "`variant'"
}

/*Aron "No diminutives"*/

local Arthur `" "Arthur" "Artur" "Artturi" "Artúr" "Arturo" "Artūrs" "Artūras" "Artair" "'
foreach variant of local Arthur {
	replace ameriname = "Arthur" if fname == "`variant'"
}

local Arthur `" "Tuur" "Art" "Arto" "Arttu" "'
foreach diminutive of local Arthur {
	replace ameriname = "Arthur" if fname == "`diminutive'"
}

local Arturo `" "Arthur" "Artur" "Artturi" "Artúr" "Arturo" "Artūrs" "Artūras" "Artair" "'
foreach variant of local Arturo {
	replace ameriname = "Arturo" if fname == "`variant'"
}

local Arturo `" "Tuur" "Art" "Arto" "Arttu" "'
foreach diminutive of local Arturo {
	replace ameriname = "Arturo" if fname == "`diminutive'"
}

local Arvid `" "Arnviðr" "Arvid" "'
foreach variant of local Arvid {
	replace ameriname = "Arvid" if fname == "`variant'"
}

/*Arvid "No diminutives"*/

local Attilio `" "Atilius" "Attilio" "Atílio" "'
foreach variant of local Attilio {
	replace ameriname = "Attilio" if fname == "`variant'"
}

/*Attilio "No diminutives"*/

local August `" "Augustus" "August" "Aukusti" "Auguste" "Augusto" "Augusts" "Augustas" "Avgust" "'
foreach variant of local August {
	replace ameriname = "August" if fname == "`variant'"
}

local August `" "Guus" "Gus" "Aku" "Kusti" "'
foreach diminutive of local August {
	replace ameriname = "August" if fname == "`diminutive'"
}

/*Auguste "No equivalents"*/

/*Auguste "No diminutives"*/

local Augusto `" "Augustus" "August" "Aukusti" "Auguste" "Augusto" "Augusts" "Augustas" "Avgust" "'
foreach variant of local Augusto {
	replace ameriname = "Augusto" if fname == "`variant'"
}

local Augusto `" "Guus" "Gus" "Aku" "Kusti" "'
foreach diminutive of local Augusto {
	replace ameriname = "Augusto" if fname == "`diminutive'"
}

local Aurelio `" "Aurelius" "Aurel" "Aurèle" "Aurél" "Aurelio" "Aurelijus" "Aureliusz" "Aurélio" "'
foreach variant of local Aurelio {
	replace ameriname = "Aurelio" if fname == "`variant'"
}

local Aurelio `" "Auke" "'
foreach diminutive of local Aurelio {
	replace ameriname = "Aurelio" if fname == "`diminutive'"
}

/*Awrum "No equivalents"*/

/*Awrum "No diminutives"*/

local Axel `" "Abessalom" "'Avshalom" "Absalom" "Aksel" "Axel" "Akseli" "Absolon" "'
foreach variant of local Axel {
	replace ameriname = "Axel" if fname == "`variant'"
}

local Axel `" "Acke" "'
foreach diminutive of local Axel {
	replace ameriname = "Axel" if fname == "`diminutive'"
}

local Bartolomeo `" "Bartholomaios" "Bartholomeus" "Bartholomew" "Bartomeu" "Bartolomej" "Bartoloměj" "Perttu" "Barthélémy" "Bartolomeu" "Bartholomäus" "Bertalan" "Bartolomeo" "Bartholomei" "Bartłomiej" "Varfolomei" "Varfolomey" "Vartolomej" "Jernej" "Bartolomé" "'
foreach variant of local Bartolomeo {
	replace ameriname = "Bartolomeo" if fname == "`variant'"
}

local Bartolomeo `" "Bartol" "Bart" "Bartel" "Mees" "Mies" "Tolly" "Bartal" "Bertók" "Bartek" "Bartosz" "Nejc" "'
foreach diminutive of local Bartolomeo {
	replace ameriname = "Bartolomeo" if fname == "`diminutive'"
}

local Battista `" "Baptiste" "Baptist" "Battista" "Baptista" "Bautista" "'
foreach variant of local Battista {
	replace ameriname = "Battista" if fname == "`variant'"
}

/*Battista "No diminutives"*/

/*Bela "No equivalents"*/

/*Bela "No diminutives"*/

local Benedetto `" "Benedikt" "Benedictus" "Benedict" "Bennett" "Pentti" "Benoit" "Bieito" "Benedek" "Benedetto" "Benito" "Bendiks" "Benediktas" "Benedykt" "Benedito" "Benesh" "'
foreach variant of local Benedetto {
	replace ameriname = "Benedetto" if fname == "`variant'"
}

local Benedetto `" "Bendt" "Bent" "Ben" "Bennie" "Benny" "Peni" "Bence" "Bettino" "Benas" "Bento" "Bengt" "'
foreach diminutive of local Benedetto {
	replace ameriname = "Benedetto" if fname == "`diminutive'"
}

local Benjamin `" "Binyamin" "Beniamin" "Benjamin" "Benjamín" "Benjámin" "Beniamino" "Benjaminas" "Venijamin" "Veniaminu" "Benjamim" "Veniamin" "Venyamin" "Bünyamin" "'
foreach variant of local Benjamin {
	replace ameriname = "Benjamin" if fname == "`variant'"
}

local Benjamin `" "Ben" "Benj" "Benji" "Benjy" "Bennie" "Benny" "Peni" "Benas" "'
foreach diminutive of local Benjamin {
	replace ameriname = "Benjamin" if fname == "`diminutive'"
}

/*Berel "No equivalents"*/

/*Berel "No diminutives"*/

/*Berl "No equivalents"*/

/*Berl "No diminutives"*/

local Bernard `" "Berinhard" "Bernard" "Bernhard" "Beñat" "Bernat" "Bernát" "Bernardo" "'
foreach variant of local Bernard {
	replace ameriname = "Bernard" if fname == "`variant'"
}

local Bernard `" "Dino" "Bernt" "Ben" "Barney" "Bernie" "Berny" "Bent" "Benno" "Bernd" "Bernardino" "'
foreach diminutive of local Bernard {
	replace ameriname = "Bernard" if fname == "`diminutive'"
}

local Bernardo `" "Berinhard" "Bernard" "Bernhard" "Beñat" "Bernat" "Bernát" "Bernardo" "'
foreach variant of local Bernardo {
	replace ameriname = "Bernardo" if fname == "`variant'"
}

local Bernardo `" "Dino" "Bernt" "Ben" "Barney" "Bernie" "Berny" "Bent" "Benno" "Bernd" "Bernardino" "'
foreach diminutive of local Bernardo {
	replace ameriname = "Bernardo" if fname == "`diminutive'"
}

local Bernhard `" "Berinhard" "Bernard" "Bernhard" "Beñat" "Bernat" "Bernát" "Bernardo" "'
foreach variant of local Bernhard {
	replace ameriname = "Bernhard" if fname == "`variant'"
}

local Bernhard `" "Dino" "Bernt" "Ben" "Barney" "Bernie" "Berny" "Bent" "Benno" "Bernd" "Bernardino" "'
foreach diminutive of local Bernhard {
	replace ameriname = "Bernhard" if fname == "`diminutive'"
}

local Biagio `" "Blasius" "Blaž" "Vlaho" "Blažej" "Blaze" "Blaise" "Brais" "Vlasis" "Vlassis" "Balázs" "Biaggio" "Biagio" "Błażej" "Brás" "Vlasi" "Vlasiy" "Blas" "'
foreach variant of local Biagio {
	replace ameriname = "Biagio" if fname == "`variant'"
}

local Biagio `" "Biagino" "'
foreach diminutive of local Biagio {
	replace ameriname = "Biagio" if fname == "`diminutive'"
}

/*Boleslaw "No equivalents"*/

/*Boleslaw "No diminutives"*/

/*Boruch "No equivalents"*/

/*Boruch "No diminutives"*/

/*Bronislaw "No equivalents"*/

/*Bronislaw "No diminutives"*/

local Bruno `" "Bruno" "Broen" "'
foreach variant of local Bruno {
	replace ameriname = "Bruno" if fname == "`variant'"
}

/*Bruno "No diminutives"*/

/*Calagero "No equivalents"*/

/*Calagero "No diminutives"*/

local Calogero `" "Calogero" "Calogerus" "'
foreach variant of local Calogero {
	replace ameriname = "Calogero" if fname == "`variant'"
}

/*Calogero "No diminutives"*/

local Camillo `" "Camillus" "Kamil" "Camille" "Camillo" "Camilo" "'
foreach variant of local Camillo {
	replace ameriname = "Camillo" if fname == "`variant'"
}

/*Camillo "No diminutives"*/

local Carl `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Carol" "Charles" "Kaarle" "Kaarlo" "Kale" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Siarl" "'
foreach variant of local Carl {
	replace ameriname = "Carl" if fname == "`variant'"
}

local Carl `" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Karcsi" "Carlinhos" "Carlito" "Carlitos" "'
foreach diminutive of local Carl {
	replace ameriname = "Carl" if fname == "`diminutive'"
}

local Carlo `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Carol" "Charles" "Kaarle" "Kaarlo" "Kale" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Siarl" "'
foreach variant of local Carlo {
	replace ameriname = "Carlo" if fname == "`variant'"
}

local Carlo `" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Karcsi" "Carlinhos" "Carlito" "Carlitos" "'
foreach diminutive of local Carlo {
	replace ameriname = "Carlo" if fname == "`diminutive'"
}

local Carlos `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Carol" "Charles" "Kaarle" "Kaarlo" "Kale" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Siarl" "'
foreach variant of local Carlos {
	replace ameriname = "Carlos" if fname == "`variant'"
}

local Carlos `" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Karcsi" "Carlinhos" "Carlito" "Carlitos" "'
foreach diminutive of local Carlos {
	replace ameriname = "Carlos" if fname == "`diminutive'"
}

local Carmelo `" "Carmelo" "Carmine" "Carmo" "'
foreach variant of local Carmelo {
	replace ameriname = "Carmelo" if fname == "`variant'"
}

/*Carmelo "No diminutives"*/

local Carmine `" "Carmelo" "Carmine" "Carmo" "'
foreach variant of local Carmine {
	replace ameriname = "Carmine" if fname == "`variant'"
}

/*Carmine "No diminutives"*/

/*Cataldo "No equivalents"*/

/*Cataldo "No diminutives"*/

local Cecil `" "Caecilius" "Cecil" "Cecilio" "'
foreach variant of local Cecil {
	replace ameriname = "Cecil" if fname == "`variant'"
}

/*Cecil "No diminutives"*/

local Cesare `" "Caesar" "César" "Cesare" "Cezary" "Cézar" "Cezar" "Kaiser" "'
foreach variant of local Cesare {
	replace ameriname = "Cesare" if fname == "`variant'"
}

local Cesare `" "Cesarino" "'
foreach diminutive of local Cesare {
	replace ameriname = "Cesare" if fname == "`diminutive'"
}

local Chaim `" "Chaim" "Chayim" "Chayyim" "Haim" "Hayim" "Hayyim" "Hyam" "'
foreach variant of local Chaim {
	replace ameriname = "Chaim" if fname == "`variant'"
}

/*Chaim "No diminutives"*/

/*Chane "No equivalents"*/

/*Chane "No diminutives"*/

local Charles `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Carol" "Charles" "Kaarle" "Kaarlo" "Kale" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Siarl" "'
foreach variant of local Charles {
	replace ameriname = "Charles" if fname == "`variant'"
}

local Charles `" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Karcsi" "Carlinhos" "Carlito" "Carlitos" "'
foreach diminutive of local Charles {
	replace ameriname = "Charles" if fname == "`diminutive'"
}

local Chas `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kaarle" "Kaarlo" "Kalle" "Charles" "Charlot" "Kale" "Karcsi" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Carlinhos" "Carlito" "Carlitos" "Carol" "Siarl" "'
foreach variant of local Chas {
	replace ameriname = "Chas" if fname == "`variant'"
}

/*Chas "No diminutives"*/

/*Chaskel "No equivalents"*/

/*Chaskel "No diminutives"*/

local Christian `" "Kristiyan" "Kristijan" "Christen" "Christian" "Kresten" "Kristen" "Kristian" "Christiaan" "Kristjan" "Carsten" "Krisztián" "Kristján" "Cristiano" "Christianus" "Kristiāns" "Kristijonas" "Karsten" "Hristijan" "Krystian" "Krystyn" "Cristian" "Cristián" "'
foreach variant of local Christian {
	replace ameriname = "Christian" if fname == "`variant'"
}

local Christian `" "Krsto" "Christer" "Kris" "Chris" "Cristi" "Krister" "'
foreach diminutive of local Christian {
	replace ameriname = "Christian" if fname == "`diminutive'"
}

local Christopher `" "Hristofor" "Kristofor" "Kryštof" "Christoffer" "Kristoffer" "Christoffel" "Christopher" "Kristopher" "Christophe" "Christoph" "Christoforos" "Kristóf" "Cristoforo" "Christophoros" "Christophorus" "Kristaps" "Kristupas" "Krzysztof" "Cristóvão" "Krištof" "Cristóbal" "'
foreach variant of local Christopher {
	replace ameriname = "Christopher" if fname == "`variant'"
}

local Christopher `" "Hristo" "Krsto" "Kris" "Chip" "Chris" "Kit" "Topher" "Risto" "Christie" "Christy" "Krzyś" "Krzysiek" "Kester" "'
foreach diminutive of local Christopher {
	replace ameriname = "Christopher" if fname == "`diminutive'"
}

local Christos `" "Christ" "Christos" "'
foreach variant of local Christos {
	replace ameriname = "Christos" if fname == "`variant'"
}

/*Christos "No diminutives"*/

local Ciro `" "Cyrus" "Kyros" "Kurush" "Koresh" "Ciro" "Kir" "'
foreach variant of local Ciro {
	replace ameriname = "Ciro" if fname == "`variant'"
}

local Ciro `" "Cy" "Cirino" "'
foreach diminutive of local Ciro {
	replace ameriname = "Ciro" if fname == "`diminutive'"
}

/*Clarence "No equivalents"*/

/*Clarence "No diminutives"*/

local Clemente `" "Kliment" "Climent" "Klement" "Klemens" "Clement" "Clément" "Clemens" "Kelemen" "Clemente" "Klemen" "'
foreach variant of local Clemente {
	replace ameriname = "Clemente" if fname == "`variant'"
}

local Clemente `" "Clem" "Klim" "'
foreach diminutive of local Clemente {
	replace ameriname = "Clemente" if fname == "`diminutive'"
}

local Clifford `" "Clifford" "'
foreach variant of local Clifford {
	replace ameriname = "Clifford" if fname == "`variant'"
}

local Clifford `" "Cliff" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Clifford {
	replace ameriname = "Clifford" if fname == "`diminutive'"
}

local Conrad `" "Conrad" "Konrád" "Konrad" "Koenraad" "Curt" "Kurt" "Corrado" "Cord" "Kord" "Kondrat" "Conrado" "'
foreach variant of local Conrad {
	replace ameriname = "Conrad" if fname == "`variant'"
}

local Conrad `" "Dino" "Koen" "Koert" "Connie" "Corradino" "'
foreach diminutive of local Conrad {
	replace ameriname = "Conrad" if fname == "`diminutive'"
}

local Constantin `" "Kostandin" "Konstantin" "Kostadin" "Constantijn" "Constantin" "Konstantine" "Konstantinos" "Constantine" "Costantino" "Constantinus" "Konstantyn" "Costache" "Kostyantyn" "Cystennin" "'
foreach variant of local Constantin {
	replace ameriname = "Constantin" if fname == "`variant'"
}

local Constantin `" "Kosta" "Stijn" "Gus" "Costel" "Costică" "Costin" "Dinu" "Kostya" "'
foreach diminutive of local Constantin {
	replace ameriname = "Constantin" if fname == "`diminutive'"
}

/*Constantinos "No equivalents"*/

/*Constantinos "No diminutives"*/

local Cornelis `" "Cornelius" "Kornel" "Cornelis" "Kerneels" "Corneille" "Korneli" "Kornél" "Cornelio" "Cornélio" "Cornel" "Corneliu" "'
foreach variant of local Cornelis {
	replace ameriname = "Cornelis" if fname == "`variant'"
}

local Cornelis `" "Cai" "Caj" "Kai" "Kaj" "Kay" "Cees" "Corné" "Kees" "Niels" "Connie" "'
foreach diminutive of local Cornelis {
	replace ameriname = "Cornelis" if fname == "`diminutive'"
}

local Cosimo `" "Cosmas" "Kosmas" "Kuzman" "Cosmo" "Côme" "Cosme" "Cosimo" "Cosma" "Cosmin" "Kuzma" "'
foreach variant of local Cosimo {
	replace ameriname = "Cosimo" if fname == "`variant'"
}

/*Cosimo "No diminutives"*/

local Costantino `" "Kostandin" "Konstantin" "Kostadin" "Constantijn" "Constantin" "Konstantine" "Konstantinos" "Constantine" "Costantino" "Constantinus" "Konstantyn" "Costache" "Kostyantyn" "Cystennin" "'
foreach variant of local Costantino {
	replace ameriname = "Costantino" if fname == "`variant'"
}

local Costantino `" "Kosta" "Stijn" "Gus" "Costel" "Costică" "Costin" "Dinu" "Kostya" "'
foreach diminutive of local Costantino {
	replace ameriname = "Costantino" if fname == "`diminutive'"
}

local Cyril `" "Cyrillus" "Kyriakos" "Kyrillos" "Kiril" "Cyril" "Cyrille" "Ciriaco" "Cirillo" "Cyriacus" "Kirils" "Kyrilu" "Cyryl" "Ciríaco" "Kirill" "Ciril" "Kyrylo" "'
foreach variant of local Cyril {
	replace ameriname = "Cyril" if fname == "`variant'"
}

local Cyril `" "Cy" "Kire" "Kiro" "'
foreach diminutive of local Cyril {
	replace ameriname = "Cyril" if fname == "`diminutive'"
}

/*Czeslaw "No equivalents"*/

/*Czeslaw "No diminutives"*/

local Daniel `" "Danyal" "Daniel" "Taniel" "Danel" "Daniyyel" "Danihel" "Deniel" "Danail" "Danijel" "Danilo" "Daniël" "Taneli" "Dániel" "Daníel" "Daniele" "Daniels" "Danielius" "Daniilu" "Daniil" "Deiniol" "'
foreach variant of local Daniel {
	replace ameriname = "Daniel" if fname == "`variant'"
}

local Daniel `" "Danko" "Dan" "Daan" "Dannie" "Danny" "Tatu" "Dani" "Dănuț" "'
foreach diminutive of local Daniel {
	replace ameriname = "Daniel" if fname == "`diminutive'"
}

local Dante `" "Dante" "Durans" "'
foreach variant of local Dante {
	replace ameriname = "Dante" if fname == "`variant'"
}

/*Dante "No diminutives"*/

local David `" "Daud" "Dawood" "Dawud" "Dauid" "Dawid" "David" "Daveth" "Taavetti" "Davit" "Daviti" "Dávid" "Davide" "Dovydas" "Davidu" "Davud" "Davi" "Dàibhidh" "Daividh" "Dafydd" "Dewey" "Dewi" "Dewydd" "Dovid" "'
foreach variant of local David {
	replace ameriname = "David" if fname == "`variant'"
}

local David `" "Dave" "Davey" "Davie" "Davy" "Taavi" "Daw" "Dai" "Taffy" "Dudel" "'
foreach diminutive of local David {
	replace ameriname = "David" if fname == "`diminutive'"
}

local Davide `" "Daud" "Dawood" "Dawud" "Dauid" "Dawid" "David" "Daveth" "Taavetti" "Davit" "Daviti" "Dávid" "Davide" "Dovydas" "Davidu" "Davud" "Davi" "Dàibhidh" "Daividh" "Dafydd" "Dewey" "Dewi" "Dewydd" "Dovid" "'
foreach variant of local Davide {
	replace ameriname = "Davide" if fname == "`variant'"
}

local Davide `" "Dave" "Davey" "Davie" "Davy" "Taavi" "Daw" "Dai" "Taffy" "Dudel" "'
foreach diminutive of local Davide {
	replace ameriname = "Davide" if fname == "`diminutive'"
}

local Dawid `" "Daud" "Dawood" "Dawud" "Dauid" "Dawid" "David" "Daveth" "Taavetti" "Davit" "Daviti" "Dávid" "Davide" "Dovydas" "Davidu" "Davud" "Davi" "Dàibhidh" "Daividh" "Dafydd" "Dewey" "Dewi" "Dewydd" "Dovid" "'
foreach variant of local Dawid {
	replace ameriname = "Dawid" if fname == "`variant'"
}

local Dawid `" "Dave" "Davey" "Davie" "Davy" "Taavi" "Daw" "Dai" "Taffy" "Dudel" "'
foreach diminutive of local Dawid {
	replace ameriname = "Dawid" if fname == "`diminutive'"
}

local Demetrios `" "Demetrios" "Demetrius" "Dimitar" "Dmitar" "Dimitri" "Dimitrios" "Dimitris" "Demeter" "Dömötör" "Demetrio" "Dimitrij" "Dmitrei" "Demétrio" "Dumitru" "Dmitri" "Dmitrii" "Dmitriy" "Dmitry" "Dimitrije" "Dmytro" "'
foreach variant of local Demetrios {
	replace ameriname = "Demetrios" if fname == "`variant'"
}

local Demetrios `" "Mitre" "Mitica" "Dima" "Mitya" "Mitja" "'
foreach diminutive of local Demetrios {
	replace ameriname = "Demetrios" if fname == "`diminutive'"
}

local Denis `" "Dionysios" "Dionysius" "Denis" "Dennis" "Dionysos" "Dénes" "Dionisio" "Dinis" "Diniz" "Dionísio" "Dionisie" "Dionýz" "Denys" "'
foreach variant of local Denis {
	replace ameriname = "Denis" if fname == "`variant'"
}

local Denis `" "Deion" "Deon" "Dion" "Den" "Denny" "Tenney" "'
foreach diminutive of local Denis {
	replace ameriname = "Denis" if fname == "`diminutive'"
}

local Diego `" "Xanti" "Dídac" "Didacus" "Diego" "'
foreach variant of local Diego {
	replace ameriname = "Diego" if fname == "`variant'"
}

/*Diego "No diminutives"*/

local Dimitrios `" "Demetrios" "Demetrius" "Dimitar" "Dmitar" "Dimitri" "Dimitrios" "Dimitris" "Demeter" "Dömötör" "Demetrio" "Dimitrij" "Dmitrei" "Demétrio" "Dumitru" "Dmitri" "Dmitrii" "Dmitriy" "Dmitry" "Dimitrije" "Dmytro" "'
foreach variant of local Dimitrios {
	replace ameriname = "Dimitrios" if fname == "`variant'"
}

local Dimitrios `" "Mitre" "Mitica" "Dima" "Mitya" "Mitja" "'
foreach diminutive of local Dimitrios {
	replace ameriname = "Dimitrios" if fname == "`diminutive'"
}

local Dirk `" "Teutorigos" "Theoderich" "Theodoricus" "Theudoricus" "Theutrich" "Þiudreiks" "Dick" "Diede" "Dirk" "Tiede" "Ties" "Thierry" "Dierk" "Thilo" "Till" "Tillo" "Tilo" "Theodoric" "Tielo" "Thelonius" "Tudor" "Tudur" "'
foreach variant of local Dirk {
	replace ameriname = "Dirk" if fname == "`variant'"
}

/*Dirk "No diminutives"*/

local Domenico `" "Txomin" "Dominik" "Dominicus" "Domenic" "Dominic" "Dominick" "Dominique" "Domonkos" "Domenico" "Dominykas" "Domingos" "Domen" "Domingo" "'
foreach variant of local Domenico {
	replace ameriname = "Domenico" if fname == "`variant'"
}

local Domenico `" "Dinko" "Dom" "Nic" "'
foreach diminutive of local Domenico {
	replace ameriname = "Domenico" if fname == "`diminutive'"
}

/*Dominico "No equivalents"*/

/*Dominico "No diminutives"*/

local Donald `" "Donald" "Domhnall" "Domnall" "Dónal" "Donal" "'
foreach variant of local Donald {
	replace ameriname = "Donald" if fname == "`variant'"
}

local Donald `" "Don" "Donnie" "Donny" "'
foreach diminutive of local Donald {
	replace ameriname = "Donald" if fname == "`diminutive'"
}

local Donato `" "Donat" "Donát" "Donato" "Donatus" "'
foreach variant of local Donato {
	replace ameriname = "Donato" if fname == "`variant'"
}

local Donato `" "Donatello" "'
foreach diminutive of local Donato {
	replace ameriname = "Donato" if fname == "`diminutive'"
}

local Douglas `" "Douglas" "Douglass" "Dubhghlas" "'
foreach variant of local Douglas {
	replace ameriname = "Douglas" if fname == "`variant'"
}

local Douglas `" "Doug" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Douglas {
	replace ameriname = "Douglas" if fname == "`diminutive'"
}

local Edgar `" "Eadgar" "Edgar" "Edgard" "Edgardo" "Edgaras" "'
foreach variant of local Edgar {
	replace ameriname = "Edgar" if fname == "`variant'"
}

local Edgar `" "Ed" "Eddie" "Eddy" "'
foreach diminutive of local Edgar {
	replace ameriname = "Edgar" if fname == "`diminutive'"
}

local Edmond `" "Eadmund" "Edmund" "Edmond" "Ödön" "Éamon" "Eamon" "Éamonn" "Edmondo" "Edmao" "Edmundo" "'
foreach variant of local Edmond {
	replace ameriname = "Edmond" if fname == "`variant'"
}

local Edmond `" "Ed" "Eddie" "Eddy" "Ned" "Edmé" "Ödi" "Mao" "'
foreach diminutive of local Edmond {
	replace ameriname = "Edmond" if fname == "`diminutive'"
}

local Edmund `" "Eadmund" "Edmund" "Edmond" "Ödön" "Éamon" "Eamon" "Éamonn" "Edmondo" "Edmao" "Edmundo" "'
foreach variant of local Edmund {
	replace ameriname = "Edmund" if fname == "`variant'"
}

local Edmund `" "Ed" "Eddie" "Eddy" "Ned" "Edmé" "Ödi" "Mao" "'
foreach diminutive of local Edmund {
	replace ameriname = "Edmund" if fname == "`diminutive'"
}

local Eduard `" "Eadweard" "Eduard" "Edvard" "Edorta" "Edward" "Eetu" "Édouard" "Ekewaka" "Eduárd" "Edvárd" "Eadbhárd" "Edoardo" "Eduards" "Duarte" "Eduardo" "Eideard" "'
foreach variant of local Eduard {
	replace ameriname = "Eduard" if fname == "`variant'"
}

local Eduard `" "Edi" "Ed" "Eddie" "Eddy" "Ned" "Ted" "Teddy" "Ede" "Dado" "Du" "Duda" "Dudu" "Edu" "Lalo" "'
foreach diminutive of local Eduard {
	replace ameriname = "Eduard" if fname == "`diminutive'"
}

local Eduardo `" "Eadweard" "Eduard" "Edvard" "Edorta" "Edward" "Eetu" "Édouard" "Ekewaka" "Eduárd" "Edvárd" "Eadbhárd" "Edoardo" "Eduards" "Duarte" "Eduardo" "Eideard" "'
foreach variant of local Eduardo {
	replace ameriname = "Eduardo" if fname == "`variant'"
}

local Eduardo `" "Edi" "Ed" "Eddie" "Eddy" "Ned" "Ted" "Teddy" "Ede" "Dado" "Du" "Duda" "Dudu" "Edu" "Lalo" "'
foreach diminutive of local Eduardo {
	replace ameriname = "Eduardo" if fname == "`diminutive'"
}

local Edward `" "Eadweard" "Eduard" "Edvard" "Edorta" "Edward" "Eetu" "Édouard" "Ekewaka" "Eduárd" "Edvárd" "Eadbhárd" "Edoardo" "Eduards" "Duarte" "Eduardo" "Eideard" "'
foreach variant of local Edward {
	replace ameriname = "Edward" if fname == "`variant'"
}

local Edward `" "Edi" "Ed" "Eddie" "Eddy" "Ned" "Ted" "Teddy" "Ede" "Dado" "Du" "Duda" "Dudu" "Edu" "Lalo" "'
foreach diminutive of local Edward {
	replace ameriname = "Edward" if fname == "`diminutive'"
}

local Edwin `" "Eadwine" "Edvin" "Edwin" "Edwyn" "'
foreach variant of local Edwin {
	replace ameriname = "Edwin" if fname == "`variant'"
}

local Edwin `" "Ed" "Eddie" "Eddy" "'
foreach diminutive of local Edwin {
	replace ameriname = "Edwin" if fname == "`diminutive'"
}

local Egidio `" "Gillis" "Giles" "Gyles" "Gilles" "Egidio" "Aegidius" "Gidie" "Egídio" "Gil" "'
foreach variant of local Egidio {
	replace ameriname = "Egidio" if fname == "`variant'"
}

/*Egidio "No diminutives"*/

local Einar `" "Einarr" "Einar" "'
foreach variant of local Einar {
	replace ameriname = "Einar" if fname == "`variant'"
}

/*Einar "No diminutives"*/

local Elia `" "Ilyas" "Elias" "Eliou" "Eliyyahu" "Helias" "Elijah" "Ilia" "Ilija" "Iliya" "Elia" "Elian" "Eelis" "Eljas" "Élie" "Ilias" "Eliyahu" "Éliás" "Illés" "Elis" "Eliasz" "Ilie" "Ilya" "Elías" "İlyas" "'
foreach variant of local Elia {
	replace ameriname = "Elia" if fname == "`variant'"
}

local Elia `" "Ile" "'
foreach diminutive of local Elia {
	replace ameriname = "Elia" if fname == "`diminutive'"
}

local Elias `" "Ilyas" "Elias" "Eliou" "Eliyyahu" "Helias" "Elijah" "Ilia" "Ilija" "Iliya" "Elia" "Elian" "Eelis" "Eljas" "Élie" "Ilias" "Eliyahu" "Éliás" "Illés" "Elis" "Eliasz" "Ilie" "Ilya" "Elías" "İlyas" "'
foreach variant of local Elias {
	replace ameriname = "Elias" if fname == "`variant'"
}

local Elias `" "Ile" "'
foreach diminutive of local Elias {
	replace ameriname = "Elias" if fname == "`diminutive'"
}

/*Elie "No equivalents"*/

/*Elie "No diminutives"*/

local Emanuel `" "Imanol" "Emmanouel" "Immanuel" "Emmanuhel" "Emmanuel" "Manel" "Emanuel" "Manuel" "Emmanouil" "Emánuel" "Emanuele" "Manuele" "Manoel" "'
foreach variant of local Emanuel {
	replace ameriname = "Emanuel" if fname == "`variant'"
}

local Emanuel `" "Manny" "Manu" "Manouel" "Manuel" "Nelinho" "Manolo" "'
foreach diminutive of local Emanuel {
	replace ameriname = "Emanuel" if fname == "`diminutive'"
}

local Emanuele `" "Imanol" "Emmanouel" "Immanuel" "Emmanuhel" "Emmanuel" "Manel" "Emanuel" "Manuel" "Emmanouil" "Emánuel" "Emanuele" "Manuele" "Manoel" "'
foreach variant of local Emanuele {
	replace ameriname = "Emanuele" if fname == "`variant'"
}

local Emanuele `" "Manny" "Manu" "Manouel" "Manuel" "Nelinho" "Manolo" "'
foreach diminutive of local Emanuele {
	replace ameriname = "Emanuele" if fname == "`diminutive'"
}

local Emil `" "Aemilius" "Emil" "Eemeli" "Eemil" "Émile" "Emilio" "Emilis" "'
foreach variant of local Emil {
	replace ameriname = "Emil" if fname == "`variant'"
}

/*Emil "No diminutives"*/

/*Emile "No equivalents"*/

/*Emile "No diminutives"*/

local Emilio `" "Aemilius" "Emil" "Eemeli" "Eemil" "Émile" "Emilio" "Emilis" "'
foreach variant of local Emilio {
	replace ameriname = "Emilio" if fname == "`variant'"
}

/*Emilio "No diminutives"*/

local Enrico `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Enrico {
	replace ameriname = "Enrico" if fname == "`variant'"
}

local Enrico `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Enrico {
	replace ameriname = "Enrico" if fname == "`diminutive'"
}

local Enrique `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Enrique {
	replace ameriname = "Enrique" if fname == "`variant'"
}

local Enrique `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Enrique {
	replace ameriname = "Enrique" if fname == "`diminutive'"
}

local Eric `" "Eiríkr" "Èric" "Erik" "Jerrik" "Aric" "Eric" "Erick" "Eerik" "Eerikki" "Eero" "Erkki" "Éric" "Erich" "Eiríkur" "Erikas" "Eirik" "Eryk" "Érico" "Jerk" "Jerker" "'
foreach variant of local Eric {
	replace ameriname = "Eric" if fname == "`variant'"
}

/*Eric "No diminutives"*/

local Erich `" "Eiríkr" "Èric" "Erik" "Jerrik" "Aric" "Eric" "Erick" "Eerik" "Eerikki" "Eero" "Erkki" "Éric" "Erich" "Eiríkur" "Erikas" "Eirik" "Eryk" "Érico" "Jerk" "Jerker" "'
foreach variant of local Erich {
	replace ameriname = "Erich" if fname == "`variant'"
}

/*Erich "No diminutives"*/

local Erik `" "Eiríkr" "Èric" "Erik" "Jerrik" "Aric" "Eric" "Erick" "Eerik" "Eerikki" "Eero" "Erkki" "Éric" "Erich" "Eiríkur" "Erikas" "Eirik" "Eryk" "Érico" "Jerk" "Jerker" "'
foreach variant of local Erik {
	replace ameriname = "Erik" if fname == "`variant'"
}

/*Erik "No diminutives"*/

local Erling `" "Erlingr" "Erling" "Erlingur" "'
foreach variant of local Erling {
	replace ameriname = "Erling" if fname == "`variant'"
}

/*Erling "No diminutives"*/

local Ernest `" "Ernust" "Ernst" "Earnest" "Ernest" "Erno" "Ernő" "Ernesto" "Ernestas" "'
foreach variant of local Ernest {
	replace ameriname = "Ernest" if fname == "`variant'"
}

local Ernest `" "Ern" "Ernie" "'
foreach diminutive of local Ernest {
	replace ameriname = "Ernest" if fname == "`diminutive'"
}

local Ernesto `" "Ernust" "Ernst" "Earnest" "Ernest" "Erno" "Ernő" "Ernesto" "Ernestas" "'
foreach variant of local Ernesto {
	replace ameriname = "Ernesto" if fname == "`variant'"
}

local Ernesto `" "Ern" "Ernie" "'
foreach diminutive of local Ernesto {
	replace ameriname = "Ernesto" if fname == "`diminutive'"
}

local Ernst `" "Ernust" "Ernst" "Earnest" "Ernest" "Erno" "Ernő" "Ernesto" "Ernestas" "'
foreach variant of local Ernst {
	replace ameriname = "Ernst" if fname == "`variant'"
}

local Ernst `" "Ern" "Ernie" "'
foreach diminutive of local Ernst {
	replace ameriname = "Ernst" if fname == "`diminutive'"
}

/*Errico "No equivalents"*/

/*Errico "No diminutives"*/

local Ettore `" "Hector" "Hèctor" "Hektor" "Ettore" "Heitor" "Héctor" "'
foreach variant of local Ettore {
	replace ameriname = "Ettore" if fname == "`variant'"
}

local Ettore `" "Heck" "'
foreach diminutive of local Ettore {
	replace ameriname = "Ettore" if fname == "`diminutive'"
}

local Eugen `" "Eugenios" "Eugenius" "Owain" "Yvain" "Ywain" "Evgeni" "Eugen" "Evžen" "Eugene" "Owen" "Eugène" "Uxío" "Eugenio" "Eugenijus" "Evgenij" "Eugeniusz" "Eugênio" "Evgeniy" "Evgeny" "Yevgeni" "Yevgeniy" "Yevgeny" "Yevgen" "Yevhen" "Yevheniy" "'
foreach variant of local Eugen {
	replace ameriname = "Eugen" if fname == "`variant'"
}

local Eugen `" "Gene" "Genya" "Zhenya" "'
foreach diminutive of local Eugen {
	replace ameriname = "Eugen" if fname == "`diminutive'"
}

local Eugene `" "Eugenios" "Eugenius" "Owain" "Yvain" "Ywain" "Evgeni" "Eugen" "Evžen" "Eugene" "Owen" "Eugène" "Uxío" "Eugenio" "Eugenijus" "Evgenij" "Eugeniusz" "Eugênio" "Evgeniy" "Evgeny" "Yevgeni" "Yevgeniy" "Yevgeny" "Yevgen" "Yevhen" "Yevheniy" "'
foreach variant of local Eugene {
	replace ameriname = "Eugene" if fname == "`variant'"
}

local Eugene `" "Gene" "Genya" "Zhenya" "'
foreach diminutive of local Eugene {
	replace ameriname = "Eugene" if fname == "`diminutive'"
}

local Eugenio `" "Eugenios" "Eugenius" "Owain" "Yvain" "Ywain" "Evgeni" "Eugen" "Evžen" "Eugene" "Owen" "Eugène" "Uxío" "Eugenio" "Eugenijus" "Evgenij" "Eugeniusz" "Eugênio" "Evgeniy" "Evgeny" "Yevgeni" "Yevgeniy" "Yevgeny" "Yevgen" "Yevhen" "Yevheniy" "'
foreach variant of local Eugenio {
	replace ameriname = "Eugenio" if fname == "`variant'"
}

local Eugenio `" "Gene" "Genya" "Zhenya" "'
foreach diminutive of local Eugenio {
	replace ameriname = "Eugenio" if fname == "`diminutive'"
}

local Federico `" "Friduric" "Bedřich" "Frederik" "Frederick" "Fredric" "Fredrick" "Fredrik" "Frédéric" "Friedrich" "Frigyes" "Friðrik" "Federico" "Federigo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Federico {
	replace ameriname = "Federico" if fname == "`variant'"
}

local Federico `" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Veeti" "Fedde" "Fiete" "Fritz" "Fredo" "'
foreach diminutive of local Federico {
	replace ameriname = "Federico" if fname == "`diminutive'"
}

/*Feiwel "No equivalents"*/

/*Feiwel "No diminutives"*/

local Felice `" "Felix" "Phelix" "Feliu" "Félix" "Felice" "Feliks" "'
foreach variant of local Felice {
	replace ameriname = "Felice" if fname == "`variant'"
}

/*Felice "No diminutives"*/

local Felix `" "Felix" "Phelix" "Feliu" "Félix" "Felice" "Feliks" "'
foreach variant of local Felix {
	replace ameriname = "Felix" if fname == "`variant'"
}

/*Felix "No diminutives"*/

local Ferdinand `" "Ferdinand" "Ferran" "Fernand" "Ferdinánd" "Ferdinando" "Ferdynand" "Fernando" "Fernão" "Hernando" "'
foreach variant of local Ferdinand {
	replace ameriname = "Ferdinand" if fname == "`variant'"
}

local Ferdinand `" "Ferdi" "Ferdie" "Ferdy" "Veeti" "Vertti" "Nándor" "Hernán" "Nando" "'
foreach diminutive of local Ferdinand {
	replace ameriname = "Ferdinand" if fname == "`diminutive'"
}

local Ferdinando `" "Ferdinand" "Ferran" "Fernand" "Ferdinánd" "Ferdinando" "Ferdynand" "Fernando" "Fernão" "Hernando" "'
foreach variant of local Ferdinando {
	replace ameriname = "Ferdinando" if fname == "`variant'"
}

local Ferdinando `" "Ferdi" "Ferdie" "Ferdy" "Veeti" "Vertti" "Nándor" "Hernán" "Nando" "'
foreach diminutive of local Ferdinando {
	replace ameriname = "Ferdinando" if fname == "`diminutive'"
}

/*Ferencz "No equivalents"*/

/*Ferencz "No diminutives"*/

local Fernand `" "Ferdinand" "Ferran" "Fernand" "Ferdinánd" "Ferdinando" "Ferdynand" "Fernando" "Fernão" "Hernando" "'
foreach variant of local Fernand {
	replace ameriname = "Fernand" if fname == "`variant'"
}

local Fernand `" "Ferdi" "Ferdie" "Ferdy" "Veeti" "Vertti" "Nándor" "Hernán" "Nando" "'
foreach diminutive of local Fernand {
	replace ameriname = "Fernand" if fname == "`diminutive'"
}

local Fernando `" "Ferdinand" "Ferran" "Fernand" "Ferdinánd" "Ferdinando" "Ferdynand" "Fernando" "Fernão" "Hernando" "'
foreach variant of local Fernando {
	replace ameriname = "Fernando" if fname == "`variant'"
}

local Fernando `" "Ferdi" "Ferdie" "Ferdy" "Veeti" "Vertti" "Nándor" "Hernán" "Nando" "'
foreach diminutive of local Fernando {
	replace ameriname = "Fernando" if fname == "`diminutive'"
}

local Filip `" "Philippos" "Philippus" "Philip" "Filip" "Felip" "Filippus" "Phillip" "Vilppu" "Philippe" "Philipp" "Filippos" "Fülöp" "Pilib" "Filippo" "Filips" "Pilypas" "Piripi" "Filippu" "Felipe" "Filipe" "Filipp" "Filib" "Pylyp" "'
foreach variant of local Filip {
	replace ameriname = "Filip" if fname == "`variant'"
}

local Filip `" "Flip" "Phil" "Pip" "Felipinho" "'
foreach diminutive of local Filip {
	replace ameriname = "Filip" if fname == "`diminutive'"
}

local Filippo `" "Philippos" "Philippus" "Philip" "Filip" "Felip" "Filippus" "Phillip" "Vilppu" "Philippe" "Philipp" "Filippos" "Fülöp" "Pilib" "Filippo" "Filips" "Pilypas" "Piripi" "Filippu" "Felipe" "Filipe" "Filipp" "Filib" "Pylyp" "'
foreach variant of local Filippo {
	replace ameriname = "Filippo" if fname == "`variant'"
}

local Filippo `" "Flip" "Phil" "Pip" "Felipinho" "'
foreach diminutive of local Filippo {
	replace ameriname = "Filippo" if fname == "`diminutive'"
}

/*Fischel "No equivalents"*/

/*Fischel "No diminutives"*/

local Fortunato `" "Fortunato" "Fortunatus" "'
foreach variant of local Fortunato {
	replace ameriname = "Fortunato" if fname == "`variant'"
}

/*Fortunato "No diminutives"*/

local Franc `" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach variant of local Franc {
	replace ameriname = "Franc" if fname == "`variant'"
}

local Franc `" "Cesc" "Fran" "Frank" "Franny" "Ransu" "Feri" "Ferkó" "Frenske" "Chico" "Curro" "Paco" "Pancho" "Paquito" "'
foreach diminutive of local Franc {
	replace ameriname = "Franc" if fname == "`diminutive'"
}

local Francesco `" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach variant of local Francesco {
	replace ameriname = "Francesco" if fname == "`variant'"
}

local Francesco `" "Cesc" "Fran" "Frank" "Franny" "Ransu" "Feri" "Ferkó" "Frenske" "Chico" "Curro" "Paco" "Pancho" "Paquito" "'
foreach diminutive of local Francesco {
	replace ameriname = "Francesco" if fname == "`diminutive'"
}

local Francis `" "Frantziska" "Frantzisko" "Patxi" "Frañsez" "Frañseza" "Francesc" "Francesca" "Francescu" "Frane" "Franjo" "Franka" "Franko" "Frano" "František" "Františka" "Frans" "Franciscus" "Frances" "Francis" "Francisque" "François" "Franz" "Franziska" "Ferenc" "Franciska" "Proinsias" "Franca" "Francesco" "Franco" "Francisca" "Frens" "Pranciškus" "Franciszek" "Franciszka" "Francisco" "Frang" "Frangag" "Franc" "Frančišek" "Frančiška" "Ffransis" "'
foreach variant of local Francis {
	replace ameriname = "Francis" if fname == "`variant'"
}

local Francis `" "Cesc" "Fran" "Cissy" "Fannie" "Fanny" "Francene" "Francine" "Frank" "Frankie" "Frannie" "Franny" "Sissie" "Sissy" "Fanni" "Ransu" "Fränze" "Franzi" "Ziska" "Feri" "Ferkó" "Franci" "Frenske" "Chica" "Chico" "Francka" "Curro" "Paca" "Paco" "Pancho" "Paquita" "Paquito" "MASCULINE FORMS" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach diminutive of local Francis {
	replace ameriname = "Francis" if fname == "`diminutive'"
}

local Francisco `" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach variant of local Francisco {
	replace ameriname = "Francisco" if fname == "`variant'"
}

local Francisco `" "Cesc" "Fran" "Frank" "Franny" "Ransu" "Feri" "Ferkó" "Frenske" "Chico" "Curro" "Paco" "Pancho" "Paquito" "'
foreach diminutive of local Francisco {
	replace ameriname = "Francisco" if fname == "`diminutive'"
}

local Franciszek `" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach variant of local Franciszek {
	replace ameriname = "Franciszek" if fname == "`variant'"
}

local Franciszek `" "Cesc" "Fran" "Frank" "Franny" "Ransu" "Feri" "Ferkó" "Frenske" "Chico" "Curro" "Paco" "Pancho" "Paquito" "'
foreach diminutive of local Franciszek {
	replace ameriname = "Franciszek" if fname == "`diminutive'"
}

/*Franco "No equivalents"*/

/*Franco "No diminutives"*/

/*Francois "No equivalents"*/

/*Francois "No diminutives"*/

local Franjo `" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach variant of local Franjo {
	replace ameriname = "Franjo" if fname == "`variant'"
}

local Franjo `" "Cesc" "Fran" "Frank" "Franny" "Ransu" "Feri" "Ferkó" "Frenske" "Chico" "Curro" "Paco" "Pancho" "Paquito" "'
foreach diminutive of local Franjo {
	replace ameriname = "Franjo" if fname == "`diminutive'"
}

/*Frank "No equivalents"*/

/*Frank "No diminutives"*/

local Frans `" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach variant of local Frans {
	replace ameriname = "Frans" if fname == "`variant'"
}

local Frans `" "Cesc" "Fran" "Frank" "Franny" "Ransu" "Feri" "Ferkó" "Frenske" "Chico" "Curro" "Paco" "Pancho" "Paquito" "'
foreach diminutive of local Frans {
	replace ameriname = "Frans" if fname == "`diminutive'"
}

/*Frantisek "No equivalents"*/

/*Frantisek "No diminutives"*/

local Franz `" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach variant of local Franz {
	replace ameriname = "Franz" if fname == "`variant'"
}

local Franz `" "Cesc" "Fran" "Frank" "Franny" "Ransu" "Feri" "Ferkó" "Frenske" "Chico" "Curro" "Paco" "Pancho" "Paquito" "'
foreach diminutive of local Franz {
	replace ameriname = "Franz" if fname == "`diminutive'"
}

local Fred `" "Friduric" "Meginfrid" "Meino" "Ælfræd" "Bedřich" "Alfred" "Frederik" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Fredrik" "Veeti" "Fedde" "Meine" "Fiete" "Fritz" "Alfréd" "Frigyes" "Friðrik" "Alfredo" "Federico" "Federigo" "Fredo" "Manfredo" "Fricis" "Frīdrihs" "Alfredas" "Fryderyk" "Manfred" "Friderik" "'
foreach variant of local Fred {
	replace ameriname = "Fred" if fname == "`variant'"
}

local Fred `" "Minke" "Menno" "'
foreach diminutive of local Fred {
	replace ameriname = "Fred" if fname == "`diminutive'"
}

local Frederick `" "Friduric" "Bedřich" "Frederik" "Frederick" "Fredric" "Fredrick" "Fredrik" "Frédéric" "Friedrich" "Frigyes" "Friðrik" "Federico" "Federigo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Frederick {
	replace ameriname = "Frederick" if fname == "`variant'"
}

local Frederick `" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Veeti" "Fedde" "Fiete" "Fritz" "Fredo" "'
foreach diminutive of local Frederick {
	replace ameriname = "Frederick" if fname == "`diminutive'"
}

local Frederik `" "Friduric" "Bedřich" "Frederik" "Frederick" "Fredric" "Fredrick" "Fredrik" "Frédéric" "Friedrich" "Frigyes" "Friðrik" "Federico" "Federigo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Frederik {
	replace ameriname = "Frederik" if fname == "`variant'"
}

local Frederik `" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Veeti" "Fedde" "Fiete" "Fritz" "Fredo" "'
foreach diminutive of local Frederik {
	replace ameriname = "Frederik" if fname == "`diminutive'"
}

local Friedrich `" "Friduric" "Bedřich" "Frederik" "Frederick" "Fredric" "Fredrick" "Fredrik" "Frédéric" "Friedrich" "Frigyes" "Friðrik" "Federico" "Federigo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Friedrich {
	replace ameriname = "Friedrich" if fname == "`variant'"
}

local Friedrich `" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Veeti" "Fedde" "Fiete" "Fritz" "Fredo" "'
foreach diminutive of local Friedrich {
	replace ameriname = "Friedrich" if fname == "`diminutive'"
}

local Fritz `" "Friduric" "Bedřich" "Frederik" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Frederick" "Fredric" "Fredrick" "Fredrik" "Veeti" "Frédéric" "Fedde" "Fiete" "Fritz" "Frigyes" "Friðrik" "Federico" "Federigo" "Fredo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Fritz {
	replace ameriname = "Fritz" if fname == "`variant'"
}

/*Fritz "No diminutives"*/

/*Froim "No equivalents"*/

/*Froim "No diminutives"*/

/*G "No equivalents"*/

/*G "No diminutives"*/

local Gabriel `" "Jabril" "Jibril" "Gabriel" "Gavri'el" "Gavrail" "Gavril" "Dzhabrail" "Gabrijel" "Gabriël" "Kaapo" "Kaapro" "Gavriil" "Gavriel" "Gábor" "Gábriel" "Gabriele" "Gabriels" "Gabrielius" "Gavriilu" "Gavrilo" "Cebrail" "Havryil" "Gavrel" "'
foreach variant of local Gabriel {
	replace ameriname = "Gabriel" if fname == "`variant'"
}

local Gabriel `" "Biel" "Gabby" "Gabe" "Gabi" "'
foreach diminutive of local Gabriel {
	replace ameriname = "Gabriel" if fname == "`diminutive'"
}

/*Gabriele "No equivalents"*/

/*Gabriele "No diminutives"*/

local Gaetano `" "Kajetán" "Gaétan" "Gaëtan" "Kayetan" "Cajetan" "Gaetano" "Caietanus" "Kajetan" "Caetano" "Cayetano" "'
foreach variant of local Gaetano {
	replace ameriname = "Gaetano" if fname == "`variant'"
}

/*Gaetano "No diminutives"*/

local Gaspare `" "Casper" "Jesper" "Kasper" "Jasper" "Gaspard" "Kaspar" "Gáspár" "Gaspare" "Gasparo" "Caspar" "Gaspar" "Kaspars" "Kasparas" "Kacper" "Gašper" "'
foreach variant of local Gaspare {
	replace ameriname = "Gaspare" if fname == "`variant'"
}

local Gaspare `" "Cas" "'
foreach diminutive of local Gaspare {
	replace ameriname = "Gaspare" if fname == "`diminutive'"
}

local Gennaro `" "Ianuarius" "Januarius" "Gennaro" "Jenaro" "'
foreach variant of local Gennaro {
	replace ameriname = "Gennaro" if fname == "`variant'"
}

local Gennaro `" "Gennarino" "'
foreach diminutive of local Gennaro {
	replace ameriname = "Gennaro" if fname == "`diminutive'"
}

/*Geo "No equivalents"*/

/*Geo "No diminutives"*/

local Georg `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Georg {
	replace ameriname = "Georg" if fname == "`variant'"
}

local Georg `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Georg {
	replace ameriname = "Georg" if fname == "`diminutive'"
}

local George `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local George {
	replace ameriname = "George" if fname == "`variant'"
}

local George `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local George {
	replace ameriname = "George" if fname == "`diminutive'"
}

local Georges `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Georges {
	replace ameriname = "Georges" if fname == "`variant'"
}

local Georges `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Georges {
	replace ameriname = "Georges" if fname == "`diminutive'"
}

local Georgios `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Georgios {
	replace ameriname = "Georgios" if fname == "`variant'"
}

local Georgios `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Georgios {
	replace ameriname = "Georgios" if fname == "`diminutive'"
}

local Gerald `" "Gerold" "Gerolt" "Gerald" "Jerald" "Jerold" "Jerrold" "Gérald" "Géraud" "Gerhold" "Gearalt" "Gearóid" "Giraldo" "Geraldo" "Gerallt" "'
foreach variant of local Gerald {
	replace ameriname = "Gerald" if fname == "`variant'"
}

local Gerald `" "Gerry" "Jerry" "'
foreach diminutive of local Gerald {
	replace ameriname = "Gerald" if fname == "`diminutive'"
}

local Gerard `" "Gerhard" "Gerard" "Gerrit" "Gerrard" "Jerrard" "Gérard" "Jorrit" "Jurryt" "Gerhardt" "Gellért" "Gearóid" "Gerardo" "Gherardo" "Sjra" "'
foreach variant of local Gerard {
	replace ameriname = "Gerard" if fname == "`variant'"
}

local Gerard `" "Cai" "Caj" "Kai" "Kaj" "Kay" "Geert" "Gerd" "Gerry" "Gert" "Jurre" "'
foreach diminutive of local Gerard {
	replace ameriname = "Gerard" if fname == "`diminutive'"
}

local Gerardo `" "Gerhard" "Gerard" "Gerrit" "Gerrard" "Jerrard" "Gérard" "Jorrit" "Jurryt" "Gerhardt" "Gellért" "Gearóid" "Gerardo" "Gherardo" "Sjra" "'
foreach variant of local Gerardo {
	replace ameriname = "Gerardo" if fname == "`variant'"
}

local Gerardo `" "Cai" "Caj" "Kai" "Kaj" "Kay" "Geert" "Gerd" "Gerry" "Gert" "Jurre" "'
foreach diminutive of local Gerardo {
	replace ameriname = "Gerardo" if fname == "`diminutive'"
}

local Gerrit `" "Gerhard" "Gerard" "Gerrit" "Gerrard" "Jerrard" "Gérard" "Jorrit" "Jurryt" "Gerhardt" "Gellért" "Gearóid" "Gerardo" "Gherardo" "Sjra" "'
foreach variant of local Gerrit {
	replace ameriname = "Gerrit" if fname == "`variant'"
}

local Gerrit `" "Cai" "Caj" "Kai" "Kaj" "Kay" "Geert" "Gerd" "Gerry" "Gert" "Jurre" "'
foreach diminutive of local Gerrit {
	replace ameriname = "Gerrit" if fname == "`diminutive'"
}

local Giacinto `" "Hyacinthus" "Hyakinthos" "Hyacinthe" "Hyacinth" "Giacinto" "Jacenty" "Jacinto" "'
foreach variant of local Giacinto {
	replace ameriname = "Giacinto" if fname == "`variant'"
}

local Giacinto `" "Jacek" "'
foreach diminutive of local Giacinto {
	replace ameriname = "Giacinto" if fname == "`diminutive'"
}

local Giacomo `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakob" "Jakov" "Jakub" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Giacomo {
	replace ameriname = "Giacomo" if fname == "`variant'"
}

local Giacomo `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Japik" "Koba" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Giacomo {
	replace ameriname = "Giacomo" if fname == "`diminutive'"
}

local Gilbert `" "Gilbert" "Giselbert" "Gisilbert" "Gilberto" "'
foreach variant of local Gilbert {
	replace ameriname = "Gilbert" if fname == "`variant'"
}

local Gilbert `" "Gib" "Gil" "'
foreach diminutive of local Gilbert {
	replace ameriname = "Gilbert" if fname == "`diminutive'"
}

local Gino `" "Gjergj" "Chlodovech" "Clodovicus" "Clovis" "Hludowig" "Ludovicus" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Koldo" "Koldobika" "Loïc" "Georgi" "Jordi" "Lluís" "Jory" "Alojz" "Alojzije" "Đurađ" "Đuro" "Juraj" "Jure" "Jurica" "Juro" "Alois" "Jiří" "Luděk" "Ludvík" "Georg" "Jørg" "Jørgen" "Jørn" "Ludvig" "Joeri" "Joris" "Jurgen" "Jurriaan" "Lodewijk" "Louis" "Lowie" "Ludo" "Sjors" "Aloysius" "Geordie" "George" "Georgie" "Lewis" "Lou" "Louie" "Georgo" "Luĉjo" "Ludoviko" "Jyri" "Jyrki" "Yrjänä" "Yrjö" "Georges" "Ludovic" "Lois" "Xurxo" "Giorgi" "Goga" "Iuri" "Jörg" "Ludwig" "Lutz" "Giorgos" "Yiorgos" "Yorgos" "Alajos" "György" "Gyuri" "Lajos" "Lúðvík" "Alaois" "Seoirse" "Gino" "Georgijs" "Georgs" "Juris" "Ludis" "Ludvigs" "Jurgis" "Liudvikas" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Varghese" "Jurian" "Aloys" "Yrian" "Georgei" "Gøran" "Ørjan" "Loís" "Alojzy" "Jerzy" "Jurek" "Ludwik" "Luiz" "Aloísio" "Jorge" "Jorginho" "Luís" "Luisinho" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yura" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Alojzij" "Jurij" "Lojze" "Ludvik" "Lucho" "Luis" "Göran" "Jöran" "Jörgen" "Love" "Ludde" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Gino {
	replace ameriname = "Gino" if fname == "`variant'"
}

/*Gino "No diminutives"*/

local Gioacchino `" "Jokin" "Yehoyakhin" "Yehoyakim" "Jehoiachin" "Jehoiakim" "Joaquim" "Jáchym" "Joakim" "Jokum" "Jochem" "Jaakkima" "Joachim" "Jochen" "Jochim" "Gioacchino" "Gioachino" "Ioachim" "Ioakeim" "Akim" "Yakim" "Joaquín" "'
foreach variant of local Gioacchino {
	replace ameriname = "Gioacchino" if fname == "`variant'"
}

local Gioacchino `" "Chimo" "Quim" "Ximo" "Kim" "Aki" "Kimi" "Achim" "Jo" "'
foreach diminutive of local Gioacchino {
	replace ameriname = "Gioacchino" if fname == "`diminutive'"
}

local Giorgio `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Giorgio {
	replace ameriname = "Giorgio" if fname == "`variant'"
}

local Giorgio `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Giorgio {
	replace ameriname = "Giorgio" if fname == "`diminutive'"
}

/*Giov "No equivalents"*/

/*Giov "No diminutives"*/

local Giovanni `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yann" "Ioan" "Ivan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Johan" "Jens" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Iván" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Giovanni {
	replace ameriname = "Giovanni" if fname == "`variant'"
}

local Giovanni `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hanke" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Giovanni {
	replace ameriname = "Giovanni" if fname == "`diminutive'"
}

local Girolamo `" "Hieronymos" "Hieronymus" "Jeronim" "Jeroen" "Jerome" "Jérôme" "Geronimo" "Gerolamo" "Girolamo" "Ieronimus" "Jerônimo" "Jerónimo" "Gerónimo" "'
foreach variant of local Girolamo {
	replace ameriname = "Girolamo" if fname == "`variant'"
}

local Girolamo `" "Jerko" "Jerry" "'
foreach diminutive of local Girolamo {
	replace ameriname = "Girolamo" if fname == "`diminutive'"
}

local Giulio `" "Iulius" "Julius" "Jules" "Giulio" "Juliusz" "Julio" "Iuliu" "Yuli" "Yuliy" "Július" "Julij" "'
foreach variant of local Giulio {
	replace ameriname = "Giulio" if fname == "`variant'"
}

local Giulio `" "Julek" "'
foreach diminutive of local Giulio {
	replace ameriname = "Giulio" if fname == "`diminutive'"
}

local Giuseppe `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Giuseppe {
	replace ameriname = "Giuseppe" if fname == "`variant'"
}

local Giuseppe `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Giuseppe {
	replace ameriname = "Giuseppe" if fname == "`diminutive'"
}

/*Giuseppi "No equivalents"*/

/*Giuseppi "No diminutives"*/

local Gordon `" "Gorden" "Gordon" "'
foreach variant of local Gordon {
	replace ameriname = "Gordon" if fname == "`variant'"
}

local Gordon `" "Gord" "Gordie" "'
foreach diminutive of local Gordon {
	replace ameriname = "Gordon" if fname == "`diminutive'"
}

local Gottfried `" "Godafrid" "Guðfriðr" "Godfried" "Geffrey" "Geoffrey" "Godfrey" "Jeffery" "Jeffrey" "Jeffry" "Geoffroy" "Godefroy" "Joffrey" "Gottfried" "Gofraidh" "Séafra" "Siothrún" "Goffredo" "Geoffroi" "Gjord" "Gjurd" "Godtfred" "Godofredo" "Goraidh" "Gottfrid" "Sieffre" "'
foreach variant of local Gottfried {
	replace ameriname = "Gottfried" if fname == "`variant'"
}

local Gottfried `" "Geoff" "Jeff" "Jep" "Fredo" "'
foreach diminutive of local Gottfried {
	replace ameriname = "Gottfried" if fname == "`diminutive'"
}

local Gottlieb `" "Goteleib" "Gottlieb" "'
foreach variant of local Gottlieb {
	replace ameriname = "Gottlieb" if fname == "`variant'"
}

/*Gottlieb "No diminutives"*/

local Gregorio `" "Grigor" "Krikor" "Grgur" "Řehoř" "Gregers" "Gregory" "Grégoire" "Grigol" "Gregor" "Gregorios" "Gergely" "Gréagóir" "Gregorio" "Gregorius" "Grigorijs" "Gligor" "Grigorii" "Grzegorz" "Grigore" "Grigori" "Grigoriy" "Grigory" "Griogair" "Grega" "Greger" "Hryhoriy" "'
foreach variant of local Gregorio {
	replace ameriname = "Gregorio" if fname == "`variant'"
}

local Gregorio `" "Grga" "Greg" "Gregg" "Reijo" "Reko" "Gergő" "Grisha" "Greig" "Goyo" "'
foreach diminutive of local Gregorio {
	replace ameriname = "Gregorio" if fname == "`diminutive'"
}

local Guglielmo `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilém" "Vilhelm" "Wilhelmus" "Willem" "William" "Vilhelmo" "Villem" "Vilhelmi" "Viljami" "Guillaume" "Vilmos" "Vilhjálmur" "Uilliam" "Guglielmo" "Vilhelms" "Wöllem" "Wullem" "Vilhelmas" "Illiam" "Wiremu" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Guglielmo {
	replace ameriname = "Guglielmo" if fname == "`variant'"
}

local Guglielmo `" "Vilko" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Billie" "Billy" "Liam" "Will" "Willie" "Vilĉjo" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Willi" "Uilleag" "Ulick" "Vilis" "Wum" "Wilkin" "Wilky" "Wilmot" "Gwil" "'
foreach diminutive of local Guglielmo {
	replace ameriname = "Guglielmo" if fname == "`diminutive'"
}

local Guido `" "Wido" "Vid" "Vít" "Guy" "Wide" "Guido" "Veit" "Vida" "Gvidas" "Wit" "'
foreach variant of local Guido {
	replace ameriname = "Guido" if fname == "`variant'"
}

/*Guido "No diminutives"*/

/*Guilio "No equivalents"*/

/*Guilio "No diminutives"*/

/*Guiseppe "No equivalents"*/

/*Guiseppe "No diminutives"*/

local Gunnar `" "Gundahar" "Gunnarr" "Gunnar" "Günter" "Gunter" "Günther" "Gunther" "'
foreach variant of local Gunnar {
	replace ameriname = "Gunnar" if fname == "`variant'"
}

/*Gunnar "No diminutives"*/

local Gustaf `" "Gautstafr" "Gustav" "Gustaaf" "Kustaa" "Kyösti" "Gustave" "Gustaf" "Gusztáv" "Gustavo" "Gustavs" "Gustaw" "Gösta" "Göstav" "'
foreach variant of local Gustaf {
	replace ameriname = "Gustaf" if fname == "`variant'"
}

local Gustaf `" "Guus" "Kusti" "'
foreach diminutive of local Gustaf {
	replace ameriname = "Gustaf" if fname == "`diminutive'"
}

local Gustav `" "Gautstafr" "Gustav" "Gustaaf" "Kustaa" "Kyösti" "Gustave" "Gustaf" "Gusztáv" "Gustavo" "Gustavs" "Gustaw" "Gösta" "Göstav" "'
foreach variant of local Gustav {
	replace ameriname = "Gustav" if fname == "`variant'"
}

local Gustav `" "Guus" "Kusti" "'
foreach diminutive of local Gustav {
	replace ameriname = "Gustav" if fname == "`diminutive'"
}

local Gustave `" "Gautstafr" "Gustav" "Gustaaf" "Kustaa" "Kyösti" "Gustave" "Gustaf" "Gusztáv" "Gustavo" "Gustavs" "Gustaw" "Gösta" "Göstav" "'
foreach variant of local Gustave {
	replace ameriname = "Gustave" if fname == "`variant'"
}

local Gustave `" "Guus" "Kusti" "'
foreach diminutive of local Gustave {
	replace ameriname = "Gustave" if fname == "`diminutive'"
}

local Gustavo `" "Gautstafr" "Gustav" "Gustaaf" "Kustaa" "Kyösti" "Gustave" "Gustaf" "Gusztáv" "Gustavo" "Gustavs" "Gustaw" "Gösta" "Göstav" "'
foreach variant of local Gustavo {
	replace ameriname = "Gustavo" if fname == "`variant'"
}

local Gustavo `" "Guus" "Kusti" "'
foreach diminutive of local Gustavo {
	replace ameriname = "Gustavo" if fname == "`diminutive'"
}

/*Gyorgy "No equivalents"*/

/*Gyorgy "No diminutives"*/

local Haim `" "Chaim" "Chayim" "Chayyim" "Haim" "Hayim" "Hayyim" "Hyam" "'
foreach variant of local Haim {
	replace ameriname = "Haim" if fname == "`variant'"
}

/*Haim "No diminutives"*/

local Hans `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivan" "Ivo" "Yanko" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Johan" "Hans" "Jannick" "Jannik" "Hanne" "Hannes" "Jo" "Joop" "Evan" "Ian" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Johannes" "Juhan" "Hannu" "Jani" "Janne" "Joni" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giovanni" "Ivano" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Hanke" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Ján" "Anže" "Janez" "Žan" "Iván" "Juanito" "Xuan" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Hans {
	replace ameriname = "Hans" if fname == "`variant'"
}

local Hans `" "Hank" "Jack" "Jackie" "Jake" "Giannino" "Nino" "Jock" "Jockie" "Jocky" "Seoc" "Hampus" "Hasse" "'
foreach diminutive of local Hans {
	replace ameriname = "Hans" if fname == "`diminutive'"
}

local Harald `" "Chariovalda" "Hariwald" "Haraldr" "Hereweald" "Harald" "Harold" "Haraldur" "Aroldo" "Haroldo" "'
foreach variant of local Harald {
	replace ameriname = "Harald" if fname == "`variant'"
}

local Harald `" "Hal" "Harry" "Harri" "'
foreach diminutive of local Harald {
	replace ameriname = "Harald" if fname == "`diminutive'"
}

local Harold `" "Chariovalda" "Hariwald" "Haraldr" "Hereweald" "Harald" "Harold" "Haraldur" "Aroldo" "Haroldo" "'
foreach variant of local Harold {
	replace ameriname = "Harold" if fname == "`variant'"
}

local Harold `" "Hal" "Harry" "Harri" "'
foreach diminutive of local Harold {
	replace ameriname = "Harold" if fname == "`diminutive'"
}

local Harry `" "Chariovalda" "Hariwald" "Heimirich" "Heinrich" "Henricus" "Haraldr" "Hereweald" "Henrik" "Endika" "Enric" "Jindřich" "Harald" "Hendrik" "Hal" "Hank" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Haraldur" "Hinrik" "Anraí" "Einrí" "Aroldo" "Arrigo" "Enrico" "Henrikas" "Hinrich" "Herry" "Henryk" "Haroldo" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Harry {
	replace ameriname = "Harry" if fname == "`variant'"
}

local Harry `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Harry {
	replace ameriname = "Harry" if fname == "`diminutive'"
}

local Hector `" "Hector" "Hèctor" "Hektor" "Ettore" "Heitor" "Héctor" "'
foreach variant of local Hector {
	replace ameriname = "Hector" if fname == "`variant'"
}

local Hector `" "Heck" "'
foreach diminutive of local Hector {
	replace ameriname = "Hector" if fname == "`diminutive'"
}

local Heinrich `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Heinrich {
	replace ameriname = "Heinrich" if fname == "`variant'"
}

local Heinrich `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Heinrich {
	replace ameriname = "Heinrich" if fname == "`diminutive'"
}

local Hendrik `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Hendrik {
	replace ameriname = "Hendrik" if fname == "`variant'"
}

local Hendrik `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Hendrik {
	replace ameriname = "Hendrik" if fname == "`diminutive'"
}

local Henri `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Henri {
	replace ameriname = "Henri" if fname == "`variant'"
}

local Henri `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Harri" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Henri {
	replace ameriname = "Henri" if fname == "`diminutive'"
}

local Henrik `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Henrik {
	replace ameriname = "Henrik" if fname == "`variant'"
}

local Henrik `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Henrik {
	replace ameriname = "Henrik" if fname == "`diminutive'"
}

local Henry `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Henry {
	replace ameriname = "Henry" if fname == "`variant'"
}

local Henry `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Harry" "Harri" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Henry {
	replace ameriname = "Henry" if fname == "`diminutive'"
}

local Henryk `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Henryk {
	replace ameriname = "Henryk" if fname == "`variant'"
}

local Henryk `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Henryk {
	replace ameriname = "Henryk" if fname == "`diminutive'"
}

local Herbert `" "Haribert" "Herbert" "Heribert" "Herberto" "Heriberto" "'
foreach variant of local Herbert {
	replace ameriname = "Herbert" if fname == "`variant'"
}

local Herbert `" "Bert" "Bertie" "Herb" "Herbie" "'
foreach diminutive of local Herbert {
	replace ameriname = "Herbert" if fname == "`diminutive'"
}

local Herman `" "Hariman" "Herman" "Hermanus" "Hermanni" "Armand" "Hermann" "Ármann" "Armando" "Ermanno" "German" "'
foreach variant of local Herman {
	replace ameriname = "Herman" if fname == "`variant'"
}

local Herman `" "Harm" "Mannes" "Maan" "'
foreach diminutive of local Herman {
	replace ameriname = "Herman" if fname == "`diminutive'"
}

local Hermann `" "Hariman" "Herman" "Hermanus" "Hermanni" "Armand" "Hermann" "Ármann" "Armando" "Ermanno" "German" "'
foreach variant of local Hermann {
	replace ameriname = "Hermann" if fname == "`variant'"
}

local Hermann `" "Harm" "Mannes" "Maan" "'
foreach diminutive of local Hermann {
	replace ameriname = "Hermann" if fname == "`diminutive'"
}

/*Hersch "No equivalents"*/

/*Hersch "No diminutives"*/

local Herschel `" "Herschel" "Hershel" "Heshel" "'
foreach variant of local Herschel {
	replace ameriname = "Herschel" if fname == "`variant'"
}

/*Herschel "No diminutives"*/

/*Hirsch "No equivalents"*/

/*Hirsch "No diminutives"*/

local Hjalmar `" "Hjálmarr" "Hjalmar" "Jalmari" "'
foreach variant of local Hjalmar {
	replace ameriname = "Hjalmar" if fname == "`variant'"
}

local Hjalmar `" "Jari" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Hjalmar {
	replace ameriname = "Hjalmar" if fname == "`diminutive'"
}

local Horace `" "Horatius" "Horace" "Horatio" "Orazio" "Horácio" "Horațiu" "Horacio" "'
foreach variant of local Horace {
	replace ameriname = "Horace" if fname == "`variant'"
}

/*Horace "No diminutives"*/

local Hubert `" "Hubert" "Hubertus" "Hugubert" "Hubrecht" "Uberto" "Hoebaer" "Huppert" "'
foreach variant of local Hubert {
	replace ameriname = "Hubert" if fname == "`variant'"
}

local Hubert `" "Brecht" "Huub" "Baer" "Bèr" "'
foreach diminutive of local Hubert {
	replace ameriname = "Hubert" if fname == "`diminutive'"
}

local Hugh `" "Hugo" "Huguo" "Hugh" "Hugues" "Ugo" "Huw" "'
foreach variant of local Hugh {
	replace ameriname = "Hugh" if fname == "`variant'"
}

local Hugh `" "Hewie" "Huey" "Hughie" "Hudde" "Shug" "'
foreach diminutive of local Hugh {
	replace ameriname = "Hugh" if fname == "`diminutive'"
}

local Hugo `" "Hugo" "Huguo" "Hugh" "Hugues" "Ugo" "Huw" "'
foreach variant of local Hugo {
	replace ameriname = "Hugo" if fname == "`variant'"
}

local Hugo `" "Hewie" "Huey" "Hughie" "Hudde" "Shug" "'
foreach diminutive of local Hugo {
	replace ameriname = "Hugo" if fname == "`diminutive'"
}

local Hyman `" "Hyman" "'
foreach variant of local Hyman {
	replace ameriname = "Hyman" if fname == "`variant'"
}

local Hyman `" "Hymie" "'
foreach diminutive of local Hyman {
	replace ameriname = "Hyman" if fname == "`diminutive'"
}

local Ian `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yann" "Ioan" "Ivan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Johan" "Jens" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Iván" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Ian {
	replace ameriname = "Ian" if fname == "`variant'"
}

local Ian `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hanke" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Ian {
	replace ameriname = "Ian" if fname == "`diminutive'"
}

/*Idel "No equivalents"*/

/*Idel "No diminutives"*/

local Ignazio `" "Egnatius" "Iñaki" "Ignasi" "Ignác" "Ignaas" "Ignace" "Ignatz" "Ignazio" "Ignatius" "Ignas" "Ignacy" "Inácio" "Ignatiy" "Ignac" "Ignacij" "Nace" "Ignacio" "'
foreach variant of local Ignazio {
	replace ameriname = "Ignazio" if fname == "`variant'"
}

local Ignazio `" "Iggy" "Nacho" "Nacio" "'
foreach diminutive of local Ignazio {
	replace ameriname = "Ignazio" if fname == "`diminutive'"
}

local Isaac `" "Sahak" "Isaak" "Yitzhak" "Isaac" "Isak" "Izaäk" "Issac" "Iisakki" "Itzhak" "Izsák" "Isaaku" "Izaak" "'
foreach variant of local Isaac {
	replace ameriname = "Isaac" if fname == "`variant'"
}

local Isaac `" "Sjaak" "Sjakie" "Ike" "Iikka" "Iiro" "'
foreach diminutive of local Isaac {
	replace ameriname = "Isaac" if fname == "`diminutive'"
}

local Isaak `" "Sahak" "Isaak" "Yitzhak" "Isaac" "Isak" "Izaäk" "Issac" "Iisakki" "Itzhak" "Izsák" "Isaaku" "Izaak" "'
foreach variant of local Isaak {
	replace ameriname = "Isaak" if fname == "`variant'"
}

local Isaak `" "Sjaak" "Sjakie" "Ike" "Iikka" "Iiro" "'
foreach diminutive of local Isaak {
	replace ameriname = "Isaak" if fname == "`diminutive'"
}

local Isak `" "Sahak" "Isaak" "Yitzhak" "Isaac" "Isak" "Izaäk" "Issac" "Iisakki" "Itzhak" "Izsák" "Isaaku" "Izaak" "'
foreach variant of local Isak {
	replace ameriname = "Isak" if fname == "`variant'"
}

local Isak `" "Sjaak" "Sjakie" "Ike" "Iikka" "Iiro" "'
foreach diminutive of local Isak {
	replace ameriname = "Isak" if fname == "`diminutive'"
}

local Isidor `" "Isidoros" "Isador" "Isadore" "Isidore" "Isidor" "Isidoro" "Isidorus" "Izydor" "Izidor" "Isidro" "'
foreach variant of local Isidor {
	replace ameriname = "Isidor" if fname == "`variant'"
}

local Isidor `" "Issy" "Izzy" "'
foreach diminutive of local Isidor {
	replace ameriname = "Isidor" if fname == "`diminutive'"
}

local Israel `" "Israel" "Yisra'el" "Israhel" "Iser" "Issur" "Sroel" "'
foreach variant of local Israel {
	replace ameriname = "Israel" if fname == "`variant'"
}

local Israel `" "Issy" "'
foreach diminutive of local Israel {
	replace ameriname = "Israel" if fname == "`diminutive'"
}

/*Istvan "No equivalents"*/

/*Istvan "No diminutives"*/

local Italo `" "Italo" "Italus" "'
foreach variant of local Italo {
	replace ameriname = "Italo" if fname == "`variant'"
}

/*Italo "No diminutives"*/

/*Itzig "No equivalents"*/

/*Itzig "No diminutives"*/

/*Itzik "No equivalents"*/

/*Itzik "No diminutives"*/

local Ivan `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yann" "Ioan" "Ivan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Johan" "Jens" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Žan" "Iván" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Ivan {
	replace ameriname = "Ivan" if fname == "`variant'"
}

local Ivan `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hanke" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Ivan {
	replace ameriname = "Ivan" if fname == "`diminutive'"
}

local Ivar `" "Ívarr" "Ivar" "Ivor" "Evander" "Íomhar" "Iomhar" "'
foreach variant of local Ivar {
	replace ameriname = "Ivar" if fname == "`variant'"
}

/*Ivar "No diminutives"*/

local Iwan `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yann" "Ioan" "Ivan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Johan" "Jens" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Iván" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Iwan {
	replace ameriname = "Iwan" if fname == "`variant'"
}

local Iwan `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hanke" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Iwan {
	replace ameriname = "Iwan" if fname == "`diminutive'"
}

local Jack `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivan" "Ivo" "Yanko" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Johan" "Hans" "Jannick" "Jannik" "Jens" "Johannes" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jake" "Joĉjo" "Johano" "Jaan" "Juhan" "Hannu" "Jani" "Janne" "Joni" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Sean" "Shane" "Gian" "Giannino" "Giovanni" "Ivano" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Hanke" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Ian" "Jock" "Seoc" "Ján" "Anže" "Janez" "Žan" "Iván" "Juanito" "Xuan" "Hampus" "Hasse" "Evan" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Jack {
	replace ameriname = "Jack" if fname == "`variant'"
}

local Jack `" "Jackie" "Nino" "Jockie" "Jocky" "'
foreach diminutive of local Jack {
	replace ameriname = "Jack" if fname == "`diminutive'"
}

local Jacob `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakob" "Jakov" "Jakub" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Jacob {
	replace ameriname = "Jacob" if fname == "`variant'"
}

local Jacob `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Japik" "Koba" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Jacob {
	replace ameriname = "Jacob" if fname == "`diminutive'"
}

local Jacobus `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakob" "Jakov" "Jakub" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Jacobus {
	replace ameriname = "Jacobus" if fname == "`variant'"
}

local Jacobus `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Japik" "Koba" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Jacobus {
	replace ameriname = "Jacobus" if fname == "`diminutive'"
}

local Jacques `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakob" "Jakov" "Jakub" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Jacques {
	replace ameriname = "Jacques" if fname == "`variant'"
}

local Jacques `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Japik" "Koba" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Jacques {
	replace ameriname = "Jacques" if fname == "`diminutive'"
}

local Jakob `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakob" "Jakov" "Jakub" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Jakob {
	replace ameriname = "Jakob" if fname == "`variant'"
}

local Jakob `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Japik" "Koba" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Jakob {
	replace ameriname = "Jakob" if fname == "`diminutive'"
}

local James `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakob" "Jakov" "Jakub" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local James {
	replace ameriname = "James" if fname == "`variant'"
}

local James `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Japik" "Koba" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local James {
	replace ameriname = "James" if fname == "`diminutive'"
}

/*Jan "No equivalents"*/

/*Jan "No diminutives"*/

/*Jankel "No equivalents"*/

/*Jankel "No diminutives"*/

/*Jankiel "No equivalents"*/

/*Jankiel "No diminutives"*/

/*Janos "No equivalents"*/

/*Janos "No diminutives"*/

local Jaroslav `" "Jaroslav" "Jaroslavas" "Yaroslav" "Jarosław" "Yaroslava" "'
foreach variant of local Jaroslav {
	replace ameriname = "Jaroslav" if fname == "`variant'"
}

local Jaroslav `" "Jarek" "Slava" "'
foreach diminutive of local Jaroslav {
	replace ameriname = "Jaroslav" if fname == "`diminutive'"
}

/*Jas "No equivalents"*/

/*Jas "No diminutives"*/

/*Jean "No equivalents"*/

/*Jean "No diminutives"*/

local Jens `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yann" "Ioan" "Ivan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Johan" "Jens" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Iván" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Jens {
	replace ameriname = "Jens" if fname == "`variant'"
}

local Jens `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hanke" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Jens {
	replace ameriname = "Jens" if fname == "`diminutive'"
}

/*Joannis "No equivalents"*/

/*Joannis "No diminutives"*/

/*Joao "No equivalents"*/

/*Joao "No diminutives"*/

local Joe `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Yosif" "Josep" "Josip" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Josephus" "Jozef" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Xosé" "Ioseb" "Soso" "Sepp" "Seppel" "Iosif" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Giuseppe" "Peppe" "Peppi" "Peppino" "Iosephus" "Jāzeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "Yussel" "'
foreach variant of local Joe {
	replace ameriname = "Joe" if fname == "`variant'"
}

local Joe `" "Pino" "'
foreach diminutive of local Joe {
	replace ameriname = "Joe" if fname == "`diminutive'"
}

local Joel `" "Ioel" "Yoel" "Iohel" "Joel" "Joël" "Xoel" "Gioele" "'
foreach variant of local Joel {
	replace ameriname = "Joel" if fname == "`variant'"
}

/*Joel "No diminutives"*/

local Johan `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yann" "Ioan" "Ivan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Johan" "Jens" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Iván" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Johan {
	replace ameriname = "Johan" if fname == "`variant'"
}

local Johan `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hanke" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Johan {
	replace ameriname = "Johan" if fname == "`diminutive'"
}

local Johann `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yann" "Ioan" "Ivan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Johan" "Jens" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Iván" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Johann {
	replace ameriname = "Johann" if fname == "`variant'"
}

local Johann `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hanke" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Johann {
	replace ameriname = "Johann" if fname == "`diminutive'"
}

local Johannes `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yann" "Ioan" "Ivan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Johan" "Jens" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Iván" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Johannes {
	replace ameriname = "Johannes" if fname == "`variant'"
}

local Johannes `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hanke" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Johannes {
	replace ameriname = "Johannes" if fname == "`diminutive'"
}

local John `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "John" "Yann" "Ioan" "Ivan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Johan" "Jens" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Iván" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local John {
	replace ameriname = "John" if fname == "`variant'"
}

local John `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hanke" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local John {
	replace ameriname = "John" if fname == "`diminutive'"
}

/*Jonas "No equivalents"*/

/*Jonas "No diminutives"*/

local Jorge `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Jorge {
	replace ameriname = "Jorge" if fname == "`variant'"
}

local Jorge `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Jorge {
	replace ameriname = "Jorge" if fname == "`diminutive'"
}

/*Jose "No equivalents"*/

/*Jose "No diminutives"*/

local Josef `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Josef {
	replace ameriname = "Josef" if fname == "`variant'"
}

local Josef `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Josef {
	replace ameriname = "Josef" if fname == "`diminutive'"
}

/*Josel "No equivalents"*/

/*Josel "No diminutives"*/

local Joseph `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Joseph {
	replace ameriname = "Joseph" if fname == "`variant'"
}

local Joseph `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Joseph {
	replace ameriname = "Joseph" if fname == "`diminutive'"
}

local Josif `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Josif {
	replace ameriname = "Josif" if fname == "`variant'"
}

local Josif `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Josif {
	replace ameriname = "Josif" if fname == "`diminutive'"
}

local Josip `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Josip {
	replace ameriname = "Josip" if fname == "`variant'"
}

local Josip `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Josip {
	replace ameriname = "Josip" if fname == "`diminutive'"
}

/*Jossel "No equivalents"*/

/*Jossel "No diminutives"*/

local Jozef `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Jozef {
	replace ameriname = "Jozef" if fname == "`variant'"
}

local Jozef `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Jozef {
	replace ameriname = "Jozef" if fname == "`diminutive'"
}

/*Jozsef "No equivalents"*/

/*Jozsef "No diminutives"*/

/*Juan "No equivalents"*/

/*Juan "No diminutives"*/

local Juda `" "Guda" "'
foreach variant of local Juda {
	replace ameriname = "Juda" if fname == "`variant'"
}

/*Juda "No diminutives"*/

/*Judel "No equivalents"*/

/*Judel "No diminutives"*/

/*Jules "No equivalents"*/

/*Jules "No diminutives"*/

local Julian `" "Iulianus" "Julen" "Yulian" "Jolyon" "Julian" "Julyan" "Julien" "Giuliano" "Iulian" "Julián" "'
foreach variant of local Julian {
	replace ameriname = "Julian" if fname == "`variant'"
}

local Julian `" "Jools" "Jules" "'
foreach diminutive of local Julian {
	replace ameriname = "Julian" if fname == "`diminutive'"
}

local Julio `" "Iulius" "Julius" "Jules" "Giulio" "Juliusz" "Julio" "Iuliu" "Yuli" "Yuliy" "Július" "Julij" "'
foreach variant of local Julio {
	replace ameriname = "Julio" if fname == "`variant'"
}

local Julio `" "Julek" "'
foreach diminutive of local Julio {
	replace ameriname = "Julio" if fname == "`diminutive'"
}

local Julius `" "Iulius" "Julius" "Jules" "Giulio" "Juliusz" "Julio" "Iuliu" "Yuli" "Yuliy" "Július" "Julij" "'
foreach variant of local Julius {
	replace ameriname = "Julius" if fname == "`variant'"
}

local Julius `" "Julek" "'
foreach diminutive of local Julius {
	replace ameriname = "Julius" if fname == "`diminutive'"
}

/*Kalman "No equivalents"*/

/*Kalman "No diminutives"*/

local Karel `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Carol" "Charles" "Kaarle" "Kaarlo" "Kale" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Siarl" "'
foreach variant of local Karel {
	replace ameriname = "Karel" if fname == "`variant'"
}

local Karel `" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Karcsi" "Carlinhos" "Carlito" "Carlitos" "'
foreach diminutive of local Karel {
	replace ameriname = "Karel" if fname == "`diminutive'"
}

local Karl `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Carol" "Charles" "Kaarle" "Kaarlo" "Kale" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Siarl" "'
foreach variant of local Karl {
	replace ameriname = "Karl" if fname == "`variant'"
}

local Karl `" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Karcsi" "Carlinhos" "Carlito" "Carlitos" "'
foreach diminutive of local Karl {
	replace ameriname = "Karl" if fname == "`diminutive'"
}

local Karol `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Carol" "Charles" "Kaarle" "Kaarlo" "Kale" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Siarl" "'
foreach variant of local Karol {
	replace ameriname = "Karol" if fname == "`variant'"
}

local Karol `" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Karcsi" "Carlinhos" "Carlito" "Carlitos" "'
foreach diminutive of local Karol {
	replace ameriname = "Karol" if fname == "`diminutive'"
}

/*Karoly "No equivalents"*/

/*Karoly "No diminutives"*/

local Kasimir `" "Kazimír" "Casimir" "Kasimir" "Kázmér" "Casimiro" "Kazimieras" "Kazimir" "Kazimierz" "'
foreach variant of local Kasimir {
	replace ameriname = "Kasimir" if fname == "`variant'"
}

local Kasimir `" "Kazik" "'
foreach diminutive of local Kasimir {
	replace ameriname = "Kasimir" if fname == "`diminutive'"
}

local Kenneth `" "Kennet" "Kenneth" "Kenith" "Kennith" "Cainneach" "Cináed" "Cionaodh" "Coinneach" "'
foreach variant of local Kenneth {
	replace ameriname = "Kenneth" if fname == "`variant'"
}

local Kenneth `" "Ken" "Kenny" "'
foreach diminutive of local Kenneth {
	replace ameriname = "Kenneth" if fname == "`diminutive'"
}

local Klaas `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Niklas" "Nikolaj" "Nils" "Klaas" "Nick" "Nico" "Niek" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Nicolaos" "Kolos" "Miklós" "Miksa" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Claes" "Klas" "Mykola" "'
foreach variant of local Klaas {
	replace ameriname = "Klaas" if fname == "`variant'"
}

local Klaas `" "Colin" "Collin" "Launo" "'
foreach diminutive of local Klaas {
	replace ameriname = "Klaas" if fname == "`diminutive'"
}

local Knut `" "Knútr" "Knud" "Knut" "Canute" "Cnut" "Knute" "'
foreach variant of local Knut {
	replace ameriname = "Knut" if fname == "`variant'"
}

/*Knut "No diminutives"*/

local Konrad `" "Conrad" "Konrád" "Konrad" "Koenraad" "Curt" "Kurt" "Corrado" "Cord" "Kord" "Kondrat" "Conrado" "'
foreach variant of local Konrad {
	replace ameriname = "Konrad" if fname == "`variant'"
}

local Konrad `" "Dino" "Koen" "Koert" "Connie" "Corradino" "'
foreach diminutive of local Konrad {
	replace ameriname = "Konrad" if fname == "`diminutive'"
}

local Kristian `" "Kristiyan" "Kristijan" "Christen" "Christian" "Kresten" "Kristen" "Kristian" "Christiaan" "Kristjan" "Carsten" "Krisztián" "Kristján" "Cristiano" "Christianus" "Kristiāns" "Kristijonas" "Karsten" "Hristijan" "Krystian" "Krystyn" "Cristian" "Cristián" "'
foreach variant of local Kristian {
	replace ameriname = "Kristian" if fname == "`variant'"
}

local Kristian `" "Krsto" "Christer" "Kris" "Chris" "Cristi" "Krister" "'
foreach diminutive of local Kristian {
	replace ameriname = "Kristian" if fname == "`diminutive'"
}

local Kurt `" "Conrad" "Konrád" "Konrad" "Koenraad" "Curt" "Kurt" "Corrado" "Cord" "Kord" "Kondrat" "Conrado" "'
foreach variant of local Kurt {
	replace ameriname = "Kurt" if fname == "`variant'"
}

local Kurt `" "Dino" "Koen" "Koert" "Connie" "Corradino" "'
foreach diminutive of local Kurt {
	replace ameriname = "Kurt" if fname == "`diminutive'"
}

local Lajos `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Lajos {
	replace ameriname = "Lajos" if fname == "`variant'"
}

local Lajos `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Lajos {
	replace ameriname = "Lajos" if fname == "`diminutive'"
}

local Lars `" "Laurentius" "Llorenç" "Lovrenco" "Vavřinec" "Lars" "Laurits" "Lauritz" "Lorens" "Laurens" "Lourens" "Lauren" "Laurence" "Lawrence" "Laurent" "Laurenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Laurynas" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Lars {
	replace ameriname = "Lars" if fname == "`variant'"
}

local Lars `" "Lovre" "Lovro" "Lasse" "Lau" "Rens" "Larrie" "Larry" "Laurie" "Lawrie" "Laz" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Lenz" "Loris" "Renzo" "Lor" "Larkin" "Law" "'
foreach diminutive of local Lars {
	replace ameriname = "Lars" if fname == "`diminutive'"
}

local Lawrence `" "Laurentius" "Llorenç" "Lovrenco" "Vavřinec" "Lars" "Laurits" "Lauritz" "Lorens" "Laurens" "Lourens" "Lauren" "Laurence" "Lawrence" "Laurent" "Laurenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Laurynas" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Lawrence {
	replace ameriname = "Lawrence" if fname == "`variant'"
}

local Lawrence `" "Lovre" "Lovro" "Lasse" "Lau" "Rens" "Larrie" "Larry" "Laurie" "Lawrie" "Laz" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Lenz" "Loris" "Renzo" "Lor" "Larkin" "Law" "'
foreach diminutive of local Lawrence {
	replace ameriname = "Lawrence" if fname == "`diminutive'"
}

local Lazar `" "Eleazar" "Lazaros" "'El'azar" "Lazarus" "Lazar" "Lazare" "Lázár" "Lazzaro" "Elazar" "'
foreach variant of local Lazar {
	replace ameriname = "Lazar" if fname == "`variant'"
}

/*Lazar "No diminutives"*/

/*Leib "No equivalents"*/

/*Leib "No diminutives"*/

/*Leibe "No equivalents"*/

/*Leibe "No diminutives"*/

/*Leiser "No equivalents"*/

/*Leiser "No diminutives"*/

/*Leizer "No equivalents"*/

/*Leizer "No diminutives"*/

local Leo `" "Leon" "Leonidas" "Leontios" "Leontius" "Levon" "Leo" "Leoš" "Léo" "Léon" "Léonce" "Léonide" "Levan" "Leone" "Leonida" "Leonzio" "Leonas" "Lew" "Leonid" "Leonti" "Leontiy" "Leonty" "Lev" "Lyov" "León" "Leoncio" "'
foreach variant of local Leo {
	replace ameriname = "Leo" if fname == "`variant'"
}

local Leo `" "Lionel" "'
foreach diminutive of local Leo {
	replace ameriname = "Leo" if fname == "`diminutive'"
}

local Leon `" "Leon" "Leonidas" "Leontios" "Leontius" "Levon" "Leo" "Leoš" "Léo" "Léon" "Léonce" "Léonide" "Levan" "Leone" "Leonida" "Leonzio" "Leonas" "Lew" "Leonid" "Leonti" "Leontiy" "Leonty" "Lev" "Lyov" "León" "Leoncio" "'
foreach variant of local Leon {
	replace ameriname = "Leon" if fname == "`variant'"
}

local Leon `" "Lionel" "'
foreach diminutive of local Leon {
	replace ameriname = "Leon" if fname == "`diminutive'"
}

local Leonard `" "Leonard" "Lennart" "Lenard" "Lennard" "Léonard" "Leonhard" "Leonardo" "Lenart" "'
foreach variant of local Leonard {
	replace ameriname = "Leonard" if fname == "`variant'"
}

local Leonard `" "Len" "Lennie" "Lenny" "Lelle" "'
foreach diminutive of local Leonard {
	replace ameriname = "Leonard" if fname == "`diminutive'"
}

local Leonardo `" "Leonard" "Lennart" "Lenard" "Lennard" "Léonard" "Leonhard" "Leonardo" "Lenart" "'
foreach variant of local Leonardo {
	replace ameriname = "Leonardo" if fname == "`variant'"
}

local Leonardo `" "Len" "Lennie" "Lenny" "Lelle" "'
foreach diminutive of local Leonardo {
	replace ameriname = "Leonardo" if fname == "`diminutive'"
}

local Leopold `" "Leudbald" "Liupold" "Leopold" "Léopold" "Luitpold" "Leopoldo" "'
foreach variant of local Leopold {
	replace ameriname = "Leopold" if fname == "`variant'"
}

local Leopold `" "Poldi" "'
foreach diminutive of local Leopold {
	replace ameriname = "Leopold" if fname == "`diminutive'"
}

local Leopoldo `" "Leudbald" "Liupold" "Leopold" "Léopold" "Luitpold" "Leopoldo" "'
foreach variant of local Leopoldo {
	replace ameriname = "Leopoldo" if fname == "`variant'"
}

local Leopoldo `" "Poldi" "'
foreach diminutive of local Leopoldo {
	replace ameriname = "Leopoldo" if fname == "`diminutive'"
}

local Leslie `" "Lesleigh" "Lesley" "Leslie" "Lesly" "'
foreach variant of local Leslie {
	replace ameriname = "Leslie" if fname == "`variant'"
}

local Leslie `" "Lessie" "MASCULINE FORMS" "'
foreach diminutive of local Leslie {
	replace ameriname = "Leslie" if fname == "`diminutive'"
}

local Lewis `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Lewis {
	replace ameriname = "Lewis" if fname == "`variant'"
}

local Lewis `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Lewis {
	replace ameriname = "Lewis" if fname == "`diminutive'"
}

local Lorenzo `" "Laurentius" "Llorenç" "Lovrenco" "Vavřinec" "Lars" "Laurits" "Lauritz" "Lorens" "Laurens" "Lourens" "Lauren" "Laurence" "Lawrence" "Laurent" "Laurenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Laurynas" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Lorenzo {
	replace ameriname = "Lorenzo" if fname == "`variant'"
}

local Lorenzo `" "Lovre" "Lovro" "Lasse" "Lau" "Rens" "Larrie" "Larry" "Laurie" "Lawrie" "Laz" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Lenz" "Loris" "Renzo" "Lor" "Larkin" "Law" "'
foreach diminutive of local Lorenzo {
	replace ameriname = "Lorenzo" if fname == "`diminutive'"
}

local Loreto `" "Loreta" "Loreto" "Loretta" "'
foreach variant of local Loreto {
	replace ameriname = "Loreto" if fname == "`variant'"
}

/*Loreto "No diminutives"*/

local Louis `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Louis {
	replace ameriname = "Louis" if fname == "`variant'"
}

local Louis `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Louis {
	replace ameriname = "Louis" if fname == "`diminutive'"
}

local Luciano `" "Loukianos" "Lucianus" "Luken" "Lucijan" "Lucian" "Lucien" "Luciano" "Łucjan" "Lucjan" "'
foreach variant of local Luciano {
	replace ameriname = "Luciano" if fname == "`variant'"
}

/*Luciano "No diminutives"*/

local Ludwig `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Ludwig {
	replace ameriname = "Ludwig" if fname == "`variant'"
}

local Ludwig `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Ludwig {
	replace ameriname = "Ludwig" if fname == "`diminutive'"
}

local Ludwik `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Ludwik {
	replace ameriname = "Ludwik" if fname == "`variant'"
}

local Ludwik `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Ludwik {
	replace ameriname = "Ludwik" if fname == "`diminutive'"
}

local Luigi `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Luigi {
	replace ameriname = "Luigi" if fname == "`variant'"
}

local Luigi `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Luigi {
	replace ameriname = "Luigi" if fname == "`diminutive'"
}

local Luis `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Luis {
	replace ameriname = "Luis" if fname == "`variant'"
}

local Luis `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Luis {
	replace ameriname = "Luis" if fname == "`diminutive'"
}

local Manoel `" "Imanol" "Emmanouel" "Immanuel" "Emmanuhel" "Emmanuel" "Manel" "Emanuel" "Manuel" "Emmanouil" "Emánuel" "Emanuele" "Manuele" "Manoel" "'
foreach variant of local Manoel {
	replace ameriname = "Manoel" if fname == "`variant'"
}

local Manoel `" "Manny" "Manu" "Manouel" "Manuel" "Nelinho" "Manolo" "'
foreach diminutive of local Manoel {
	replace ameriname = "Manoel" if fname == "`diminutive'"
}

local Manuel `" "Imanol" "Emmanouel" "Immanuel" "Emmanuhel" "Emmanuel" "Manel" "Emanuel" "Emmanouil" "Emánuel" "Emanuele" "Manuele" "Manouel" "Manuel" "Manoel" "'
foreach variant of local Manuel {
	replace ameriname = "Manuel" if fname == "`variant'"
}

local Manuel `" "Manny" "Manuel" "Manu" "Nelinho" "Manolo" "'
foreach diminutive of local Manuel {
	replace ameriname = "Manuel" if fname == "`diminutive'"
}

local Marcel `" "Marcellus" "Martzel" "Marcel" "Marcell" "Marzell" "Marcello" "Marceli" "Marcelo" "'
foreach variant of local Marcel {
	replace ameriname = "Marcel" if fname == "`variant'"
}

local Marcel `" "Ceel" "Marcelinho" "'
foreach diminutive of local Marcel {
	replace ameriname = "Marcel" if fname == "`diminutive'"
}

local Marco `" "Markos" "Marcus" "Marko" "Mark" "Marc" "Margh" "Marek" "Markus" "Marco" "Markku" "Maleko" "Márk" "Marcas" "Markuss" "Marcos" "Mars" "'
foreach variant of local Marco {
	replace ameriname = "Marco" if fname == "`variant'"
}

local Marco `" "Marquinhos" "'
foreach diminutive of local Marco {
	replace ameriname = "Marco" if fname == "`diminutive'"
}

local Marcus `" "Markos" "Marcus" "Marko" "Mark" "Marc" "Margh" "Marek" "Markus" "Marco" "Markku" "Maleko" "Márk" "Marcas" "Markuss" "Marcos" "Mars" "'
foreach variant of local Marcus {
	replace ameriname = "Marcus" if fname == "`variant'"
}

local Marcus `" "Marquinhos" "'
foreach diminutive of local Marcus {
	replace ameriname = "Marcus" if fname == "`diminutive'"
}

local Maria `" "Mariam" "Maryam" "Maria" "Miren" "Maryia" "Miriam" "Mary" "Mari" "Mariya" "Mara" "Marija" "Marie" "Marja" "Marjo" "Mirjam" "Maleah" "Maralyn" "Maree" "Mariah" "Marilyn" "Marilynn" "Marlyn" "Marylyn" "Maura" "Merilyn" "Merrilyn" "Moira" "Mora" "Maarja" "Maaria" "Marjaana" "Mirjami" "Myriam" "María" "Mariami" "Meri" "Malia" "Mele" "Mariamne" "Mária" "Máire" "Moyra" "Marianna" "Moirrey" "Voirrey" "Mere" "Mariana" "Marya" "Márjá" "Màiri" "Meryem" "Mair" "Mairwen" "'
foreach variant of local Maria {
	replace ameriname = "Maria" if fname == "`variant'"
}

local Maria `" "Maia" "Mariona" "Ona" "Maja" "Mare" "Marica" "Marijeta" "Maša" "Mojca" "Madlenka" "Marika" "Máša" "Maiken" "Majken" "Marianne" "Mia" "Jet" "Maaike" "Manon" "Marieke" "Mariëlle" "Mariëtte" "Marijke" "Marijse" "Marike" "Mariska" "Marita" "Marjan" "Meike" "Mieke" "Miep" "Mies" "Ria" "Mae" "Mamie" "Marian" "Mariel" "Marinda" "Marion" "Maureen" "Maurene" "Maurine" "May" "Mayme" "Mimi" "Mo" "Mollie" "Molly" "Moreen" "Mya" "Pollie" "Polly" "Reenie" "Maarika" "Jaana" "Maija" "Mari" "Maritta" "Marjatta" "Marjukka" "Marjut" "Miia" "Mirja" "Marielle" "Mariette" "Marise" "Maike" "Mareike" "Mariele" "Mitzi" "Mæja" "Mairenn" "Máirín" "Mallaidh" "Mariella" "Marietta" "Malle" "Molle" "Maryla" "Marzena" "Marianita" "Mariazinha" "Manya" "Maryana" "Masha" "Maritza" "My" "Mirele" "'
foreach diminutive of local Maria {
	replace ameriname = "Maria" if fname == "`diminutive'"
}

local Mariano `" "Marianus" "Marijan" "Marjan" "Marián" "Marian" "Mariano" "Meirion" "Merrion" "'
foreach variant of local Mariano {
	replace ameriname = "Mariano" if fname == "`variant'"
}

/*Mariano "No diminutives"*/

local Marino `" "Marinus" "Marin" "Marijn" "Marinos" "Marino" "'
foreach variant of local Marino {
	replace ameriname = "Marino" if fname == "`variant'"
}

local Marino `" "Marinko" "Rien" "Rini" "Rinus" "Riny" "'
foreach diminutive of local Marino {
	replace ameriname = "Marino" if fname == "`diminutive'"
}

local Marinus `" "Marinus" "Marin" "Marijn" "Marinos" "Marino" "'
foreach variant of local Marinus {
	replace ameriname = "Marinus" if fname == "`variant'"
}

local Marinus `" "Marinko" "Rien" "Rini" "Rinus" "Riny" "'
foreach diminutive of local Marinus {
	replace ameriname = "Marinus" if fname == "`diminutive'"
}

local Mario `" "Marius" "Marijo" "Mario" "Marios" "Marijus" "Mariusz" "Mário" "Mars" "'
foreach variant of local Mario {
	replace ameriname = "Mario" if fname == "`variant'"
}

local Mario `" "Marinho" "'
foreach diminutive of local Mario {
	replace ameriname = "Mario" if fname == "`diminutive'"
}

local Marko `" "Markos" "Marcus" "Marko" "Mark" "Marc" "Margh" "Marek" "Markus" "Marco" "Markku" "Maleko" "Márk" "Marcas" "Markuss" "Marcos" "Mars" "'
foreach variant of local Marko {
	replace ameriname = "Marko" if fname == "`variant'"
}

local Marko `" "Marquinhos" "'
foreach diminutive of local Marko {
	replace ameriname = "Marko" if fname == "`diminutive'"
}

local Markus `" "Markos" "Marcus" "Marko" "Mark" "Marc" "Margh" "Marek" "Markus" "Marco" "Markku" "Maleko" "Márk" "Marcas" "Markuss" "Marcos" "Mars" "'
foreach variant of local Markus {
	replace ameriname = "Markus" if fname == "`variant'"
}

local Markus `" "Marquinhos" "'
foreach diminutive of local Markus {
	replace ameriname = "Markus" if fname == "`diminutive'"
}

local Martin `" "Martinus" "Mattin" "Martin" "Martí" "Morten" "Maarten" "Marten" "Martijn" "Martti" "Márton" "Máirtín" "Martino" "Martynas" "Merten" "Marcin" "Martim" "Martinho" "Mars" "Martín" "Mårten" "Martyn" "'
foreach variant of local Martin {
	replace ameriname = "Martin" if fname == "`variant'"
}

local Martin `" "Matxin" "Tin" "Tijn" "Martie" "Marty" "Tino" "Tine" "Tinek" "'
foreach diminutive of local Martin {
	replace ameriname = "Martin" if fname == "`diminutive'"
}

local Martino `" "Martinus" "Mattin" "Martin" "Martí" "Morten" "Maarten" "Marten" "Martijn" "Martti" "Márton" "Máirtín" "Martino" "Martynas" "Merten" "Marcin" "Martim" "Martinho" "Mars" "Martín" "Mårten" "Martyn" "'
foreach variant of local Martino {
	replace ameriname = "Martino" if fname == "`variant'"
}

local Martino `" "Matxin" "Tin" "Tijn" "Martie" "Marty" "Tino" "Tine" "Tinek" "'
foreach diminutive of local Martino {
	replace ameriname = "Martino" if fname == "`diminutive'"
}

/*Mate "No equivalents"*/

/*Mate "No diminutives"*/

local Mathias `" "Matia" "Matthaios" "Matthias" "Mattityahu" "Mattheus" "Matthew" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Mattithyahu" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Mathias {
	replace ameriname = "Mathias" if fname == "`variant'"
}

local Mathias `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Mathias {
	replace ameriname = "Mathias" if fname == "`diminutive'"
}

local Matteo `" "Matia" "Matthaios" "Matthias" "Mattityahu" "Mattheus" "Matthew" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Mattithyahu" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Matteo {
	replace ameriname = "Matteo" if fname == "`variant'"
}

local Matteo `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Matteo {
	replace ameriname = "Matteo" if fname == "`diminutive'"
}

local Matthew `" "Matia" "Matthaios" "Matthias" "Mattityahu" "Mattheus" "Matthew" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Mattithyahu" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Matthew {
	replace ameriname = "Matthew" if fname == "`variant'"
}

local Matthew `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Matthew {
	replace ameriname = "Matthew" if fname == "`diminutive'"
}

local Maurice `" "Maurits" "Maurice" "Morris" "Moritz" "Móric" "Muiris" "Maurizio" "Mauritius" "Maurycy" "Maurício" "Mauricio" "Meuric" "Meurig" "'
foreach variant of local Maurice {
	replace ameriname = "Maurice" if fname == "`variant'"
}

local Maurice `" "Mo" "Moe" "Mauri" "'
foreach diminutive of local Maurice {
	replace ameriname = "Maurice" if fname == "`diminutive'"
}

local Max `" "Maximilianus" "Maxmilián" "Max" "Maximilien" "Miksa" "Massimiliano" "Maksymilian" "Maximiliano" "Maksimilian" "Maximilián" "'
foreach variant of local Max {
	replace ameriname = "Max" if fname == "`variant'"
}

/*Max "No diminutives"*/

/*Mechel "No equivalents"*/

/*Mechel "No diminutives"*/

/*Meier "No equivalents"*/

/*Meier "No diminutives"*/

/*Meische "No equivalents"*/

/*Meische "No diminutives"*/

local Mendel `" "Manaem" "Menachem" "Manahem" "Menahem" "Mendel" "'
foreach variant of local Mendel {
	replace ameriname = "Mendel" if fname == "`variant'"
}

/*Mendel "No diminutives"*/

local Meyer `" "Meir" "Meyer" "'
foreach variant of local Meyer {
	replace ameriname = "Meyer" if fname == "`variant'"
}

/*Meyer "No diminutives"*/

local Michael `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michelangelo" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Miguelangel" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "Mihangel" "'
foreach variant of local Michael {
	replace ameriname = "Michael" if fname == "`variant'"
}

local Michael `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Michael {
	replace ameriname = "Michael" if fname == "`diminutive'"
}

local Michail `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Michail {
	replace ameriname = "Michail" if fname == "`variant'"
}

local Michail `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Michail {
	replace ameriname = "Michail" if fname == "`diminutive'"
}

/*Michal "No equivalents"*/

/*Michal "No diminutives"*/

local Michel `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mickaël" "Mikheil" "Michi" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Michel {
	replace ameriname = "Michel" if fname == "`variant'"
}

local Michel `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Michel {
	replace ameriname = "Michel" if fname == "`diminutive'"
}

local Michelangelo `" "Michelangelo" "Michele" "Miguelangel" "Mihangel" "'
foreach variant of local Michelangelo {
	replace ameriname = "Michelangelo" if fname == "`variant'"
}

/*Michelangelo "No diminutives"*/

/*Michele "No equivalents"*/

/*Michele "No diminutives"*/

local Miguel `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michelangelo" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "Mihangel" "'
foreach variant of local Miguel {
	replace ameriname = "Miguel" if fname == "`variant'"
}

local Miguel `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Miguel {
	replace ameriname = "Miguel" if fname == "`diminutive'"
}

/*Mihaly "No equivalents"*/

/*Mihaly "No diminutives"*/

/*Miklos "No equivalents"*/

/*Miklos "No diminutives"*/

local Milan `" "Milan" "Milen" "Milko" "Mile" "Miloš" "Milán" "Bogumil" "Miloje" "Milosh" "Miloslav" "Bogumił" "Miłosław" "Miłosz" "'
foreach variant of local Milan {
	replace ameriname = "Milan" if fname == "`variant'"
}

local Milan `" "Mijo" "Milenko" "Miljenko" "Milojica" "'
foreach diminutive of local Milan {
	replace ameriname = "Milan" if fname == "`diminutive'"
}

/*Moische "No equivalents"*/

/*Moische "No diminutives"*/

/*Moise "No equivalents"*/

/*Moise "No diminutives"*/

/*Mojsche "No equivalents"*/

/*Mojsche "No diminutives"*/

/*Mordche "No equivalents"*/

/*Mordche "No diminutives"*/

/*Morduch "No equivalents"*/

/*Morduch "No diminutives"*/

local Moritz `" "Maurits" "Maurice" "Morris" "Moritz" "Móric" "Muiris" "Maurizio" "Mauritius" "Maurycy" "Maurício" "Mauricio" "Meuric" "Meurig" "'
foreach variant of local Moritz {
	replace ameriname = "Moritz" if fname == "`variant'"
}

local Moritz `" "Mo" "Moe" "Mauri" "'
foreach diminutive of local Moritz {
	replace ameriname = "Moritz" if fname == "`diminutive'"
}

local Morris `" "Maurits" "Maurice" "Morris" "Moritz" "Móric" "Muiris" "Maurizio" "Mauritius" "Maurycy" "Maurício" "Mauricio" "Meuric" "Meurig" "'
foreach variant of local Morris {
	replace ameriname = "Morris" if fname == "`variant'"
}

local Morris `" "Mo" "Moe" "Mauri" "'
foreach diminutive of local Morris {
	replace ameriname = "Morris" if fname == "`diminutive'"
}

local Moses `" "Musa" "Mouses" "Moshe" "Moses" "Moyses" "Mozes" "Moss" "Moïse" "Mose" "Mózes" "Moysei" "Moisés" "Moisey" "'
foreach variant of local Moses {
	replace ameriname = "Moses" if fname == "`variant'"
}

/*Moses "No diminutives"*/

local Motel `" "Mordokhay" "Mordecai" "Mordikai" "Motel" "Motke" "'
foreach variant of local Motel {
	replace ameriname = "Motel" if fname == "`variant'"
}

/*Motel "No diminutives"*/

/*Mottel "No equivalents"*/

/*Mottel "No diminutives"*/

/*Nachman "No equivalents"*/

/*Nachman "No diminutives"*/

local Natale `" "Natale" "Natalius" "Natalio" "'
foreach variant of local Natale {
	replace ameriname = "Natale" if fname == "`variant'"
}

/*Natale "No diminutives"*/

local Nathan `" "Nathan" "Natan" "Nosson" "'
foreach variant of local Nathan {
	replace ameriname = "Nathan" if fname == "`variant'"
}

local Nathan `" "Nat" "'
foreach diminutive of local Nathan {
	replace ameriname = "Nathan" if fname == "`diminutive'"
}

/*Nicola "No equivalents"*/

/*Nicola "No diminutives"*/

local Nicolaos `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nicolaos {
	replace ameriname = "Nicolaos" if fname == "`variant'"
}

local Nicolaos `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nicolaos {
	replace ameriname = "Nicolaos" if fname == "`diminutive'"
}

local Nicolas `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nicolas {
	replace ameriname = "Nicolas" if fname == "`variant'"
}

local Nicolas `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nicolas {
	replace ameriname = "Nicolas" if fname == "`diminutive'"
}

/*Nicolo "No equivalents"*/

/*Nicolo "No diminutives"*/

/*Niels "No equivalents"*/

/*Niels "No diminutives"*/

/*Nikola "No equivalents"*/

/*Nikola "No diminutives"*/

local Nils `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Nicolaas" "Niek" "Nikolaas" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Niklas" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Kolos" "Miklós" "Miksa" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nikolaj" "Nicolao" "Nicolás" "Claes" "Klas" "Mykola" "'
foreach variant of local Nils {
	replace ameriname = "Nils" if fname == "`variant'"
}

local Nils `" "Colin" "Collin" "Launo" "'
foreach diminutive of local Nils {
	replace ameriname = "Nils" if fname == "`diminutive'"
}

/*Nochem "No equivalents"*/

/*Nochem "No diminutives"*/

local Norman `" "Norman" "'
foreach variant of local Norman {
	replace ameriname = "Norman" if fname == "`variant'"
}

local Norman `" "Norm" "'
foreach diminutive of local Norman {
	replace ameriname = "Norman" if fname == "`diminutive'"
}

local Nunzio `" "Nunzio" "'
foreach variant of local Nunzio {
	replace ameriname = "Nunzio" if fname == "`variant'"
}

/*Nunzio "No diminutives"*/

local Olaf `" "Áleifr" "Olaf" "Olav" "Oluf" "Olev" "Olavi" "Uolevi" "Ólafur" "Amhlaoibh" "Olavo" "Amhlaidh" "Aulay" "Olof" "Olov" "'
foreach variant of local Olaf {
	replace ameriname = "Olaf" if fname == "`variant'"
}

local Olaf `" "Ole" "Olli" "Ola" "Olle" "'
foreach diminutive of local Olaf {
	replace ameriname = "Olaf" if fname == "`diminutive'"
}

local Ole `" "Áleifr" "Ole" "Olaf" "Olev" "Olavi" "Olli" "Uolevi" "Ólafur" "Amhlaoibh" "Ola" "Olavo" "Amhlaidh" "Aulay" "Olle" "Olof" "Olov" "'
foreach variant of local Ole {
	replace ameriname = "Ole" if fname == "`variant'"
}

/*Ole "No diminutives"*/

local Olof `" "Áleifr" "Olaf" "Olav" "Oluf" "Olev" "Olavi" "Uolevi" "Ólafur" "Amhlaoibh" "Olavo" "Amhlaidh" "Aulay" "Olof" "Olov" "'
foreach variant of local Olof {
	replace ameriname = "Olof" if fname == "`variant'"
}

local Olof `" "Ole" "Olli" "Ola" "Olle" "'
foreach diminutive of local Olof {
	replace ameriname = "Olof" if fname == "`diminutive'"
}

/*Onofrio "No equivalents"*/

/*Onofrio "No diminutives"*/

local Orazio `" "Horatius" "Horace" "Horatio" "Orazio" "Horácio" "Horațiu" "Horacio" "'
foreach variant of local Orazio {
	replace ameriname = "Orazio" if fname == "`variant'"
}

/*Orazio "No diminutives"*/

/*Oreste "No equivalents"*/

/*Oreste "No diminutives"*/

local Orlando `" "Hrodland" "Roeland" "Roland" "Rolland" "Rowland" "Loránd" "Lóránt" "Orlando" "Rolando" "Roldão" "Rolan" "Roldán" "'
foreach variant of local Orlando {
	replace ameriname = "Orlando" if fname == "`variant'"
}

local Orlando `" "Roel" "Roly" "Rowley" "'
foreach diminutive of local Orlando {
	replace ameriname = "Orlando" if fname == "`diminutive'"
}

local Oscar `" "Òscar" "Oscar" "Oskar" "Oskari" "Oszkár" "Óskar" "Oskars" "Óscar" "'
foreach variant of local Oscar {
	replace ameriname = "Oscar" if fname == "`variant'"
}

local Oscar `" "Osku" "'
foreach diminutive of local Oscar {
	replace ameriname = "Oscar" if fname == "`diminutive'"
}

local Oskar `" "Òscar" "Oscar" "Oskar" "Oskari" "Oszkár" "Óskar" "Oskars" "Óscar" "'
foreach variant of local Oskar {
	replace ameriname = "Oskar" if fname == "`variant'"
}

local Oskar `" "Osku" "'
foreach diminutive of local Oskar {
	replace ameriname = "Oskar" if fname == "`diminutive'"
}

local Otto `" "Audo" "Odilo" "Odo" "Otto" "Odilon" "Udo" "Ottó" "Oddo" "Ottone" "Ode" "Eudes" "'
foreach variant of local Otto {
	replace ameriname = "Otto" if fname == "`variant'"
}

local Otto `" "Ottorino" "Rino" "'
foreach diminutive of local Otto {
	replace ameriname = "Otto" if fname == "`diminutive'"
}

local Pal `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Páll" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Pal {
	replace ameriname = "Pal" if fname == "`variant'"
}

local Pal `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Pal {
	replace ameriname = "Pal" if fname == "`diminutive'"
}

local Panagiotis `" "Panagiotis" "Panayiotis" "'
foreach variant of local Panagiotis {
	replace ameriname = "Panagiotis" if fname == "`variant'"
}

local Panagiotis `" "Panagiotakis" "Panos" "Takis" "'
foreach diminutive of local Panagiotis {
	replace ameriname = "Panagiotis" if fname == "`diminutive'"
}

local Paolo `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Páll" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Paolo {
	replace ameriname = "Paolo" if fname == "`variant'"
}

local Paolo `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Paolo {
	replace ameriname = "Paolo" if fname == "`diminutive'"
}

local Pasquale `" "Paskal" "Pasco" "Paškal" "Pascal" "Paschal" "Pasquale" "Paschalis" "Pascual" "'
foreach variant of local Pasquale {
	replace ameriname = "Pasquale" if fname == "`variant'"
}

local Pasquale `" "Paško" "Pasqualino" "'
foreach diminutive of local Pasquale {
	replace ameriname = "Pasquale" if fname == "`diminutive'"
}

local Patrick `" "Padrig" "Patrik" "Patrick" "Patrice" "Pádraic" "Pádraig" "Patrizio" "Patricius" "Pherick" "Patariki" "Patryk" "Patrício" "Pàdraig" "Patricio" "'
foreach variant of local Patrick {
	replace ameriname = "Patrick" if fname == "`variant'"
}

local Patrick `" "Pat" "Patsy" "Paddy" "Pate" "'
foreach diminutive of local Patrick {
	replace ameriname = "Patrick" if fname == "`diminutive'"
}

local Paul `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Páll" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Paul {
	replace ameriname = "Paul" if fname == "`variant'"
}

local Paul `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Paul {
	replace ameriname = "Paul" if fname == "`diminutive'"
}

local Pavel `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Páll" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Pavel {
	replace ameriname = "Pavel" if fname == "`variant'"
}

local Pavel `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Pavel {
	replace ameriname = "Pavel" if fname == "`diminutive'"
}

/*Pawel "No equivalents"*/

/*Pawel "No diminutives"*/

local Peder `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Peder {
	replace ameriname = "Peder" if fname == "`variant'"
}

local Peder `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Peder {
	replace ameriname = "Peder" if fname == "`diminutive'"
}

local Pedro `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Pedro {
	replace ameriname = "Pedro" if fname == "`variant'"
}

local Pedro `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Pedro {
	replace ameriname = "Pedro" if fname == "`diminutive'"
}

local Pellegrino `" "Peregrine" "Pellegrino" "'
foreach variant of local Pellegrino {
	replace ameriname = "Pellegrino" if fname == "`variant'"
}

/*Pellegrino "No diminutives"*/

local Per `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peio" "Peru" "Petri" "Petrus" "Peter" "Per" "Penko" "Petar" "Pere" "Petru" "Pejo" "Perica" "Pero" "Petr" "Peer" "Pier" "Piet" "Pieter" "Piers" "Peers" "Pete" "Petro" "Peeter" "Pekka" "Petteri" "Pietari" "Pierre" "Pierrick" "Pitter" "Petre" "Pika" "Péter" "Peti" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Pit" "Petras" "Pece" "Petera" "Petruccio" "Pèire" "Piotr" "Pedrinho" "Pedro" "Petrica" "Petia" "Petya" "Pyotr" "Pehr" "Pedr" "'
foreach variant of local Per {
	replace ameriname = "Per" if fname == "`variant'"
}

local Per `" "Perig" "Pierrick" "Pelle" "'
foreach diminutive of local Per {
	replace ameriname = "Per" if fname == "`diminutive'"
}

local Percy `" "Perceval" "Percival" "Percy" "Parsifal" "'
foreach variant of local Percy {
	replace ameriname = "Percy" if fname == "`variant'"
}

local Percy `" "Perce" "'
foreach diminutive of local Percy {
	replace ameriname = "Percy" if fname == "`diminutive'"
}

local Petar `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Petar {
	replace ameriname = "Petar" if fname == "`variant'"
}

local Petar `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Petar {
	replace ameriname = "Petar" if fname == "`diminutive'"
}

local Peter `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Peter {
	replace ameriname = "Peter" if fname == "`variant'"
}

local Peter `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Peter {
	replace ameriname = "Peter" if fname == "`diminutive'"
}

local Petro `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Petro {
	replace ameriname = "Petro" if fname == "`variant'"
}

local Petro `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Petro {
	replace ameriname = "Petro" if fname == "`diminutive'"
}

local Petrus `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Petrus {
	replace ameriname = "Petrus" if fname == "`variant'"
}

local Petrus `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Petrus {
	replace ameriname = "Petrus" if fname == "`diminutive'"
}

local Philip `" "Philippos" "Philippus" "Philip" "Filip" "Felip" "Filippus" "Phillip" "Vilppu" "Philippe" "Philipp" "Filippos" "Fülöp" "Pilib" "Filippo" "Filips" "Pilypas" "Piripi" "Filippu" "Felipe" "Filipe" "Filipp" "Filib" "Pylyp" "'
foreach variant of local Philip {
	replace ameriname = "Philip" if fname == "`variant'"
}

local Philip `" "Flip" "Phil" "Pip" "Felipinho" "'
foreach diminutive of local Philip {
	replace ameriname = "Philip" if fname == "`diminutive'"
}

local Pierre `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Pierre {
	replace ameriname = "Pierre" if fname == "`variant'"
}

local Pierre `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Pierre {
	replace ameriname = "Pierre" if fname == "`diminutive'"
}

local Pieter `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Pieter {
	replace ameriname = "Pieter" if fname == "`variant'"
}

local Pieter `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Pieter {
	replace ameriname = "Pieter" if fname == "`diminutive'"
}

local Pietro `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Pietro {
	replace ameriname = "Pietro" if fname == "`variant'"
}

local Pietro `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Pietro {
	replace ameriname = "Pietro" if fname == "`diminutive'"
}

local Piotr `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Piotr {
	replace ameriname = "Piotr" if fname == "`variant'"
}

local Piotr `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Piotr {
	replace ameriname = "Piotr" if fname == "`diminutive'"
}

local Primo `" "Primo" "Primus" "Primož" "'
foreach variant of local Primo {
	replace ameriname = "Primo" if fname == "`variant'"
}

/*Primo "No diminutives"*/

local Rafael `" "Raphael" "Rafa'el" "Rafaël" "Raphaël" "Rafael" "Raffael" "Raffaele" "Raffaello" "Rafał" "'
foreach variant of local Rafael {
	replace ameriname = "Rafael" if fname == "`variant'"
}

local Rafael `" "Raf" "Rafinha" "Rafa" "'
foreach diminutive of local Rafael {
	replace ameriname = "Rafael" if fname == "`diminutive'"
}

local Raffaele `" "Raphael" "Rafa'el" "Rafaël" "Raphaël" "Rafael" "Raffael" "Raffaele" "Raffaello" "Rafał" "'
foreach variant of local Raffaele {
	replace ameriname = "Raffaele" if fname == "`variant'"
}

local Raffaele `" "Raf" "Rafinha" "Rafa" "'
foreach diminutive of local Raffaele {
	replace ameriname = "Raffaele" if fname == "`diminutive'"
}

local Ralph `" "Radulf" "Ráðúlfr" "Ralf" "Ralph" "Rafe" "Raoul" "Raul" "Raúl" "'
foreach variant of local Ralph {
	replace ameriname = "Ralph" if fname == "`variant'"
}

local Ralph `" "Ralphie" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Ralph {
	replace ameriname = "Ralph" if fname == "`diminutive'"
}

local Ramon `" "Raginmund" "Raimund" "Erramun" "Ramon" "Raymond" "Raymund" "Raimo" "Reima" "Reimund" "Réamann" "Redmond" "Redmund" "Raimondo" "Raimonds" "Remao" "Raimondas" "Rajmund" "Raymundo" "Raimundo" "Ramón" "'
foreach variant of local Ramon {
	replace ameriname = "Ramon" if fname == "`variant'"
}

local Ramon `" "Ray" "Mao" "'
foreach diminutive of local Ramon {
	replace ameriname = "Ramon" if fname == "`diminutive'"
}

local Raymond `" "Raginmund" "Raimund" "Erramun" "Ramon" "Raymond" "Raymund" "Raimo" "Reima" "Reimund" "Réamann" "Redmond" "Redmund" "Raimondo" "Raimonds" "Remao" "Raimondas" "Rajmund" "Raymundo" "Raimundo" "Ramón" "'
foreach variant of local Raymond {
	replace ameriname = "Raymond" if fname == "`variant'"
}

local Raymond `" "Ray" "Mao" "'
foreach diminutive of local Raymond {
	replace ameriname = "Raymond" if fname == "`diminutive'"
}

local Reginald `" "Raginald" "Reinald" "Reinhold" "Ragnvaldr" "Ragnvald" "Reinoud" "Reinout" "Reginald" "Reynold" "Ronald" "Reino" "Renaud" "Reynaud" "Raghnall" "Rinaldo" "Reinaldo" "Reynaldo" "Ronaldo" "Ranald" "Rheinallt" "'
foreach variant of local Reginald {
	replace ameriname = "Reginald" if fname == "`variant'"
}

local Reginald `" "Reg" "Reggie" "Ron" "Ronnie" "Ronny" "'
foreach diminutive of local Reginald {
	replace ameriname = "Reginald" if fname == "`diminutive'"
}

local Reinhold `" "Raginald" "Reinald" "Reinhold" "Ragnvaldr" "Ragnvald" "Reinoud" "Reinout" "Reginald" "Reynold" "Ronald" "Reino" "Renaud" "Reynaud" "Raghnall" "Rinaldo" "Reinaldo" "Reynaldo" "Ronaldo" "Ranald" "Rheinallt" "'
foreach variant of local Reinhold {
	replace ameriname = "Reinhold" if fname == "`variant'"
}

local Reinhold `" "Reg" "Reggie" "Ron" "Ronnie" "Ronny" "'
foreach diminutive of local Reinhold {
	replace ameriname = "Reinhold" if fname == "`diminutive'"
}

local Renato `" "Rinat" "Renato" "René" "Rene" "Renatus" "Renat" "'
foreach variant of local Renato {
	replace ameriname = "Renato" if fname == "`variant'"
}

/*Renato "No diminutives"*/

local Rene `" "Rinat" "Renata" "Renato" "Renáta" "René" "Renate" "Renée" "Reene" "Reenie" "Rena" "Renae" "Rene" "Renee" "Renita" "Renatus" "Renat" "'
foreach variant of local Rene {
	replace ameriname = "Rene" if fname == "`variant'"
}

local Rene `" "Renie" "Renia" "MASCULINE FORMS" "Rinat" "Renato" "René" "Renatus" "Renat" "'
foreach diminutive of local Rene {
	replace ameriname = "Rene" if fname == "`diminutive'"
}

local Ricardo `" "Richard" "Ricohard" "Ricard" "Rikard" "Rikhard" "Richárd" "Rikárd" "Risteárd" "Riccardo" "Rihards" "Ričardas" "Ryszard" "Ricardo" "Rihard" "Rhisiart" "'
foreach variant of local Ricardo {
	replace ameriname = "Ricardo" if fname == "`variant'"
}

local Ricardo `" "Dick" "Rich" "Richie" "Rick" "Rickey" "Ricki" "Rickie" "Ricky" "Ritchie" "Riku" "Dicun" "Hudde" "Riško" "Rišo" "Rico" "'
foreach diminutive of local Ricardo {
	replace ameriname = "Ricardo" if fname == "`diminutive'"
}

local Riccardo `" "Richard" "Ricohard" "Ricard" "Rikard" "Rikhard" "Richárd" "Rikárd" "Risteárd" "Riccardo" "Rihards" "Ričardas" "Ryszard" "Ricardo" "Rihard" "Rhisiart" "'
foreach variant of local Riccardo {
	replace ameriname = "Riccardo" if fname == "`variant'"
}

local Riccardo `" "Dick" "Rich" "Richie" "Rick" "Rickey" "Ricki" "Rickie" "Ricky" "Ritchie" "Riku" "Dicun" "Hudde" "Riško" "Rišo" "Rico" "'
foreach diminutive of local Riccardo {
	replace ameriname = "Riccardo" if fname == "`diminutive'"
}

local Richard `" "Richard" "Ricohard" "Ricard" "Rikard" "Rikhard" "Richárd" "Rikárd" "Risteárd" "Riccardo" "Rihards" "Ričardas" "Ryszard" "Ricardo" "Rihard" "Rhisiart" "'
foreach variant of local Richard {
	replace ameriname = "Richard" if fname == "`variant'"
}

local Richard `" "Dick" "Rich" "Richie" "Rick" "Rickey" "Ricki" "Rickie" "Ricky" "Ritchie" "Riku" "Dicun" "Hudde" "Riško" "Rišo" "Rico" "'
foreach diminutive of local Richard {
	replace ameriname = "Richard" if fname == "`diminutive'"
}

local Robert `" "Hrodebert" "Hrodpreht" "Robert" "Roparzh" "Robrecht" "Rupert" "Roopertti" "Róbert" "Roibeárd" "Roberto" "Roberts" "Robertas" "Ruprecht" "Raibeart" "Ruperto" "'
foreach variant of local Robert {
	replace ameriname = "Robert" if fname == "`variant'"
}

local Robert `" "Bob" "Brecht" "Rob" "Robbe" "Robin" "Bobbie" "Bobby" "Robbie" "Robby" "Pertti" "Roope" "Robi" "Hob" "Hopkin" "Rab" "Rabbie" "Hopcyn" "'
foreach diminutive of local Robert {
	replace ameriname = "Robert" if fname == "`diminutive'"
}

local Roberto `" "Hrodebert" "Hrodpreht" "Robert" "Roparzh" "Robrecht" "Rupert" "Roopertti" "Róbert" "Roibeárd" "Roberto" "Roberts" "Robertas" "Ruprecht" "Raibeart" "Ruperto" "'
foreach variant of local Roberto {
	replace ameriname = "Roberto" if fname == "`variant'"
}

local Roberto `" "Bob" "Brecht" "Rob" "Robbe" "Robin" "Bobbie" "Bobby" "Robbie" "Robby" "Pertti" "Roope" "Robi" "Hob" "Hopkin" "Rab" "Rabbie" "Hopcyn" "'
foreach diminutive of local Roberto {
	replace ameriname = "Roberto" if fname == "`diminutive'"
}

/*Robt "No equivalents"*/

/*Robt "No diminutives"*/

local Rocco `" "Rocco" "Rochus" "Roc" "Roko" "Rokus" "Roch" "Roque" "Rok" "'
foreach variant of local Rocco {
	replace ameriname = "Rocco" if fname == "`variant'"
}

local Rocco `" "Rocky" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Rocco {
	replace ameriname = "Rocco" if fname == "`diminutive'"
}

local Rodolfo `" "Hrodulf" "Hrolf" "Hrólfr" "Hróðólfr" "Hroðulf" "Hrothulf" "Rudolf" "Rolf" "Rodolf" "Roelof" "Rodolph" "Rollo" "Rolo" "Rolph" "Rudolph" "Rodolphe" "Rodolfo" "Roul" "'
foreach variant of local Rodolfo {
	replace ameriname = "Rodolfo" if fname == "`variant'"
}

local Rodolfo `" "Roel" "Ruud" "Rudy" "Ruedi" "Rudi" "Fito" "Rodolfito" "'
foreach diminutive of local Rodolfo {
	replace ameriname = "Rodolfo" if fname == "`diminutive'"
}

local Roger `" "Hrodger" "Hróarr" "Hróðgeirr" "Hroðgar" "Hrothgar" "Roger" "Rogier" "Rutger" "Rodger" "Rüdiger" "Ruggero" "Ruggiero" "Roar" "Rogério" "'
foreach variant of local Roger {
	replace ameriname = "Roger" if fname == "`variant'"
}

local Roger `" "Rodge" "'
foreach diminutive of local Roger {
	replace ameriname = "Roger" if fname == "`diminutive'"
}

local Rolf `" "Hrodulf" "Hrolf" "Hrólfr" "Hróðólfr" "Hroðulf" "Hrothulf" "Rudolf" "Rolf" "Rodolf" "Roelof" "Rodolph" "Rollo" "Rolo" "Rolph" "Rudolph" "Rodolphe" "Rodolfo" "Roul" "'
foreach variant of local Rolf {
	replace ameriname = "Rolf" if fname == "`variant'"
}

local Rolf `" "Roel" "Ruud" "Rudy" "Ruedi" "Rudi" "Fito" "Rodolfito" "'
foreach diminutive of local Rolf {
	replace ameriname = "Rolf" if fname == "`diminutive'"
}

local Roman `" "Romà" "Roman" "Romain" "Román" "Romano" "Romeo" "Romolo" "Romaeus" "Romanus" "Romulus" "'
foreach variant of local Roman {
	replace ameriname = "Roman" if fname == "`variant'"
}

local Roman `" "Roma" "'
foreach diminutive of local Roman {
	replace ameriname = "Roman" if fname == "`diminutive'"
}

local Ronald `" "Raginald" "Reinald" "Reinhold" "Ragnvaldr" "Ragnvald" "Reinoud" "Reinout" "Reginald" "Reynold" "Ronald" "Reino" "Renaud" "Reynaud" "Raghnall" "Rinaldo" "Reinaldo" "Reynaldo" "Ronaldo" "Ranald" "Rheinallt" "'
foreach variant of local Ronald {
	replace ameriname = "Ronald" if fname == "`variant'"
}

local Ronald `" "Reg" "Reggie" "Ron" "Ronnie" "Ronny" "'
foreach diminutive of local Ronald {
	replace ameriname = "Ronald" if fname == "`diminutive'"
}

local Rosario `" "Roser" "Rosario" "Rosário" "'
foreach variant of local Rosario {
	replace ameriname = "Rosario" if fname == "`variant'"
}

local Rosario `" "Charo" "'
foreach diminutive of local Rosario {
	replace ameriname = "Rosario" if fname == "`diminutive'"
}

local Roy `" "Roy" "Ruadh" "'
foreach variant of local Roy {
	replace ameriname = "Roy" if fname == "`variant'"
}

local Roy `" "Ruadhán" "'
foreach diminutive of local Roy {
	replace ameriname = "Roy" if fname == "`diminutive'"
}

/*Rubin "No equivalents"*/

/*Rubin "No diminutives"*/

local Rudolf `" "Hrodulf" "Hrolf" "Hrólfr" "Hróðólfr" "Hroðulf" "Hrothulf" "Rudolf" "Rolf" "Rodolf" "Roelof" "Rodolph" "Rollo" "Rolo" "Rolph" "Rudolph" "Rodolphe" "Rodolfo" "Roul" "'
foreach variant of local Rudolf {
	replace ameriname = "Rudolf" if fname == "`variant'"
}

local Rudolf `" "Roel" "Ruud" "Rudy" "Ruedi" "Rudi" "Fito" "Rodolfito" "'
foreach diminutive of local Rudolf {
	replace ameriname = "Rudolf" if fname == "`diminutive'"
}

/*Sabatino "No equivalents"*/

/*Sabatino "No diminutives"*/

/*Sabato "No equivalents"*/

/*Sabato "No diminutives"*/

local Salomon `" "Sulaiman" "Sulayman" "Salomon" "Shelomoh" "Solomon" "Shlomo" "Suleiman" "Salamon" "Salomão" "Salomón" "Süleyman" "Zalman" "'
foreach variant of local Salomon {
	replace ameriname = "Salomon" if fname == "`variant'"
}

local Salomon `" "Suljo" "Sol" "'
foreach diminutive of local Salomon {
	replace ameriname = "Salomon" if fname == "`diminutive'"
}

local Salvatore `" "Salvatore" "Salvator" "Salvador" "'
foreach variant of local Salvatore {
	replace ameriname = "Salvatore" if fname == "`variant'"
}

local Salvatore `" "Sal" "Tore" "'
foreach diminutive of local Salvatore {
	replace ameriname = "Salvatore" if fname == "`diminutive'"
}

/*Sam "No equivalents"*/

/*Sam "No diminutives"*/

local Samuel `" "Samouel" "Shemu'el" "Samuhel" "Samuel" "Samuil" "Samuli" "Shmuel" "Sámuel" "Samuele" "Samoil" "Samuilu" "Sawyl" "'
foreach variant of local Samuel {
	replace ameriname = "Samuel" if fname == "`variant'"
}

local Samuel `" "Sam" "Sammie" "Sammy" "Sami" "Samppa" "Samu" "'
foreach diminutive of local Samuel {
	replace ameriname = "Samuel" if fname == "`diminutive'"
}

/*Sandor "No equivalents"*/

/*Sandor "No diminutives"*/

local Santo `" "Santo" "'
foreach variant of local Santo {
	replace ameriname = "Santo" if fname == "`variant'"
}

local Santo `" "Santino" "'
foreach diminutive of local Santo {
	replace ameriname = "Santo" if fname == "`diminutive'"
}

local Saverio `" "Xabier" "Xavier" "Saveriu" "Xavior" "Xzavier" "Zavier" "Xaver" "Saverio" "Ksawery" "Javier" "'
foreach variant of local Saverio {
	replace ameriname = "Saverio" if fname == "`variant'"
}

local Saverio `" "Xabi" "Xavi" "'
foreach diminutive of local Saverio {
	replace ameriname = "Saverio" if fname == "`diminutive'"
}

/*Schaje "No equivalents"*/

/*Schaje "No diminutives"*/

/*Schloime "No equivalents"*/

/*Schloime "No diminutives"*/

/*Schmiel "No equivalents"*/

/*Schmiel "No diminutives"*/

/*Schmuel "No equivalents"*/

/*Schmuel "No diminutives"*/

/*Schmul "No equivalents"*/

/*Schmul "No diminutives"*/

/*Scholem "No equivalents"*/

/*Scholem "No diminutives"*/

local Sebastiano `" "Sebastijan" "Sebastian" "Sebastiaan" "Sébastien" "Sebestyén" "Sebastiano" "Sebastianus" "Sebastião" "Sevastian" "Sevastyan" "Sebastjan" "Sebastián" "'
foreach variant of local Sebastiano {
	replace ameriname = "Sebastiano" if fname == "`variant'"
}

local Sebastiano `" "Bas" "Bastiaan" "Sepi" "Seppo" "Bastien" "Bastian" "Boštjan" "'
foreach diminutive of local Sebastiano {
	replace ameriname = "Sebastiano" if fname == "`diminutive'"
}

local Selig `" "Selig" "Zelig" "'
foreach variant of local Selig {
	replace ameriname = "Selig" if fname == "`variant'"
}

/*Selig "No diminutives"*/

local Serafino `" "Séraphin" "Serafeim" "Serafino" "Seraphinus" "Serafim" "Serafin" "'
foreach variant of local Serafino {
	replace ameriname = "Serafino" if fname == "`variant'"
}

/*Serafino "No diminutives"*/

local Sidney `" "Sidney" "'
foreach variant of local Sidney {
	replace ameriname = "Sidney" if fname == "`variant'"
}

local Sidney `" "Sid" "'
foreach diminutive of local Sidney {
	replace ameriname = "Sidney" if fname == "`diminutive'"
}

local Sigmund `" "Sigimund" "Sigismund" "Sigmundr" "Zikmund" "Sigmund" "Siegmund" "Zsigmond" "Zygmunt" "Žigmund" "'
foreach variant of local Sigmund {
	replace ameriname = "Sigmund" if fname == "`variant'"
}

local Sigmund `" "Zsiga" "Žiga" "'
foreach diminutive of local Sigmund {
	replace ameriname = "Sigmund" if fname == "`diminutive'"
}

local Sigurd `" "Sigiward" "Siward" "Sigurðr" "Sigeweard" "Sigurd" "Sieuwerd" "Sjoerd" "Siegward" "Sigurður" "Sjurd" "Sigvard" "'
foreach variant of local Sigurd {
	replace ameriname = "Sigurd" if fname == "`variant'"
}

/*Sigurd "No diminutives"*/

local Silvio `" "Silvijo" "Silvio" "Silvius" "Silviu" "'
foreach variant of local Silvio {
	replace ameriname = "Silvio" if fname == "`variant'"
}

/*Silvio "No diminutives"*/

/*Simche "No equivalents"*/

/*Simche "No diminutives"*/

local Simon `" "Ximun" "Simon" "Symeon" "Shimon" "Simeon" "Šimun" "Šimon" "Siemen" "Simo" "Simoni" "Simone" "Simonas" "Ximeno" "Simen" "Simonu" "Symeonu" "Szymon" "Simão" "Simion" "Semen" "Semyon" "Jimeno" "Simón" "Symon" "'
foreach variant of local Simon {
	replace ameriname = "Simon" if fname == "`variant'"
}

local Simon `" "Šime" "Šimo" "Siem" "Sime" "Simo" "Shimmel" "'
foreach diminutive of local Simon {
	replace ameriname = "Simon" if fname == "`diminutive'"
}

local Solomon `" "Sulaiman" "Sulayman" "Salomon" "Shelomoh" "Solomon" "Shlomo" "Suleiman" "Salamon" "Salomão" "Salomón" "Süleyman" "Zalman" "'
foreach variant of local Solomon {
	replace ameriname = "Solomon" if fname == "`variant'"
}

local Solomon `" "Suljo" "Sol" "'
foreach diminutive of local Solomon {
	replace ameriname = "Solomon" if fname == "`diminutive'"
}

/*Srul "No equivalents"*/

/*Srul "No diminutives"*/

/*Stanislaus "No equivalents"*/

/*Stanislaus "No diminutives"*/

/*Stanislaw "No equivalents"*/

/*Stanislaw "No diminutives"*/

local Stanley `" "Stanley" "'
foreach variant of local Stanley {
	replace ameriname = "Stanley" if fname == "`variant'"
}

local Stanley `" "Stan" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Stanley {
	replace ameriname = "Stanley" if fname == "`diminutive'"
}

local Stavros `" "Stavros" "'
foreach variant of local Stavros {
	replace ameriname = "Stavros" if fname == "`variant'"
}

/*Stavros "No diminutives"*/

local Stefan `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stefan {
	replace ameriname = "Stefan" if fname == "`variant'"
}

local Stefan `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Stefan {
	replace ameriname = "Stefan" if fname == "`diminutive'"
}

local Stefano `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stefano {
	replace ameriname = "Stefano" if fname == "`variant'"
}

local Stefano `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Stefano {
	replace ameriname = "Stefano" if fname == "`diminutive'"
}

local Stephen `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stephen {
	replace ameriname = "Stephen" if fname == "`variant'"
}

local Stephen `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Stephen {
	replace ameriname = "Stephen" if fname == "`diminutive'"
}

local Sven `" "Sveinn" "Sven" "Svend" "Soini" "Svein" "'
foreach variant of local Sven {
	replace ameriname = "Sven" if fname == "`variant'"
}

/*Sven "No diminutives"*/

local Sydney `" "Cydney" "Sydne" "Sydney" "Sydnie" "MASCULINE FORMS" "Syd" "'
foreach variant of local Sydney {
	replace ameriname = "Sydney" if fname == "`variant'"
}

/*Sydney "No diminutives"*/

local Teodor `" "Tewodros" "Theodoros" "Theodorus" "Toros" "Teodor" "Todor" "Theodor" "Theodoor" "Theodore" "Théodore" "Tedore" "Tivadar" "Tódor" "Teodoro" "Teodors" "Tudor" "Fedor" "Feodor" "Fyodor" "Fedir" "'
foreach variant of local Teodor {
	replace ameriname = "Teodor" if fname == "`variant'"
}

local Teodor `" "Teo" "Theo" "Ted" "Teddy" "Teuvo" "Théo" "Thei" "Toše" "Toshe" "Téo" "Fedya" "'
foreach diminutive of local Teodor {
	replace ameriname = "Teodor" if fname == "`diminutive'"
}

local Theodor `" "Tewodros" "Theodoros" "Theodorus" "Toros" "Teodor" "Todor" "Theodor" "Theodoor" "Theodore" "Théodore" "Tedore" "Tivadar" "Tódor" "Teodoro" "Teodors" "Tudor" "Fedor" "Feodor" "Fyodor" "Fedir" "'
foreach variant of local Theodor {
	replace ameriname = "Theodor" if fname == "`variant'"
}

local Theodor `" "Teo" "Theo" "Ted" "Teddy" "Teuvo" "Théo" "Thei" "Toše" "Toshe" "Téo" "Fedya" "'
foreach diminutive of local Theodor {
	replace ameriname = "Theodor" if fname == "`diminutive'"
}

local Theodoros `" "Tewodros" "Theodoros" "Theodorus" "Toros" "Teodor" "Todor" "Theodor" "Theodoor" "Theodore" "Théodore" "Tedore" "Tivadar" "Tódor" "Teodoro" "Teodors" "Tudor" "Fedor" "Feodor" "Fyodor" "Fedir" "'
foreach variant of local Theodoros {
	replace ameriname = "Theodoros" if fname == "`variant'"
}

local Theodoros `" "Teo" "Theo" "Ted" "Teddy" "Teuvo" "Théo" "Thei" "Toše" "Toshe" "Téo" "Fedya" "'
foreach diminutive of local Theodoros {
	replace ameriname = "Theodoros" if fname == "`diminutive'"
}

local Thomas `" "Te'oma" "Thomas" "Toma" "Tomàs" "Tomo" "Tomáš" "Toomas" "Tuomas" "Tuomo" "Tamás" "Tómas" "Tomás" "Tommaso" "Toms" "Tomas" "Tamati" "Thoma" "Tomasz" "Tomé" "Foma" "Tàmhas" "Tavish" "Tòmas" "Tomaž" "Tomos" "'
foreach variant of local Thomas {
	replace ameriname = "Thomas" if fname == "`variant'"
}

local Thomas `" "Tomica" "Maas" "Tom" "Thom" "Tommie" "Tommy" "Tomi" "Tommi" "Tomek" "Tam" "Twm" "'
foreach diminutive of local Thomas {
	replace ameriname = "Thomas" if fname == "`diminutive'"
}

/*Thos "No equivalents"*/

/*Thos "No diminutives"*/

/*Tom "No equivalents"*/

/*Tom "No diminutives"*/

local Tomas `" "Te'oma" "Thomas" "Toma" "Tomàs" "Tomo" "Tomáš" "Toomas" "Tuomas" "Tuomo" "Tamás" "Tómas" "Tomás" "Tommaso" "Toms" "Tomas" "Tamati" "Thoma" "Tomasz" "Tomé" "Foma" "Tàmhas" "Tavish" "Tòmas" "Tomaž" "Tomos" "'
foreach variant of local Tomas {
	replace ameriname = "Tomas" if fname == "`variant'"
}

local Tomas `" "Tomica" "Maas" "Tom" "Thom" "Tommie" "Tommy" "Tomi" "Tommi" "Tomek" "Tam" "Twm" "'
foreach diminutive of local Tomas {
	replace ameriname = "Tomas" if fname == "`diminutive'"
}

local Tommaso `" "Te'oma" "Thomas" "Toma" "Tomàs" "Tomo" "Tomáš" "Toomas" "Tuomas" "Tuomo" "Tamás" "Tómas" "Tomás" "Tommaso" "Toms" "Tomas" "Tamati" "Thoma" "Tomasz" "Tomé" "Foma" "Tàmhas" "Tavish" "Tòmas" "Tomaž" "Tomos" "'
foreach variant of local Tommaso {
	replace ameriname = "Tommaso" if fname == "`variant'"
}

local Tommaso `" "Tomica" "Maas" "Tom" "Thom" "Tommie" "Tommy" "Tomi" "Tommi" "Tomek" "Tam" "Twm" "'
foreach diminutive of local Tommaso {
	replace ameriname = "Tommaso" if fname == "`diminutive'"
}

local Ugo `" "Hugo" "Huguo" "Hugh" "Hugues" "Ugo" "Huw" "'
foreach variant of local Ugo {
	replace ameriname = "Ugo" if fname == "`variant'"
}

local Ugo `" "Hewie" "Huey" "Hughie" "Hudde" "Shug" "'
foreach diminutive of local Ugo {
	replace ameriname = "Ugo" if fname == "`diminutive'"
}

local Umberto `" "Humbert" "Hunberct" "'
foreach variant of local Umberto {
	replace ameriname = "Umberto" if fname == "`variant'"
}

/*Umberto "No diminutives"*/

/*Vaclav "No equivalents"*/

/*Vaclav "No diminutives"*/

local Valentino `" "Valentinus" "Balendin" "Valentin" "Valentijn" "Valentine" "Bálint" "Valentino" "Walenty" "Ualan" "Valentín" "Valentyn" "Folant" "'
foreach variant of local Valentino {
	replace ameriname = "Valentino" if fname == "`variant'"
}

local Valentino `" "Tin" "Valent" "Val" "Tino" "Vali" "Tine" "Tinek" "'
foreach diminutive of local Valentino {
	replace ameriname = "Valentino" if fname == "`diminutive'"
}

/*Vassilios "No equivalents"*/

/*Vassilios "No diminutives"*/

local Victor `" "Bittor" "Viktor" "Víctor" "Victor" "Vítor" "Vittore" "Viktoras" "Wiktor" "Gwythyr" "'
foreach variant of local Victor {
	replace ameriname = "Victor" if fname == "`variant'"
}

local Victor `" "Vic" "Vitya" "'
foreach diminutive of local Victor {
	replace ameriname = "Victor" if fname == "`diminutive'"
}

local Viktor `" "Bittor" "Viktor" "Víctor" "Victor" "Vítor" "Vittore" "Viktoras" "Wiktor" "Gwythyr" "'
foreach variant of local Viktor {
	replace ameriname = "Viktor" if fname == "`variant'"
}

local Viktor `" "Vic" "Vitya" "'
foreach diminutive of local Viktor {
	replace ameriname = "Viktor" if fname == "`diminutive'"
}

/*Vincenso "No equivalents"*/

/*Vincenso "No diminutives"*/

local Vincent `" "Bikendi" "Vicenç" "Vicent" "Vincenc" "Vincent" "Vinzent" "Vinzenz" "Bence" "Vince" "Uinseann" "Vincente" "Vincenzo" "Vincentius" "Vincentas" "Wincenty" "Vicente" "Vikenti" "Vikentiy" "Vikentije" "'
foreach variant of local Vincent {
	replace ameriname = "Vincent" if fname == "`variant'"
}

local Vincent `" "Vinko" "Cenek" "Vin" "Vince" "Vinnie" "Vinny" "Enzo" "'
foreach diminutive of local Vincent {
	replace ameriname = "Vincent" if fname == "`diminutive'"
}

local Vincenzo `" "Bikendi" "Vicenç" "Vicent" "Vincenc" "Vincent" "Vinzent" "Vinzenz" "Bence" "Vince" "Uinseann" "Vincente" "Vincenzo" "Vincentius" "Vincentas" "Wincenty" "Vicente" "Vikenti" "Vikentiy" "Vikentije" "'
foreach variant of local Vincenzo {
	replace ameriname = "Vincenzo" if fname == "`variant'"
}

local Vincenzo `" "Vinko" "Cenek" "Vin" "Vince" "Vinnie" "Vinny" "Enzo" "'
foreach diminutive of local Vincenzo {
	replace ameriname = "Vincenzo" if fname == "`diminutive'"
}

local Virgilio `" "Vergilius" "Vergil" "Virgil" "Virgilio" "Virgilius" "Virgilijus" "Virgílio" "Virgiliu" "'
foreach variant of local Virgilio {
	replace ameriname = "Virgilio" if fname == "`variant'"
}

/*Virgilio "No diminutives"*/

local Vito `" "Vitus" "Vid" "Vít" "Veit" "Vida" "Vito" "Wit" "'
foreach variant of local Vito {
	replace ameriname = "Vito" if fname == "`variant'"
}

/*Vito "No diminutives"*/

local Vittorio `" "Vittorio" "Victorius" "'
foreach variant of local Vittorio {
	replace ameriname = "Vittorio" if fname == "`variant'"
}

/*Vittorio "No diminutives"*/

/*Waclaw "No equivalents"*/

/*Waclaw "No diminutives"*/

local Walter `" "Waldhar" "Walter" "Walther" "Valter" "Wolter" "Wouter" "Valtteri" "Gaultier" "Gauthier" "Gautier" "Gualtiero" "Guálter" "Bhaltair" "Bhàtair" "Gualterio" "Gwallter" "'
foreach variant of local Walter {
	replace ameriname = "Walter" if fname == "`variant'"
}

local Walter `" "Wally" "Walt" "Wat" "Wate" "'
foreach diminutive of local Walter {
	replace ameriname = "Walter" if fname == "`diminutive'"
}

local Wasyl `" "Vasil" "Basileios" "Basilius" "Basil" "Pasi" "Basile" "Vasilios" "Vasilis" "Vassilis" "Basilio" "Vasilii" "Bazyli" "Vasile" "Vasili" "Vasiliy" "Vasily" "Vassily" "Vasilije" "Vasyl" "Wasyl" "'
foreach variant of local Wasyl {
	replace ameriname = "Wasyl" if fname == "`variant'"
}

local Wasyl `" "Vasko" "Baz" "Bazza" "Vaso" "Vasilica" "Vaska" "Vasya" "'
foreach diminutive of local Wasyl {
	replace ameriname = "Wasyl" if fname == "`diminutive'"
}

/*Welwel "No equivalents"*/

/*Welwel "No diminutives"*/

local Werner `" "Warinhari" "Verner" "Werner" "'
foreach variant of local Werner {
	replace ameriname = "Werner" if fname == "`variant'"
}

local Werner `" "Wessel" "Wetzel" "'
foreach diminutive of local Werner {
	replace ameriname = "Werner" if fname == "`diminutive'"
}

local Wilfred `" "Willifrid" "Wilfrith" "Wilfrið" "Guifré" "Vilfred" "Wilfred" "Wilfrid" "Wilfried" "Vilfredo" "Wilfredo" "'
foreach variant of local Wilfred {
	replace ameriname = "Wilfred" if fname == "`variant'"
}

local Wilfred `" "Wil" "Wilf" "'
foreach diminutive of local Wilfred {
	replace ameriname = "Wilfred" if fname == "`diminutive'"
}

local Wilhelm `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilém" "Vilhelm" "Wilhelmus" "Willem" "William" "Vilhelmo" "Villem" "Vilhelmi" "Viljami" "Guillaume" "Vilmos" "Vilhjálmur" "Uilliam" "Guglielmo" "Vilhelms" "Wöllem" "Wullem" "Vilhelmas" "Illiam" "Wiremu" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Wilhelm {
	replace ameriname = "Wilhelm" if fname == "`variant'"
}

local Wilhelm `" "Vilko" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Billie" "Billy" "Liam" "Will" "Willie" "Vilĉjo" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Willi" "Uilleag" "Ulick" "Vilis" "Wum" "Wilkin" "Wilky" "Wilmot" "Gwil" "'
foreach diminutive of local Wilhelm {
	replace ameriname = "Wilhelm" if fname == "`diminutive'"
}

local Willem `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilém" "Vilhelm" "Wilhelmus" "Willem" "William" "Vilhelmo" "Villem" "Vilhelmi" "Viljami" "Guillaume" "Vilmos" "Vilhjálmur" "Uilliam" "Guglielmo" "Vilhelms" "Wöllem" "Wullem" "Vilhelmas" "Illiam" "Wiremu" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Willem {
	replace ameriname = "Willem" if fname == "`variant'"
}

local Willem `" "Vilko" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Billie" "Billy" "Liam" "Will" "Willie" "Vilĉjo" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Willi" "Uilleag" "Ulick" "Vilis" "Wum" "Wilkin" "Wilky" "Wilmot" "Gwil" "'
foreach diminutive of local Willem {
	replace ameriname = "Willem" if fname == "`diminutive'"
}

local Willi `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilko" "Vilém" "Vilhelm" "Jelle" "Pim" "Wil" "Wilhelmus" "Willem" "Willy" "Wim" "Bill" "Liam" "Will" "William" "Willie" "Vilĉjo" "Vilhelmo" "Villem" "Jami" "Vilhelmi" "Vilho" "Vili" "Viljami" "Viljo" "Ville" "Guillaume" "Willi" "Vilmos" "Vilhjálmur" "Uilleag" "Uilliam" "Ulick" "Guglielmo" "Vilhelms" "Vilis" "Wöllem" "Wullem" "Wum" "Vilhelmas" "Illiam" "Wiremu" "Wilmot" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwil" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Willi {
	replace ameriname = "Willi" if fname == "`variant'"
}

local Willi `" "Billie" "Billy" "Wilkin" "Wilky" "'
foreach diminutive of local Willi {
	replace ameriname = "Willi" if fname == "`diminutive'"
}

local William `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilém" "Vilhelm" "Wilhelmus" "Willem" "William" "Vilhelmo" "Villem" "Vilhelmi" "Viljami" "Guillaume" "Vilmos" "Vilhjálmur" "Uilliam" "Guglielmo" "Vilhelms" "Wöllem" "Wullem" "Vilhelmas" "Illiam" "Wiremu" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local William {
	replace ameriname = "William" if fname == "`variant'"
}

local William `" "Vilko" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Billie" "Billy" "Liam" "Will" "Willie" "Vilĉjo" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Willi" "Uilleag" "Ulick" "Vilis" "Wum" "Wilkin" "Wilky" "Wilmot" "Gwil" "'
foreach diminutive of local William {
	replace ameriname = "William" if fname == "`diminutive'"
}

local Willie `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilko" "Vilém" "Vilhelm" "Jelle" "Pim" "Wil" "Wilhelmus" "Willem" "Willy" "Wim" "Bill" "Liam" "Will" "Willie" "Vilĉjo" "Vilhelmo" "Villem" "Jami" "Vilhelmi" "Vilho" "Vili" "Viljami" "Viljo" "Ville" "Guillaume" "Willi" "Vilmos" "Vilhjálmur" "Uilleag" "Uilliam" "Ulick" "Guglielmo" "Vilhelms" "Vilis" "Wöllem" "Wullem" "Wum" "Vilhelmas" "Illiam" "Wiremu" "Wilmot" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwil" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Willie {
	replace ameriname = "Willie" if fname == "`variant'"
}

local Willie `" "Billie" "Billy" "Wilkin" "Wilky" "'
foreach diminutive of local Willie {
	replace ameriname = "Willie" if fname == "`diminutive'"
}

local Willy `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilko" "Vilma" "Vilém" "Vilhelm" "Elma" "Helma" "Jelle" "Mien" "Mina" "Pim" "Wil" "Willy" "Wilma" "Wim" "Bill" "Liam" "Will" "Willie" "Vilĉjo" "Vilhelmo" "Villem" "Helmi" "Iina" "Jami" "Miina" "Mimmi" "Minna" "Vilhelmi" "Vilhelmiina" "Vilho" "Vili" "Viljami" "Viljo" "Ville" "Guillaume" "Willi" "Vilmos" "Vilhjálmur" "Uilleag" "Uilliam" "Ulick" "Guglielmo" "Vilhelms" "Vilis" "Wöllem" "Wullem" "Wum" "Vilhelmas" "Vilhelmina" "Illiam" "Wiremu" "Wilmot" "Wilhelmina" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwil" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Willy {
	replace ameriname = "Willy" if fname == "`variant'"
}

local Willy `" "Billie" "Billy" "Wilkin" "Wilky" "MASCULINE FORMS" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilko" "Vilém" "Vilhelm" "Jelle" "Pim" "Wil" "Wilhelmus" "Willem" "Wim" "Bill" "Liam" "Will" "William" "Willie" "Vilĉjo" "Vilhelmo" "Villem" "Jami" "Vilhelmi" "Vilho" "Vili" "Viljami" "Viljo" "Ville" "Guillaume" "Willi" "Vilmos" "Vilhjálmur" "Uilleag" "Uilliam" "Ulick" "Guglielmo" "Vilhelms" "Vilis" "Wöllem" "Wullem" "Wum" "Vilhelmas" "Illiam" "Wiremu" "Wilmot" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwil" "Gwilim" "Gwillym" "Gwilym" "'
foreach diminutive of local Willy {
	replace ameriname = "Willy" if fname == "`diminutive'"
}

/*Wladislaw "No equivalents"*/

/*Wladislaw "No diminutives"*/

/*Wladyslaw "No equivalents"*/

/*Wladyslaw "No diminutives"*/

/*Wm "No equivalents"*/

/*Wm "No diminutives"*/

local Wojciech `" "Vojtěch" "Voitsekh" "Wojciech" "Vojtech" "'
foreach variant of local Wojciech {
	replace ameriname = "Wojciech" if fname == "`variant'"
}

local Wojciech `" "Wojtek" "'
foreach diminutive of local Wojciech {
	replace ameriname = "Wojciech" if fname == "`diminutive'"
}

local Wolf `" "Wolf" "Úlfr" "Uffe" "Ulf" "Wolfe" "Wulf" "Wolfgang" "'
foreach variant of local Wolf {
	replace ameriname = "Wolf" if fname == "`variant'"
}

/*Wolf "No diminutives"*/

local Yankel `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jaumet" "Jago" "Jakob" "Jakov" "Jakša" "Jakub" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Jacobus" "Kobe" "Kobus" "Koos" "Sjaak" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jaycob" "Jaymes" "Jeb" "Jem" "Jemmy" "Jim" "Koby" "Jaagup" "Jaak" "Jaakob" "Jaakko" "Jaakoppi" "Jacques" "Japik" "Iago" "Iakob" "Koba" "Iakopa" "Kimo" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Lapo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Kuba" "Jacó" "Jaime" "Yasha" "Jamie" "Seumas" "Jaka" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "Kapel" "Koppel" "Yankel" "'
foreach variant of local Yankel {
	replace ameriname = "Yankel" if fname == "`variant'"
}

local Yankel `" "Jimi" "Jimmie" "Jimmy" "Jaska" "'
foreach diminutive of local Yankel {
	replace ameriname = "Yankel" if fname == "`diminutive'"
}

local Youssef `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Youssef {
	replace ameriname = "Youssef" if fname == "`variant'"
}

local Youssef `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Youssef {
	replace ameriname = "Youssef" if fname == "`diminutive'"
}




// New ones - these are the names from 100 to 10 (includes 10)


/* A "No equivalents" */

/* A "No diminutives" */

local Aage `" "Áki" "Aage" "Åge" "'
foreach variant of local Aage {
	replace ameriname = "Aage" if fname == "`variant'"
}

/* Aage "No diminutives" */

local Aarne `" "Ari" "Árni" "Arne" "Aarne" "'
foreach variant of local Aarne {
	replace ameriname = "Aarne" if fname == "`variant'"
}

/* Aarne "No diminutives" */

local Aaron `" "Haroun" "Harun" "Aaron" "Aharon" "Aron" "Aaren" "Arron" "Áron" "Aarón" "'
foreach variant of local Aaron {
	replace ameriname = "Aaron" if fname == "`variant'"
}

/* Aaron "No diminutives" */

local Aart `" "Arnold" "Arnau" "Aart" "Arno" "Arn" "Arnie" "Arnaud" "Ane" "Anne" "Arke" "Arend" "Arndt" "Arne" "Arnaldo" "Nöl" "Arnt" "'
foreach variant of local Aart {
	replace ameriname = "Aart" if fname == "`variant'"
}

local Aart `" "Nölke" "'
foreach diminutive of local Aart {
	replace ameriname = "Aart" if fname == "`diminutive'"
}

/* Aba "No equivalents" */

/* Aba "No diminutives" */

/* Abdalla "No equivalents" */

/* Abdalla "No diminutives" */

/* Abdallah "No equivalents" */

/* Abdallah "No diminutives" */

/* Abdo "No equivalents" */

/* Abdo "No diminutives" */

local Abel `" "Abel" "Hevel" "Aapeli" "Hebel" "Ábel" "Abele" "'
foreach variant of local Abel {
	replace ameriname = "Abel" if fname == "`variant'"
}

/* Abel "No diminutives" */

local Abele `" "Abel" "Hevel" "Aapeli" "Hebel" "Ábel" "Abele" "'
foreach variant of local Abele {
	replace ameriname = "Abele" if fname == "`variant'"
}

/* Abele "No diminutives" */

/* Abr "No equivalents" */

/* Abr "No diminutives" */

local Abraam `" "Ebrahim" "Ibraheem" "Ibrahim" "Abraam" "Avraham" "Abraham" "Ibragim" "Aabraham" "Abram" "Ábrahám" "Abramo" "Avraamu" "Abraão" "İbrahim" "Ibrahima" "'
foreach variant of local Abraam {
	replace ameriname = "Abraam" if fname == "`variant'"
}

local Abraam `" "Ibro" "Braam" "Bram" "Abe" "Aapo" "Avi" "'
foreach diminutive of local Abraam {
	replace ameriname = "Abraam" if fname == "`diminutive'"
}

local Abramo `" "Ebrahim" "Ibraheem" "Ibrahim" "Abraam" "Avraham" "Abraham" "Ibragim" "Aabraham" "Abram" "Ábrahám" "Abramo" "Avraamu" "Abraão" "İbrahim" "Ibrahima" "'
foreach variant of local Abramo {
	replace ameriname = "Abramo" if fname == "`variant'"
}

local Abramo `" "Ibro" "Braam" "Bram" "Abe" "Aapo" "Avi" "'
foreach diminutive of local Abramo {
	replace ameriname = "Abramo" if fname == "`diminutive'"
}

/* Abrum "No equivalents" */

/* Abrum "No diminutives" */

/* Aby "No equivalents" */

/* Aby "No diminutives" */

/* Accursio "No equivalents" */

/* Accursio "No diminutives" */

/* Achiel "No equivalents" */

/* Achiel "No diminutives" */

local Adalbert `" "Adalberht" "Adalbert" "Albert" "Albertus" "Æþelbeorht" "Æðelberht" "Adelbert" "Ethelbert" "Alpertti" "Aubert" "Alberte" "Albrecht" "Adalberto" "Alberto" "Albaer" "Albertas" "'
foreach variant of local Adalbert {
	replace ameriname = "Adalbert" if fname == "`variant'"
}

local Adalbert `" "Abe" "Bert" "Brecht" "Elbert" "Al" "Bertie" "Delbert" "Altti" "Pertti" "Abbe" "Berto" "Baer" "Bèr" "'
foreach diminutive of local Adalbert {
	replace ameriname = "Adalbert" if fname == "`diminutive'"
}

local Adamo `" "Adam" "Aatami" "Akamu" "Ádám" "Ádhamh" "Adamo" "Adomas" "Adamu" "Adão" "Adán" "Adem" "'
foreach variant of local Adamo {
	replace ameriname = "Adamo" if fname == "`variant'"
}

local Adamo `" "Addy" "'
foreach diminutive of local Adamo {
	replace ameriname = "Adamo" if fname == "`diminutive'"
}

/* Adelino "No equivalents" */

/* Adelino "No diminutives" */

/* Adelmo "No equivalents" */

/* Adelmo "No diminutives" */

/* Adib "No equivalents" */

/* Adib "No diminutives" */

local Adolph `" "Adalwolf" "Adolf" "Adolphus" "Adolph" "Aadolf" "Adolphe" "Adolfo" "'
foreach variant of local Adolph {
	replace ameriname = "Adolph" if fname == "`variant'"
}

local Adolph `" "Alf" "Dolph" "Aatto" "Aatu" "Atte" "Adde" "Ade" "Aike" "Ale" "Alke" "Alle" "Atse" "Dölf" "Dulf" "Adolfito" "Fito" "'
foreach diminutive of local Adolph {
	replace ameriname = "Adolph" if fname == "`diminutive'"
}

local Adolphe `" "Adalwolf" "Adolf" "Adolphus" "Adolph" "Aadolf" "Adolphe" "Adolfo" "'
foreach variant of local Adolphe {
	replace ameriname = "Adolphe" if fname == "`variant'"
}

local Adolphe `" "Alf" "Dolph" "Aatto" "Aatu" "Atte" "Adde" "Ade" "Aike" "Ale" "Alke" "Alle" "Atse" "Dölf" "Dulf" "Adolfito" "Fito" "'
foreach diminutive of local Adolphe {
	replace ameriname = "Adolphe" if fname == "`diminutive'"
}

local Adolphus `" "Adalwolf" "Adolf" "Adolphus" "Adolph" "Aadolf" "Adolphe" "Adolfo" "'
foreach variant of local Adolphus {
	replace ameriname = "Adolphus" if fname == "`variant'"
}

local Adolphus `" "Alf" "Dolph" "Aatto" "Aatu" "Atte" "Adde" "Ade" "Aike" "Ale" "Alke" "Alle" "Atse" "Dölf" "Dulf" "Adolfito" "Fito" "'
foreach diminutive of local Adolphus {
	replace ameriname = "Adolphus" if fname == "`diminutive'"
}

local Adrian `" "Hadrianus" "Adrià" "Adrijan" "Jadran" "Adrian" "Adriaan" "Adrianus" "Arjan" "Adrien" "Hadrien" "Hadrian" "Adorján" "Adrián" "Adriano" "'
foreach variant of local Adrian {
	replace ameriname = "Adrian" if fname == "`variant'"
}

local Adrian `" "Jadranko" "Ad" "Arie" "Aris" "'
foreach diminutive of local Adrian {
	replace ameriname = "Adrian" if fname == "`diminutive'"
}

local Adriano `" "Hadrianus" "Adrià" "Adrijan" "Jadran" "Adrian" "Adriaan" "Adrianus" "Arjan" "Adrien" "Hadrien" "Hadrian" "Adorján" "Adrián" "Adriano" "'
foreach variant of local Adriano {
	replace ameriname = "Adriano" if fname == "`variant'"
}

local Adriano `" "Jadranko" "Ad" "Arie" "Aris" "'
foreach diminutive of local Adriano {
	replace ameriname = "Adriano" if fname == "`diminutive'"
}

local Adrianus `" "Hadrianus" "Adrià" "Adrijan" "Jadran" "Adrian" "Adriaan" "Adrianus" "Arjan" "Adrien" "Hadrien" "Hadrian" "Adorján" "Adrián" "Adriano" "'
foreach variant of local Adrianus {
	replace ameriname = "Adrianus" if fname == "`variant'"
}

local Adrianus `" "Jadranko" "Ad" "Arie" "Aris" "'
foreach diminutive of local Adrianus {
	replace ameriname = "Adrianus" if fname == "`diminutive'"
}

local Adrien `" "Hadrianus" "Adrià" "Adrijan" "Jadran" "Adrian" "Adriaan" "Adrianus" "Arjan" "Adrien" "Hadrien" "Hadrian" "Adorján" "Adrián" "Adriano" "'
foreach variant of local Adrien {
	replace ameriname = "Adrien" if fname == "`variant'"
}

local Adrien `" "Jadranko" "Ad" "Arie" "Aris" "'
foreach diminutive of local Adrien {
	replace ameriname = "Adrien" if fname == "`diminutive'"
}

local Agata `" "Agatha" "Agathe" "Agata" "Agáta" "Ágota" "Ågot" "Águeda" "Agafya" "'
foreach variant of local Agata {
	replace ameriname = "Agata" if fname == "`variant'"
}

local Agata `" "Jaga" "Aggie" "Ági" "Agda" "MASCULINE FORMS" "'
foreach diminutive of local Agata {
	replace ameriname = "Agata" if fname == "`diminutive'"
}

/* Agatino "No equivalents" */

/* Agatino "No diminutives" */

/* Agop "No equivalents" */

/* Agop "No diminutives" */

local Agostinho `" "Augustinus" "Agustí" "Augustin" "Augustín" "Augustijn" "Augustine" "Austen" "Austin" "Austyn" "Ágoston" "Agostino" "Augustinas" "Augustyn" "Agostinho" "Avguštin" "Agustín" "Awstin" "'
foreach variant of local Agostinho {
	replace ameriname = "Agostinho" if fname == "`variant'"
}

local Agostinho `" "Dino" "Tin" "Stijn" "Tijn" "Auke" "'
foreach diminutive of local Agostinho {
	replace ameriname = "Agostinho" if fname == "`diminutive'"
}

/* Agrippino "No equivalents" */

/* Agrippino "No diminutives" */

/* Agustin "No equivalents" */

/* Agustin "No diminutives" */

local Ahmed `" "Ahmad" "Ahmed" "Akhmad" "Ahmet" "'
foreach variant of local Ahmed {
	replace ameriname = "Ahmed" if fname == "`variant'"
}

/* Ahmed "No diminutives" */

/* Aime "No equivalents" */

/* Aime "No diminutives" */

/* Aisik "No equivalents" */

/* Aisik "No diminutives" */

/* Aizik "No equivalents" */

/* Aizik "No diminutives" */

/* Ajzyk "No equivalents" */

/* Ajzyk "No diminutives" */

/* Ake "No equivalents" */

/* Ake "No diminutives" */

local Aksel `" "Abessalom" "'Avshalom" "Absalom" "Aksel" "Axel" "Akseli" "Absolon" "'
foreach variant of local Aksel {
	replace ameriname = "Aksel" if fname == "`variant'"
}

local Aksel `" "Acke" "'
foreach diminutive of local Aksel {
	replace ameriname = "Aksel" if fname == "`diminutive'"
}

/* Aladar "No equivalents" */

/* Aladar "No diminutives" */

/* Aladino "No equivalents" */

/* Aladino "No diminutives" */

local Alan `" "Alan" "Alen" "Allan" "Allen" "Allyn" "Alain" "Ailín" "Alun" "'
foreach variant of local Alan {
	replace ameriname = "Alan" if fname == "`variant'"
}

local Alan `" "Al" "'
foreach diminutive of local Alan {
	replace ameriname = "Alan" if fname == "`diminutive'"
}

local Alban `" "Alban" "Albanus" "'
foreach variant of local Alban {
	replace ameriname = "Alban" if fname == "`variant'"
}

/* Alban "No diminutives" */

/* Alber "No equivalents" */

/* Alber "No diminutives" */

local Alberico `" "Alberich" "Ælfric" "Auberon" "Aubrey" "Alberic" "Alberico" "Elric" "'
foreach variant of local Alberico {
	replace ameriname = "Alberico" if fname == "`variant'"
}

/* Alberico "No diminutives" */

local Alberta `" "Alberte" "Alberta" "'
foreach variant of local Alberta {
	replace ameriname = "Alberta" if fname == "`variant'"
}

local Alberta `" "Albertina" "Brechtje" "Tina" "Tineke" "Bertina" "Albertine" "MASCULINE FORMS" "Adalberht" "Adalbert" "Albert" "Albertus" "Æþelbeorht" "Æðelberht" "Abe" "Adelbert" "Bert" "Brecht" "Elbert" "Al" "Bertie" "Delbert" "Ethelbert" "Alpertti" "Altti" "Pertti" "Aubert" "Abbe" "Alberte" "Albrecht" "Adalberto" "Alberto" "Berto" "Albaer" "Baer" "Bèr" "Albertas" "'
foreach diminutive of local Alberta {
	replace ameriname = "Alberta" if fname == "`diminutive'"
}

local Albertus `" "Adalberht" "Adalbert" "Albert" "Albertus" "Æþelbeorht" "Æðelberht" "Adelbert" "Ethelbert" "Alpertti" "Aubert" "Alberte" "Albrecht" "Adalberto" "Alberto" "Albaer" "Albertas" "'
foreach variant of local Albertus {
	replace ameriname = "Albertus" if fname == "`variant'"
}

local Albertus `" "Abe" "Bert" "Brecht" "Elbert" "Al" "Bertie" "Delbert" "Altti" "Pertti" "Abbe" "Berto" "Baer" "Bèr" "'
foreach diminutive of local Albertus {
	replace ameriname = "Albertus" if fname == "`diminutive'"
}

local Albino `" "Albinus" "Albin" "Aubin" "Albino" "'
foreach variant of local Albino {
	replace ameriname = "Albino" if fname == "`variant'"
}

/* Albino "No diminutives" */

/* Alceste "No equivalents" */

/* Alceste "No diminutives" */

local Alec `" "Aleksander" "Skender" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Sasho" "Àlex" "Alexandre" "Sandi" "Saša" "Aleš" "Alexandr" "Alex" "Sander" "Lex" "Xander" "Al" "Alec" "Sandy" "Zander" "Aleĉjo" "Aleksandro" "Ale" "Aleksanteri" "Samppa" "Santeri" "Santtu" "Sacha" "Sasha" "Aleksandre" "Sandro" "Sascha" "Sándor" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aca" "Ace" "Aco" "Aleksandru" "Sikandar" "Eskandar" "Aleks" "Olek" "Xande" "Xandinho" "Alexandru" "Sandu" "Sanya" "Shura" "Alasdair" "Alastair" "Alistair" "Alister" "Ally" "Sawney" "Sašo" "Alejandro" "İskender" "Oleksander" "Oleksandr" "Oles" "Sender" "'
foreach variant of local Alec {
	replace ameriname = "Alec" if fname == "`variant'"
}

local Alec `" "Sanyi" "'
foreach diminutive of local Alec {
	replace ameriname = "Alec" if fname == "`diminutive'"
}

local Alejandro `" "Aleksander" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Alexandre" "Alexandr" "Aleksandro" "Aleksanteri" "Aleksandre" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aleksandru" "Sikandar" "Eskandar" "Alexandru" "Alasdair" "Alastair" "Alistair" "Alister" "Alejandro" "İskender" "Oleksander" "Oleksandr" "'
foreach variant of local Alejandro {
	replace ameriname = "Alejandro" if fname == "`variant'"
}

local Alejandro `" "Skender" "Sasho" "Àlex" "Sandi" "Saša" "Aleš" "Alex" "Sander" "Lex" "Xander" "Al" "Alec" "Sandy" "Zander" "Aleĉjo" "Ale" "Samppa" "Santeri" "Santtu" "Sacha" "Sasha" "Sandro" "Sascha" "Sándor" "Sanyi" "Aca" "Ace" "Aco" "Aleks" "Olek" "Xande" "Xandinho" "Sandu" "Sanya" "Shura" "Ally" "Sawney" "Sašo" "Oles" "Sender" "'
foreach diminutive of local Alejandro {
	replace ameriname = "Alejandro" if fname == "`diminutive'"
}

local Aleksander `" "Aleksander" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Alexandre" "Alexandr" "Aleksandro" "Aleksanteri" "Aleksandre" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aleksandru" "Sikandar" "Eskandar" "Alexandru" "Alasdair" "Alastair" "Alistair" "Alister" "Alejandro" "İskender" "Oleksander" "Oleksandr" "'
foreach variant of local Aleksander {
	replace ameriname = "Aleksander" if fname == "`variant'"
}

local Aleksander `" "Skender" "Sasho" "Àlex" "Sandi" "Saša" "Aleš" "Alex" "Sander" "Lex" "Xander" "Al" "Alec" "Sandy" "Zander" "Aleĉjo" "Ale" "Samppa" "Santeri" "Santtu" "Sacha" "Sasha" "Sandro" "Sascha" "Sándor" "Sanyi" "Aca" "Ace" "Aco" "Aleks" "Olek" "Xande" "Xandinho" "Sandu" "Sanya" "Shura" "Ally" "Sawney" "Sašo" "Oles" "Sender" "'
foreach diminutive of local Aleksander {
	replace ameriname = "Aleksander" if fname == "`diminutive'"
}

/* Alesandro "No equivalents" */

/* Alesandro "No diminutives" */

local Alessio `" "Alexios" "Alexius" "Aleksei" "Aleksey" "Alexei" "Alexey" "Aliaksei" "Aleix" "Alexej" "Aleksi" "Alexis" "Aleixo" "Elek" "Alessio" "Aleksy" "Aleksej" "Alejo" "Oleksiy" "Olexiy" "'
foreach variant of local Alessio {
	replace ameriname = "Alessio" if fname == "`variant'"
}

local Alessio `" "Aljoša" "Aleš" "Ale" "Aleks" "Alyosha" "Lyosha" "Oles" "'
foreach diminutive of local Alessio {
	replace ameriname = "Alessio" if fname == "`diminutive'"
}

local Alexandr `" "Aleksander" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Alexandre" "Alexandr" "Aleksandro" "Aleksanteri" "Aleksandre" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aleksandru" "Sikandar" "Eskandar" "Alexandru" "Alasdair" "Alastair" "Alistair" "Alister" "Alejandro" "İskender" "Oleksander" "Oleksandr" "'
foreach variant of local Alexandr {
	replace ameriname = "Alexandr" if fname == "`variant'"
}

local Alexandr `" "Skender" "Sasho" "Àlex" "Sandi" "Saša" "Aleš" "Alex" "Sander" "Lex" "Xander" "Al" "Alec" "Sandy" "Zander" "Aleĉjo" "Ale" "Samppa" "Santeri" "Santtu" "Sacha" "Sasha" "Sandro" "Sascha" "Sándor" "Sanyi" "Aca" "Ace" "Aco" "Aleks" "Olek" "Xande" "Xandinho" "Sandu" "Sanya" "Shura" "Ally" "Sawney" "Sašo" "Oles" "Sender" "'
foreach diminutive of local Alexandr {
	replace ameriname = "Alexandr" if fname == "`diminutive'"
}

local Alexandra `" "Alexandra" "Aleksandra" "Alexandrea" "Alexandria" "Alexandrina" "Alexandrie" "Alexandrine" "Alastríona" "Alessandra" "Alejandra" "Oleksandra" "'
foreach variant of local Alexandra {
	replace ameriname = "Alexandra" if fname == "`variant'"
}

local Alexandra `" "Aleksandrina" "Sashka" "Sanda" "Sandra" "Saša" "Alex" "Xandra" "Alexa" "Alexina" "Ali" "Allie" "Ally" "Alyx" "Lexa" "Lexi" "Lexie" "Lexine" "Lexy" "Sandie" "Sandy" "Sasha" "Sondra" "Zandra" "Sacha" "Sandrine" "Sascha" "Szandra" "Alessa" "Ola" "Sanya" "Shura" "Saundra" "Ale" "Sassa" "Lesya" "MASCULINE FORMS" "Aleksander" "Skender" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Sasho" "Àlex" "Alexandre" "Sandi" "Aleš" "Alexandr" "Sander" "Lex" "Xander" "Al" "Alec" "Zander" "Aleĉjo" "Aleksandro" "Aleksanteri" "Samppa" "Santeri" "Santtu" "Aleksandre" "Sandro" "Sándor" "Sanyi" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aca" "Ace" "Aco" "Aleksandru" "Sikandar" "Eskandar" "Aleks" "Olek" "Xande" "Xandinho" "Alexandru" "Sandu" "Alasdair" "Alastair" "Alistair" "Alister" "Sawney" "Sašo" "Alejandro" "İskender" "Oleksander" "Oleksandr" "Oles" "'
foreach diminutive of local Alexandra {
	replace ameriname = "Alexandra" if fname == "`diminutive'"
}

local Alexandre `" "Aleksander" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Alexandre" "Alexandr" "Aleksandro" "Aleksanteri" "Aleksandre" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aleksandru" "Sikandar" "Eskandar" "Alexandru" "Alasdair" "Alastair" "Alistair" "Alister" "Alejandro" "İskender" "Oleksander" "Oleksandr" "'
foreach variant of local Alexandre {
	replace ameriname = "Alexandre" if fname == "`variant'"
}

local Alexandre `" "Skender" "Sasho" "Àlex" "Sandi" "Saša" "Aleš" "Alex" "Sander" "Lex" "Xander" "Al" "Alec" "Sandy" "Zander" "Aleĉjo" "Ale" "Samppa" "Santeri" "Santtu" "Sacha" "Sasha" "Sandro" "Sascha" "Sándor" "Sanyi" "Aca" "Ace" "Aco" "Aleks" "Olek" "Xande" "Xandinho" "Sandu" "Sanya" "Shura" "Ally" "Sawney" "Sašo" "Oles" "Sender" "'
foreach diminutive of local Alexandre {
	replace ameriname = "Alexandre" if fname == "`diminutive'"
}

/* Alexandro "No equivalents" */

/* Alexandro "No diminutives" */

local Alexandros `" "Aleksander" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Alexandre" "Alexandr" "Aleksandro" "Aleksanteri" "Aleksandre" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aleksandru" "Sikandar" "Eskandar" "Alexandru" "Alasdair" "Alastair" "Alistair" "Alister" "Alejandro" "İskender" "Oleksander" "Oleksandr" "'
foreach variant of local Alexandros {
	replace ameriname = "Alexandros" if fname == "`variant'"
}

local Alexandros `" "Skender" "Sasho" "Àlex" "Sandi" "Saša" "Aleš" "Alex" "Sander" "Lex" "Xander" "Al" "Alec" "Sandy" "Zander" "Aleĉjo" "Ale" "Samppa" "Santeri" "Santtu" "Sacha" "Sasha" "Sandro" "Sascha" "Sándor" "Sanyi" "Aca" "Ace" "Aco" "Aleks" "Olek" "Xande" "Xandinho" "Sandu" "Sanya" "Shura" "Ally" "Sawney" "Sašo" "Oles" "Sender" "'
foreach diminutive of local Alexandros {
	replace ameriname = "Alexandros" if fname == "`diminutive'"
}

local Alexios `" "Alexios" "Alexius" "Aleksei" "Aleksey" "Alexei" "Alexey" "Aliaksei" "Aleix" "Alexej" "Aleksi" "Alexis" "Aleixo" "Elek" "Alessio" "Aleksy" "Aleksej" "Alejo" "Oleksiy" "Olexiy" "'
foreach variant of local Alexios {
	replace ameriname = "Alexios" if fname == "`variant'"
}

local Alexios `" "Aljoša" "Aleš" "Ale" "Aleks" "Alyosha" "Lyosha" "Oles" "'
foreach diminutive of local Alexios {
	replace ameriname = "Alexios" if fname == "`diminutive'"
}

local Alexis `" "Alexis" "Aleksei" "Aleksey" "Alexei" "Alexey" "Aliaksei" "Aleix" "Alexej" "Alexia" "Alexus" "Aleksi" "Aleixo" "Elek" "Alessia" "Alessio" "Aleksy" "Aleksej" "Alejo" "Oleksiy" "Olexiy" "'
foreach variant of local Alexis {
	replace ameriname = "Alexis" if fname == "`variant'"
}

local Alexis `" "Aljoša" "Aleš" "Alexina" "Lexi" "Lexia" "Lexie" "Lexine" "Lexus" "Lexy" "Ale" "Aleks" "Alyosha" "Lyosha" "Oles" "MASCULINE FORMS" "Alexios" "Alexius" "Aleksei" "Aleksey" "Alexei" "Alexey" "Aliaksei" "Aleix" "Alexej" "Aleksi" "Aleixo" "Elek" "Alessio" "Aleksy" "Aleksej" "Alejo" "Oleksiy" "Olexiy" "'
foreach diminutive of local Alexis {
	replace ameriname = "Alexis" if fname == "`diminutive'"
}

/* Alexr "No equivalents" */

/* Alexr "No diminutives" */

/* Alfonsa "No equivalents" */

/* Alfonsa "No diminutives" */

/* Alfonse "No equivalents" */

/* Alfonse "No diminutives" */

/* Alfonzo "No equivalents" */

/* Alfonzo "No diminutives" */

/* Algot "No equivalents" */

/* Algot "No diminutives" */

/* Ali "No equivalents" */

/* Ali "No diminutives" */

/* Alick "No equivalents" */

/* Alick "No diminutives" */

local Alle `" "Adalhard" "Adalwolf" "Adolf" "Adolphus" "Alard" "Alf" "Aldert" "Allard" "Adolph" "Dolph" "Aadolf" "Aatto" "Aatu" "Atte" "Adélard" "Adolphe" "Abbe" "Adde" "Ade" "Aike" "Ale" "Alke" "Alle" "Atse" "Adelardo" "Adolfo" "Dölf" "Dulf" "Adolfito" "'
foreach variant of local Alle {
	replace ameriname = "Alle" if fname == "`variant'"
}

local Alle `" "Fito" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Alle {
	replace ameriname = "Alle" if fname == "`diminutive'"
}

local Allen `" "Alan" "Alen" "Allan" "Allen" "Allyn" "Alain" "Ailín" "Alun" "'
foreach variant of local Allen {
	replace ameriname = "Allen" if fname == "`variant'"
}

local Allen `" "Al" "'
foreach diminutive of local Allen {
	replace ameriname = "Allen" if fname == "`diminutive'"
}

/* Allessandro "No equivalents" */

/* Allessandro "No diminutives" */

/* Alma "No equivalents" */

/* Alma "No diminutives" */

local Alojzy `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Alojzy {
	replace ameriname = "Alojzy" if fname == "`variant'"
}

local Alojzy `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Alojzy {
	replace ameriname = "Alojzy" if fname == "`diminutive'"
}

local Alonso `" "Adalfuns" "Alfons" "Hadufuns" "Hildefons" "Alphonso" "Alphonzo" "Alphonse" "Afonso" "Alphonsus" "Alfonso" "Alonzo" "Alfonz" "Alonso" "Ildefonso" "'
foreach variant of local Alonso {
	replace ameriname = "Alonso" if fname == "`variant'"
}

local Alonso `" "Fons" "Funs" "Funske" "Lon" "Lonnie" "Lonny" "'
foreach diminutive of local Alonso {
	replace ameriname = "Alonso" if fname == "`diminutive'"
}

local Aloys `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Aloys {
	replace ameriname = "Aloys" if fname == "`variant'"
}

local Aloys `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Aloys {
	replace ameriname = "Aloys" if fname == "`diminutive'"
}

/* Alphons "No equivalents" */

/* Alphons "No diminutives" */

local Alphonse `" "Adalfuns" "Alfons" "Hadufuns" "Hildefons" "Alphonso" "Alphonzo" "Alphonse" "Afonso" "Alphonsus" "Alfonso" "Alonzo" "Alfonz" "Alonso" "Ildefonso" "'
foreach variant of local Alphonse {
	replace ameriname = "Alphonse" if fname == "`variant'"
}

local Alphonse `" "Fons" "Funs" "Funske" "Lon" "Lonnie" "Lonny" "'
foreach diminutive of local Alphonse {
	replace ameriname = "Alphonse" if fname == "`diminutive'"
}

/* Alte "No equivalents" */

/* Alte "No diminutives" */

local Alvar `" "Alfher" "Alfarr" "Alvar" "Elvar" "'
foreach variant of local Alvar {
	replace ameriname = "Alvar" if fname == "`variant'"
}

/* Alvar "No diminutives" */

/* Alvaro "No equivalents" */

/* Alvaro "No diminutives" */

local Alvin `" "Adalwin" "Alboin" "Alfwin" "Alwin" "Ælfwine" "Æðelwine" "Æthelwine" "Ealdwine" "Alvin" "Elvin" "'
foreach variant of local Alvin {
	replace ameriname = "Alvin" if fname == "`variant'"
}

local Alvin `" "Aldous" "Aldus" "'
foreach diminutive of local Alvin {
	replace ameriname = "Alvin" if fname == "`diminutive'"
}

local Alvis `" "Alvis" "'
foreach variant of local Alvis {
	replace ameriname = "Alvis" if fname == "`variant'"
}

/* Alvis "No diminutives" */

local Alwin `" "Adalwin" "Alboin" "Alfwin" "Alwin" "Ælfwine" "Æðelwine" "Æthelwine" "Alvin" "Elvin" "'
foreach variant of local Alwin {
	replace ameriname = "Alwin" if fname == "`variant'"
}

/* Alwin "No diminutives" */

/* Aly "No equivalents" */

/* Aly "No diminutives" */

local Amadeo `" "Amédée" "Amadeo" "Amedeo" "Amadeus" "Amadej" "'
foreach variant of local Amadeo {
	replace ameriname = "Amadeo" if fname == "`variant'"
}

/* Amadeo "No diminutives" */

/* Amadio "No equivalents" */

/* Amadio "No diminutives" */

/* Amalio "No equivalents" */

/* Amalio "No diminutives" */

local Amandus `" "Amand" "Amando" "Amandus" "'
foreach variant of local Amandus {
	replace ameriname = "Amandus" if fname == "`variant'"
}

/* Amandus "No diminutives" */

local Amato `" "Aimé" "Amato" "Amatus" "Amé" "Amado" "'
foreach variant of local Amato {
	replace ameriname = "Amato" if fname == "`variant'"
}

/* Amato "No diminutives" */

local Ambrogio `" "Ambrosios" "Ambrosius" "Ambrozije" "Ambrož" "Ambroos" "Ambrose" "Ambroise" "Ambrosi" "Ambrus" "Ambrogio" "Ambroży" "Ambrósio" "Ambrosio" "Emrys" "'
foreach variant of local Ambrogio {
	replace ameriname = "Ambrogio" if fname == "`variant'"
}

local Ambrogio `" "Broos" "Ambrogino" "Giotto" "'
foreach diminutive of local Ambrogio {
	replace ameriname = "Ambrogio" if fname == "`diminutive'"
}

/* Ambros "No equivalents" */

/* Ambros "No diminutives" */

local Ambrose `" "Ambrosios" "Ambrosius" "Ambrozije" "Ambrož" "Ambroos" "Ambrose" "Ambroise" "Ambrosi" "Ambrus" "Ambrogio" "Ambroży" "Ambrósio" "Ambrosio" "Emrys" "'
foreach variant of local Ambrose {
	replace ameriname = "Ambrose" if fname == "`variant'"
}

local Ambrose `" "Broos" "Ambrogino" "Giotto" "'
foreach diminutive of local Ambrose {
	replace ameriname = "Ambrose" if fname == "`diminutive'"
}

/* Amedio "No equivalents" */

/* Amedio "No diminutives" */

/* Amelio "No equivalents" */

/* Amelio "No diminutives" */

/* Amello "No equivalents" */

/* Amello "No diminutives" */

local Amerigo `" "Emmerich" "Amery" "Emery" "Emory" "Émeric" "Imre" "Amerigo" "Américo" "Imrich" "'
foreach variant of local Amerigo {
	replace ameriname = "Amerigo" if fname == "`variant'"
}

local Amerigo `" "Imrus" "'
foreach diminutive of local Amerigo {
	replace ameriname = "Amerigo" if fname == "`diminutive'"
}

local Amilcare `" "Hamilcar" "Amilcare" "Amílcar" "'
foreach variant of local Amilcare {
	replace ameriname = "Amilcare" if fname == "`variant'"
}

/* Amilcare "No diminutives" */

/* Amillo "No equivalents" */

/* Amillo "No diminutives" */

local Amin `" "Amin" "Emin" "'
foreach variant of local Amin {
	replace ameriname = "Amin" if fname == "`variant'"
}

/* Amin "No diminutives" */

/* Amleto "No equivalents" */

/* Amleto "No diminutives" */

/* Amodeo "No equivalents" */

/* Amodeo "No diminutives" */

local Amos `" "Amos" "'
foreach variant of local Amos {
	replace ameriname = "Amos" if fname == "`variant'"
}

/* Amos "No diminutives" */

local Anacleto `" "Anacletus" "Anakletos" "Anacleto" "'
foreach variant of local Anacleto {
	replace ameriname = "Anacleto" if fname == "`variant'"
}

local Anacleto `" "Cletis" "Cletus" "Cleto" "'
foreach diminutive of local Anacleto {
	replace ameriname = "Anacleto" if fname == "`diminutive'"
}

local Anastasio `" "Anastasios" "Anastasius" "Anastas" "Anastasiy" "Anasztáz" "Anastasio" "Anastazy" "'
foreach variant of local Anastasio {
	replace ameriname = "Anastasio" if fname == "`variant'"
}

local Anastasio `" "Staas" "Stas" "'
foreach diminutive of local Anastasio {
	replace ameriname = "Anastasio" if fname == "`diminutive'"
}

local Anastasios `" "Anastasios" "Anastasius" "Anastas" "Anastasiy" "Anasztáz" "Anastasio" "Anastazy" "'
foreach variant of local Anastasios {
	replace ameriname = "Anastasios" if fname == "`variant'"
}

local Anastasios `" "Staas" "Stas" "'
foreach diminutive of local Anastasios {
	replace ameriname = "Anastasios" if fname == "`diminutive'"
}

/* Anastassios "No equivalents" */

/* Anastassios "No diminutives" */

/* And "No equivalents" */

/* And "No diminutives" */

/* Andor "No equivalents" */

/* Andor "No diminutives" */

local Andrei `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andrei {
	replace ameriname = "Andrei" if fname == "`variant'"
}

local Andrei `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andrei {
	replace ameriname = "Andrei" if fname == "`diminutive'"
}

/* Andreo "No equivalents" */

/* Andreo "No diminutives" */

local Andres `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andres {
	replace ameriname = "Andres" if fname == "`variant'"
}

local Andres `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andres {
	replace ameriname = "Andres" if fname == "`diminutive'"
}

local Andrey `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andrey {
	replace ameriname = "Andrey" if fname == "`variant'"
}

local Andrey `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andrey {
	replace ameriname = "Andrey" if fname == "`diminutive'"
}

/* Andri "No equivalents" */

/* Andri "No diminutives" */

local Andria `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andria {
	replace ameriname = "Andria" if fname == "`variant'"
}

local Andria `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andria {
	replace ameriname = "Andria" if fname == "`diminutive'"
}

local Andries `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andries {
	replace ameriname = "Andries" if fname == "`variant'"
}

local Andries `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andries {
	replace ameriname = "Andries" if fname == "`diminutive'"
}

local Andrija `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andrija {
	replace ameriname = "Andrija" if fname == "`variant'"
}

local Andrija `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andrija {
	replace ameriname = "Andrija" if fname == "`diminutive'"
}

local Andro `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andro {
	replace ameriname = "Andro" if fname == "`variant'"
}

local Andro `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andro {
	replace ameriname = "Andro" if fname == "`diminutive'"
}

local Andrus `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andrus {
	replace ameriname = "Andrus" if fname == "`variant'"
}

local Andrus `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andrus {
	replace ameriname = "Andrus" if fname == "`diminutive'"
}

/* Andry "No equivalents" */

/* Andry "No diminutives" */

local Andrzej `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andrzej {
	replace ameriname = "Andrzej" if fname == "`variant'"
}

local Andrzej `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andrzej {
	replace ameriname = "Andrzej" if fname == "`diminutive'"
}

/* Andrzey "No equivalents" */

/* Andrzey "No diminutives" */

/* Andw "No equivalents" */

/* Andw "No diminutives" */

local Angela `" "Anđela" "Anđelka" "Anděla" "Angelika" "Angela" "Angelique" "Angelia" "Angelica" "Angelle" "Anjelica" "Angèle" "Angélique" "Angeliki" "Angéla" "Angyalka" "Aingeal" "Andżelika" "Aniela" "Ângela" "Angélica" "Anzhela" "Andjela" "Ángela" "'
foreach variant of local Angela {
	replace ameriname = "Angela" if fname == "`variant'"
}

local Angela `" "Anđa" "Angelien" "Angelina" "Lieke" "Angie" "Lina" "Angeline" "Kiki" "Anielka" "Anzhelina" "Angelita" "MASCULINE FORMS" "Deangelo" "Aingeru" "Angel" "Àngel" "Anđelko" "Anđelo" "Anděl" "Anxo" "Engel" "Angelos" "Angelino" "Angelo" "Angiolo" "Angelus" "Angjelko" "Anghel" "Ángel" "Anshel" "'
foreach diminutive of local Angela {
	replace ameriname = "Angela" if fname == "`diminutive'"
}

/* Angelantonio "No equivalents" */

/* Angelantonio "No diminutives" */

local Angelino `" "Deangelo" "Aingeru" "Angel" "Àngel" "Anđelko" "Anđelo" "Anděl" "Anxo" "Engel" "Angelos" "Angelino" "Angelus" "Angjelko" "Anghel" "Anshel" "'
foreach variant of local Angelino {
	replace ameriname = "Angelino" if fname == "`variant'"
}

/* Angelino "No diminutives" */

local ANGELO `" "Deangelo" "Aingeru" "Angel" "Àngel" "Anđelko" "Anđelo" "Anděl" "Anxo" "Engel" "Angelos" "Angelo" "Angiolo" "Angelus" "Anghel" "Ángel" "Anshel" "'
foreach variant of local ANGELO {
	replace ameriname = "ANGELO" if fname == "`variant'"
}

local ANGELO `" "Angelino" "Angjelko" "'
foreach diminutive of local ANGELO {
	replace ameriname = "ANGELO" if fname == "`diminutive'"
}

local Angelos `" "Deangelo" "Aingeru" "Angel" "Àngel" "Anđelko" "Anđelo" "Anděl" "Anxo" "Engel" "Angelos" "Angelo" "Angiolo" "Angelus" "Anghel" "Ángel" "Anshel" "'
foreach variant of local Angelos {
	replace ameriname = "Angelos" if fname == "`variant'"
}

local Angelos `" "Angelino" "Angjelko" "'
foreach diminutive of local Angelos {
	replace ameriname = "Angelos" if fname == "`diminutive'"
}

/* Angiolino "No equivalents" */

/* Angiolino "No diminutives" */

local Angus `" "Óengus" "Angus" "Aonghus" "Aengus" "Aonghas" "Innes" "'
foreach variant of local Angus {
	replace ameriname = "Angus" if fname == "`variant'"
}

local Angus `" "Gus" "'
foreach diminutive of local Angus {
	replace ameriname = "Angus" if fname == "`diminutive'"
}

local Anis `" "Anis" "Enes" "Enis" "'
foreach variant of local Anis {
	replace ameriname = "Anis" if fname == "`variant'"
}

/* Anis "No diminutives" */

local Anke `" "Quanna" "Ane" "Anne" "Anna" "Hanna" "Channah" "Hannah" "Annick" "Ana" "Ani" "Anka" "Aina" "Anaïs" "Anica" "Anita" "Anja" "Hana" "Jana" "Nensi" "Aneta" "Anika" "Annette" "Hanne" "Anke" "Anneke" "Annet" "Annie" "Annika" "Anouk" "Ans" "Antje" "Anissa" "Ann" "Anneka" "Keanna" "Nan" "Nancy" "Nanette" "Nannie" "Nanny" "Anu" "Anneli" "Anni" "Anniina" "Annikki" "Annukka" "Hannele" "Ninon" "Anina" "Annett" "Chanah" "Anett" "Anikó" "Annuska" "Panna" "Panni" "Nainsí" "Annabella" "Annetta" "Ona" "Anniken" "Ania" "Hania" "Anabela" "Anca" "Annushka" "Anushka" "Anya" "Annag" "Nandag" "Anabel" "Anoushka" "Anouska" "Hena" "Henda" "Hendel" "Hene" "Henye" "'
foreach variant of local Anke {
	replace ameriname = "Anke" if fname == "`variant'"
}

local Anke `" "Ankica" "Nettie" "Nita" "Niina" "'
foreach diminutive of local Anke {
	replace ameriname = "Anke" if fname == "`diminutive'"
}

/* Anker "No equivalents" */

/* Anker "No diminutives" */

local Anna `" "Quanna" "Ane" "Anne" "Anna" "Hanna" "Channah" "Hannah" "Ana" "Aina" "Hana" "Jana" "Hanne" "Annelien" "Anissa" "Ann" "Keanna" "Chanah" "Annabella" "Ona" "Anabela" "Anabel" "Hena" "Henda" "Hene" "Henye" "'
foreach variant of local Anna {
	replace ameriname = "Anna" if fname == "`variant'"
}

local Anna `" "Annick" "Ani" "Anka" "Anaïs" "Anica" "Anita" "Anja" "Ankica" "Nensi" "Aneta" "Ane" "Anika" "Annette" "Anke" "Anneke" "Annet" "Annie" "Annika" "Anouk" "Ans" "Antje" "Anneka" "Nan" "Nancy" "Nanette" "Nannie" "Nanny" "Nettie" "Nita" "Anu" "Anneli" "Anni" "Anniina" "Annikki" "Annukka" "Hannele" "Niina" "Ninon" "Anina" "Annett" "Anett" "Anikó" "Annuska" "Panna" "Panni" "Nainsí" "Annetta" "Anniken" "Ania" "Hania" "Anca" "Annushka" "Anushka" "Anya" "Annag" "Nandag" "Anoushka" "Anouska" "Hendel" "'
foreach diminutive of local Anna {
	replace ameriname = "Anna" if fname == "`diminutive'"
}

/* Anne "No equivalents" */

/* Anne "No diminutives" */

local Annibale `" "Hannibal" "Annibale" "Aníbal" "'
foreach variant of local Annibale {
	replace ameriname = "Annibale" if fname == "`variant'"
}

/* Annibale "No diminutives" */

local Annunziato `" "Annunziato" "'
foreach variant of local Annunziato {
	replace ameriname = "Annunziato" if fname == "`variant'"
}

local Annunziato `" "Nunzio" "'
foreach diminutive of local Annunziato {
	replace ameriname = "Annunziato" if fname == "`diminutive'"
}

/* Anschel "No equivalents" */

/* Anschel "No diminutives" */

local Ansel `" "Ansel" "'
foreach variant of local Ansel {
	replace ameriname = "Ansel" if fname == "`variant'"
}

/* Ansel "No diminutives" */

local Anselmo `" "Ansehelm" "Anselm" "Anselmi" "Anselme" "Anselmo" "'
foreach variant of local Anselmo {
	replace ameriname = "Anselmo" if fname == "`variant'"
}

local Anselmo `" "Anssi" "'
foreach diminutive of local Anselmo {
	replace ameriname = "Anselmo" if fname == "`diminutive'"
}

/* Ant "No equivalents" */

/* Ant "No diminutives" */

local Antanas `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antanas {
	replace ameriname = "Antanas" if fname == "`variant'"
}

local Antanas `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antanas {
	replace ameriname = "Antanas" if fname == "`diminutive'"
}

/* Ante "No equivalents" */

/* Ante "No diminutives" */

local Anthony `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Anthony {
	replace ameriname = "Anthony" if fname == "`variant'"
}

local Anthony `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Anthony {
	replace ameriname = "Anthony" if fname == "`diminutive'"
}

/* Antimo "No equivalents" */

/* Antimo "No diminutives" */

local Anto `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Doncho" "Antoni" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Antonie" "Antoon" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Anthony" "Antony" "Tony" "Anĉjo" "Antono" "Tõnis" "Anttoni" "Antón" "Antonios" "Antonis" "Akoni" "Anakoni" "Antal" "Tóni" "Antonello" "Antonio" "Tonino" "Tonio" "Antanas" "Antonij" "Antônio" "António" "Toninho" "Tone" "Toño" "'
foreach variant of local Anto {
	replace ameriname = "Anto" if fname == "`variant'"
}

/* Anto "No diminutives" */

/* Antoin "No equivalents" */

/* Antoin "No diminutives" */

local Antoine `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antoine {
	replace ameriname = "Antoine" if fname == "`variant'"
}

local Antoine `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antoine {
	replace ameriname = "Antoine" if fname == "`diminutive'"
}

/* Antonas "No equivalents" */

/* Antonas "No diminutives" */

/* Antone "No equivalents" */

/* Antone "No diminutives" */

/* Antonie "No equivalents" */

/* Antonie "No diminutives" */

local Antonina `" "Antonina" "'
foreach variant of local Antonina {
	replace ameriname = "Antonina" if fname == "`variant'"
}

local Antonina `" "Nina" "Nena" "Ninette" "Tosia" "MASCULINE FORMS" "Antoninus" "Antonín" "Antonin" "Antonino" "Nino" "'
foreach diminutive of local Antonina {
	replace ameriname = "Antonina" if fname == "`diminutive'"
}

local ANTONINO `" "Antoninus" "Antonín" "Antonin" "Antonino" "'
foreach variant of local ANTONINO {
	replace ameriname = "ANTONINO" if fname == "`variant'"
}

local ANTONINO `" "Nino" "'
foreach diminutive of local ANTONINO {
	replace ameriname = "ANTONINO" if fname == "`diminutive'"
}

local ANTONIO `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local ANTONIO {
	replace ameriname = "ANTONIO" if fname == "`variant'"
}

local ANTONIO `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local ANTONIO {
	replace ameriname = "ANTONIO" if fname == "`diminutive'"
}

local Antonis `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antonis {
	replace ameriname = "Antonis" if fname == "`variant'"
}

local Antonis `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antonis {
	replace ameriname = "Antonis" if fname == "`diminutive'"
}

local Antonius `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antonius {
	replace ameriname = "Antonius" if fname == "`variant'"
}

local Antonius `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antonius {
	replace ameriname = "Antonius" if fname == "`diminutive'"
}

/* Antonnio "No equivalents" */

/* Antonnio "No diminutives" */

local Antony `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antony {
	replace ameriname = "Antony" if fname == "`variant'"
}

local Antony `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antony {
	replace ameriname = "Antony" if fname == "`diminutive'"
}

local Antoon `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antoon {
	replace ameriname = "Antoon" if fname == "`variant'"
}

local Antoon `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antoon {
	replace ameriname = "Antoon" if fname == "`diminutive'"
}

/* Antoun "No equivalents" */

/* Antoun "No diminutives" */

local Antti `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andie" "Andy" "Dre" "Drew" "Andres" "Andrus" "Antti" "Atte" "Tero" "André" "Andor" "András" "Andris" "Bandi" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Dand" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Antti {
	replace ameriname = "Antti" if fname == "`variant'"
}

local Antti `" "Atte" "'
foreach diminutive of local Antti {
	replace ameriname = "Antti" if fname == "`diminutive'"
}

local Antun `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Antoni" "Antonijo" "Antonio" "Antun" "Antonie" "Antoon" "Anthony" "Antony" "Antono" "Anttoni" "Antón" "Antonios" "Antonis" "Anakoni" "Antal" "Antanas" "Antonij" "Antônio" "António" "Antonije" "'
foreach variant of local Antun {
	replace ameriname = "Antun" if fname == "`variant'"
}

local Antun `" "Doncho" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Tõnis" "Akoni" "Tóni" "Antonello" "Tonino" "Tonio" "Toninho" "Tone" "Toño" "'
foreach diminutive of local Antun {
	replace ameriname = "Antun" if fname == "`diminutive'"
}

local Apostolos `" "Apostol" "Apostolis" "Apostolos" "'
foreach variant of local Apostolos {
	replace ameriname = "Apostolos" if fname == "`variant'"
}

/* Apostolos "No diminutives" */

/* Aquilino "No equivalents" */

/* Aquilino "No diminutives" */

/* Aram "No equivalents" */

/* Aram "No diminutives" */

/* Aran "No equivalents" */

/* Aran "No diminutives" */

/* Arch "No equivalents" */

/* Arch "No diminutives" */

local Archie `" "Archembald" "Ercanbald" "Archie" "'
foreach variant of local Archie {
	replace ameriname = "Archie" if fname == "`variant'"
}

/* Archie "No diminutives" */

/* Archimede "No equivalents" */

/* Archimede "No diminutives" */

/* Ardnino "No equivalents" */

/* Ardnino "No diminutives" */

/* Aren "No equivalents" */

/* Aren "No diminutives" */

local Arend `" "Arnold" "Arnau" "Arend" "Arnoud" "Arnout" "Arnaud" "Arnaldo" "Arnt" "'
foreach variant of local Arend {
	replace ameriname = "Arend" if fname == "`variant'"
}

local Arend `" "Aart" "Arno" "Arn" "Arnie" "Ane" "Anne" "Arke" "Arndt" "Arne" "Nöl" "Nölke" "'
foreach diminutive of local Arend {
	replace ameriname = "Arend" if fname == "`diminutive'"
}

/* Areste "No equivalents" */

/* Areste "No diminutives" */

local Aric `" "Eiríkr" "Èric" "Erik" "Jerrik" "Aric" "Eric" "Erick" "Eerik" "Eerikki" "Eero" "Erkki" "Éric" "Erich" "Eiríkur" "Erikas" "Eirik" "Eryk" "Érico" "Jerk" "Jerker" "'
foreach variant of local Aric {
	replace ameriname = "Aric" if fname == "`variant'"
}

/* Aric "No diminutives" */

local Aristide `" "Aristeides" "Aristides" "Aristide" "Aristeidis" "Arisztid" "'
foreach variant of local Aristide {
	replace ameriname = "Aristide" if fname == "`variant'"
}

/* Aristide "No diminutives" */

local Aristides `" "Aristeides" "Aristides" "Aristide" "Aristeidis" "Arisztid" "'
foreach variant of local Aristides {
	replace ameriname = "Aristides" if fname == "`variant'"
}

/* Aristides "No diminutives" */

/* Aristidis "No equivalents" */

/* Aristidis "No diminutives" */

local Arke `" "Arnold" "Arnulf" "Arnau" "Aart" "Arend" "Arno" "Arnoud" "Arnout" "Arn" "Arnie" "Arnaud" "Ane" "Anne" "Arke" "Arndt" "Arne" "Arnaldo" "Arnolfo" "Nöl" "Arnt" "'
foreach variant of local Arke {
	replace ameriname = "Arke" if fname == "`variant'"
}

local Arke `" "Nölke" "'
foreach diminutive of local Arke {
	replace ameriname = "Arke" if fname == "`diminutive'"
}

local Armand `" "Hariman" "Herman" "Hermanus" "Hermanni" "Armand" "Hermann" "Ármann" "Armando" "Ermanno" "German" "'
foreach variant of local Armand {
	replace ameriname = "Armand" if fname == "`variant'"
}

local Armand `" "Harm" "Mannes" "Maan" "'
foreach diminutive of local Armand {
	replace ameriname = "Armand" if fname == "`diminutive'"
}

/* Armas "No equivalents" */

/* Armas "No diminutives" */

/* Armenak "No equivalents" */

/* Armenak "No diminutives" */

local Armin `" "Arminius" "Armin" "'
foreach variant of local Armin {
	replace ameriname = "Armin" if fname == "`variant'"
}

/* Armin "No diminutives" */

/* Armondo "No equivalents" */

/* Armondo "No diminutives" */

local Arnaldo `" "Arnold" "Arnau" "Arend" "Arnoud" "Arnout" "Arnaud" "Arnaldo" "Arnt" "'
foreach variant of local Arnaldo {
	replace ameriname = "Arnaldo" if fname == "`variant'"
}

local Arnaldo `" "Aart" "Arno" "Arn" "Arnie" "Ane" "Anne" "Arke" "Arndt" "Arne" "Nöl" "Nölke" "'
foreach diminutive of local Arnaldo {
	replace ameriname = "Arnaldo" if fname == "`diminutive'"
}

local Arno `" "Arnold" "Arnau" "Aart" "Arno" "Arn" "Arnie" "Arnaud" "Ane" "Anne" "Arke" "Arndt" "Arne" "Arnaldo" "Nöl" "Arnt" "'
foreach variant of local Arno {
	replace ameriname = "Arno" if fname == "`variant'"
}

local Arno `" "Nölke" "'
foreach diminutive of local Arno {
	replace ameriname = "Arno" if fname == "`diminutive'"
}

/* Arnoldo "No equivalents" */

/* Arnoldo "No diminutives" */

/* Arnoldus "No equivalents" */

/* Arnoldus "No diminutives" */

local Arnt `" "Arnold" "Arnau" "Arend" "Arnoud" "Arnout" "Arnaud" "Arnaldo" "Arnt" "'
foreach variant of local Arnt {
	replace ameriname = "Arnt" if fname == "`variant'"
}

local Arnt `" "Aart" "Arno" "Arn" "Arnie" "Ane" "Anne" "Arke" "Arndt" "Arne" "Nöl" "Nölke" "'
foreach diminutive of local Arnt {
	replace ameriname = "Arnt" if fname == "`diminutive'"
}

/* Arpad "No equivalents" */

/* Arpad "No diminutives" */

/* Arsene "No equivalents" */

/* Arsene "No diminutives" */

local Arsenio `" "Arsenios" "Arsenius" "Arsen" "Arsène" "Arsenio" "Arseni" "Arseniy" "'
foreach variant of local Arsenio {
	replace ameriname = "Arsenio" if fname == "`variant'"
}

/* Arsenio "No diminutives" */

/* Artin "No equivalents" */

/* Artin "No diminutives" */

local Artur `" "Arthur" "Artur" "Artturi" "Artúr" "Arturo" "Artūrs" "Artūras" "Artair" "'
foreach variant of local Artur {
	replace ameriname = "Artur" if fname == "`variant'"
}

local Artur `" "Tuur" "Art" "Arto" "Arttu" "'
foreach diminutive of local Artur {
	replace ameriname = "Artur" if fname == "`diminutive'"
}

/* Arvo "No equivalents" */

/* Arvo "No diminutives" */

/* Asbjorn "No equivalents" */

/* Asbjorn "No diminutives" */

/* Asriel "No equivalents" */

/* Asriel "No diminutives" */

/* Assad "No equivalents" */

/* Assad "No diminutives" */

/* Assaf "No equivalents" */

/* Assaf "No diminutives" */

local Assunta `" "Assumpció" "Assumpta" "Assunta" "Assunção" "Asunción" "'
foreach variant of local Assunta {
	replace ameriname = "Assunta" if fname == "`variant'"
}

local Assunta `" "Asun" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Assunta {
	replace ameriname = "Assunta" if fname == "`diminutive'"
}

local Athanas `" "Athanas" "Atanas" "Tase" "Athanasios" "Thanasis" "Thanos" "Atanasij" "Athanasi" "Atanase" "Afanasiy" "Afanasy" "Atanasije" "'
foreach variant of local Athanas {
	replace ameriname = "Athanas" if fname == "`variant'"
}

/* Athanas "No diminutives" */

/* Athanase "No equivalents" */

/* Athanase "No diminutives" */

local Athanasios `" "Athanasios" "Athanasius" "Atanas" "Atanasij" "Athanasi" "Atanase" "Afanasiy" "Afanasy" "Atanasije" "'
foreach variant of local Athanasios {
	replace ameriname = "Athanasios" if fname == "`variant'"
}

local Athanasios `" "Athanas" "Tase" "Thanasis" "Thanos" "'
foreach diminutive of local Athanasios {
	replace ameriname = "Athanasios" if fname == "`diminutive'"
}

/* Athanassios "No equivalents" */

/* Athanassios "No diminutives" */

/* Attelio "No equivalents" */

/* Attelio "No diminutives" */

local Aubrey `" "Alberich" "Ælfric" "Auberon" "Aubrey" "Alberic" "Alberico" "Elric" "'
foreach variant of local Aubrey {
	replace ameriname = "Aubrey" if fname == "`variant'"
}

/* Aubrey "No diminutives" */

/* Aug "No equivalents" */

/* Aug "No diminutives" */

local Augusta `" "Augusta" "Auguste" "Avgusta" "'
foreach variant of local Augusta {
	replace ameriname = "Augusta" if fname == "`variant'"
}

local Augusta `" "Gusta" "Gussie" "MASCULINE FORMS" "Augustus" "August" "Guus" "Gus" "Aku" "Aukusti" "Kusti" "Auguste" "Augusto" "Augusts" "Augustas" "Avgust" "'
foreach diminutive of local Augusta {
	replace ameriname = "Augusta" if fname == "`diminutive'"
}

local Augustin `" "Augustinus" "Agustí" "Augustin" "Augustín" "Augustijn" "Augustine" "Austen" "Austin" "Austyn" "Ágoston" "Agostino" "Augustinas" "Augustyn" "Agostinho" "Avguštin" "Agustín" "Awstin" "'
foreach variant of local Augustin {
	replace ameriname = "Augustin" if fname == "`variant'"
}

local Augustin `" "Dino" "Tin" "Stijn" "Tijn" "Auke" "'
foreach diminutive of local Augustin {
	replace ameriname = "Augustin" if fname == "`diminutive'"
}

/* Augustine "No equivalents" */

/* Augustine "No diminutives" */

local Augustus `" "Augustus" "August" "Aukusti" "Auguste" "Augusto" "Augusts" "Augustas" "Avgust" "'
foreach variant of local Augustus {
	replace ameriname = "Augustus" if fname == "`variant'"
}

local Augustus `" "Guus" "Gus" "Aku" "Kusti" "'
foreach diminutive of local Augustus {
	replace ameriname = "Augustus" if fname == "`diminutive'"
}

local Aurel `" "Aurelius" "Aurel" "Aurèle" "Aurél" "Aurelio" "Aurelijus" "Aureliusz" "Aurélio" "'
foreach variant of local Aurel {
	replace ameriname = "Aurel" if fname == "`variant'"
}

local Aurel `" "Auke" "'
foreach diminutive of local Aurel {
	replace ameriname = "Aurel" if fname == "`diminutive'"
}

local Austin `" "Augustinus" "Agustí" "Augustin" "Augustín" "Augustijn" "Augustine" "Austen" "Austin" "Austyn" "Ágoston" "Agostino" "Augustinas" "Augustyn" "Agostinho" "Avguštin" "Agustín" "Awstin" "'
foreach variant of local Austin {
	replace ameriname = "Austin" if fname == "`variant'"
}

local Austin `" "Dino" "Tin" "Stijn" "Tijn" "Auke" "'
foreach diminutive of local Austin {
	replace ameriname = "Austin" if fname == "`diminutive'"
}

/* Aute "No equivalents" */

/* Aute "No diminutives" */

local Avedis `" "Avedis" "'
foreach variant of local Avedis {
	replace ameriname = "Avedis" if fname == "`variant'"
}

/* Avedis "No diminutives" */

/* Avraam "No equivalents" */

/* Avraam "No diminutives" */

local Avram `" "Avram" "Abram" "Avrum" "'
foreach variant of local Avram {
	replace ameriname = "Avram" if fname == "`variant'"
}

/* Avram "No diminutives" */

local Avrum `" "Avram" "Abram" "Avrum" "'
foreach variant of local Avrum {
	replace ameriname = "Avrum" if fname == "`variant'"
}

/* Avrum "No diminutives" */

/* Awram "No equivalents" */

/* Awram "No diminutives" */

local Aziz `" "'Aziz" "Aziz" "'
foreach variant of local Aziz {
	replace ameriname = "Aziz" if fname == "`variant'"
}

/* Aziz "No diminutives" */

local Azriel `" "'Azri'el" "Azriel" "Azrael" "'
foreach variant of local Azriel {
	replace ameriname = "Azriel" if fname == "`variant'"
}

/* Azriel "No diminutives" */

/* B "No equivalents" */

/* B "No diminutives" */

/* Baldanare "No equivalents" */

/* Baldanare "No diminutives" */

local Baldassare `" "Bel-Sarra-Usur" "Belshazzar" "Baghdasar" "Baltasar" "Belshatzzar" "Baltassar" "Boldizsár" "Baldassare" "Baltazar" "Balthasar" "Balthazar" "'
foreach variant of local Baldassare {
	replace ameriname = "Baldassare" if fname == "`variant'"
}

/* Baldassare "No diminutives" */

/* Baldassarre "No equivalents" */

/* Baldassarre "No diminutives" */

/* Balint "No equivalents" */

/* Balint "No diminutives" */

local Barend `" "Berard" "Berinhard" "Bernard" "Bernhard" "Beñat" "Bernat" "Barend" "Bernát" "Berardo" "Bernardo" "'
foreach variant of local Barend {
	replace ameriname = "Barend" if fname == "`variant'"
}

local Barend `" "Dino" "Bernt" "Ben" "Barney" "Bernie" "Berny" "Bent" "Benno" "Bernd" "Bernardino" "'
foreach diminutive of local Barend {
	replace ameriname = "Barend" if fname == "`diminutive'"
}

/* Barnet "No equivalents" */

/* Barnet "No diminutives" */

/* Barnett "No equivalents" */

/* Barnett "No diminutives" */

local Barney `" "Berard" "Berinhard" "Bernard" "Bernhard" "Beñat" "Barnabas" "Bernat" "Bernt" "Barend" "Ben" "Barney" "Bernie" "Berny" "Barnabé" "Bent" "Benno" "Bernd" "Barna" "Barnabás" "Bernát" "Berardo" "Bernardino" "Bernardo" "Varnava" "'
foreach variant of local Barney {
	replace ameriname = "Barney" if fname == "`variant'"
}

local Barney `" "Dino" "'
foreach diminutive of local Barney {
	replace ameriname = "Barney" if fname == "`diminutive'"
}

local Bartolo `" "Bartholomaios" "Bartholomeus" "Bartholomew" "Bartomeu" "Bartol" "Bartolomej" "Bartoloměj" "Bart" "Bartel" "Mees" "Mies" "Tolly" "Perttu" "Barthélémy" "Bartolomeu" "Bartholomäus" "Barta" "Bartal" "Bertalan" "Bertók" "Bartolo" "Bate" "Bartholomei" "Bartek" "Bartłomiej" "Bartosz" "Varfolomei" "Varfolomey" "Vartolomej" "Jernej" "Nejc" "Bartolomé" "'
foreach variant of local Bartolo {
	replace ameriname = "Bartolo" if fname == "`variant'"
}

/* Bartolo "No diminutives" */

/* Bartolome "No equivalents" */

/* Bartolome "No diminutives" */

local Baruch `" "Barukh" "Baruch" "'
foreach variant of local Baruch {
	replace ameriname = "Baruch" if fname == "`variant'"
}

/* Baruch "No diminutives" */

/* Basil "No equivalents" */

/* Basil "No diminutives" */

local Basile `" "Vasil" "Basileios" "Basilius" "Basil" "Pasi" "Basile" "Vasilios" "Vasilis" "Vassilis" "Basilio" "Vasilii" "Bazyli" "Vasile" "Vasili" "Vasiliy" "Vasily" "Vassily" "Vasilije" "Vasyl" "Wasyl" "'
foreach variant of local Basile {
	replace ameriname = "Basile" if fname == "`variant'"
}

local Basile `" "Vasko" "Baz" "Bazza" "Vaso" "Vasilica" "Vaska" "Vasya" "'
foreach diminutive of local Basile {
	replace ameriname = "Basile" if fname == "`diminutive'"
}

local Basilio `" "Vasil" "Basileios" "Basilius" "Basil" "Pasi" "Basile" "Vasilios" "Vasilis" "Vassilis" "Basilio" "Vasilii" "Bazyli" "Vasile" "Vasili" "Vasiliy" "Vasily" "Vassily" "Vasilije" "Vasyl" "Wasyl" "'
foreach variant of local Basilio {
	replace ameriname = "Basilio" if fname == "`variant'"
}

local Basilio `" "Vasko" "Baz" "Bazza" "Vaso" "Vasilica" "Vaska" "Vasya" "'
foreach diminutive of local Basilio {
	replace ameriname = "Basilio" if fname == "`diminutive'"
}

/* Basse "No equivalents" */

/* Basse "No diminutives" */

/* Battisto "No equivalents" */

/* Battisto "No diminutives" */

local Bautista `" "Baptiste" "Baptist" "Battista" "Baptista" "'
foreach variant of local Bautista {
	replace ameriname = "Bautista" if fname == "`variant'"
}

/* Bautista "No diminutives" */

/* Bechara "No equivalents" */

/* Bechara "No diminutives" */

/* Bedrich "No equivalents" */

/* Bedrich "No diminutives" */

local Bedros `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petur" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Bedros {
	replace ameriname = "Bedros" if fname == "`variant'"
}

local Bedros `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pierino" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Bedros {
	replace ameriname = "Bedros" if fname == "`diminutive'"
}

/* Behr "No equivalents" */

/* Behr "No diminutives" */

/* Beil "No equivalents" */

/* Beil "No diminutives" */

/* Beile "No equivalents" */

/* Beile "No diminutives" */

/* Ben "No equivalents" */

/* Ben "No diminutives" */

/* Bencion "No equivalents" */

/* Bencion "No diminutives" */

local Benedetta `" "Benedikte" "Bénédicte" "Benoite" "Benedikta" "Benedetta" "Benedicta" "Benedykta" "Benedita" "Benita" "'
foreach variant of local Benedetta {
	replace ameriname = "Benedetta" if fname == "`variant'"
}

local Benedetta `" "Bente" "Bettina" "Bengta" "MASCULINE FORMS" "Benedikt" "Bendt" "Bent" "Ben" "Benedictus" "Benedict" "Bennett" "Bennie" "Benny" "Pentti" "Benoit" "Bieito" "Peni" "Bence" "Benedek" "Benedetto" "Benito" "Bettino" "Bendiks" "Benas" "Benediktas" "Benedykt" "Benedito" "Bento" "Bengt" "Benesh" "'
foreach diminutive of local Benedetta {
	replace ameriname = "Benedetta" if fname == "`diminutive'"
}

local Benedikt `" "Benedikt" "Benedictus" "Benedict" "Bennett" "Pentti" "Benoit" "Bieito" "Benedek" "Benedetto" "Benito" "Bendiks" "Benediktas" "Benedykt" "Benedito" "Benesh" "'
foreach variant of local Benedikt {
	replace ameriname = "Benedikt" if fname == "`variant'"
}

local Benedikt `" "Bendt" "Bent" "Ben" "Bennie" "Benny" "Peni" "Bence" "Bettino" "Benas" "Bento" "Bengt" "'
foreach diminutive of local Benedikt {
	replace ameriname = "Benedikt" if fname == "`diminutive'"
}

/* Beneditto "No equivalents" */

/* Beneditto "No diminutives" */

local Bengt `" "Benedikt" "Bendt" "Bent" "Ben" "Benedictus" "Benedict" "Bennett" "Bennie" "Benny" "Pentti" "Benoit" "Bieito" "Peni" "Bence" "Benedek" "Benedetto" "Benito" "Bettino" "Bendiks" "Benas" "Benediktas" "Benedykt" "Benedito" "Bento" "Bengt" "Benesh" "'
foreach variant of local Bengt {
	replace ameriname = "Bengt" if fname == "`variant'"
}

/* Bengt "No diminutives" */

/* Beni "No equivalents" */

/* Beni "No diminutives" */

local Beniamin `" "Binyamin" "Beniamin" "Benjamin" "Benjamín" "Benjámin" "Beniamino" "Benjaminas" "Venijamin" "Veniaminu" "Benjamim" "Veniamin" "Venyamin" "Bünyamin" "'
foreach variant of local Beniamin {
	replace ameriname = "Beniamin" if fname == "`variant'"
}

local Beniamin `" "Ben" "Benj" "Benji" "Benjy" "Bennie" "Benny" "Peni" "Benas" "'
foreach diminutive of local Beniamin {
	replace ameriname = "Beniamin" if fname == "`diminutive'"
}

local Beniamino `" "Binyamin" "Beniamin" "Benjamin" "Benjamín" "Benjámin" "Beniamino" "Benjaminas" "Venijamin" "Veniaminu" "Benjamim" "Veniamin" "Venyamin" "Bünyamin" "'
foreach variant of local Beniamino {
	replace ameriname = "Beniamino" if fname == "`variant'"
}

local Beniamino `" "Ben" "Benj" "Benji" "Benjy" "Bennie" "Benny" "Peni" "Benas" "'
foreach diminutive of local Beniamino {
	replace ameriname = "Beniamino" if fname == "`diminutive'"
}

/* Benie "No equivalents" */

/* Benie "No diminutives" */

local Benigno `" "Benigno" "Benignus" "'
foreach variant of local Benigno {
	replace ameriname = "Benigno" if fname == "`variant'"
}

/* Benigno "No diminutives" */

local Benito `" "Benedikt" "Benedictus" "Benedict" "Bennett" "Pentti" "Benoit" "Bieito" "Benedek" "Benedetto" "Benito" "Bendiks" "Benediktas" "Benedykt" "Benedito" "Benesh" "'
foreach variant of local Benito {
	replace ameriname = "Benito" if fname == "`variant'"
}

local Benito `" "Bendt" "Bent" "Ben" "Bennie" "Benny" "Peni" "Bence" "Bettino" "Benas" "Bento" "Bengt" "'
foreach diminutive of local Benito {
	replace ameriname = "Benito" if fname == "`diminutive'"
}

local Benj `" "Binyamin" "Beniamin" "Benjamin" "Benjamín" "Ben" "Benj" "Benji" "Benjy" "Bennie" "Benny" "Peni" "Benjámin" "Beniamino" "Benas" "Benjaminas" "Venijamin" "Veniaminu" "Benjamim" "Veniamin" "Venyamin" "Bünyamin" "'
foreach variant of local Benj {
	replace ameriname = "Benj" if fname == "`variant'"
}

/* Benj "No diminutives" */

local Bennie `" "Binyamin" "Beniamin" "Benjamin" "Benedikt" "Benjamín" "Bendt" "Bent" "Ben" "Benedictus" "Benj" "Benji" "Benjy" "Bennie" "Benny" "Pentti" "Benoit" "Bieito" "Peni" "Bence" "Benedek" "Benjámin" "Benedetto" "Beniamino" "Benito" "Bettino" "Bendiks" "Benas" "Benediktas" "Benjaminas" "Venijamin" "Veniaminu" "Benedykt" "Benedito" "Benjamim" "Bento" "Veniamin" "Venyamin" "Bengt" "Bünyamin" "Benesh" "'
foreach variant of local Bennie {
	replace ameriname = "Bennie" if fname == "`variant'"
}

/* Bennie "No diminutives" */

local Benno `" "Berard" "Berinhard" "Bernard" "Bernhard" "Beñat" "Bernat" "Bernt" "Barend" "Ben" "Barney" "Bernie" "Berny" "Bent" "Benno" "Bernd" "Bernát" "Berardo" "Bernardino" "Bernardo" "'
foreach variant of local Benno {
	replace ameriname = "Benno" if fname == "`variant'"
}

local Benno `" "Dino" "'
foreach diminutive of local Benno {
	replace ameriname = "Benno" if fname == "`diminutive'"
}

local Benny `" "Binyamin" "Beniamin" "Benjamin" "Benedikt" "Benjamín" "Bendt" "Bent" "Ben" "Benedictus" "Benj" "Benji" "Benjy" "Bennie" "Benny" "Pentti" "Benoit" "Bieito" "Peni" "Bence" "Benedek" "Benjámin" "Benedetto" "Beniamino" "Benito" "Bettino" "Bendiks" "Benas" "Benediktas" "Benjaminas" "Venijamin" "Veniaminu" "Benedykt" "Benedito" "Benjamim" "Bento" "Veniamin" "Venyamin" "Bengt" "Bünyamin" "Benesh" "'
foreach variant of local Benny {
	replace ameriname = "Benny" if fname == "`variant'"
}

/* Benny "No diminutives" */

/* Beno "No equivalents" */

/* Beno "No diminutives" */

/* Bension "No equivalents" */

/* Bension "No diminutives" */

local Benvenuto `" "Benvenuto" "EQUIVALENTS" "'
foreach variant of local Benvenuto {
	replace ameriname = "Benvenuto" if fname == "`variant'"
}

/* Benvenuto "No diminutives" */

/* Beny "No equivalents" */

/* Beny "No diminutives" */

/* Benze "No equivalents" */

/* Benze "No diminutives" */

/* Benzion "No equivalents" */

/* Benzion "No diminutives" */

local Ber `" "Ber" "EQUIVALENTS" "'
foreach variant of local Ber {
	replace ameriname = "Ber" if fname == "`variant'"
}

/* Ber "No diminutives" */

/* Berardino "No equivalents" */

/* Berardino "No diminutives" */

local Berardo `" "Berard" "Berinhard" "Bernard" "Bernhard" "Beñat" "Bernat" "Barend" "Bernát" "Berardo" "Bernardo" "'
foreach variant of local Berardo {
	replace ameriname = "Berardo" if fname == "`variant'"
}

local Berardo `" "Dino" "Bernt" "Ben" "Barney" "Bernie" "Berny" "Bent" "Benno" "Bernd" "Bernardino" "'
foreach diminutive of local Berardo {
	replace ameriname = "Berardo" if fname == "`diminutive'"
}

/* Berco "No equivalents" */

/* Berco "No diminutives" */

/* Bercu "No equivalents" */

/* Bercu "No diminutives" */

/* Bere "No equivalents" */

/* Bere "No diminutives" */

/* Berek "No equivalents" */

/* Berek "No diminutives" */

/* Berend "No equivalents" */

/* Berend "No diminutives" */

/* Berger "No equivalents" */

/* Berger "No diminutives" */

/* Beril "No equivalents" */

/* Beril "No diminutives" */

/* Berisch "No equivalents" */

/* Berisch "No diminutives" */

/* Berka "No equivalents" */

/* Berka "No diminutives" */

/* Berke "No equivalents" */

/* Berke "No diminutives" */

/* Berko "No equivalents" */

/* Berko "No diminutives" */

local Bernardino `" "Berard" "Berinhard" "Bernard" "Bernhard" "Beñat" "Bernat" "Bernt" "Barend" "Ben" "Barney" "Bernie" "Berny" "Bent" "Benno" "Bernd" "Bernát" "Bernardino" "'
foreach variant of local Bernardino {
	replace ameriname = "Bernardino" if fname == "`variant'"
}

local Bernardino `" "Dino" "'
foreach diminutive of local Bernardino {
	replace ameriname = "Bernardino" if fname == "`diminutive'"
}

/* Bernardus "No equivalents" */

/* Bernardus "No diminutives" */

local Bernat `" "Berard" "Berinhard" "Bernard" "Bernhard" "Beñat" "Bernat" "Barend" "Bernát" "Berardo" "Bernardo" "'
foreach variant of local Bernat {
	replace ameriname = "Bernat" if fname == "`variant'"
}

local Bernat `" "Dino" "Bernt" "Ben" "Barney" "Bernie" "Berny" "Bent" "Benno" "Bernd" "Bernardino" "'
foreach diminutive of local Bernat {
	replace ameriname = "Bernat" if fname == "`diminutive'"
}

local Bernt `" "Berard" "Berinhard" "Bernard" "Bernhard" "Beñat" "Bernat" "Bernt" "Barend" "Ben" "Barney" "Bernie" "Berny" "Bent" "Benno" "Bernd" "Bernát" "Berardo" "Bernardino" "Bernardo" "'
foreach variant of local Bernt {
	replace ameriname = "Bernt" if fname == "`variant'"
}

local Bernt `" "Dino" "'
foreach diminutive of local Bernt {
	replace ameriname = "Bernt" if fname == "`diminutive'"
}

local Bert `" "Adalberht" "Adalbert" "Albert" "Albertus" "Berhtoald" "Haribert" "Æþelbeorht" "Æðelberht" "Bertil" "Abe" "Bert" "Brecht" "Elbert" "Al" "Bertie" "Delbert" "Herb" "Herbie" "Alpertti" "Altti" "Pertti" "Aubert" "Herbert" "Abbe" "Alberte" "Adalberto" "Alberto" "Berto" "Bertoldo" "Albaer" "Baer" "Bèr" "Albertas" "Herberto" "Heriberto" "'
foreach variant of local Bert {
	replace ameriname = "Bert" if fname == "`variant'"
}

/* Bert "No diminutives" */

local Bertalan `" "Bartholomaios" "Bartholomeus" "Bartholomew" "Bartomeu" "Bartolomej" "Bartoloměj" "Perttu" "Barthélémy" "Bartolomeu" "Bartholomäus" "Bertalan" "Bartolomeo" "Bartholomei" "Bartłomiej" "Varfolomei" "Varfolomey" "Vartolomej" "Jernej" "Bartolomé" "'
foreach variant of local Bertalan {
	replace ameriname = "Bertalan" if fname == "`variant'"
}

local Bertalan `" "Bartol" "Bart" "Bartel" "Mees" "Mies" "Tolly" "Barta" "Bartal" "Bertók" "Bartolo" "Bate" "Bartek" "Bartosz" "Nejc" "'
foreach diminutive of local Bertalan {
	replace ameriname = "Bertalan" if fname == "`diminutive'"
}

local Berthold `" "Berhtoald" "Bertil" "Berthold" "Bertoldo" "'
foreach variant of local Berthold {
	replace ameriname = "Berthold" if fname == "`variant'"
}

local Berthold `" "Bert" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Berthold {
	replace ameriname = "Berthold" if fname == "`diminutive'"
}

local Bertie `" "Adalberht" "Adalbert" "Albert" "Albertus" "Haribert" "Æþelbeorht" "Æðelberht" "Abe" "Adelbert" "Bert" "Brecht" "Elbert" "Al" "Bertie" "Delbert" "Herb" "Herbie" "Alpertti" "Altti" "Pertti" "Aubert" "Herbert" "Abbe" "Alberte" "Albrecht" "Heribert" "Adalberto" "Alberto" "Berto" "Albaer" "Baer" "Bèr" "Albertas" "Herberto" "Heriberto" "'
foreach variant of local Bertie {
	replace ameriname = "Bertie" if fname == "`variant'"
}

/* Bertie "No diminutives" */

local Bertil `" "Berhtoald" "Bertilo" "Bertil" "Berthold" "Bertoldo" "'
foreach variant of local Bertil {
	replace ameriname = "Bertil" if fname == "`variant'"
}

local Bertil `" "Bert" "'
foreach diminutive of local Bertil {
	replace ameriname = "Bertil" if fname == "`diminutive'"
}

local Bertram `" "Berahthraban" "Berahthram" "Bertram" "Bertrand" "'
foreach variant of local Bertram {
	replace ameriname = "Bertram" if fname == "`variant'"
}

/* Bertram "No diminutives" */

local Bertrand `" "Bertrand" "Bertram" "'
foreach variant of local Bertrand {
	replace ameriname = "Bertrand" if fname == "`variant'"
}

/* Bertrand "No diminutives" */

/* Bertus "No equivalents" */

/* Bertus "No diminutives" */

/* Biase "No equivalents" */

/* Biase "No diminutives" */

local Birger `" "Birgir" "Birger" "'
foreach variant of local Birger {
	replace ameriname = "Birger" if fname == "`variant'"
}

/* Birger "No diminutives" */

local Bjarne `" "Ásbjörn" "Bjarni" "Björn" "Hallbjörn" "Þórbjörn" "Osbeorn" "Bjarke" "Bjarne" "Ebbe" "Osborn" "Oz" "Ozzie" "Ozzy" "Thorben" "Torben" "Björne" "'
foreach variant of local Bjarne {
	replace ameriname = "Bjarne" if fname == "`variant'"
}

/* Bjarne "No diminutives" */

/* Bjorn "No equivalents" */

/* Bjorn "No diminutives" */

/* Blaz "No equivalents" */

/* Blaz "No diminutives" */

/* Blume "No equivalents" */

/* Blume "No diminutives" */

/* Bocco "No equivalents" */

/* Bocco "No diminutives" */

local Bogdan `" "Bogdan" "Bohdan" "'
foreach variant of local Bogdan {
	replace ameriname = "Bogdan" if fname == "`variant'"
}

local Bogdan `" "Boško" "Boban" "'
foreach diminutive of local Bogdan {
	replace ameriname = "Bogdan" if fname == "`diminutive'"
}

local Boghos `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Boghos {
	replace ameriname = "Boghos" if fname == "`variant'"
}

local Boghos `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Boghos {
	replace ameriname = "Boghos" if fname == "`diminutive'"
}

local Bohumil `" "Bogomil" "Bohumil" "Bogumil" "Bogumił" "'
foreach variant of local Bohumil {
	replace ameriname = "Bohumil" if fname == "`variant'"
}

local Bohumil `" "Milan" "Milen" "Mijo" "Milenko" "Miljenko" "Miloš" "Milán" "Milosh" "Miłosz" "'
foreach diminutive of local Bohumil {
	replace ameriname = "Bohumil" if fname == "`diminutive'"
}

local Boleslav `" "Boleslav" "Bolesław" "'
foreach variant of local Boleslav {
	replace ameriname = "Boleslav" if fname == "`variant'"
}

local Boleslav `" "Bolek" "'
foreach diminutive of local Boleslav {
	replace ameriname = "Boleslav" if fname == "`diminutive'"
}

local Bonaventura `" "Bonaventure" "Bonaventura" "'
foreach variant of local Bonaventura {
	replace ameriname = "Bonaventura" if fname == "`variant'"
}

/* Bonaventura "No diminutives" */

local Bonifacio `" "Bonifác" "Bonifaas" "Boniface" "Bonifaz" "Bonifacio" "Bonifatius" "Bonifacy" "'
foreach variant of local Bonifacio {
	replace ameriname = "Bonifacio" if fname == "`variant'"
}

local Bonifacio `" "Faas" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Bonifacio {
	replace ameriname = "Bonifacio" if fname == "`diminutive'"
}

/* Borech "No equivalents" */

/* Borech "No diminutives" */

/* Borge "No equivalents" */

/* Borge "No diminutives" */

local Boris `" "Boris" "Borisu" "Borys" "'
foreach variant of local Boris {
	replace ameriname = "Boris" if fname == "`variant'"
}

local Boris `" "Boro" "Borya" "Bor" "Borut" "'
foreach diminutive of local Boris {
	replace ameriname = "Boris" if fname == "`diminutive'"
}

/* Bornch "No equivalents" */

/* Bornch "No diminutives" */

/* Bortolo "No equivalents" */

/* Bortolo "No diminutives" */

local Boulos `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Boulos {
	replace ameriname = "Boulos" if fname == "`variant'"
}

local Boulos `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Boulos {
	replace ameriname = "Boulos" if fname == "`diminutive'"
}

local Boutros `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petur" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Boutros {
	replace ameriname = "Boutros" if fname == "`variant'"
}

local Boutros `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pierino" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Boutros {
	replace ameriname = "Boutros" if fname == "`diminutive'"
}

/* Bozo "No equivalents" */

/* Bozo "No diminutives" */

/* Bragio "No equivalents" */

/* Bragio "No diminutives" */

/* Brahim "No equivalents" */

/* Brahim "No diminutives" */

/* Branislaw "No equivalents" */

/* Branislaw "No diminutives" */

local Branko `" "Branimir" "Branko" "Branislav" "Bronislav" "Bronislovas" "Bronius" "Bronimir" "Bronisław" "'
foreach variant of local Branko {
	replace ameriname = "Branko" if fname == "`variant'"
}

/* Branko "No diminutives" */

local Brian `" "Brian" "Brion" "Bryan" "Bryon" "'
foreach variant of local Brian {
	replace ameriname = "Brian" if fname == "`variant'"
}

/* Brian "No diminutives" */

/* Brinley "No equivalents" */

/* Brinley "No diminutives" */

/* Bronislawa "No equivalents" */

/* Bronislawa "No diminutives" */

/* Bror "No equivalents" */

/* Bror "No diminutives" */

local Bruce `" "Bruce" "'
foreach variant of local Bruce {
	replace ameriname = "Bruce" if fname == "`variant'"
}

/* Bruce "No diminutives" */

local Bryan `" "Brian" "Brion" "Bryan" "Bryon" "'
foreach variant of local Bryan {
	replace ameriname = "Bryan" if fname == "`variant'"
}

/* Bryan "No diminutives" */

/* Burach "No equivalents" */

/* Burach "No diminutives" */

/* Burech "No equivalents" */

/* Burech "No diminutives" */

/* C "No equivalents" */

/* C "No diminutives" */

/* Calcedonio "No equivalents" */

/* Calcedonio "No diminutives" */

/* Calman "No equivalents" */

/* Calman "No diminutives" */

local Calogera `" "Calogera" "MASCULINE FORMS" "Calogero" "'
foreach variant of local Calogera {
	replace ameriname = "Calogera" if fname == "`variant'"
}

/* Calogera "No diminutives" */

/* Camiel "No equivalents" */

/* Camiel "No diminutives" */

local Camille `" "Camilla" "Camillus" "Kamil" "Kamila" "Kamilla" "Camille" "Camillo" "Kamilė" "Camila" "Camilo" "'
foreach variant of local Camille {
	replace ameriname = "Camille" if fname == "`variant'"
}

local Camille `" "Milla" "Cammie" "Millie" "Milly" "MASCULINE FORMS" "Camillus" "Kamil" "Camillo" "Camilo" "'
foreach diminutive of local Camille {
	replace ameriname = "Camille" if fname == "`diminutive'"
}

/* Candido "No equivalents" */

/* Candido "No diminutives" */

/* Canio "No equivalents" */

/* Canio "No diminutives" */

local Carlton `" "Carleton" "Carlton" "'
foreach variant of local Carlton {
	replace ameriname = "Carlton" if fname == "`variant'"
}

/* Carlton "No diminutives" */

local Carmela `" "Carme" "Karmela" "Karmen" "Carmel" "Carmella" "Carmen" "Carmela" "Carmina" "'
foreach variant of local Carmela {
	replace ameriname = "Carmela" if fname == "`variant'"
}

local Carmela `" "Carmelita" "MASCULINE FORMS" "Carmelo" "Carmine" "Carmo" "'
foreach diminutive of local Carmela {
	replace ameriname = "Carmela" if fname == "`diminutive'"
}

/* Carmello "No equivalents" */

/* Carmello "No diminutives" */

/* Carmillo "No equivalents" */

/* Carmillo "No diminutives" */

/* Carminantonio "No equivalents" */

/* Carminantonio "No diminutives" */

/* Carmino "No equivalents" */

/* Carmino "No diminutives" */

/* Carnelis "No equivalents" */

/* Carnelis "No diminutives" */

/* Carol "No equivalents" */

/* Carol "No diminutives" */

local Carsten `" "Kristiyan" "Kristijan" "Carsten" "Christen" "Christian" "Karsten" "Kresten" "Kristen" "Kristian" "Christiaan" "Kristjan" "Krisztián" "Kristján" "Cristiano" "Christianus" "Kristiāns" "Kristijonas" "Hristijan" "Krystian" "Krystyn" "Cristian" "Cristián" "'
foreach variant of local Carsten {
	replace ameriname = "Carsten" if fname == "`variant'"
}

local Carsten `" "Krsto" "Christer" "Kris" "Chris" "Cristi" "Krister" "'
foreach diminutive of local Carsten {
	replace ameriname = "Carsten" if fname == "`diminutive'"
}

local Casimir `" "Kazimír" "Casimir" "Kasimir" "Kázmér" "Casimiro" "Kazimieras" "Kazimir" "Kazimierz" "'
foreach variant of local Casimir {
	replace ameriname = "Casimir" if fname == "`variant'"
}

local Casimir `" "Kazik" "'
foreach diminutive of local Casimir {
	replace ameriname = "Casimir" if fname == "`diminutive'"
}

local Casimiro `" "Kazimír" "Casimir" "Kasimir" "Kázmér" "Casimiro" "Kazimieras" "Kazimir" "Kazimierz" "'
foreach variant of local Casimiro {
	replace ameriname = "Casimiro" if fname == "`variant'"
}

local Casimiro `" "Kazik" "'
foreach diminutive of local Casimiro {
	replace ameriname = "Casimiro" if fname == "`diminutive'"
}

/* Casimo "No equivalents" */

/* Casimo "No diminutives" */

local Caspar `" "Casper" "Jesper" "Kasper" "Jasper" "Gaspard" "Kaspar" "Gáspár" "Gaspare" "Gasparo" "Caspar" "Gaspar" "Kaspars" "Kasparas" "Kacper" "Gašper" "'
foreach variant of local Caspar {
	replace ameriname = "Caspar" if fname == "`variant'"
}

local Caspar `" "Cas" "'
foreach diminutive of local Caspar {
	replace ameriname = "Caspar" if fname == "`diminutive'"
}

local Casper `" "Casper" "Jesper" "Kasper" "Jasper" "Gaspard" "Kaspar" "Gáspár" "Gaspare" "Gasparo" "Caspar" "Gaspar" "Kaspars" "Kasparas" "Kacper" "Gašper" "'
foreach variant of local Casper {
	replace ameriname = "Casper" if fname == "`variant'"
}

local Casper `" "Cas" "'
foreach diminutive of local Casper {
	replace ameriname = "Casper" if fname == "`diminutive'"
}

/* Castrenze "No equivalents" */

/* Castrenze "No diminutives" */

/* Catello "No equivalents" */

/* Catello "No diminutives" */

/* Cateno "No equivalents" */

/* Cateno "No diminutives" */

local Caterina `" "Aikaterine" "Katalin" "Kattalin" "Katsiaryna" "Katarin" "Katell" "Ekaterina" "Caterina" "Katarina" "Kateřina" "Cathrine" "Katharina" "Kathrine" "Katrine" "Catharina" "Katelijn" "Katelijne" "Katrien" "Katrijn" "Katrina" "Caetlin" "Caitlin" "Caitlyn" "Catharine" "Catherin" "Catherina" "Catherine" "Cathleen" "Cathryn" "Kaitlin" "Kaitlyn" "Kaitlynn" "Katelin" "Katelyn" "Katelynn" "Katharine" "Katharyn" "Katherina" "Katherine" "Katheryn" "Katheryne" "Kathleen" "Kathlyn" "Kathryn" "Katlyn" "Katriona" "Kadri" "Katariina" "Katrin" "Katriina" "Catarina" "Ekaterine" "Katarine" "Katerina" "Katina" "Kakalina" "Kateri" "Katrín" "Caitlín" "Caitria" "Caitríona" "Catrina" "Catriona" "Kotryna" "Cateline" "Katarzyna" "Cătălina" "Catina" "Ecaterina" "Jekaterina" "Yekaterina" "Caitrìona" "Katarína" "Catalina" "Catrine" "Kateryna" "Catrin" "'
foreach variant of local Caterina {
	replace ameriname = "Caterina" if fname == "`variant'"
}

local Caterina `" "Katerina" "Ina" "Kata" "Kate" "Katica" "Tina" "Katka" "Caja" "Carina" "Kaja" "Karen" "Karin" "Karina" "Katja" "Trine" "Cato" "Katinka" "Rina" "Rini" "Riny" "Tineke" "Trijntje" "Caelie" "Caileigh" "Cailin" "Cailyn" "Caleigh" "Caren" "Caryn" "Cate" "Cathy" "Cayley" "Kae" "Kaelea" "Kaelee" "Kaelyn" "Kaety" "Kailee" "Kailey" "Kailyn" "Kaleigh" "Kaley" "Kalie" "Kalyn" "Karena" "Karyn" "Kat" "Katee" "Katey" "Kathi" "Kathie" "Kathy" "Katie" "Katy" "Kay" "Kaye" "Kayla" "Kayleah" "Kaylee" "Kayleen" "Kayleigh" "Kayley" "Kaylie" "Kaylin" "Kayly" "Kaylyn" "Kaylynn" "Keighley" "Kerena" "Kit" "Kitty" "Trina" "Kaia" "Kaisa" "Kati" "Riina" "Triinu" "Iina" "Kaarina" "Kaija" "Katri" "Carine" "Karine" "Nienke" "Nine" "Nynke" "Eka" "Cathrin" "Catrin" "Käthe" "Kathrin" "Kalena" "Katalinka" "Kató" "Kitti" "Cáit" "Ríona" "Katrė" "Kari" "Kasia" "Cátia" "Katenka" "Katia" "Katya" "Cajsa" "Carin" "Kai" "Kaj" "Kajsa" "Cadi" "MASCULINE FORMS" "Cătălin" "'
foreach diminutive of local Caterina {
	replace ameriname = "Caterina" if fname == "`diminutive'"
}

local Cedric `" "Caratacos" "Caratacus" "Cerdic" "Cedric" "Caradoc" "'
foreach variant of local Cedric {
	replace ameriname = "Cedric" if fname == "`variant'"
}

/* Cedric "No diminutives" */

local Celeste `" "Celeste" "Céleste" "Caelestis" "MASCULINE FORMS" "'
foreach variant of local Celeste {
	replace ameriname = "Celeste" if fname == "`variant'"
}

/* Celeste "No diminutives" */

local Celestino `" "Celestine" "Célestin" "Celestino" "Caelestinus" "Celestyn" "'
foreach variant of local Celestino {
	replace ameriname = "Celestino" if fname == "`variant'"
}

/* Celestino "No diminutives" */

local Celso `" "Celsus" "Celso" "'
foreach variant of local Celso {
	replace ameriname = "Celso" if fname == "`variant'"
}

/* Celso "No diminutives" */

/* Cesar "No equivalents" */

/* Cesar "No diminutives" */

local Cesarino `" "Caesar" "César" "Cesarino" "Cezary" "Cézar" "Cezar" "Kaiser" "'
foreach variant of local Cesarino {
	replace ameriname = "Cesarino" if fname == "`variant'"
}

/* Cesarino "No diminutives" */

/* Cesario "No equivalents" */

/* Cesario "No diminutives" */

/* Cesaro "No equivalents" */

/* Cesaro "No diminutives" */

/* Cesidio "No equivalents" */

/* Cesidio "No diminutives" */

/* Ceslaw "No equivalents" */

/* Ceslaw "No diminutives" */

/* Chaie "No equivalents" */

/* Chaie "No diminutives" */

/* Chaike "No equivalents" */

/* Chaike "No diminutives" */

/* Chaikel "No equivalents" */

/* Chaikel "No diminutives" */

/* Chain "No equivalents" */

/* Chain "No diminutives" */

/* Chaine "No equivalents" */

/* Chaine "No diminutives" */

/* Chaja "No equivalents" */

/* Chaja "No diminutives" */

/* Chaje "No equivalents" */

/* Chaje "No diminutives" */

/* Chajem "No equivalents" */

/* Chajem "No diminutives" */

/* Chajm "No equivalents" */

/* Chajm "No diminutives" */

/* Chann "No equivalents" */

/* Chann "No diminutives" */

/* Charalambos "No equivalents" */

/* Charalambos "No diminutives" */

local Charalampos `" "Haralambi" "Charalampos" "'
foreach variant of local Charalampos {
	replace ameriname = "Charalampos" if fname == "`variant'"
}

/* Charalampos "No diminutives" */

/* Charilaos "No equivalents" */

/* Charilaos "No diminutives" */

local Charley `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kaarle" "Kaarlo" "Kalle" "Charles" "Charlot" "Kale" "Karcsi" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Carlinhos" "Carlito" "Carlitos" "Carol" "Siarl" "'
foreach variant of local Charley {
	replace ameriname = "Charley" if fname == "`variant'"
}

/* Charley "No diminutives" */

local Charlie `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kaarle" "Kaarlo" "Kalle" "Charles" "Charlot" "Kale" "Karcsi" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Carlinhos" "Carlito" "Carlitos" "Carol" "Siarl" "'
foreach variant of local Charlie {
	replace ameriname = "Charlie" if fname == "`variant'"
}

/* Charlie "No diminutives" */

/* Charm "No equivalents" */

/* Charm "No diminutives" */

/* Chaskiel "No equivalents" */

/* Chaskiel "No diminutives" */

local Chatzkel `" "Iezekiel" "Yechezkel" "Ezechiel" "Hiezecihel" "Ezekiel" "Hesekiel" "Ezequiel" "Chatzkel" "Haskel" "'
foreach variant of local Chatzkel {
	replace ameriname = "Chatzkel" if fname == "`variant'"
}

local Chatzkel `" "Zeke" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Chatzkel {
	replace ameriname = "Chatzkel" if fname == "`diminutive'"
}

/* Chawe "No equivalents" */

/* Chawe "No diminutives" */

/* Chazkel "No equivalents" */

/* Chazkel "No diminutives" */

local Chester `" "Chester" "'
foreach variant of local Chester {
	replace ameriname = "Chester" if fname == "`variant'"
}

local Chester `" "Chet" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Chester {
	replace ameriname = "Chester" if fname == "`diminutive'"
}

/* Chiel "No equivalents" */

/* Chiel "No diminutives" */

/* Chil "No equivalents" */

/* Chil "No diminutives" */

/* Chone "No equivalents" */

/* Chone "No diminutives" */

/* Chr "No equivalents" */

/* Chr "No diminutives" */

local Chris `" "Kistiñe" "Hristina" "Hristo" "Hristofor" "Kristina" "Kristiyan" "Ina" "Kristijan" "Kristofor" "Krsto" "Tina" "Kristýna" "Kryštof" "Carsten" "Christa" "Christen" "Christer" "Christian" "Christin" "Christina" "Christine" "Christoffer" "Karsten" "Kirsten" "Kirstine" "Kresten" "Kris" "Kristen" "Kristian" "Kristin" "Kristine" "Kristoffer" "Stina" "Stine" "Tine" "Chris" "Chip" "Chrissie" "Chrissy" "Christi" "Christie" "Christy" "Cristen" "Kiersten" "Kiki" "Kit" "Krista" "Kristi" "Kristia" "Kristie" "Kristy" "Krysten" "Kyrsten" "Tiana" "Tianna" "Topher" "Kristiina" "Kristjan" "Iina" "Kirsi" "Kirsti" "Risto" "Stiina" "Tiina" "Christelle" "Christiane" "Christophe" "Christel" "Christoph" "Kerstin" "Kristiane" "Christoforos" "Kilikina" "Kristóf" "Krisztián" "Krisztina" "Kristín" "Kristján" "Kristjana" "Críostóir" "Cristiana" "Cristiano" "Cristina" "Cristoforo" "Christophoros" "Christiana" "Christianus" "Christophorus" "Kristaps" "Kristiāna" "Kristiāns" "Kristīna" "Kristīne" "Stien" "Kristijonas" "Kristupas" "Hristijan" "Kine" "Kjerstin" "Krysia" "Krystian" "Krystiana" "Krystyn" "Krystyna" "Krzyś" "Krzysiek" "Krzysztof" "Cristóvão" "Cristi" "Cristian" "Cairistìona" "Kester" "Kirsteen" "Kirstie" "Kirstin" "Kirsty" "Kristína" "Krištof" "Cristián" "Cristóbal" "Kia" "Krister" "Khrystyna" "Crystin" "'
foreach variant of local Chris {
	replace ameriname = "Chris" if fname == "`variant'"
}

local Chris `" "Kiki" "Kjersti" "MASCULINE FORMS" "Kristiyan" "Kristijan" "Krsto" "Carsten" "Christen" "Christer" "Christian" "Karsten" "Kresten" "Kris" "Kristen" "Kristian" "Christiaan" "Kristjan" "Krisztián" "Kristján" "Cristiano" "Christianus" "Kristiāns" "Kristijonas" "Hristijan" "Krystian" "Krystyn" "Cristi" "Cristian" "Cristián" "Krister" "'
foreach diminutive of local Chris {
	replace ameriname = "Chris" if fname == "`diminutive'"
}

local Christ `" "Christ" "Christos" "'
foreach variant of local Christ {
	replace ameriname = "Christ" if fname == "`variant'"
}

/* Christ "No diminutives" */

/* Christen "No equivalents" */

/* Christen "No diminutives" */

local Christiaan `" "Kristiyan" "Kristijan" "Carsten" "Christen" "Christian" "Karsten" "Kresten" "Kristen" "Kristian" "Christiaan" "Kristjan" "Krisztián" "Kristján" "Cristiano" "Christianus" "Kristiāns" "Kristijonas" "Hristijan" "Krystian" "Krystyn" "Cristian" "Cristián" "'
foreach variant of local Christiaan {
	replace ameriname = "Christiaan" if fname == "`variant'"
}

local Christiaan `" "Krsto" "Christer" "Kris" "Chris" "Cristi" "Krister" "'
foreach diminutive of local Christiaan {
	replace ameriname = "Christiaan" if fname == "`diminutive'"
}

/* Christo "No equivalents" */

/* Christo "No diminutives" */

/* Christof "No equivalents" */

/* Christof "No diminutives" */

local Christoffer `" "Hristofor" "Kristofor" "Kryštof" "Christoffer" "Kristoffer" "Christoffel" "Christopher" "Kristopher" "Christophe" "Christoph" "Christoforos" "Kristóf" "Críostóir" "Cristoforo" "Christophoros" "Christophorus" "Kristaps" "Kristupas" "Krzysztof" "Cristóvão" "Krištof" "Cristóbal" "'
foreach variant of local Christoffer {
	replace ameriname = "Christoffer" if fname == "`variant'"
}

local Christoffer `" "Hristo" "Krsto" "Kris" "Chip" "Chris" "Kit" "Topher" "Risto" "Christie" "Christy" "Krzyś" "Krzysiek" "Kester" "'
foreach diminutive of local Christoffer {
	replace ameriname = "Christoffer" if fname == "`diminutive'"
}

local Christoforos `" "Hristofor" "Kristofor" "Kryštof" "Christoffer" "Kristoffer" "Christoffel" "Christopher" "Kristopher" "Christophe" "Christoph" "Christoforos" "Kristóf" "Críostóir" "Cristoforo" "Christophoros" "Christophorus" "Kristaps" "Kristupas" "Krzysztof" "Cristóvão" "Krištof" "Cristóbal" "'
foreach variant of local Christoforos {
	replace ameriname = "Christoforos" if fname == "`variant'"
}

local Christoforos `" "Hristo" "Krsto" "Kris" "Chip" "Chris" "Kit" "Topher" "Risto" "Christie" "Christy" "Krzyś" "Krzysiek" "Kester" "'
foreach diminutive of local Christoforos {
	replace ameriname = "Christoforos" if fname == "`diminutive'"
}

local Christoph `" "Hristofor" "Kristofor" "Kryštof" "Christoffer" "Kristoffer" "Christoffel" "Christopher" "Kristopher" "Christophe" "Christoph" "Christoforos" "Kristóf" "Críostóir" "Cristoforo" "Christophoros" "Christophorus" "Kristaps" "Kristupas" "Krzysztof" "Cristóvão" "Krištof" "Cristóbal" "'
foreach variant of local Christoph {
	replace ameriname = "Christoph" if fname == "`variant'"
}

local Christoph `" "Hristo" "Krsto" "Kris" "Chip" "Chris" "Kit" "Topher" "Risto" "Christie" "Christy" "Krzyś" "Krzysiek" "Kester" "'
foreach diminutive of local Christoph {
	replace ameriname = "Christoph" if fname == "`diminutive'"
}

/* Chune "No equivalents" */

/* Chune "No diminutives" */

local Cipriano `" "Cyprianus" "Cibrán" "Cyprian" "Cipriano" "Ciprian" "Cebrián" "'
foreach variant of local Cipriano {
	replace ameriname = "Cipriano" if fname == "`variant'"
}

/* Cipriano "No diminutives" */

local Ciriaco `" "Cyrillus" "Kyriakos" "Kyrillos" "Kiril" "Cyril" "Cyrille" "Ciriaco" "Cirillo" "Cyriacus" "Kirils" "Kyrilu" "Cyryl" "Ciríaco" "Kirill" "Ciril" "Kyrylo" "'
foreach variant of local Ciriaco {
	replace ameriname = "Ciriaco" if fname == "`variant'"
}

local Ciriaco `" "Cy" "Kire" "Kiro" "'
foreach diminutive of local Ciriaco {
	replace ameriname = "Ciriaco" if fname == "`diminutive'"
}

local Ciril `" "Cyrillus" "Kyriakos" "Kyrillos" "Kiril" "Cyril" "Cyrille" "Ciriaco" "Cirillo" "Cyriacus" "Kirils" "Kyrilu" "Cyryl" "Ciríaco" "Kirill" "Ciril" "Kyrylo" "'
foreach variant of local Ciril {
	replace ameriname = "Ciril" if fname == "`variant'"
}

local Ciril `" "Cy" "Kire" "Kiro" "'
foreach diminutive of local Ciril {
	replace ameriname = "Ciril" if fname == "`diminutive'"
}

local Cirino `" "Cyrus" "Kyros" "Kurush" "Koresh" "Cy" "Cirino" "Kir" "'
foreach variant of local Cirino {
	replace ameriname = "Cirino" if fname == "`variant'"
}

/* Cirino "No diminutives" */

/* Clas "No equivalents" */

/* Clas "No diminutives" */

local Claude `" "Claudia" "Claudius" "Klavdiya" "Klaudija" "Klaudio" "Klaudie" "Claud" "Claude" "Claudie" "Claudio" "Klaudijs" "Klaudia" "Klaudiusz" "Cláudia" "Cláudio" "Claudiu" "Klavdija" "Gladys" "'
foreach variant of local Claude {
	replace ameriname = "Claude" if fname == "`variant'"
}

local Claude `" "Claudette" "Claudine" "Klava" "MASCULINE FORMS" "Claudius" "Klaudio" "Claud" "Claudio" "Klaudijs" "Klaudiusz" "Cláudio" "Claudiu" "'
foreach diminutive of local Claude {
	replace ameriname = "Claude" if fname == "`diminutive'"
}

local Claudio `" "Claudius" "Klaudio" "Claud" "Claude" "Claudio" "Klaudijs" "Klaudiusz" "Cláudio" "Claudiu" "'
foreach variant of local Claudio {
	replace ameriname = "Claudio" if fname == "`variant'"
}

/* Claudio "No diminutives" */

local Claus `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Nicolaas" "Niek" "Nikolaas" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Niklas" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Nicolaos" "Kolos" "Miklós" "Miksa" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nikolaj" "Nicolao" "Nicolás" "Claes" "Klas" "Mykola" "'
foreach variant of local Claus {
	replace ameriname = "Claus" if fname == "`variant'"
}

local Claus `" "Colin" "Collin" "Launo" "'
foreach diminutive of local Claus {
	replace ameriname = "Claus" if fname == "`diminutive'"
}

local Clemens `" "Kliment" "Climent" "Klement" "Klemens" "Clement" "Clément" "Clemens" "Kelemen" "Clemente" "Klemen" "'
foreach variant of local Clemens {
	replace ameriname = "Clemens" if fname == "`variant'"
}

local Clemens `" "Clem" "Klim" "'
foreach diminutive of local Clemens {
	replace ameriname = "Clemens" if fname == "`diminutive'"
}

local Clement `" "Kliment" "Climent" "Klement" "Klemens" "Clement" "Clément" "Clemens" "Kelemen" "Clemente" "Clementius" "Klemen" "'
foreach variant of local Clement {
	replace ameriname = "Clement" if fname == "`variant'"
}

local Clement `" "Clem" "Klim" "'
foreach diminutive of local Clement {
	replace ameriname = "Clement" if fname == "`diminutive'"
}

/* Clyde "No equivalents" */

/* Clyde "No diminutives" */

/* Colin "No equivalents" */

/* Colin "No diminutives" */

/* Cologero "No equivalents" */

/* Cologero "No diminutives" */

local Colombo `" "Colin" "Colm" "Colum" "Colombo" "Columba" "Cailean" "Callum" "Calum" "'
foreach variant of local Colombo {
	replace ameriname = "Colombo" if fname == "`variant'"
}

local Colombo `" "Coleman" "Kolman" "Koloman" "Colmán" "Columban" "Colombano" "Columbanus" "'
foreach diminutive of local Colombo {
	replace ameriname = "Colombo" if fname == "`diminutive'"
}

/* Commaso "No equivalents" */

/* Commaso "No diminutives" */

local Concetta `" "Concepta" "Concetta" "Concepción" "'
foreach variant of local Concetta {
	replace ameriname = "Concetta" if fname == "`variant'"
}

local Concetta `" "Concettina" "Chita" "Concha" "Conchita" "MASCULINE FORMS" "'
foreach diminutive of local Concetta {
	replace ameriname = "Concetta" if fname == "`diminutive'"
}

local Concetto `" "Concetto" "'
foreach variant of local Concetto {
	replace ameriname = "Concetto" if fname == "`variant'"
}

/* Concetto "No diminutives" */

/* Concezio "No equivalents" */

/* Concezio "No diminutives" */

/* Cono "No equivalents" */

/* Cono "No diminutives" */

/* Const "No equivalents" */

/* Const "No diminutives" */

/* Constandinos "No equivalents" */

/* Constandinos "No diminutives" */

local Constant `" "Constant" "Costanzo" "Constans" "Konstanty" "'
foreach variant of local Constant {
	replace ameriname = "Constant" if fname == "`variant'"
}

/* Constant "No diminutives" */

local Constantine `" "Kostandin" "Konstantin" "Kostadin" "Constantijn" "Constantin" "Konstantine" "Konstantinos" "Constantine" "Costantino" "Constantinus" "Konstantyn" "Costache" "Kostyantyn" "Cystennin" "'
foreach variant of local Constantine {
	replace ameriname = "Constantine" if fname == "`variant'"
}

local Constantine `" "Kosta" "Stijn" "Gus" "Costel" "Costică" "Costin" "Dinu" "Kostya" "'
foreach diminutive of local Constantine {
	replace ameriname = "Constantine" if fname == "`diminutive'"
}

/* Constantino "No equivalents" */

/* Constantino "No diminutives" */

local Cornelio `" "Cornelius" "Kornel" "Cornelis" "Kerneels" "Corneille" "Korneli" "Kornél" "Cornelio" "Cornélio" "Cornel" "Corneliu" "'
foreach variant of local Cornelio {
	replace ameriname = "Cornelio" if fname == "`variant'"
}

local Cornelio `" "Cai" "Caj" "Kai" "Kaj" "Kay" "Cees" "Corné" "Kees" "Niels" "Connie" "'
foreach diminutive of local Cornelio {
	replace ameriname = "Cornelio" if fname == "`diminutive'"
}

local Cornelius `" "Cornelius" "Kornel" "Cornelis" "Kerneels" "Corneille" "Korneli" "Kornél" "Cornelio" "Cornélio" "Cornel" "Corneliu" "'
foreach variant of local Cornelius {
	replace ameriname = "Cornelius" if fname == "`variant'"
}

local Cornelius `" "Cai" "Caj" "Kai" "Kaj" "Kay" "Cees" "Corné" "Kees" "Niels" "Connie" "'
foreach diminutive of local Cornelius {
	replace ameriname = "Cornelius" if fname == "`diminutive'"
}

/* Cornelus "No equivalents" */

/* Cornelus "No diminutives" */

local Corradino `" "Conrad" "Konrád" "Konrad" "Koen" "Koenraad" "Koert" "Connie" "Curt" "Kurt" "Cord" "Kord" "Corradino" "Kondrat" "Conrado" "'
foreach variant of local Corradino {
	replace ameriname = "Corradino" if fname == "`variant'"
}

local Corradino `" "Dino" "'
foreach diminutive of local Corradino {
	replace ameriname = "Corradino" if fname == "`diminutive'"
}

local Corrado `" "Conrad" "Konrád" "Konrad" "Koenraad" "Curt" "Kurt" "Cord" "Kord" "Corrado" "Kondrat" "Conrado" "'
foreach variant of local Corrado {
	replace ameriname = "Corrado" if fname == "`variant'"
}

local Corrado `" "Dino" "Koen" "Koert" "Connie" "Corradino" "'
foreach diminutive of local Corrado {
	replace ameriname = "Corrado" if fname == "`diminutive'"
}

/* Cosino "No equivalents" */

/* Cosino "No diminutives" */

local Cosmo `" "Cosmas" "Kosmas" "Kuzman" "Cosmo" "Côme" "Cosme" "Cosimo" "Cosma" "Cosmin" "Kuzma" "'
foreach variant of local Cosmo {
	replace ameriname = "Cosmo" if fname == "`variant'"
}

/* Cosmo "No diminutives" */

/* Costa "No equivalents" */

/* Costa "No diminutives" */

/* Costante "No equivalents" */

/* Costante "No diminutives" */

/* Costantin "No equivalents" */

/* Costantin "No diminutives" */

/* Costantinos "No equivalents" */

/* Costantinos "No diminutives" */

local Costanzo `" "Constant" "Costanzo" "Constans" "Konstanty" "'
foreach variant of local Costanzo {
	replace ameriname = "Costanzo" if fname == "`variant'"
}

/* Costanzo "No diminutives" */

/* Costas "No equivalents" */

/* Costas "No diminutives" */

local Crescenzo `" "Kreskes" "Crescens" "Crescenzo" "'
foreach variant of local Crescenzo {
	replace ameriname = "Crescenzo" if fname == "`variant'"
}

local Crescenzo `" "Enzo" "'
foreach diminutive of local Crescenzo {
	replace ameriname = "Crescenzo" if fname == "`diminutive'"
}

/* Creslaw "No equivalents" */

/* Creslaw "No diminutives" */

/* Crispino "No equivalents" */

/* Crispino "No diminutives" */

/* Cristobal "No equivalents" */

/* Cristobal "No diminutives" */

/* Cristofaro "No equivalents" */

/* Cristofaro "No diminutives" */

local Cristoforo `" "Hristofor" "Kristofor" "Kryštof" "Christoffer" "Kristoffer" "Christoffel" "Christopher" "Kristopher" "Christophe" "Christoph" "Christoforos" "Kristóf" "Críostóir" "Cristoforo" "Christophoros" "Christophorus" "Kristaps" "Kristupas" "Krzysztof" "Cristóvão" "Krištof" "Cristóbal" "'
foreach variant of local Cristoforo {
	replace ameriname = "Cristoforo" if fname == "`variant'"
}

local Cristoforo `" "Hristo" "Krsto" "Kris" "Chip" "Chris" "Kit" "Topher" "Risto" "Christie" "Christy" "Krzyś" "Krzysiek" "Kester" "'
foreach diminutive of local Cristoforo {
	replace ameriname = "Cristoforo" if fname == "`diminutive'"
}

/* Croce "No equivalents" */

/* Croce "No diminutives" */

local Curt `" "Conrad" "Konrád" "Konrad" "Koenraad" "Curt" "Kurt" "Cord" "Kord" "Corrado" "Kondrat" "Conrado" "'
foreach variant of local Curt {
	replace ameriname = "Curt" if fname == "`variant'"
}

local Curt `" "Dino" "Koen" "Koert" "Connie" "Corradino" "'
foreach diminutive of local Curt {
	replace ameriname = "Curt" if fname == "`diminutive'"
}

local Cuthbert `" "Cuthberht" "'
foreach variant of local Cuthbert {
	replace ameriname = "Cuthbert" if fname == "`variant'"
}

/* Cuthbert "No diminutives" */

/* Cyriel "No equivalents" */

/* Cyriel "No diminutives" */

/* Cyrill "No equivalents" */

/* Cyrill "No diminutives" */

local Cyrille `" "Cyrillus" "Kyriakos" "Kyrillos" "Kiril" "Cyril" "Cyrille" "Ciriaco" "Cirillo" "Cyriacus" "Kirils" "Kyrilu" "Cyryl" "Ciríaco" "Kirill" "Ciril" "Kyrylo" "'
foreach variant of local Cyrille {
	replace ameriname = "Cyrille" if fname == "`variant'"
}

local Cyrille `" "Cy" "Kire" "Kiro" "'
foreach diminutive of local Cyrille {
	replace ameriname = "Cyrille" if fname == "`diminutive'"
}

/* D "No equivalents" */

/* D "No diminutives" */

local Damiano `" "Damianos" "Damianus" "Damyan" "Damjan" "Damiaan" "Damian" "Damion" "Damon" "Damien" "Damiano" "Demyan" "Damijan" "'
foreach variant of local Damiano {
	replace ameriname = "Damiano" if fname == "`variant'"
}

/* Damiano "No diminutives" */

/* Dan "No equivalents" */

/* Dan "No diminutives" */

/* Danato "No equivalents" */

/* Danato "No diminutives" */

local Dane `" "Dane" "Dean" "Dene" "'
foreach variant of local Dane {
	replace ameriname = "Dane" if fname == "`variant'"
}

/* Dane "No diminutives" */

local Daniele `" "Danyal" "Daniel" "Taniel" "Danel" "Daniyyel" "Danihel" "Deniel" "Danail" "Danijel" "Danilo" "Daniël" "Taneli" "Dániel" "Daníel" "Daniele" "Daniels" "Danielius" "Daniilu" "Daniil" "Deiniol" "'
foreach variant of local Daniele {
	replace ameriname = "Daniele" if fname == "`variant'"
}

local Daniele `" "Danko" "Dan" "Daan" "Dannie" "Danny" "Tatu" "Dani" "Dănuț" "'
foreach diminutive of local Daniele {
	replace ameriname = "Daniele" if fname == "`diminutive'"
}

local Danilo `" "Danyal" "Daniel" "Taniel" "Danel" "Daniyyel" "Danihel" "Deniel" "Danail" "Danijel" "Danilo" "Daniël" "Taneli" "Dániel" "Daníel" "Daniele" "Daniels" "Danielius" "Daniilu" "Daniil" "Deiniol" "'
foreach variant of local Danilo {
	replace ameriname = "Danilo" if fname == "`variant'"
}

local Danilo `" "Danko" "Dan" "Daan" "Dannie" "Danny" "Tatu" "Dani" "Dănuț" "'
foreach diminutive of local Danilo {
	replace ameriname = "Danilo" if fname == "`diminutive'"
}

/* Daoud "No equivalents" */

/* Daoud "No diminutives" */

local Dario `" "Dareios" "Darayavahush" "Daryawesh" "Darius" "Darijo" "Dario" "Darijus" "Dariush" "Daryush" "Dariusz" "Darío" "'
foreach variant of local Dario {
	replace ameriname = "Dario" if fname == "`variant'"
}

local Dario `" "Darek" "'
foreach diminutive of local Dario {
	replace ameriname = "Dario" if fname == "`diminutive'"
}

local Davis `" "Davis" "'
foreach variant of local Davis {
	replace ameriname = "Davis" if fname == "`variant'"
}

/* Davis "No diminutives" */

/* Dco "No equivalents" */

/* Dco "No diminutives" */

/* Delfino "No equivalents" */

/* Delfino "No diminutives" */

/* Demeter "No equivalents" */

/* Demeter "No diminutives" */

/* Demetre "No equivalents" */

/* Demetre "No diminutives" */

local Demetrio `" "Demetrios" "Demetrius" "Dimitar" "Dmitar" "Dimitri" "Dimitrios" "Dimitris" "Demeter" "Dömötör" "Demetrio" "Dimitrij" "Dmitrei" "Demétrio" "Dumitru" "Dmitri" "Dmitrii" "Dmitriy" "Dmitry" "Dimitrije" "Dmytro" "'
foreach variant of local Demetrio {
	replace ameriname = "Demetrio" if fname == "`variant'"
}

local Demetrio `" "Mitre" "Mitica" "Dima" "Mitya" "Mitja" "'
foreach diminutive of local Demetrio {
	replace ameriname = "Demetrio" if fname == "`diminutive'"
}

local Demetrius `" "Demetrios" "Demetrius" "Dimitar" "Dmitar" "Dimitri" "Dimitrios" "Dimitris" "Demeter" "Dömötör" "Demetrio" "Dimitrij" "Dmitrei" "Demétrio" "Dumitru" "Dmitri" "Dmitrii" "Dmitriy" "Dmitry" "Dimitrije" "Dmytro" "'
foreach variant of local Demetrius {
	replace ameriname = "Demetrius" if fname == "`variant'"
}

local Demetrius `" "Mitre" "Mitica" "Dima" "Mitya" "Mitja" "'
foreach diminutive of local Demetrius {
	replace ameriname = "Demetrius" if fname == "`diminutive'"
}

/* Demitrios "No equivalents" */

/* Demitrios "No diminutives" */

local Dennis `" "Dionysios" "Dionysius" "Denis" "Dennis" "Dionysos" "Dénes" "Dionisio" "Dinis" "Diniz" "Dionísio" "Dionisie" "Dionýz" "Denys" "'
foreach variant of local Dennis {
	replace ameriname = "Dennis" if fname == "`variant'"
}

local Dennis `" "Deion" "Deon" "Dion" "Den" "Denny" "Tenney" "'
foreach diminutive of local Dennis {
	replace ameriname = "Dennis" if fname == "`diminutive'"
}

/* Derk "No equivalents" */

/* Derk "No diminutives" */

local Desiderio `" "Didier" "Dezső" "Desiderio" "Desiderius" "Desidério" "'
foreach variant of local Desiderio {
	replace ameriname = "Desiderio" if fname == "`variant'"
}

local Desiderio `" "Desi" "'
foreach diminutive of local Desiderio {
	replace ameriname = "Desiderio" if fname == "`diminutive'"
}

/* Desire "No equivalents" */

/* Desire "No diminutives" */

local Desmond `" "Desmond" "'
foreach variant of local Desmond {
	replace ameriname = "Desmond" if fname == "`variant'"
}

local Desmond `" "Des" "Dezi" "'
foreach diminutive of local Desmond {
	replace ameriname = "Desmond" if fname == "`diminutive'"
}

/* Dezso "No equivalents" */

/* Dezso "No diminutives" */

local Di `" "Diana" "Dajana" "Dijana" "Di" "Diane" "Dianne" "Kiana" "Diána" "Diāna" "'
foreach variant of local Di {
	replace ameriname = "Di" if fname == "`variant'"
}

/* Di "No diminutives" */

/* Diamante "No equivalents" */

/* Diamante "No diminutives" */

/* Diamantis "No equivalents" */

/* Diamantis "No diminutives" */

/* Dib "No equivalents" */

/* Dib "No diminutives" */

/* Dick "No equivalents" */

/* Dick "No diminutives" */

/* Diedrich "No equivalents" */

/* Diedrich "No diminutives" */

/* Dikran "No equivalents" */

/* Dikran "No diminutives" */

local Dimitri `" "Demetrios" "Demetrius" "Dimitar" "Dmitar" "Dimitri" "Dimitrios" "Dimitris" "Demeter" "Dömötör" "Demetrio" "Dimitrij" "Dmitrei" "Demétrio" "Dumitru" "Dmitri" "Dmitrii" "Dmitriy" "Dmitry" "Dimitrije" "Dmytro" "'
foreach variant of local Dimitri {
	replace ameriname = "Dimitri" if fname == "`variant'"
}

local Dimitri `" "Mitre" "Mitica" "Dima" "Mitya" "Mitja" "'
foreach diminutive of local Dimitri {
	replace ameriname = "Dimitri" if fname == "`diminutive'"
}

/* Dimitrio "No equivalents" */

/* Dimitrio "No diminutives" */

local Dimosthenis `" "Demosthenes" "'
foreach variant of local Dimosthenis {
	replace ameriname = "Dimosthenis" if fname == "`variant'"
}

/* Dimosthenis "No diminutives" */

local Dino `" "Berard" "Berinhard" "Bernard" "Bernhard" "Conrad" "Augustinus" "Beñat" "Agustí" "Bernat" "Dino" "Tin" "Augustín" "Augustin" "Konrád" "Bernt" "Konrad" "Augustijn" "Barend" "Ben" "Koen" "Koenraad" "Koert" "Stijn" "Tijn" "Augustine" "Austen" "Austin" "Austyn" "Barney" "Bernie" "Berny" "Connie" "Curt" "Kurt" "Auke" "Bent" "Benno" "Bernd" "Cord" "Kord" "Ágoston" "Bernát" "Augustinas" "Augustyn" "Kondrat" "Agostinho" "Bernardino" "Bernardo" "Avguštin" "Agustín" "Conrado" "Awstin" "'
foreach variant of local Dino {
	replace ameriname = "Dino" if fname == "`variant'"
}

/* Dino "No diminutives" */

local Diodato `" "Déodat" "Dieudonné" "Diodato" "Adeodatus" "Deodatus" "Deusdedit" "Deodato" "'
foreach variant of local Diodato {
	replace ameriname = "Diodato" if fname == "`variant'"
}

/* Diodato "No diminutives" */

/* Dionigi "No equivalents" */

/* Dionigi "No diminutives" */

local Dionisio `" "Dionysios" "Dionysius" "Denis" "Dennis" "Dionysos" "Dénes" "Dionisio" "Dinis" "Diniz" "Dionísio" "Dionisie" "Dionýz" "Denys" "'
foreach variant of local Dionisio {
	replace ameriname = "Dionisio" if fname == "`variant'"
}

local Dionisio `" "Deion" "Deon" "Dion" "Den" "Denny" "Tenney" "'
foreach diminutive of local Dionisio {
	replace ameriname = "Dionisio" if fname == "`diminutive'"
}

/* Dionisios "No equivalents" */

/* Dionisios "No diminutives" */

/* Dionissios "No equivalents" */

/* Dionissios "No diminutives" */

/* Diran "No equivalents" */

/* Diran "No diminutives" */

/* Dmitro "No equivalents" */

/* Dmitro "No diminutives" */

local Dmytro `" "Demetrios" "Demetrius" "Dimitar" "Dmitar" "Dimitri" "Dimitrios" "Dimitris" "Demeter" "Dömötör" "Demetrio" "Dimitrij" "Dmitrei" "Demétrio" "Dumitru" "Dmitri" "Dmitrii" "Dmitriy" "Dmitry" "Dimitrije" "Dmytro" "'
foreach variant of local Dmytro {
	replace ameriname = "Dmytro" if fname == "`variant'"
}

local Dmytro `" "Mitre" "Mitica" "Dima" "Mitya" "Mitja" "'
foreach diminutive of local Dmytro {
	replace ameriname = "Dmytro" if fname == "`diminutive'"
}

/* Dobe "No equivalents" */

/* Dobe "No diminutives" */

/* Domco "No equivalents" */

/* Domco "No diminutives" */

/* Domencio "No equivalents" */

/* Domencio "No diminutives" */

local Domenic `" "Txomin" "Dominik" "Dominicus" "Domenic" "Dominic" "Dominick" "Dominique" "Domonkos" "Domenico" "Dominykas" "Domingos" "Domen" "Domingo" "'
foreach variant of local Domenic {
	replace ameriname = "Domenic" if fname == "`variant'"
}

local Domenic `" "Dinko" "Dom" "Nic" "'
foreach diminutive of local Domenic {
	replace ameriname = "Domenic" if fname == "`diminutive'"
}

local Domenica `" "Dominika" "Dominica" "Dominique" "Domenica" "Domnika" "Dominga" "MASCULINE FORMS" "Txomin" "Dinko" "Dominik" "Dominicus" "Dom" "Domenic" "Dominic" "Dominick" "Nic" "Domonkos" "Domenico" "Dominykas" "Domingos" "Domen" "'
foreach variant of local Domenica {
	replace ameriname = "Domenica" if fname == "`variant'"
}

/* Domenica "No diminutives" */

/* Domenicantonio "No equivalents" */

/* Domenicantonio "No diminutives" */

local DOMENICO `" "Txomin" "Dominik" "Dominicus" "Domenic" "Dominic" "Dominick" "Dominique" "Domonkos" "Domenico" "Dominykas" "Domingos" "Domen" "Domingo" "'
foreach variant of local DOMENICO {
	replace ameriname = "DOMENICO" if fname == "`variant'"
}

local DOMENICO `" "Dinko" "Dom" "Nic" "'
foreach diminutive of local DOMENICO {
	replace ameriname = "DOMENICO" if fname == "`diminutive'"
}

/* Domiano "No equivalents" */

/* Domiano "No diminutives" */

/* Dominco "No equivalents" */

/* Dominco "No diminutives" */

local Domingo `" "Txomin" "Dominik" "Dominicus" "Domenic" "Dominic" "Dominick" "Dominique" "Domonkos" "Domenico" "Dominykas" "Domingos" "Domen" "Domingo" "'
foreach variant of local Domingo {
	replace ameriname = "Domingo" if fname == "`variant'"
}

local Domingo `" "Dinko" "Dom" "Nic" "'
foreach diminutive of local Domingo {
	replace ameriname = "Domingo" if fname == "`diminutive'"
}

local Domingos `" "Txomin" "Dominik" "Dominicus" "Domenic" "Dominic" "Dominick" "Dominique" "Domonkos" "Domenico" "Dominykas" "Domingos" "Domen" "Domingo" "'
foreach variant of local Domingos {
	replace ameriname = "Domingos" if fname == "`variant'"
}

local Domingos `" "Dinko" "Dom" "Nic" "'
foreach diminutive of local Domingos {
	replace ameriname = "Domingos" if fname == "`diminutive'"
}

local Dominic `" "Txomin" "Dominik" "Dominicus" "Domenic" "Dominic" "Dominick" "Dominique" "Domonkos" "Domenico" "Dominykas" "Domingos" "Domen" "Domingo" "'
foreach variant of local Dominic {
	replace ameriname = "Dominic" if fname == "`variant'"
}

local Dominic `" "Dinko" "Dom" "Nic" "'
foreach diminutive of local Dominic {
	replace ameriname = "Dominic" if fname == "`diminutive'"
}

local Dominick `" "Txomin" "Dominik" "Dominicus" "Domenic" "Dominic" "Dominick" "Dominique" "Domonkos" "Domenico" "Dominykas" "Domingos" "Domen" "Domingo" "'
foreach variant of local Dominick {
	replace ameriname = "Dominick" if fname == "`variant'"
}

local Dominick `" "Dinko" "Dom" "Nic" "'
foreach diminutive of local Dominick {
	replace ameriname = "Dominick" if fname == "`diminutive'"
}

local Dominik `" "Txomin" "Dominik" "Dominicus" "Domenic" "Dominic" "Dominick" "Dominique" "Domonkos" "Domenico" "Dominykas" "Domingos" "Domen" "Domingo" "'
foreach variant of local Dominik {
	replace ameriname = "Dominik" if fname == "`variant'"
}

local Dominik `" "Dinko" "Dom" "Nic" "'
foreach diminutive of local Dominik {
	replace ameriname = "Dominik" if fname == "`diminutive'"
}

local Don `" "Don" "Donnie" "Donny" "Domhnall" "Domnall" "Dónal" "Donal" "Donald" "'
foreach variant of local Don {
	replace ameriname = "Don" if fname == "`variant'"
}

/* Don "No diminutives" */

local Donata `" "Donata" "'
foreach variant of local Donata {
	replace ameriname = "Donata" if fname == "`variant'"
}

local Donata `" "Donatella" "MASCULINE FORMS" "Donat" "Donát" "Donatello" "Donato" "Donatus" "'
foreach diminutive of local Donata {
	replace ameriname = "Donata" if fname == "`diminutive'"
}

/* Donatantonio "No equivalents" */

/* Donatantonio "No diminutives" */

local Doris `" "Doris" "Dorris" "'
foreach variant of local Doris {
	replace ameriname = "Doris" if fname == "`variant'"
}

local Doris `" "Dory" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Doris {
	replace ameriname = "Doris" if fname == "`diminutive'"
}

/* Douwe "No equivalents" */

/* Douwe "No diminutives" */

/* Dowid "No equivalents" */

/* Dowid "No diminutives" */

local Dragutin `" "Dragan" "Drago" "Dragutin" "Dražen" "Drazhan" "'
foreach variant of local Dragutin {
	replace ameriname = "Dragutin" if fname == "`variant'"
}

local Dragutin `" "Draško" "'
foreach diminutive of local Dragutin {
	replace ameriname = "Dragutin" if fname == "`diminutive'"
}

local Dudley `" "Dudley" "'
foreach variant of local Dudley {
	replace ameriname = "Dudley" if fname == "`variant'"
}

/* Dudley "No diminutives" */

local Duilio `" "Duilius" "Duilio" "'
foreach variant of local Duilio {
	replace ameriname = "Duilio" if fname == "`variant'"
}

/* Duilio "No diminutives" */

local Duncan `" "Duncan" "Donagh" "Donnchad" "Donnchadh" "'
foreach variant of local Duncan {
	replace ameriname = "Duncan" if fname == "`variant'"
}

/* Duncan "No diminutives" */

/* Dusan "No equivalents" */

/* Dusan "No diminutives" */

/* Duwid "No equivalents" */

/* Duwid "No diminutives" */

/* Dwoire "No equivalents" */

/* Dwoire "No diminutives" */

/* E "No equivalents" */

/* E "No diminutives" */

local Earl `" "Earl" "Earle" "Erle" "'
foreach variant of local Earl {
	replace ameriname = "Earl" if fname == "`variant'"
}

/* Earl "No diminutives" */

local Earnest `" "Ernust" "Ernst" "Earnest" "Ernest" "Erno" "Ernő" "Ernesto" "Ernestas" "'
foreach variant of local Earnest {
	replace ameriname = "Earnest" if fname == "`variant'"
}

local Earnest `" "Ern" "Ernie" "'
foreach diminutive of local Earnest {
	replace ameriname = "Earnest" if fname == "`diminutive'"
}

local Ebenezer `" "Ebenezer" "'
foreach variant of local Ebenezer {
	replace ameriname = "Ebenezer" if fname == "`variant'"
}

local Ebenezer `" "Eben" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Ebenezer {
	replace ameriname = "Ebenezer" if fname == "`diminutive'"
}

local Ed `" "Eadgar" "Eadmund" "Eadweard" "Eadwine" "Eduard" "Edvard" "Edorta" "Edi" "Edvin" "Ed" "Eddie" "Eddy" "Ned" "Ted" "Teddy" "Eetu" "Edgar" "Edgard" "Edmé" "Edmond" "Édouard" "Edmund" "Ekewaka" "Ede" "Eduárd" "Edvárd" "Ödi" "Ödön" "Eadbhárd" "Éamon" "Eamon" "Éamonn" "Edgardo" "Edmondo" "Edoardo" "Eduards" "Edmao" "Mao" "Edgaras" "Edward" "Dado" "Du" "Duarte" "Duda" "Dudu" "Edmundo" "Edu" "Eduardo" "Eideard" "Lalo" "'
foreach variant of local Ed {
	replace ameriname = "Ed" if fname == "`variant'"
}

/* Ed "No diminutives" */

local Eddie `" "Eadgar" "Eadmund" "Eadweard" "Eadwine" "Eduard" "Edvard" "Edorta" "Edi" "Edvin" "Ed" "Edwin" "Eddie" "Eddy" "Ned" "Ted" "Teddy" "Eetu" "Edgar" "Edgard" "Edmé" "Edmond" "Édouard" "Edmund" "Ekewaka" "Ede" "Eduárd" "Edvárd" "Ödi" "Ödön" "Eadbhárd" "Éamon" "Eamon" "Éamonn" "Edgardo" "Edmondo" "Edoardo" "Eduards" "Edmao" "Mao" "Edgaras" "Edward" "Dado" "Du" "Duarte" "Duda" "Dudu" "Edmundo" "Edu" "Eduardo" "Eideard" "Lalo" "'
foreach variant of local Eddie {
	replace ameriname = "Eddie" if fname == "`variant'"
}

/* Eddie "No diminutives" */

local Eddy `" "Eadgar" "Eadmund" "Eadweard" "Eadwine" "Eduard" "Edvard" "Edorta" "Edi" "Edvin" "Ed" "Edwin" "Eddie" "Eddy" "Ned" "Ted" "Teddy" "Eetu" "Edgar" "Edgard" "Edmé" "Edmond" "Édouard" "Edmund" "Ekewaka" "Ede" "Eduárd" "Edvárd" "Ödi" "Ödön" "Eadbhárd" "Éamon" "Eamon" "Éamonn" "Edgardo" "Edmondo" "Edoardo" "Eduards" "Edmao" "Mao" "Edgaras" "Edward" "Dado" "Du" "Duarte" "Duda" "Dudu" "Edmundo" "Edu" "Eduardo" "Eideard" "Lalo" "'
foreach variant of local Eddy {
	replace ameriname = "Eddy" if fname == "`variant'"
}

/* Eddy "No diminutives" */

local Ede `" "Eadweard" "Eduard" "Edvard" "Edorta" "Edi" "Ed" "Eddie" "Eddy" "Edward" "Ned" "Ted" "Teddy" "Eetu" "Édouard" "Ekewaka" "Ede" "Eadbhárd" "Edoardo" "Eduards" "Dado" "Du" "Duarte" "Duda" "Dudu" "Edu" "Eduardo" "Eideard" "Lalo" "'
foreach variant of local Ede {
	replace ameriname = "Ede" if fname == "`variant'"
}

/* Ede "No diminutives" */

local Edgard `" "Eadgar" "Edgar" "Edgard" "Edgardo" "Edgaras" "'
foreach variant of local Edgard {
	replace ameriname = "Edgard" if fname == "`variant'"
}

local Edgard `" "Ed" "Eddie" "Eddy" "'
foreach diminutive of local Edgard {
	replace ameriname = "Edgard" if fname == "`diminutive'"
}

local Edmondo `" "Eadmund" "Edmund" "Edmond" "Ödön" "Éamon" "Eamon" "Éamonn" "Edmondo" "Edmao" "Edmundo" "'
foreach variant of local Edmondo {
	replace ameriname = "Edmondo" if fname == "`variant'"
}

local Edmondo `" "Ed" "Eddie" "Eddy" "Ned" "Edmé" "Ödi" "Mao" "'
foreach diminutive of local Edmondo {
	replace ameriname = "Edmondo" if fname == "`diminutive'"
}

local Edmundo `" "Eadmund" "Edmund" "Edmond" "Ödön" "Éamon" "Eamon" "Éamonn" "Edmondo" "Edmao" "Edmundo" "'
foreach variant of local Edmundo {
	replace ameriname = "Edmundo" if fname == "`variant'"
}

local Edmundo `" "Ed" "Eddie" "Eddy" "Ned" "Edmé" "Ödi" "Mao" "'
foreach diminutive of local Edmundo {
	replace ameriname = "Edmundo" if fname == "`diminutive'"
}

local Edoardo `" "Eadweard" "Eduard" "Edvard" "Edorta" "Edward" "Eetu" "Édouard" "Ekewaka" "Eduárd" "Edvárd" "Eadbhárd" "Edoardo" "Eduards" "Duarte" "Eduardo" "Eideard" "'
foreach variant of local Edoardo {
	replace ameriname = "Edoardo" if fname == "`variant'"
}

local Edoardo `" "Edi" "Ed" "Eddie" "Eddy" "Ned" "Ted" "Teddy" "Ede" "Dado" "Du" "Duda" "Dudu" "Edu" "Lalo" "'
foreach diminutive of local Edoardo {
	replace ameriname = "Edoardo" if fname == "`diminutive'"
}

/* Edouard "No equivalents" */

/* Edouard "No diminutives" */

local Edvard `" "Eadweard" "Eduard" "Edvard" "Edorta" "Edward" "Eetu" "Édouard" "Ekewaka" "Eduárd" "Edvárd" "Eadbhárd" "Edoardo" "Eduards" "Duarte" "Eduardo" "Eideard" "'
foreach variant of local Edvard {
	replace ameriname = "Edvard" if fname == "`variant'"
}

local Edvard `" "Edi" "Ed" "Eddie" "Eddy" "Ned" "Ted" "Teddy" "Ede" "Dado" "Du" "Duda" "Dudu" "Edu" "Lalo" "'
foreach diminutive of local Edvard {
	replace ameriname = "Edvard" if fname == "`diminutive'"
}

/* Edvardo "No equivalents" */

/* Edvardo "No diminutives" */

local Edvin `" "Eadwine" "Edvin" "Edwin" "Edwyn" "'
foreach variant of local Edvin {
	replace ameriname = "Edvin" if fname == "`variant'"
}

local Edvin `" "Ed" "Eddie" "Eddy" "'
foreach diminutive of local Edvin {
	replace ameriname = "Edvin" if fname == "`diminutive'"
}

/* Edwardo "No equivalents" */

/* Edwardo "No diminutives" */

local Eero `" "Eiríkr" "Èric" "Erik" "Jerrik" "Aric" "Eric" "Erick" "Eerik" "Eerikki" "Eero" "Erkki" "Éric" "Erich" "Eiríkur" "Erikas" "Eirik" "Eryk" "Érico" "Jerk" "Jerker" "'
foreach variant of local Eero {
	replace ameriname = "Eero" if fname == "`variant'"
}

/* Eero "No diminutives" */

local Efraim `" "Ephraim" "'Efrayim" "Efraim" "Yefrem" "Jevrem" "Efraín" "'
foreach variant of local Efraim {
	replace ameriname = "Efraim" if fname == "`variant'"
}

/* Efraim "No diminutives" */

/* Efroim "No equivalents" */

/* Efroim "No diminutives" */

local Efstathios `" "Eustathios" "Eustathius" "Eustace" "Eustache" "Efstathios" "'
foreach variant of local Efstathios {
	replace ameriname = "Efstathios" if fname == "`variant'"
}

local Efstathios `" "Stathis" "Stace" "'
foreach diminutive of local Efstathios {
	replace ameriname = "Efstathios" if fname == "`diminutive'"
}

/* Efstratios "No equivalents" */

/* Efstratios "No diminutives" */

/* Efthimios "No equivalents" */

/* Efthimios "No diminutives" */

local Egbert `" "Ekkebert" "Ecgberht" "Egbert" "'
foreach variant of local Egbert {
	replace ameriname = "Egbert" if fname == "`variant'"
}

/* Egbert "No diminutives" */

local Egil `" "Aghi" "Egill" "Egil" "Ove" "Uwe" "'
foreach variant of local Egil {
	replace ameriname = "Egil" if fname == "`variant'"
}

/* Egil "No diminutives" */

/* Egisto "No equivalents" */

/* Egisto "No diminutives" */

local Egon `" "Agi" "Egino" "Aghi" "Ove" "Egon" "Uwe" "'
foreach variant of local Egon {
	replace ameriname = "Egon" if fname == "`variant'"
}

/* Egon "No diminutives" */

/* Einer "No equivalents" */

/* Einer "No diminutives" */

local Eino `" "Eino" "'
foreach variant of local Eino {
	replace ameriname = "Eino" if fname == "`variant'"
}

/* Eino "No diminutives" */

/* Eisig "No equivalents" */

/* Eisig "No diminutives" */

/* Eisik "No equivalents" */

/* Eisik "No diminutives" */

local Eivind `" "Eyvindr" "Ejvind" "Eyvindur" "Eivind" "Even" "Øivind" "'
foreach variant of local Eivind {
	replace ameriname = "Eivind" if fname == "`variant'"
}

/* Eivind "No diminutives" */

/* Ejnar "No equivalents" */

/* Ejnar "No diminutives" */

/* Ejner "No equivalents" */

/* Ejner "No diminutives" */

/* Ela "No equivalents" */

/* Ela "No diminutives" */

/* Ele "No equivalents" */

/* Ele "No diminutives" */

local Eleftherios `" "Eleftherios" "Eleuterio" "Eleutherios" "Eleutherius" "'
foreach variant of local Eleftherios {
	replace ameriname = "Eleftherios" if fname == "`variant'"
}

local Eleftherios `" "Lefteris" "'
foreach diminutive of local Eleftherios {
	replace ameriname = "Eleftherios" if fname == "`diminutive'"
}

local Elek `" "Alexios" "Alexius" "Aleksei" "Aleksey" "Alexei" "Alexey" "Aliaksei" "Aleix" "Alexej" "Aleksi" "Alexis" "Aleixo" "Elek" "Alessio" "Aleksy" "Aleksej" "Alejo" "Oleksiy" "Olexiy" "'
foreach variant of local Elek {
	replace ameriname = "Elek" if fname == "`variant'"
}

local Elek `" "Aljoša" "Aleš" "Ale" "Aleks" "Alyosha" "Lyosha" "Oles" "'
foreach diminutive of local Elek {
	replace ameriname = "Elek" if fname == "`diminutive'"
}

/* Eli "No equivalents" */

/* Eli "No diminutives" */

local Eligio `" "Eloi" "Eligio" "Eligius" "Eligiusz" "Eloy" "'
foreach variant of local Eligio {
	replace ameriname = "Eligio" if fname == "`variant'"
}

/* Eligio "No diminutives" */

/* Elik "No equivalents" */

/* Elik "No diminutives" */

local Elio `" "Aelius" "Helios" "Elio" "'
foreach variant of local Elio {
	replace ameriname = "Elio" if fname == "`variant'"
}

/* Elio "No diminutives" */

local Elis `" "Ilyas" "Elias" "Eliou" "Eliyyahu" "Helias" "Elijah" "Ilia" "Ilija" "Iliya" "Elia" "Elian" "Eelis" "Eljas" "Élie" "Ilias" "Eliyahu" "Éliás" "Illés" "Elías" "Elis" "Eliasz" "Ilie" "Ilya" "İlyas" "'
foreach variant of local Elis {
	replace ameriname = "Elis" if fname == "`variant'"
}

local Elis `" "Ile" "'
foreach diminutive of local Elis {
	replace ameriname = "Elis" if fname == "`diminutive'"
}

local Eliseo `" "Elisaie" "Elisha" "Eliseus" "Eliseo" "Elisie" "'
foreach variant of local Eliseo {
	replace ameriname = "Eliseo" if fname == "`variant'"
}

/* Eliseo "No diminutives" */

/* Elja "No equivalents" */

/* Elja "No diminutives" */

/* Elje "No equivalents" */

/* Elje "No diminutives" */

/* Elke "No equivalents" */

/* Elke "No diminutives" */

local Elle `" "Shelena" "Helena" "Helene" "Zabel" "Elaine" "Elixabete" "Elisabet" "Elisheba" "Elisabeth" "Elizabeth" "Elena" "Eleonora" "Elisaveta" "Elizabeta" "Jela" "Jelena" "Jelka" "Alena" "Alžběta" "Eliška" "Lenka" "Eli" "Elin" "Elise" "Ella" "Ellinor" "Else" "Isabella" "Lena" "Lene" "Lilly" "Lis" "Lisa" "Lisbet" "Lise" "Lissi" "Nora" "Betje" "Ellen" "Elly" "Els" "Elsje" "Heleen" "Heleentje" "Ilse" "Isa" "Isabelle" "Lies" "Liesbeth" "Liese" "Liesje" "Lijsbeth" "Noor" "Noortje" "Bella" "Belle" "Bess" "Bessie" "Beth" "Betsy" "Bette" "Bettie" "Betty" "Bettye" "Buffy" "Elea" "Elisa" "Elissa" "Eliza" "Elle" "Ellie" "Elsa" "Elsie" "Elyse" "Ibbie" "Issy" "Izzy" "Lainey" "Laney" "Leanora" "Leesa" "Lenora" "Lenore" "Libbie" "Libby" "Liddy" "Lilian" "Liliana" "Lilibet" "Lilibeth" "Lillian" "Lilliana" "Liz" "Liza" "Lizbeth" "Lizette" "Lizzie" "Lizzy" "Nell" "Nelle" "Norah" "Sabella" "Tetty" "Eliisabet" "Leena" "Liis" "Liisa" "Liisi" "Liisu" "Eleonoora" "Eliina" "Eliisa" "Elina" "Elli" "Heleena" "Heli" "Noora" "Babette" "Eléonore" "Élisabeth" "Élise" "Hélène" "Isabel" "Lili" "Liliane" "Lilianne" "Bet" "Lys" "Sabela" "Elene" "Elisabed" "Eliso" "Bettina" "Eleonore" "Ilsa" "Isabell" "Leni" "Leonore" "Liesa" "Liesel" "Liesl" "Lilli" "Lisbeth" "Lore" "Helen" "Eleni" "Elisavet" "Elikapeka" "Elisheva" "Bözsi" "Eleonóra" "Erzsébet" "Erzsi" "Heléna" "Izabella" "Liliána" "Nóra" "Zsóka" "Elísabet" "Eilís" "Eilish" "Isibéal" "Léan" "Sibéal" "Elisabetta" "Ileana" "Leonora" "Lora" "Elīna" "Helēna" "Jeļena" "Elžbieta" "Elzė" "Beti" "Veta" "Ealisaid" "Ibb" "Liss" "Aliénor" "Isabèl" "Elisabeti" "Ela" "Elżbieta" "Iza" "Izabela" "Izabel" "Lílian" "Belinha" "Elisabete" "Isabela" "Leonor" "Elisabeta" "Ilinca" "Lenuța" "Alyona" "Elizaveta" "Lizaveta" "Yelena" "Yelizaveta" "Beileag" "Ealasaid" "Eilidh" "Eilionoir" "Elspet" "Elspeth" "Iseabail" "Ishbel" "Isobel" "Lileas" "Lilias" "Lillias" "Jelisaveta" "Alžbeta" "Špela" "Ysabel" "Eleonor" "Lesya" "Olena" "Yelyzaveta" "Bethan" "Elen" "'
foreach variant of local Elle {
	replace ameriname = "Elle" if fname == "`variant'"
}

local Elle `" "Jelica" "Leanna" "Liana" "Libbie" "Libby" "Lillia" "Lisette" "Lysette" "Nellie" "Nelly" "Nonie" "Noreen" "Norene" "Lorita" "Norina" "Betje" "Alenka" "'
foreach diminutive of local Elle {
	replace ameriname = "Elle" if fname == "`diminutive'"
}

local Ellie `" "Shelena" "Helena" "Helene" "Zabel" "Elaine" "Elixabete" "Elisabet" "Elisheba" "Elisabeth" "Elizabeth" "Elena" "Eleonora" "Elisaveta" "Elizabeta" "Jela" "Jelena" "Jelka" "Alena" "Alžběta" "Eliška" "Lenka" "Eli" "Elin" "Elise" "Ella" "Ellinor" "Else" "Isabella" "Lena" "Lene" "Lilly" "Lis" "Lisa" "Lisbet" "Lise" "Lissi" "Nora" "Betje" "Ellen" "Elly" "Els" "Elsje" "Heleen" "Heleentje" "Ilse" "Isa" "Isabelle" "Lies" "Liesbeth" "Liese" "Liesje" "Lijsbeth" "Noor" "Noortje" "Bella" "Belle" "Bess" "Bessie" "Beth" "Betsy" "Bette" "Bettie" "Betty" "Bettye" "Buffy" "Elea" "Elisa" "Elissa" "Eliza" "Elle" "Ellie" "Elsa" "Elsie" "Elyse" "Ibbie" "Issy" "Izzy" "Lainey" "Laney" "Leanora" "Leesa" "Lenora" "Lenore" "Libbie" "Libby" "Liddy" "Lilian" "Liliana" "Lilibet" "Lilibeth" "Lillian" "Lilliana" "Liz" "Liza" "Lizbeth" "Lizette" "Lizzie" "Lizzy" "Nell" "Nelle" "Norah" "Sabella" "Tetty" "Eliisabet" "Leena" "Liis" "Liisa" "Liisi" "Liisu" "Eleonoora" "Eliina" "Eliisa" "Elina" "Elli" "Heleena" "Heli" "Noora" "Babette" "Eléonore" "Élisabeth" "Élise" "Hélène" "Isabel" "Lili" "Liliane" "Lilianne" "Bet" "Lys" "Sabela" "Elene" "Elisabed" "Eliso" "Bettina" "Eleonore" "Ilsa" "Isabell" "Leni" "Leonore" "Liesa" "Liesel" "Liesl" "Lilli" "Lisbeth" "Lore" "Helen" "Eleni" "Elisavet" "Elikapeka" "Elisheva" "Bözsi" "Eleonóra" "Erzsébet" "Erzsi" "Heléna" "Izabella" "Liliána" "Nóra" "Zsóka" "Elísabet" "Eilís" "Eilish" "Isibéal" "Léan" "Sibéal" "Elisabetta" "Ileana" "Leonora" "Lora" "Elīna" "Helēna" "Jeļena" "Elžbieta" "Elzė" "Beti" "Veta" "Ealisaid" "Ibb" "Liss" "Aliénor" "Isabèl" "Elisabeti" "Ela" "Elżbieta" "Iza" "Izabela" "Izabel" "Lílian" "Belinha" "Elisabete" "Isabela" "Leonor" "Elisabeta" "Ilinca" "Lenuța" "Alyona" "Elizaveta" "Lizaveta" "Yelena" "Yelizaveta" "Beileag" "Ealasaid" "Eilidh" "Eilionoir" "Elspet" "Elspeth" "Iseabail" "Ishbel" "Isobel" "Lileas" "Lilias" "Lillias" "Jelisaveta" "Alžbeta" "Špela" "Ysabel" "Eleonor" "Lesya" "Olena" "Yelyzaveta" "Bethan" "Elen" "'
foreach variant of local Ellie {
	replace ameriname = "Ellie" if fname == "`variant'"
}

local Ellie `" "Jelica" "Leanna" "Liana" "Libbie" "Libby" "Lillia" "Lisette" "Lysette" "Nellie" "Nelly" "Nonie" "Noreen" "Norene" "Lorita" "Norina" "Betje" "Alenka" "'
foreach diminutive of local Ellie {
	replace ameriname = "Ellie" if fname == "`diminutive'"
}

/* Ellis "No equivalents" */

/* Ellis "No diminutives" */

local Elly `" "Shelena" "Helena" "Helene" "Zabel" "Elaine" "Elixabete" "Elisabet" "Elisheba" "Elisabeth" "Elizabeth" "Elena" "Eleonora" "Elisaveta" "Elizabeta" "Jela" "Jelena" "Jelka" "Alena" "Alžběta" "Eliška" "Lenka" "Eli" "Elin" "Elise" "Ella" "Ellinor" "Else" "Isabella" "Lena" "Lene" "Lilly" "Lis" "Lisa" "Lisbet" "Lise" "Lissi" "Nora" "Betje" "Elly" "Els" "Elsje" "Ilse" "Isa" "Lies" "Liese" "Liesje" "Bella" "Belle" "Bess" "Bessie" "Beth" "Betsy" "Bette" "Bettie" "Betty" "Bettye" "Buffy" "Elea" "Elisa" "Elissa" "Eliza" "Elle" "Ellie" "Elsa" "Elsie" "Elyse" "Ibbie" "Issy" "Izzy" "Lainey" "Laney" "Leanora" "Leesa" "Lenora" "Lenore" "Libbie" "Libby" "Liddy" "Lilian" "Liliana" "Lilibet" "Lilibeth" "Lillian" "Lilliana" "Liz" "Liza" "Lizbeth" "Lizette" "Lizzie" "Lizzy" "Nell" "Nelle" "Norah" "Sabella" "Tetty" "Eliisabet" "Leena" "Liis" "Liisa" "Liisi" "Liisu" "Eleonoora" "Eliina" "Eliisa" "Elina" "Elli" "Heleena" "Heli" "Noora" "Babette" "Eléonore" "Élisabeth" "Élise" "Hélène" "Isabel" "Isabelle" "Lili" "Liliane" "Lilianne" "Bet" "Lys" "Sabela" "Elene" "Elisabed" "Eliso" "Bettina" "Eleonore" "Ilsa" "Isabell" "Leni" "Leonore" "Liesa" "Liesel" "Liesl" "Lilli" "Lisbeth" "Lore" "Helen" "Eleni" "Elisavet" "Elikapeka" "Elisheva" "Bözsi" "Eleonóra" "Erzsébet" "Erzsi" "Heléna" "Izabella" "Liliána" "Nóra" "Zsóka" "Elísabet" "Eilís" "Eilish" "Isibéal" "Léan" "Sibéal" "Elisabetta" "Ileana" "Leonora" "Lora" "Elīna" "Helēna" "Jeļena" "Noor" "Noortje" "Elžbieta" "Elzė" "Beti" "Veta" "Ealisaid" "Ibb" "Liss" "Aliénor" "Isabèl" "Elisabeti" "Ela" "Elżbieta" "Iza" "Izabela" "Izabel" "Lílian" "Belinha" "Elisabete" "Isabela" "Leonor" "Elisabeta" "Ilinca" "Lenuța" "Alyona" "Elizaveta" "Lizaveta" "Yelena" "Yelizaveta" "Beileag" "Ealasaid" "Eilidh" "Eilionoir" "Elspet" "Elspeth" "Iseabail" "Ishbel" "Isobel" "Lileas" "Lilias" "Lillias" "Jelisaveta" "Alžbeta" "Špela" "Ysabel" "Eleonor" "Lesya" "Olena" "Yelyzaveta" "Bethan" "Elen" "'
foreach variant of local Elly {
	replace ameriname = "Elly" if fname == "`variant'"
}

local Elly `" "Jelica" "Leanna" "Liana" "Libbie" "Libby" "Lillia" "Lisette" "Lysette" "Nellie" "Nelly" "Nonie" "Noreen" "Norene" "Lorita" "Norina" "Betje" "Alenka" "'
foreach diminutive of local Elly {
	replace ameriname = "Elly" if fname == "`diminutive'"
}

local Elmer `" "Elmer" "'
foreach variant of local Elmer {
	replace ameriname = "Elmer" if fname == "`variant'"
}

/* Elmer "No diminutives" */

local Elof `" "Eileifr" "Eluf" "Elof" "'
foreach variant of local Elof {
	replace ameriname = "Elof" if fname == "`variant'"
}

/* Elof "No diminutives" */

local Eloy `" "Eloi" "Eligio" "Eligius" "Eligiusz" "Eloy" "'
foreach variant of local Eloy {
	replace ameriname = "Eloy" if fname == "`variant'"
}

/* Eloy "No diminutives" */

local Ely `" "Eli" "Heli" "Ely" "'
foreach variant of local Ely {
	replace ameriname = "Ely" if fname == "`variant'"
}

/* Ely "No diminutives" */

/* Emelio "No equivalents" */

/* Emelio "No diminutives" */

/* Emerich "No equivalents" */

/* Emerich "No diminutives" */

/* Emiddio "No equivalents" */

/* Emiddio "No diminutives" */

local Emidio `" "Emidio" "Emygdius" "Emigdio" "'
foreach variant of local Emidio {
	replace ameriname = "Emidio" if fname == "`variant'"
}

/* Emidio "No diminutives" */

/* Emiel "No equivalents" */

/* Emiel "No diminutives" */

local Emilia `" "Aemilia" "Emiliya" "Emilija" "Emílie" "Emilia" "Emilie" "Amilia" "Emalee" "Emely" "Emilee" "Emily" "Émilie" "Emília" "Emilía" "Emīlija" "Emelie" "'
foreach variant of local Emilia {
	replace ameriname = "Emilia" if fname == "`variant'"
}

local Emilia `" "Em" "Emmie" "Emmy" "Millie" "Milly" "Emmi" "MASCULINE FORMS" "Aemilius" "Emil" "Eemeli" "Eemil" "Émile" "Emilio" "Emilis" "'
foreach diminutive of local Emilia {
	replace ameriname = "Emilia" if fname == "`diminutive'"
}

local Emilie `" "Aemilia" "Emiliya" "Emilija" "Emílie" "Emilia" "Emilie" "Amilia" "Emalee" "Emely" "Emilee" "Emily" "Émilie" "Emília" "Emilía" "Emīlija" "Emelie" "'
foreach variant of local Emilie {
	replace ameriname = "Emilie" if fname == "`variant'"
}

local Emilie `" "Em" "Emmie" "Emmy" "Millie" "Milly" "Emmi" "MASCULINE FORMS" "Aemilius" "Emil" "Eemeli" "Eemil" "Émile" "Emilio" "Emilis" "'
foreach diminutive of local Emilie {
	replace ameriname = "Emilie" if fname == "`diminutive'"
}

local Emma `" "Emma" "Ima" "Irma" "Ema" "Emmalyn" "Erma" "'
foreach variant of local Emma {
	replace ameriname = "Emma" if fname == "`variant'"
}

local Emma `" "Emmy" "Em" "Emmie" "Emmi" "Irmuska" "'
foreach diminutive of local Emma {
	replace ameriname = "Emma" if fname == "`diminutive'"
}

local Emmanouil `" "Imanol" "Emmanouel" "Immanuel" "Emmanuhel" "Emmanuel" "Manel" "Emanuel" "Manuel" "Emmanouil" "Emánuel" "Emanuele" "Manuele" "Manoel" "'
foreach variant of local Emmanouil {
	replace ameriname = "Emmanouil" if fname == "`variant'"
}

local Emmanouil `" "Manny" "Manu" "Manouel" "Manuel" "Nelinho" "Manolo" "'
foreach diminutive of local Emmanouil {
	replace ameriname = "Emmanouil" if fname == "`diminutive'"
}

local Emmanuel `" "Imanol" "Emmanouel" "Immanuel" "Emmanuhel" "Emmanuel" "Manel" "Emanuel" "Manuel" "Emmanouil" "Emánuel" "Emanuele" "Manuele" "Manoel" "'
foreach variant of local Emmanuel {
	replace ameriname = "Emmanuel" if fname == "`variant'"
}

local Emmanuel `" "Manny" "Manu" "Manouel" "Manuel" "Nelinho" "Manolo" "'
foreach diminutive of local Emmanuel {
	replace ameriname = "Emmanuel" if fname == "`diminutive'"
}

/* Emmanuele "No equivalents" */

/* Emmanuele "No diminutives" */

/* Endre "No equivalents" */

/* Endre "No diminutives" */

local Engel `" "Deangelo" "Engel" "Aingeru" "Angel" "Àngel" "Anđelko" "Anđelo" "Anděl" "Anxo" "Angelos" "Angelo" "Angiolo" "Angelus" "Anghel" "Ángel" "Anshel" "'
foreach variant of local Engel {
	replace ameriname = "Engel" if fname == "`variant'"
}

local Engel `" "Angelino" "Angjelko" "'
foreach diminutive of local Engel {
	replace ameriname = "Engel" if fname == "`diminutive'"
}

local Engelbert `" "Angilberct" "Engelbert" "'
foreach variant of local Engelbert {
	replace ameriname = "Engelbert" if fname == "`variant'"
}

/* Engelbert "No diminutives" */

local Ennio `" "Ennius" "Ennio" "'
foreach variant of local Ennio {
	replace ameriname = "Ennio" if fname == "`variant'"
}

/* Ennio "No diminutives" */

local Enoch `" "Enoch" "Chanokh" "Enok" "'
foreach variant of local Enoch {
	replace ameriname = "Enoch" if fname == "`variant'"
}

/* Enoch "No diminutives" */

local Enzo `" "Anzo" "Heimirich" "Heinrich" "Henricus" "Laurentius" "Henrik" "Bikendi" "Endika" "Kreskes" "Crescens" "Enric" "Llorenç" "Vicenç" "Vicent" "Lovre" "Lovrenco" "Lovro" "Vinko" "Cenek" "Hynek" "Jindřich" "Vavřinec" "Vincenc" "Henning" "Lars" "Lasse" "Laurits" "Lauritz" "Lorens" "Vincent" "Heike" "Heiko" "Hein" "Hendrik" "Henk" "Hennie" "Henny" "Lau" "Laurens" "Lourens" "Rens" "Rik" "Hal" "Hank" "Harry" "Henry" "Larrie" "Larry" "Lauren" "Laurence" "Laurie" "Lawrence" "Lawrie" "Loren" "Lorin" "Lorrin" "Vin" "Vince" "Vinnie" "Vinny" "Harri" "Heikki" "Henri" "Henrikki" "Lari" "Lassi" "Lauri" "Enzo" "Anri" "Heiner" "Heinz" "Laurenz" "Lenz" "Lorenz" "Vinzent" "Vinzenz" "Lavrentios" "Bence" "Lőrinc" "Hinrik" "Lárus" "Anraí" "Einrí" "Labhrás" "Uinseann" "Loris" "Renzo" "Rico" "Vincentius" "Lor" "Henrikas" "Herkus" "Laurynas" "Vincentas" "Hinnerk" "Hinrich" "Herry" "Larkin" "Law" "Lorencio" "Henryk" "Wawrzyniec" "Wincenty" "Henrique" "Lourenço" "Vicente" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Vikenti" "Vikentiy" "Eanraig" "Hendry" "Labhrainn" "Vikentije" "Henrich" "Vavrinec" "Lovrenc" "Enrique" "Kike" "Lorenzo" "Quique" "'
foreach variant of local Enzo {
	replace ameriname = "Enzo" if fname == "`variant'"
}

local Enzo `" "Laz" "'
foreach diminutive of local Enzo {
	replace ameriname = "Enzo" if fname == "`diminutive'"
}

local Ephraim `" "Ephraim" "'Efrayim" "Efraim" "Yefrem" "Jevrem" "Efraín" "'
foreach variant of local Ephraim {
	replace ameriname = "Ephraim" if fname == "`variant'"
}

/* Ephraim "No diminutives" */

local Epifanio `" "Epiphanes" "Epiphanios" "Epiphanius" "Epifanio" "'
foreach variant of local Epifanio {
	replace ameriname = "Epifanio" if fname == "`variant'"
}

/* Epifanio "No diminutives" */

/* Eraldo "No equivalents" */

/* Eraldo "No diminutives" */

local Erasmo `" "Erasmos" "Rasmus" "Erasmo" "Erasmus" "Erazem" "'
foreach variant of local Erasmo {
	replace ameriname = "Erasmo" if fname == "`variant'"
}

local Erasmo `" "Elmo" "Ermo" "'
foreach diminutive of local Erasmo {
	replace ameriname = "Erasmo" if fname == "`diminutive'"
}

/* Erberto "No equivalents" */

/* Erberto "No diminutives" */

local Ercole `" "Heraclius" "Herakleides" "Herakleios" "Hercule" "Erekle" "Irakli" "Heracles" "Herakles" "Iraklis" "Ercole" "Hercules" "Irakliy" "Heraclio" "Ercwlff" "'
foreach variant of local Ercole {
	replace ameriname = "Ercole" if fname == "`variant'"
}

local Ercole `" "Herk" "'
foreach diminutive of local Ercole {
	replace ameriname = "Ercole" if fname == "`diminutive'"
}

local Erhard `" "Eberhard" "Erhard" "Evert" "Everard" "Évrard" "Eberardo" "'
foreach variant of local Erhard {
	replace ameriname = "Erhard" if fname == "`variant'"
}

local Erhard `" "Ebbe" "'
foreach diminutive of local Erhard {
	replace ameriname = "Erhard" if fname == "`diminutive'"
}

local Erick `" "Eiríkr" "Èric" "Erik" "Jerrik" "Aric" "Eric" "Erick" "Eerik" "Eerikki" "Eero" "Erkki" "Éric" "Erich" "Eiríkur" "Erikas" "Eirik" "Eryk" "Érico" "Jerk" "Jerker" "'
foreach variant of local Erick {
	replace ameriname = "Erick" if fname == "`variant'"
}

/* Erick "No diminutives" */

/* Erico "No equivalents" */

/* Erico "No diminutives" */

local Erkki `" "Eiríkr" "Èric" "Erik" "Jerrik" "Aric" "Eric" "Erick" "Eerik" "Eerikki" "Eero" "Erkki" "Éric" "Erich" "Eiríkur" "Erikas" "Eirik" "Eryk" "Érico" "Jerk" "Jerker" "'
foreach variant of local Erkki {
	replace ameriname = "Erkki" if fname == "`variant'"
}

/* Erkki "No diminutives" */

local Erland `" "Erlendr" "Erland" "Erlend" "Erlendur" "'
foreach variant of local Erland {
	replace ameriname = "Erland" if fname == "`variant'"
}

/* Erland "No diminutives" */

/* Ermando "No equivalents" */

/* Ermando "No diminutives" */

local Ermanno `" "Hariman" "Herman" "Hermanus" "Hermanni" "Armand" "Hermann" "Ármann" "Armando" "Ermanno" "German" "'
foreach variant of local Ermanno {
	replace ameriname = "Ermanno" if fname == "`variant'"
}

local Ermanno `" "Harm" "Mannes" "Maan" "'
foreach diminutive of local Ermanno {
	replace ameriname = "Ermanno" if fname == "`diminutive'"
}

local Ermenegildo `" "Erminigild" "Ermenegilde" "Hermenegild" "Ermenegildo" "Hermenegildo" "'
foreach variant of local Ermenegildo {
	replace ameriname = "Ermenegildo" if fname == "`variant'"
}

/* Ermenegildo "No diminutives" */

local Erminio `" "Herminius" "Erminio" "Hermínio" "Herminio" "'
foreach variant of local Erminio {
	replace ameriname = "Erminio" if fname == "`variant'"
}

/* Erminio "No diminutives" */

local Erno `" "Ernust" "Ernst" "Earnest" "Ernest" "Erno" "Ernő" "Ernesto" "Ernestas" "'
foreach variant of local Erno {
	replace ameriname = "Erno" if fname == "`variant'"
}

local Erno `" "Ern" "Ernie" "'
foreach diminutive of local Erno {
	replace ameriname = "Erno" if fname == "`diminutive'"
}

local Erwin `" "Eburwin" "Erwin" "Hariwini" "Ervin" "'
foreach variant of local Erwin {
	replace ameriname = "Erwin" if fname == "`variant'"
}

/* Erwin "No diminutives" */

/* Eskil "No equivalents" */

/* Eskil "No diminutives" */

local Esteban `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Esteban {
	replace ameriname = "Esteban" if fname == "`variant'"
}

local Esteban `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Esteban {
	replace ameriname = "Esteban" if fname == "`diminutive'"
}

local Ester `" "Esther" "'Ester" "Hester" "Ester" "Esteri" "Eszter" "Estera" "Esthiru" "Esfir" "Yesfir" "'
foreach variant of local Ester {
	replace ameriname = "Ester" if fname == "`variant'"
}

local Ester `" "Essie" "Esta" "Hettie" "Essi" "Eszti" "Estee" "'
foreach diminutive of local Ester {
	replace ameriname = "Ester" if fname == "`diminutive'"
}

/* Etienne "No equivalents" */

/* Etienne "No diminutives" */

/* Ettel "No equivalents" */

/* Ettel "No diminutives" */

local Eugenia `" "Eugeneia" "Eugenia" "Eukene" "Evgenia" "Evgeniya" "Eugénie" "Uxía" "Evgenija" "Eugênia" "Yevgeniya" "Yevheniya" "Owena" "'
foreach variant of local Eugenia {
	replace ameriname = "Eugenia" if fname == "`variant'"
}

local Eugenia `" "Lagina" "Zhenya" "Geena" "Gena" "Genie" "Gina" "MASCULINE FORMS" "Eugenios" "Eugenius" "Owain" "Yvain" "Ywain" "Evgeni" "Eugen" "Evžen" "Eugene" "Gene" "Owen" "Eugène" "Uxío" "Eugenio" "Eugenijus" "Evgenij" "Eugeniusz" "Eugênio" "Evgeniy" "Evgeny" "Genya" "Yevgeni" "Yevgeniy" "Yevgeny" "Yevgen" "Yevhen" "Yevheniy" "'
foreach diminutive of local Eugenia {
	replace ameriname = "Eugenia" if fname == "`diminutive'"
}

local Eugenius `" "Eugenios" "Eugenius" "Owain" "Yvain" "Ywain" "Evgeni" "Eugen" "Evžen" "Eugene" "Owen" "Eugène" "Uxío" "Eugenio" "Eugenijus" "Evgenij" "Eugeniusz" "Eugênio" "Evgeniy" "Evgeny" "Yevgeni" "Yevgeniy" "Yevgeny" "Yevgen" "Yevhen" "Yevheniy" "'
foreach variant of local Eugenius {
	replace ameriname = "Eugenius" if fname == "`variant'"
}

local Eugenius `" "Gene" "Genya" "Zhenya" "'
foreach diminutive of local Eugenius {
	replace ameriname = "Eugenius" if fname == "`diminutive'"
}

/* Eurico "No equivalents" */

/* Eurico "No diminutives" */

local Eusebio `" "Eusebios" "Eusebius" "Eusebio" "Eusébio" "'
foreach variant of local Eusebio {
	replace ameriname = "Eusebio" if fname == "`variant'"
}

/* Eusebio "No diminutives" */

/* Eustacchio "No equivalents" */

/* Eustacchio "No diminutives" */

/* Evagelos "No equivalents" */

/* Evagelos "No diminutives" */

/* Evald "No equivalents" */

/* Evald "No diminutives" */

local Evan `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Evan {
	replace ameriname = "Evan" if fname == "`variant'"
}

local Evan `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Evan {
	replace ameriname = "Evan" if fname == "`diminutive'"
}

local Evangelos `" "Evangelos" "Vangelis" "Vangel" "'
foreach variant of local Evangelos {
	replace ameriname = "Evangelos" if fname == "`variant'"
}

/* Evangelos "No diminutives" */

/* Evanghelos "No equivalents" */

/* Evanghelos "No diminutives" */

local Evaristo `" "Euaristos" "Evaristus" "Évariste" "Evaristo" "'
foreach variant of local Evaristo {
	replace ameriname = "Evaristo" if fname == "`variant'"
}

/* Evaristo "No diminutives" */

/* Evelio "No equivalents" */

/* Evelio "No diminutives" */

local Even `" "Eyvindr" "Ejvind" "Eyvindur" "Eivind" "Even" "Øivind" "'
foreach variant of local Even {
	replace ameriname = "Even" if fname == "`variant'"
}

/* Even "No diminutives" */

local Evert `" "Eberhard" "Erhard" "Evert" "Everard" "Évrard" "Eberardo" "'
foreach variant of local Evert {
	replace ameriname = "Evert" if fname == "`variant'"
}

local Evert `" "Ebbe" "'
foreach diminutive of local Evert {
	replace ameriname = "Evert" if fname == "`diminutive'"
}

local Ewald `" "Ewald" "Ewoud" "Ewout" "'
foreach variant of local Ewald {
	replace ameriname = "Ewald" if fname == "`variant'"
}

/* Ewald "No diminutives" */

/* Ewel "No equivalents" */

/* Ewel "No diminutives" */

local Ezio `" "Aetius" "'
foreach variant of local Ezio {
	replace ameriname = "Ezio" if fname == "`variant'"
}

/* Ezio "No diminutives" */

local Ezra `" "Esdras" "'Ezra'" "Ezras" "Ezra" "'
foreach variant of local Ezra {
	replace ameriname = "Ezra" if fname == "`variant'"
}

/* Ezra "No diminutives" */

/* F "No equivalents" */

/* F "No diminutives" */

local Fabian `" "Fabianus" "Fabijan" "Fabian" "Fabien" "Fábián" "Fabiano" "Fabián" "'
foreach variant of local Fabian {
	replace ameriname = "Fabian" if fname == "`variant'"
}

local Fabian `" "Fabó" "'
foreach diminutive of local Fabian {
	replace ameriname = "Fabian" if fname == "`diminutive'"
}

local Fabio `" "Fabius" "Fabio" "Fábio" "'
foreach variant of local Fabio {
	replace ameriname = "Fabio" if fname == "`variant'"
}

/* Fabio "No diminutives" */

/* Faivel "No equivalents" */

/* Faivel "No diminutives" */

/* Faiwel "No equivalents" */

/* Faiwel "No diminutives" */

/* Fajwel "No equivalents" */

/* Fajwel "No diminutives" */

/* Falco "No equivalents" */

/* Falco "No diminutives" */

/* Fan "No equivalents" */

/* Fan "No diminutives" */

/* Fancesco "No equivalents" */

/* Fancesco "No diminutives" */

/* Fankel "No equivalents" */

/* Fankel "No diminutives" */

/* Fares "No equivalents" */

/* Fares "No diminutives" */

local Farid `" "Fareed" "Farid" "Ferid" "Ferit" "'
foreach variant of local Farid {
	replace ameriname = "Farid" if fname == "`variant'"
}

/* Farid "No diminutives" */

/* Faro "No equivalents" */

/* Faro "No diminutives" */

/* Faroslav "No equivalents" */

/* Faroslav "No diminutives" */

local Faustino `" "Faustinus" "Faustino" "'
foreach variant of local Faustino {
	replace ameriname = "Faustino" if fname == "`variant'"
}

/* Faustino "No diminutives" */

local Fausto `" "Faustus" "Fausto" "'
foreach variant of local Fausto {
	replace ameriname = "Fausto" if fname == "`variant'"
}

/* Fausto "No diminutives" */

/* Fawel "No equivalents" */

/* Fawel "No diminutives" */

/* Fco "No equivalents" */

/* Fco "No diminutives" */

local Fedele `" "Fedele" "Fidelis" "Fidel" "'
foreach variant of local Fedele {
	replace ameriname = "Fedele" if fname == "`variant'"
}

/* Fedele "No diminutives" */

/* Fedko "No equivalents" */

/* Fedko "No diminutives" */

local Fedor `" "Tewodros" "Theodoros" "Theodorus" "Toros" "Teodor" "Todor" "Theodor" "Theodoor" "Theodore" "Théodore" "Tedore" "Tivadar" "Tódor" "Teodoro" "Teodors" "Tudor" "Fedor" "Feodor" "Fyodor" "Fedir" "'
foreach variant of local Fedor {
	replace ameriname = "Fedor" if fname == "`variant'"
}

local Fedor `" "Teo" "Theo" "Ted" "Teddy" "Teuvo" "Théo" "Thei" "Toše" "Toshe" "Téo" "Fedya" "'
foreach diminutive of local Fedor {
	replace ameriname = "Fedor" if fname == "`diminutive'"
}

local Feige `" "Faiga" "Faigel" "'
foreach variant of local Feige {
	replace ameriname = "Feige" if fname == "`variant'"
}

/* Feige "No diminutives" */

/* Feigel "No equivalents" */

/* Feigel "No diminutives" */

local Feivel `" "Phoibos" "Phoebus" "Fayvel" "Feivel" "'
foreach variant of local Feivel {
	replace ameriname = "Feivel" if fname == "`variant'"
}

/* Feivel "No diminutives" */

/* Feiwe "No equivalents" */

/* Feiwe "No diminutives" */

local Feliciano `" "Félicien" "Feliciano" "Felicianus" "Felicjan" "'
foreach variant of local Feliciano {
	replace ameriname = "Feliciano" if fname == "`variant'"
}

/* Feliciano "No diminutives" */

local Feliks `" "Felix" "Phelix" "Feliu" "Félix" "Felice" "Feliks" "'
foreach variant of local Feliks {
	replace ameriname = "Feliks" if fname == "`variant'"
}

/* Feliks "No diminutives" */

local Felipe `" "Philippos" "Philippus" "Philip" "Filip" "Felip" "Filippus" "Phillip" "Vilppu" "Philippe" "Philipp" "Filippos" "Fülöp" "Pilib" "Filippo" "Filips" "Pilypas" "Piripi" "Filippu" "Felipe" "Filipe" "Filipp" "Filib" "Pylyp" "'
foreach variant of local Felipe {
	replace ameriname = "Felipe" if fname == "`variant'"
}

local Felipe `" "Flip" "Phil" "Pip" "Felipinho" "'
foreach diminutive of local Felipe {
	replace ameriname = "Felipe" if fname == "`diminutive'"
}

/* Felippo "No equivalents" */

/* Felippo "No diminutives" */

/* Felis "No equivalents" */

/* Felis "No diminutives" */

/* Felise "No equivalents" */

/* Felise "No diminutives" */

local Ferdynand `" "Ferdinand" "Ferran" "Fernand" "Ferdinánd" "Ferdinando" "Ferdynand" "Fernando" "Fernão" "Hernando" "'
foreach variant of local Ferdynand {
	replace ameriname = "Ferdynand" if fname == "`variant'"
}

local Ferdynand `" "Ferdi" "Ferdie" "Ferdy" "Veeti" "Vertti" "Nándor" "Hernán" "Nando" "'
foreach diminutive of local Ferdynand {
	replace ameriname = "Ferdynand" if fname == "`diminutive'"
}

/* Ferenez "No equivalents" */

/* Ferenez "No diminutives" */

/* Ferenz "No equivalents" */

/* Ferenz "No diminutives" */

local Fermin `" "Fermin" "Firmin" "Firmino" "Firminus" "Fermín" "'
foreach variant of local Fermin {
	replace ameriname = "Fermin" if fname == "`variant'"
}

local Fermin `" "Fermintxo" "'
foreach diminutive of local Fermin {
	replace ameriname = "Fermin" if fname == "`diminutive'"
}

local Ferruccio `" "Ferruccio" "'
foreach variant of local Ferruccio {
	replace ameriname = "Ferruccio" if fname == "`variant'"
}

/* Ferruccio "No diminutives" */

local Fidel `" "Fedele" "Fidelis" "Fidel" "'
foreach variant of local Fidel {
	replace ameriname = "Fidel" if fname == "`variant'"
}

/* Fidel "No diminutives" */

/* Fidele "No equivalents" */

/* Fidele "No diminutives" */

/* Filadelfio "No equivalents" */

/* Filadelfio "No diminutives" */

local Filiberto `" "Filibert" "Filbert" "Philbert" "Philibert" "'
foreach variant of local Filiberto {
	replace ameriname = "Filiberto" if fname == "`variant'"
}

/* Filiberto "No diminutives" */

local Filipp `" "Philippos" "Philippus" "Philip" "Filip" "Felip" "Filippus" "Phillip" "Vilppu" "Philippe" "Philipp" "Filippos" "Fülöp" "Pilib" "Filippo" "Filips" "Pilypas" "Piripi" "Filippu" "Felipe" "Filipe" "Filipp" "Filib" "Pylyp" "'
foreach variant of local Filipp {
	replace ameriname = "Filipp" if fname == "`variant'"
}

local Filipp `" "Flip" "Phil" "Pip" "Felipinho" "'
foreach diminutive of local Filipp {
	replace ameriname = "Filipp" if fname == "`diminutive'"
}

local Filippa `" "Filipa" "Philippa" "Philipa" "Phillipa" "Philippine" "Filippa" "Felipa" "'
foreach variant of local Filippa {
	replace ameriname = "Filippa" if fname == "`variant'"
}

local Filippa `" "Pippa" "Philippina" "Filipina" "MASCULINE FORMS" "Philippos" "Philippus" "Philip" "Filip" "Felip" "Filippus" "Flip" "Phil" "Phillip" "Pip" "Vilppu" "Philippe" "Philipp" "Filippos" "Fülöp" "Pilib" "Filippo" "Filips" "Pilypas" "Piripi" "Filippu" "Felipe" "Felipinho" "Filipe" "Filipp" "Filib" "'
foreach diminutive of local Filippa {
	replace ameriname = "Filippa" if fname == "`diminutive'"
}

/* Filippe "No equivalents" */

/* Filippe "No diminutives" */

/* Filippi "No equivalents" */

/* Filippi "No diminutives" */

local Filippos `" "Philippos" "Philippus" "Philip" "Filip" "Felip" "Filippus" "Phillip" "Vilppu" "Philippe" "Philipp" "Filippos" "Fülöp" "Pilib" "Filippo" "Filips" "Pilypas" "Piripi" "Filippu" "Felipe" "Filipe" "Filipp" "Filib" "Pylyp" "'
foreach variant of local Filippos {
	replace ameriname = "Filippos" if fname == "`variant'"
}

local Filippos `" "Flip" "Phil" "Pip" "Felipinho" "'
foreach diminutive of local Filippos {
	replace ameriname = "Filippos" if fname == "`diminutive'"
}

/* Fillipo "No equivalents" */

/* Fillipo "No diminutives" */

/* Fillippo "No equivalents" */

/* Fillippo "No diminutives" */

local Filomena `" "Filomena" "Philomena" "Philomène" "Filimena" "'
foreach variant of local Filomena {
	replace ameriname = "Filomena" if fname == "`variant'"
}

/* Filomena "No diminutives" */

/* Filomeno "No equivalents" */

/* Filomeno "No diminutives" */

/* Finn "No equivalents" */

/* Finn "No diminutives" */

/* Fioravante "No equivalents" */

/* Fioravante "No diminutives" */

/* Fioravanti "No equivalents" */

/* Fioravanti "No diminutives" */

/* Fiore "No equivalents" */

/* Fiore "No diminutives" */

/* Fiorentino "No equivalents" */

/* Fiorentino "No diminutives" */

local Fiorino `" "Florus" "Fiorino" "Florinus" "Florin" "'
foreach variant of local Fiorino {
	replace ameriname = "Fiorino" if fname == "`variant'"
}

/* Fiorino "No diminutives" */

local Fishel `" "Fishel" "'
foreach variant of local Fishel {
	replace ameriname = "Fishel" if fname == "`variant'"
}

/* Fishel "No diminutives" */

local Flaviano `" "Flavianus" "Flavien" "Flavian" "Flaviano" "'
foreach variant of local Flaviano {
	replace ameriname = "Flaviano" if fname == "`variant'"
}

/* Flaviano "No diminutives" */

local Flavio `" "Flavius" "Flavio" "Flávio" "Flaviu" "'
foreach variant of local Flavio {
	replace ameriname = "Flavio" if fname == "`variant'"
}

/* Flavio "No diminutives" */

local Florence `" "Floor" "Floris" "Florence" "Fiorenza" "Fiorenzo" "Florentia" "Florentius" "Florencio" "Florencia" "'
foreach variant of local Florence {
	replace ameriname = "Florence" if fname == "`variant'"
}

local Florence `" "Flo" "Floella" "Florrie" "Flossie" "MASCULINE FORMS" "Floor" "Floris" "Florent" "Fiorenzo" "Florentius" "Florencio" "'
foreach diminutive of local Florence {
	replace ameriname = "Florence" if fname == "`diminutive'"
}

local Florent `" "Floor" "Floris" "Florence" "Florent" "Fiorenzo" "Florentius" "Florencio" "'
foreach variant of local Florent {
	replace ameriname = "Florent" if fname == "`variant'"
}

/* Florent "No diminutives" */

local Florentino `" "Florentin" "Florentinus" "Florentino" "'
foreach variant of local Florentino {
	replace ameriname = "Florentino" if fname == "`variant'"
}

/* Florentino "No diminutives" */

local Florian `" "Florianus" "Florijan" "Florian" "Floriano" "'
foreach variant of local Florian {
	replace ameriname = "Florian" if fname == "`variant'"
}

/* Florian "No diminutives" */

/* Florindo "No equivalents" */

/* Florindo "No diminutives" */

local Folke `" "Fulco" "Fólki" "Folke" "Fulk" "Fulke" "'
foreach variant of local Folke {
	replace ameriname = "Folke" if fname == "`variant'"
}

/* Folke "No diminutives" */

/* Fossel "No equivalents" */

/* Fossel "No diminutives" */

local Fotios `" "Photios" "Fotios" "Fotis" "'
foreach variant of local Fotios {
	replace ameriname = "Fotios" if fname == "`variant'"
}

/* Fotios "No diminutives" */

local Fotis `" "Photios" "Fotios" "Fotis" "'
foreach variant of local Fotis {
	replace ameriname = "Fotis" if fname == "`variant'"
}

/* Fotis "No diminutives" */

local Fouad `" "Fouad" "Fuad" "'
foreach variant of local Fouad {
	replace ameriname = "Fouad" if fname == "`variant'"
}

/* Fouad "No diminutives" */

/* Fraim "No equivalents" */

/* Fraim "No diminutives" */

local Fran `" "Frantziska" "Frantzisko" "Patxi" "Frañsez" "Frañseza" "Cesc" "Francesc" "Francesca" "Francescu" "Fran" "František" "Františka" "Frans" "Franciscus" "Cissy" "Fannie" "Fanny" "Francene" "Francine" "Frank" "Frankie" "Frannie" "Franny" "Sissie" "Sissy" "Fanni" "Ransu" "France" "Francette" "Francis" "Francisque" "François" "Françoise" "Franz" "Fränze" "Franzi" "Franziska" "Ziska" "Ferenc" "Feri" "Ferkó" "Franci" "Franciska" "Proinsias" "Franca" "Francesco" "Franco" "Francisca" "Frens" "Frenske" "Pranciškus" "Franciszek" "Franciszka" "Chica" "Chico" "Francisco" "Frang" "Frangag" "Franjo" "Curro" "Paco" "Pancho" "Paquito" "Ffransis" "MASCULINE FORMS" "Frane" "Franko" "Frano" "Franc" "Frančišek" "'
foreach variant of local Fran {
	replace ameriname = "Fran" if fname == "`variant'"
}

/* Fran "No diminutives" */

/* Franceno "No equivalents" */

/* Franceno "No diminutives" */

local Frances `" "Frantziska" "Frañseza" "Francesca" "Franka" "Františka" "Frances" "Francis" "Françoise" "Franziska" "Franciska" "Franca" "Francisca" "Franciszka" "Frangag" "Frančiška" "'
foreach variant of local Frances {
	replace ameriname = "Frances" if fname == "`variant'"
}

local Frances `" "Cissy" "Fannie" "Fanny" "Fran" "Francene" "Francine" "Frankie" "Frannie" "Franny" "Sissie" "Sissy" "Fanni" "France" "Francette" "Fränze" "Franzi" "Ziska" "Franci" "Chica" "Francka" "Paca" "Paquita" "MASCULINE FORMS" "Frantzisko" "Patxi" "Frañsez" "Cesc" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Frank" "Ransu" "Francisque" "François" "Franz" "Ferenc" "Feri" "Ferkó" "Proinsias" "Francesco" "Franco" "Frens" "Frenske" "Pranciškus" "Franciszek" "Chico" "Francisco" "Frang" "Franc" "Frančišek" "Curro" "Paco" "Pancho" "Paquito" "Ffransis" "'
foreach diminutive of local Frances {
	replace ameriname = "Frances" if fname == "`diminutive'"
}

local Francesca `" "Frantziska" "Frañseza" "Francesca" "Franka" "Františka" "Frances" "Francis" "Françoise" "Franziska" "Franciska" "Franca" "Francisca" "Franciszka" "Frangag" "Frančiška" "'
foreach variant of local Francesca {
	replace ameriname = "Francesca" if fname == "`variant'"
}

local Francesca `" "Cissy" "Fannie" "Fanny" "Fran" "Francene" "Francine" "Frankie" "Frannie" "Franny" "Sissie" "Sissy" "Fanni" "France" "Francette" "Fränze" "Franzi" "Ziska" "Franci" "Chica" "Francka" "Paca" "Paquita" "MASCULINE FORMS" "Frantzisko" "Patxi" "Frañsez" "Cesc" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Frank" "Ransu" "Francisque" "François" "Franz" "Ferenc" "Feri" "Ferkó" "Proinsias" "Francesco" "Franco" "Frens" "Frenske" "Pranciškus" "Franciszek" "Chico" "Francisco" "Frang" "Franc" "Frančišek" "Curro" "Paco" "Pancho" "Paquito" "Ffransis" "'
foreach diminutive of local Francesca {
	replace ameriname = "Francesca" if fname == "`diminutive'"
}

/* Francescantonio "No equivalents" */

/* Francescantonio "No diminutives" */

local FRANCESCO `" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach variant of local FRANCESCO {
	replace ameriname = "FRANCESCO" if fname == "`variant'"
}

local FRANCESCO `" "Cesc" "Fran" "Frank" "Franny" "Ransu" "Feri" "Ferkó" "Frenske" "Chico" "Curro" "Paco" "Pancho" "Paquito" "'
foreach diminutive of local FRANCESCO {
	replace ameriname = "FRANCESCO" if fname == "`diminutive'"
}

/* Franceseo "No equivalents" */

/* Franceseo "No diminutives" */

/* Franceso "No equivalents" */

/* Franceso "No diminutives" */

/* Francino "No equivalents" */

/* Francino "No diminutives" */

local Franciscus `" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach variant of local Franciscus {
	replace ameriname = "Franciscus" if fname == "`variant'"
}

local Franciscus `" "Cesc" "Fran" "Frank" "Franny" "Ransu" "Feri" "Ferkó" "Frenske" "Chico" "Curro" "Paco" "Pancho" "Paquito" "'
foreach diminutive of local Franciscus {
	replace ameriname = "Franciscus" if fname == "`diminutive'"
}

/* Francisek "No equivalents" */

/* Francisek "No diminutives" */

/* Franciskus "No equivalents" */

/* Franciskus "No diminutives" */

/* Francizek "No equivalents" */

/* Francizek "No diminutives" */

local Franck `" "Franco" "Frank" "Franck" "'
foreach variant of local Franck {
	replace ameriname = "Franck" if fname == "`variant'"
}

local Franck `" "Frankie" "'
foreach diminutive of local Franck {
	replace ameriname = "Franck" if fname == "`diminutive'"
}

/* Francz "No equivalents" */

/* Francz "No diminutives" */

local Frane `" "Frantzisko" "Patxi" "Frañsez" "Francesc" "Francescu" "Frane" "Franjo" "Franko" "Frano" "František" "Frans" "Franciscus" "Francis" "Francisque" "François" "Franz" "Ferenc" "Proinsias" "Francesco" "Franco" "Frens" "Pranciškus" "Franciszek" "Francisco" "Frang" "Franc" "Frančišek" "Ffransis" "'
foreach variant of local Frane {
	replace ameriname = "Frane" if fname == "`variant'"
}

local Frane `" "Cesc" "Fran" "Frank" "Franny" "Ransu" "Feri" "Ferkó" "Frenske" "Chico" "Curro" "Paco" "Pancho" "Paquito" "'
foreach diminutive of local Frane {
	replace ameriname = "Frane" if fname == "`diminutive'"
}

/* Fransesco "No equivalents" */

/* Fransesco "No diminutives" */

/* Frant "No equivalents" */

/* Frant "No diminutives" */

/* Frantisck "No equivalents" */

/* Frantisck "No diminutives" */

/* Frantz "No equivalents" */

/* Frantz "No diminutives" */

/* Franyo "No equivalents" */

/* Franyo "No diminutives" */

/* Franzisek "No equivalents" */

/* Franzisek "No diminutives" */

/* Franziszek "No equivalents" */

/* Franziszek "No diminutives" */

local Freddy `" "Friduric" "Bedřich" "Frederik" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Fredrik" "Veeti" "Frédéric" "Fedde" "Fiete" "Friedrich" "Fritz" "Frigyes" "Friðrik" "Federico" "Federigo" "Fredo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Freddy {
	replace ameriname = "Freddy" if fname == "`variant'"
}

/* Freddy "No diminutives" */

/* Frederic "No equivalents" */

/* Frederic "No diminutives" */

/* Frederich "No equivalents" */

/* Frederich "No diminutives" */

local Frederico `" "Friduric" "Bedřich" "Frederik" "Frederick" "Fredric" "Fredrick" "Fredrik" "Frédéric" "Friedrich" "Frigyes" "Friðrik" "Federico" "Federigo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Frederico {
	replace ameriname = "Frederico" if fname == "`variant'"
}

local Frederico `" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Veeti" "Fedde" "Fiete" "Fritz" "Fredo" "'
foreach diminutive of local Frederico {
	replace ameriname = "Frederico" if fname == "`diminutive'"
}

/* Fredk "No equivalents" */

/* Fredk "No diminutives" */

/* Fredrich "No equivalents" */

/* Fredrich "No diminutives" */

local Fredrick `" "Friduric" "Bedřich" "Frederik" "Frederick" "Fredric" "Fredrick" "Fredrik" "Frédéric" "Friedrich" "Frigyes" "Friðrik" "Federico" "Federigo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Fredrick {
	replace ameriname = "Fredrick" if fname == "`variant'"
}

local Fredrick `" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Veeti" "Fedde" "Fiete" "Fritz" "Fredo" "'
foreach diminutive of local Fredrick {
	replace ameriname = "Fredrick" if fname == "`diminutive'"
}

local Fredrik `" "Friduric" "Bedřich" "Frederik" "Frederick" "Fredric" "Fredrick" "Fredrik" "Frédéric" "Friedrich" "Frigyes" "Friðrik" "Federico" "Federigo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Fredrik {
	replace ameriname = "Fredrik" if fname == "`variant'"
}

local Fredrik `" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Veeti" "Fedde" "Fiete" "Fritz" "Fredo" "'
foreach diminutive of local Fredrik {
	replace ameriname = "Fredrik" if fname == "`diminutive'"
}

/* Freide "No equivalents" */

/* Freide "No diminutives" */

/* Freidrich "No equivalents" */

/* Freidrich "No diminutives" */

/* Fridolf "No equivalents" */

/* Fridolf "No diminutives" */

/* Fridrich "No equivalents" */

/* Fridrich "No diminutives" */

/* Friedr "No equivalents" */

/* Friedr "No diminutives" */

/* Friedrick "No equivalents" */

/* Friedrick "No diminutives" */

local Frigyes `" "Friduric" "Bedřich" "Frederik" "Frederick" "Fredric" "Fredrick" "Fredrik" "Frédéric" "Friedrich" "Frigyes" "Friðrik" "Federico" "Federigo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Frigyes {
	replace ameriname = "Frigyes" if fname == "`variant'"
}

local Frigyes `" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Veeti" "Fedde" "Fiete" "Fritz" "Fredo" "'
foreach diminutive of local Frigyes {
	replace ameriname = "Frigyes" if fname == "`diminutive'"
}

/* Frithjof "No equivalents" */

/* Frithjof "No diminutives" */

local Frits `" "Friduric" "Bedřich" "Frederik" "Fred" "Freek" "Frits" "Rik" "Freddie" "Freddy" "Frederick" "Fredric" "Fredrick" "Fredrik" "Veeti" "Frédéric" "Fedde" "Fiete" "Friedrich" "Fritz" "Frigyes" "Friðrik" "Federico" "Federigo" "Fredo" "Fricis" "Frīdrihs" "Fryderyk" "Frederico" "Friderik" "'
foreach variant of local Frits {
	replace ameriname = "Frits" if fname == "`variant'"
}

/* Frits "No diminutives" */

/* Fronz "No equivalents" */

/* Fronz "No diminutives" */

/* Fsco "No equivalents" */

/* Fsco "No diminutives" */

/* Ftze "No equivalents" */

/* Ftze "No diminutives" */

/* Fudel "No equivalents" */

/* Fudel "No diminutives" */

/* Fulop "No equivalents" */

/* Fulop "No diminutives" */

local Fulvio `" "Fulvius" "Fulvio" "Fúlvio" "'
foreach variant of local Fulvio {
	replace ameriname = "Fulvio" if fname == "`variant'"
}

/* Fulvio "No diminutives" */

/* Gabor "No equivalents" */

/* Gabor "No diminutives" */

local Gaetana `" "Gaetane" "Gaetana" "MASCULINE FORMS" "Kajetán" "Gaétan" "Gaëtan" "Kayetan" "Cajetan" "Gaetano" "Caietanus" "Kajetan" "Caetano" "'
foreach variant of local Gaetana {
	replace ameriname = "Gaetana" if fname == "`variant'"
}

/* Gaetana "No diminutives" */

local GAETANO `" "Kajetán" "Gaétan" "Gaëtan" "Kayetan" "Cajetan" "Gaetano" "Caietanus" "Kajetan" "Caetano" "Cayetano" "'
foreach variant of local GAETANO {
	replace ameriname = "GAETANO" if fname == "`variant'"
}

/* GAETANO "No diminutives" */

/* Gaitano "No equivalents" */

/* Gaitano "No diminutives" */

/* Galliano "No equivalents" */

/* Galliano "No diminutives" */

/* Gandolfo "No equivalents" */

/* Gandolfo "No diminutives" */

/* Garabed "No equivalents" */

/* Garabed "No diminutives" */

/* Garabet "No equivalents" */

/* Garabet "No diminutives" */

local Garfield `" "Garfield" "EQUIVALENTS" "'
foreach variant of local Garfield {
	replace ameriname = "Garfield" if fname == "`variant'"
}

/* Garfield "No diminutives" */

/* Garibaldi "No equivalents" */

/* Garibaldi "No diminutives" */

local Gaspar `" "Casper" "Jesper" "Kasper" "Jasper" "Gaspard" "Kaspar" "Gáspár" "Gaspare" "Gasparo" "Caspar" "Gaspar" "Kaspars" "Kasparas" "Kacper" "Gašper" "'
foreach variant of local Gaspar {
	replace ameriname = "Gaspar" if fname == "`variant'"
}

local Gaspar `" "Cas" "'
foreach diminutive of local Gaspar {
	replace ameriname = "Gaspar" if fname == "`diminutive'"
}

/* Gaspari "No equivalents" */

/* Gaspari "No diminutives" */

local Gasparo `" "Casper" "Jesper" "Kasper" "Jasper" "Gaspard" "Kaspar" "Gáspár" "Gaspare" "Gasparo" "Caspar" "Gaspar" "Kaspars" "Kasparas" "Kacper" "Gašper" "'
foreach variant of local Gasparo {
	replace ameriname = "Gasparo" if fname == "`variant'"
}

local Gasparo `" "Cas" "'
foreach diminutive of local Gasparo {
	replace ameriname = "Gasparo" if fname == "`diminutive'"
}

/* Gastano "No equivalents" */

/* Gastano "No diminutives" */

local Gaston `" "Gasto" "'
foreach variant of local Gaston {
	replace ameriname = "Gaston" if fname == "`variant'"
}

/* Gaston "No diminutives" */

/* Gastone "No equivalents" */

/* Gastone "No diminutives" */

/* Gawriel "No equivalents" */

/* Gawriel "No diminutives" */

/* Gdalie "No equivalents" */

/* Gdalie "No diminutives" */

/* Gdalje "No equivalents" */

/* Gdalje "No diminutives" */

/* Gedale "No equivalents" */

/* Gedale "No diminutives" */

/* Gedalie "No equivalents" */

/* Gedalie "No diminutives" */

/* Gedalje "No equivalents" */

/* Gedalje "No diminutives" */

local Geert `" "Gerhard" "Gerard" "Cai" "Caj" "Kai" "Kaj" "Kay" "Geert" "Gerd" "Gerry" "Gert" "Gerrard" "Jerrard" "Gérard" "Gerrit" "Jorrit" "Jurre" "Jurryt" "Gerhardt" "Gellért" "Gearóid" "Gerardo" "Gherardo" "Sjra" "'
foreach variant of local Geert {
	replace ameriname = "Geert" if fname == "`variant'"
}

/* Geert "No diminutives" */

/* Gelindo "No equivalents" */

/* Gelindo "No diminutives" */

/* Gelsomino "No equivalents" */

/* Gelsomino "No diminutives" */

/* Genaro "No equivalents" */

/* Genaro "No diminutives" */

/* Generoso "No equivalents" */

/* Generoso "No diminutives" */

local Gennarino `" "Ianuarius" "Januarius" "Gennarino" "Jenaro" "'
foreach variant of local Gennarino {
	replace ameriname = "Gennarino" if fname == "`variant'"
}

local Gennarino `" "Rino" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Gennarino {
	replace ameriname = "Gennarino" if fname == "`diminutive'"
}

local Geoffrey `" "Gaufrid" "Gisilfrid" "Godafrid" "Walahfrid" "Guðfriðr" "Godfried" "Geffrey" "Geoffrey" "Godfrey" "Jeffery" "Jeffrey" "Jeffry" "Geoffroy" "Godefroy" "Joffrey" "Gottfried" "Gofraidh" "Séafra" "Siothrún" "Goffredo" "Geoffroi" "Gjord" "Gjurd" "Godtfred" "Godofredo" "Goraidh" "Gottfrid" "Sieffre" "'
foreach variant of local Geoffrey {
	replace ameriname = "Geoffrey" if fname == "`variant'"
}

local Geoffrey `" "Geoff" "Jeff" "Jep" "Fredo" "'
foreach diminutive of local Geoffrey {
	replace ameriname = "Geoffrey" if fname == "`diminutive'"
}

/* Georgeo "No equivalents" */

/* Georgeo "No diminutives" */

/* Georghios "No equivalents" */

/* Georghios "No diminutives" */

local Georgi `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Georgi {
	replace ameriname = "Georgi" if fname == "`variant'"
}

local Georgi `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jockel" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Georgi {
	replace ameriname = "Georgi" if fname == "`diminutive'"
}

/* Georgio "No equivalents" */

/* Georgio "No diminutives" */

local Georgy `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Georgy {
	replace ameriname = "Georgy" if fname == "`variant'"
}

local Georgy `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jockel" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Georgy {
	replace ameriname = "Georgy" if fname == "`diminutive'"
}

/* Geovanni "No equivalents" */

/* Geovanni "No diminutives" */

/* Gerardus "No equivalents" */

/* Gerardus "No diminutives" */

/* Gerd "No equivalents" */

/* Gerd "No diminutives" */

/* Geremia "No equivalents" */

/* Geremia "No diminutives" */

local Gerhard `" "Gerhard" "Gerard" "Gerrit" "Gerrard" "Jerrard" "Gérard" "Jorrit" "Jurryt" "Gerhardt" "Gellért" "Gearóid" "Gerardo" "Gherardo" "Sjra" "'
foreach variant of local Gerhard {
	replace ameriname = "Gerhard" if fname == "`variant'"
}

local Gerhard `" "Cai" "Caj" "Kai" "Kaj" "Kay" "Geert" "Gerd" "Gerry" "Gert" "Jurre" "'
foreach diminutive of local Gerhard {
	replace ameriname = "Gerhard" if fname == "`diminutive'"
}

/* Gerios "No equivalents" */

/* Gerios "No diminutives" */

/* Gerlando "No equivalents" */

/* Gerlando "No diminutives" */

local Germain `" "Germanus" "Kerman" "German" "Jermaine" "Germain" "Germano" "Germán" "'
foreach variant of local Germain {
	replace ameriname = "Germain" if fname == "`variant'"
}

/* Germain "No diminutives" */

/* German "No equivalents" */

/* German "No diminutives" */

local Germano `" "Germanus" "Kerman" "German" "Jermaine" "Germain" "Germano" "Germán" "'
foreach variant of local Germano {
	replace ameriname = "Germano" if fname == "`variant'"
}

/* Germano "No diminutives" */

local Gerolamo `" "Hieronymos" "Hieronymus" "Jeronim" "Jeroen" "Jerome" "Jérôme" "Geronimo" "Gerolamo" "Girolamo" "Ieronimus" "Jerônimo" "Jerónimo" "Gerónimo" "'
foreach variant of local Gerolamo {
	replace ameriname = "Gerolamo" if fname == "`variant'"
}

local Gerolamo `" "Jerko" "Jerry" "'
foreach diminutive of local Gerolamo {
	replace ameriname = "Gerolamo" if fname == "`diminutive'"
}

/* Gersch "No equivalents" */

/* Gersch "No diminutives" */

/* Gerschan "No equivalents" */

/* Gerschan "No diminutives" */

/* Gerschen "No equivalents" */

/* Gerschen "No diminutives" */

/* Gerschon "No equivalents" */

/* Gerschon "No diminutives" */

local Gershon `" "Gershom" "Gershon" "'
foreach variant of local Gershon {
	replace ameriname = "Gershon" if fname == "`variant'"
}

/* Gershon "No diminutives" */

/* Gerson "No equivalents" */

/* Gerson "No diminutives" */

/* Gesualdo "No equivalents" */

/* Gesualdo "No diminutives" */

/* Getzel "No equivalents" */

/* Getzel "No diminutives" */

/* Geza "No equivalents" */

/* Geza "No diminutives" */

/* Giacchino "No equivalents" */

/* Giacchino "No diminutives" */

local Giacobbe `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakov" "Jakub" "Jakob" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jákup" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Giacobbe {
	replace ameriname = "Giacobbe" if fname == "`variant'"
}

local Giacobbe `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Jacky" "Japik" "Koba" "Jockel" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Jaša" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Giacobbe {
	replace ameriname = "Giacobbe" if fname == "`diminutive'"
}

local Giacoma `" "Zhaklina" "Žaklina" "Jacobine" "Jacoba" "Jacobina" "Jacomina" "Jackalyn" "Jacklyn" "Jaclyn" "Jacqueline" "Jacquelyn" "Jaqueline" "Jaquelyn" "Giacoma" "Giacomina" "Żaklina" "Jamesina" "'
foreach variant of local Giacoma {
	replace ameriname = "Giacoma" if fname == "`variant'"
}

local Giacoma `" "Bine" "Coba" "Mina" "Jacquetta" "Jacqui" "Jaci" "Jacki" "Jackie" "Jaime" "Jaimie" "Jaki" "Jakki" "Jami" "Jamie" "Jaye" "Jayla" "Jaylen" "Jaylene" "Jaylin" "Jaylyn" "Jayma" "Jayme" "Jacquette" "MASCULINE FORMS" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jaumet" "Jago" "Jakov" "Jakša" "Jakub" "Ib" "Jakob" "Jeppe" "Cobus" "Coos" "Jaap" "Jacobus" "Kobe" "Kobus" "Koos" "Sjaak" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jaycob" "Jaymes" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaagup" "Jaak" "Jaakob" "Jákup" "Jaakko" "Jaakoppi" "Jaska" "Jacky" "Jacques" "Japik" "Iago" "Iakob" "Koba" "Jockel" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Lapo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Kuba" "Jacó" "Yasha" "Seumas" "Jaka" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Giacoma {
	replace ameriname = "Giacoma" if fname == "`diminutive'"
}

/* Giacomino "No equivalents" */

/* Giacomino "No diminutives" */

/* Giaconio "No equivalents" */

/* Giaconio "No diminutives" */

local Giambattista `" "Giambattista" "'
foreach variant of local Giambattista {
	replace ameriname = "Giambattista" if fname == "`variant'"
}

/* Giambattista "No diminutives" */

/* Giavanni "No equivalents" */

/* Giavanni "No diminutives" */

local Gilberto `" "Gilbert" "Giselbert" "Gisilbert" "Gilberto" "'
foreach variant of local Gilberto {
	replace ameriname = "Gilberto" if fname == "`variant'"
}

local Gilberto `" "Gib" "Gil" "'
foreach diminutive of local Gilberto {
	replace ameriname = "Gilberto" if fname == "`diminutive'"
}

/* Gildo "No equivalents" */

/* Gildo "No diminutives" */

/* Ginlio "No equivalents" */

/* Ginlio "No diminutives" */

/* Ginseppe "No equivalents" */

/* Ginseppe "No diminutives" */

/* Gio "No equivalents" */

/* Gio "No diminutives" */

local Gioachino `" "Jokin" "Yehoyakhin" "Yehoyakim" "Jehoiachin" "Jehoiakim" "Joaquim" "Jáchym" "Joakim" "Jokum" "Jochem" "Jaakkima" "Joachim" "Jochen" "Jochim" "Gioacchino" "Gioachino" "Ioachim" "Ioakeim" "Akim" "Yakim" "Joaquín" "'
foreach variant of local Gioachino {
	replace ameriname = "Gioachino" if fname == "`variant'"
}

local Gioachino `" "Chimo" "Quim" "Ximo" "Kim" "Aki" "Kimi" "Achim" "Jo" "Jockel" "'
foreach diminutive of local Gioachino {
	replace ameriname = "Gioachino" if fname == "`diminutive'"
}

/* Giocomo "No equivalents" */

/* Giocomo "No diminutives" */

/* Giocondo "No equivalents" */

/* Giocondo "No diminutives" */

/* Gioranni "No equivalents" */

/* Gioranni "No diminutives" */

local Giordano `" "Jordanes" "Iordan" "Yordan" "Jordaan" "Jordan" "Jordon" "Jourdain" "Yarden" "Giordano" "Jordão" "Jordán" "'
foreach variant of local Giordano {
	replace ameriname = "Giordano" if fname == "`variant'"
}

local Giordano `" "Joord" "Judd" "'
foreach diminutive of local Giordano {
	replace ameriname = "Giordano" if fname == "`diminutive'"
}

/* Giorgios "No equivalents" */

/* Giorgios "No diminutives" */

/* Giosne "No equivalents" */

/* Giosne "No diminutives" */

/* Giosue "No equivalents" */

/* Giosue "No diminutives" */

/* Giovan "No equivalents" */

/* Giovan "No diminutives" */

/* Giovanbattista "No equivalents" */

/* Giovanbattista "No diminutives" */

/* Giovani "No equivalents" */

/* Giovani "No diminutives" */

local Giovanna `" "Lashawn" "Tajuana" "Jone" "Ioanna" "Iohanna" "Joanna" "Ioana" "Ivana" "Yana" "Yanka" "Yoana" "Jana" "Joana" "Johana" "Johanna" "Johanne" "Janna" "Jane" "Janessa" "Janice" "Janis" "Jayna" "Jayne" "Jean" "Jeana" "Jeane" "Jeanna" "Jeanne" "Joan" "Joann" "Joanne" "Johna" "Johnna" "Jonelle" "Seanna" "Shauna" "Shavonne" "Shawna" "Sheena" "Sheenagh" "Shena" "Shevaun" "Shevon" "Janina" "Xoana" "Gianna" "Yanna" "Jóhanna" "Jóna" "Chevonne" "Síne" "Siobhán" "Giovanna" "Jovana" "Jehanne" "Ivanna" "Zhanna" "Seona" "Seonag" "Sìne" "Juana" "Shan" "Siân" "Siwan" "'
foreach variant of local Giovanna {
	replace ameriname = "Giovanna" if fname == "`variant'"
}

local Giovanna `" "Ivanka" "Nina" "Žana" "Iva" "Ivka" "Janička" "Hanna" "Hanne" "Janne" "Jannicke" "Jannike" "Jeanette" "Jonna" "Vanja" "Hannie" "Janine" "Janneke" "Jantine" "Jantje" "Jeanine" "Jeannette" "Jennigje" "Jenny" "Johanneke" "Genette" "Jan" "Janae" "Janeka" "Janel" "Janele" "Janella" "Janelle" "Janene" "Janet" "Janetta" "Janette" "Janey" "Janie" "Janna" "Jannah" "Jannette" "Jannine" "Jaynie" "Jeanie" "Jeannie" "Jeannine" "Jeni" "Jenna" "Jenni" "Jennie" "Jessalyn" "Jessi" "Jessie" "Jessye" "Jo" "Joanie" "Joetta" "Joey" "Jojo" "Joleen" "Jolene" "Jonette" "Joni" "Jonie" "Nena" "Netta" "Nettie" "Hannele" "Ninette" "Nana" "Zsanett" "Sinéad" "Gia" "Gianna" "Giannina" "Giovannetta" "Vanna" "Jovanka" "Jovka" "Vana" "Asia" "Joasia" "Joaninha" "Ionela" "Oana" "Zhannochka" "Seònaid" "Sheona" "Shona" "Sìneag" "Teasag" "Janka" "Juanita" "Siana" "Siani" "Sioned" "MASCULINE FORMS" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hannes" "Joop" "Evan" "Hank" "Ian" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giannino" "Giovanni" "Ivano" "Nino" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Jock" "Jockie" "Jocky" "Seoc" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Hampus" "Hasse" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach diminutive of local Giovanna {
	replace ameriname = "Giovanna" if fname == "`diminutive'"
}

/* Giovannantonio "No equivalents" */

/* Giovannantonio "No diminutives" */

/* Giovanne "No equivalents" */

/* Giovanne "No diminutives" */

local GIOVANNI `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local GIOVANNI {
	replace ameriname = "GIOVANNI" if fname == "`variant'"
}

local GIOVANNI `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local GIOVANNI {
	replace ameriname = "GIOVANNI" if fname == "`diminutive'"
}

/* Giovannino "No equivalents" */

/* Giovannino "No diminutives" */

/* Giovanno "No equivalents" */

/* Giovanno "No diminutives" */

/* Giovi "No equivalents" */

/* Giovi "No diminutives" */

/* Giovonni "No equivalents" */

/* Giovonni "No diminutives" */

/* Girardo "No equivalents" */

/* Girardo "No diminutives" */

/* Girolanio "No equivalents" */

/* Girolanio "No diminutives" */

/* Girsch "No equivalents" */

/* Girsch "No diminutives" */

/* Gisacchino "No equivalents" */

/* Gisacchino "No diminutives" */

/* Gisberto "No equivalents" */

/* Gisberto "No diminutives" */

/* Gitel "No equivalents" */

/* Gitel "No diminutives" */

/* Gittel "No equivalents" */

/* Gittel "No diminutives" */

/* Giudo "No equivalents" */

/* Giudo "No diminutives" */

local Giuliano `" "Iulianus" "Julen" "Yulian" "Jolyon" "Julian" "Julyan" "Julien" "Giuliano" "Iulian" "Julián" "'
foreach variant of local Giuliano {
	replace ameriname = "Giuliano" if fname == "`variant'"
}

local Giuliano `" "Jools" "Jules" "'
foreach diminutive of local Giuliano {
	replace ameriname = "Giuliano" if fname == "`diminutive'"
}

/* Giuro "No equivalents" */

/* Giuro "No diminutives" */

/* Gius "No equivalents" */

/* Gius "No diminutives" */

local Giuseppa `" "Josipa" "Josefa" "Josepha" "Josée" "Josèphe" "Jozefa" "Giuseppa" "Józefa" "Jožefa" "'
foreach variant of local Giuseppa {
	replace ameriname = "Giuseppa" if fname == "`variant'"
}

local Giuseppa `" "Finka" "Ina" "Jozefina" "Jožica" "Josefine" "Josephine" "Jozefien" "Jo" "Jodene" "Jodi" "Jodie" "Jody" "Joetta" "Joey" "Jojo" "Joleen" "Jolene" "Josephina" "Josie" "Posie" "Posy" "Iina" "Josefiina" "Fifi" "Joséphine" "Josette" "Josiane" "Giosetta" "Giuseppina" "Pina" "Józefina" "Josefina" "Jozefína" "Pepca" "Pepita" "MASCULINE FORMS" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Yosif" "Josep" "Josip" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Josephus" "Jozef" "Sjef" "Zef" "Joe" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Xosé" "Ioseb" "Soso" "Sepp" "Seppel" "Iosif" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Giuseppe" "Peppe" "Peppi" "Peppino" "Pino" "Iosephus" "Jāzeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "'
foreach diminutive of local Giuseppa {
	replace ameriname = "Giuseppa" if fname == "`diminutive'"
}

/* Giuseppantonio "No equivalents" */

/* Giuseppantonio "No diminutives" */

local GIUSEPPE `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local GIUSEPPE {
	replace ameriname = "GIUSEPPE" if fname == "`variant'"
}

local GIUSEPPE `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local GIUSEPPE {
	replace ameriname = "GIUSEPPE" if fname == "`diminutive'"
}

local Giuseppina `" "Josipa" "Jozefina" "Jožica" "Josefa" "Josefine" "Josephine" "Jozefien" "Jodene" "Jodi" "Jodie" "Jody" "Josepha" "Josephina" "Josefiina" "Josée" "Josèphe" "Joséphine" "Jozefa" "Giuseppina" "Józefa" "Józefina" "Josefina" "Jozefína" "Jožefa" "Pepca" "Pepita" "'
foreach variant of local Giuseppina {
	replace ameriname = "Giuseppina" if fname == "`variant'"
}

local Giuseppina `" "Finka" "Ina" "Jo" "Joetta" "Joey" "Jojo" "Joleen" "Jolene" "Josie" "Posie" "Posy" "Iina" "Fifi" "Josette" "Josiane" "Giosetta" "Pina" "MASCULINE FORMS" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Yosif" "Josep" "Josip" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Josephus" "Jozef" "Sjef" "Zef" "Joe" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Xosé" "Ioseb" "Soso" "Sepp" "Seppel" "Iosif" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Giuseppe" "Peppe" "Peppi" "Peppino" "Pino" "Iosephus" "Jāzeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "'
foreach diminutive of local Giuseppina {
	replace ameriname = "Giuseppina" if fname == "`diminutive'"
}

/* Giuseppino "No equivalents" */

/* Giuseppino "No diminutives" */

/* Giuseppo "No equivalents" */

/* Giuseppo "No diminutives" */

/* Giusseppe "No equivalents" */

/* Giusseppe "No diminutives" */

local Giustino `" "Justin" "Giustino" "Iustinus" "Justinas" "Justyn" "Iestyn" "'
foreach variant of local Giustino {
	replace ameriname = "Giustino" if fname == "`variant'"
}

local Giustino `" "Justy" "'
foreach diminutive of local Giustino {
	replace ameriname = "Giustino" if fname == "`diminutive'"
}

/* Giusto "No equivalents" */

/* Giusto "No diminutives" */

/* Gjuro "No equivalents" */

/* Gjuro "No diminutives" */

/* Godel "No equivalents" */

/* Godel "No diminutives" */

local Godfrey `" "Godafrid" "Guðfriðr" "Godfried" "Geffrey" "Geoffrey" "Godfrey" "Jeffery" "Jeffrey" "Jeffry" "Geoffroy" "Godefroy" "Joffrey" "Gottfried" "Gofraidh" "Séafra" "Siothrún" "Goffredo" "Geoffroi" "Gjord" "Gjurd" "Godtfred" "Godofredo" "Goraidh" "Gottfrid" "Sieffre" "'
foreach variant of local Godfrey {
	replace ameriname = "Godfrey" if fname == "`variant'"
}

local Godfrey `" "Geoff" "Jeff" "Jep" "Fredo" "'
foreach diminutive of local Godfrey {
	replace ameriname = "Godfrey" if fname == "`diminutive'"
}

/* Golde "No equivalents" */

/* Golde "No diminutives" */

local Gonzalo `" "Gundisalvus" "Gonçal" "Gonçalo" "'
foreach variant of local Gonzalo {
	replace ameriname = "Gonzalo" if fname == "`variant'"
}

/* Gonzalo "No diminutives" */

/* Gosta "No equivalents" */

/* Gosta "No diminutives" */

local Gottfrid `" "Godafrid" "Guðfriðr" "Godfried" "Geffrey" "Geoffrey" "Godfrey" "Jeffery" "Jeffrey" "Jeffry" "Geoffroy" "Godefroy" "Joffrey" "Gottfried" "Gofraidh" "Séafra" "Siothrún" "Goffredo" "Geoffroi" "Gjord" "Gjurd" "Godtfred" "Godofredo" "Goraidh" "Gottfrid" "Sieffre" "'
foreach variant of local Gottfrid {
	replace ameriname = "Gottfrid" if fname == "`variant'"
}

local Gottfrid `" "Geoff" "Jeff" "Jep" "Fredo" "'
foreach diminutive of local Gottfrid {
	replace ameriname = "Gottfrid" if fname == "`diminutive'"
}

/* Gotthilf "No equivalents" */

/* Gotthilf "No diminutives" */

/* Gppe "No equivalents" */

/* Gppe "No diminutives" */

local Graham `" "Graeme" "Graham" "Grahame" "'
foreach variant of local Graham {
	replace ameriname = "Graham" if fname == "`variant'"
}

/* Graham "No diminutives" */

local Grazia `" "Grace" "Gracelyn" "Gratia" "Grazia" "Gracja" "Graça" "Gracília" "Gracia" "Graciela" "'
foreach variant of local Grazia {
	replace ameriname = "Grazia" if fname == "`variant'"
}

local Grazia `" "Gracie" "'
foreach diminutive of local Grazia {
	replace ameriname = "Grazia" if fname == "`diminutive'"
}

local Graziano `" "Gratianus" "Gratien" "Gratian" "Graziano" "Gracjan" "Graciano" "'
foreach variant of local Graziano {
	replace ameriname = "Graziano" if fname == "`variant'"
}

/* Graziano "No diminutives" */

/* Grazio "No equivalents" */

/* Grazio "No diminutives" */

local Gregor `" "Grigor" "Krikor" "Grgur" "Řehoř" "Gregers" "Gregory" "Grégoire" "Grigol" "Gregor" "Gregorios" "Gergely" "Gréagóir" "Gregorio" "Gregorius" "Grigorijs" "Gligor" "Grigorii" "Grzegorz" "Grigore" "Grigori" "Grigoriy" "Grigory" "Griogair" "Grega" "Greger" "Hryhoriy" "'
foreach variant of local Gregor {
	replace ameriname = "Gregor" if fname == "`variant'"
}

local Gregor `" "Grga" "Greg" "Gregg" "Reijo" "Reko" "Gergő" "Grisha" "Greig" "Goyo" "'
foreach diminutive of local Gregor {
	replace ameriname = "Gregor" if fname == "`diminutive'"
}

local Gregorios `" "Grigor" "Krikor" "Grgur" "Řehoř" "Gregers" "Gregory" "Grégoire" "Grigol" "Gregor" "Gregorios" "Gergely" "Gréagóir" "Gregorio" "Gregorius" "Grigorijs" "Gligor" "Grigorii" "Grzegorz" "Grigore" "Grigori" "Grigoriy" "Grigory" "Griogair" "Grega" "Greger" "Hryhoriy" "'
foreach variant of local Gregorios {
	replace ameriname = "Gregorios" if fname == "`variant'"
}

local Gregorios `" "Grga" "Greg" "Gregg" "Reijo" "Reko" "Gergő" "Grisha" "Greig" "Goyo" "'
foreach diminutive of local Gregorios {
	replace ameriname = "Gregorios" if fname == "`diminutive'"
}

local Griffith `" "Griffin" "Griffith" "Gruffud" "Gruffudd" "Gruffydd" "'
foreach variant of local Griffith {
	replace ameriname = "Griffith" if fname == "`variant'"
}

local Griffith `" "Guto" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Griffith {
	replace ameriname = "Griffith" if fname == "`diminutive'"
}

/* Grigorios "No equivalents" */

/* Grigorios "No diminutives" */

local Grigory `" "Grigor" "Krikor" "Grgur" "Řehoř" "Gregers" "Gregory" "Grégoire" "Grigol" "Gregor" "Gregorios" "Gergely" "Gréagóir" "Gregorio" "Gregorius" "Grigorijs" "Gligor" "Grigorii" "Grzegorz" "Grigore" "Grigori" "Grigoriy" "Grigory" "Griogair" "Grega" "Greger" "Hryhoriy" "'
foreach variant of local Grigory {
	replace ameriname = "Grigory" if fname == "`variant'"
}

local Grigory `" "Grga" "Greg" "Gregg" "Reijo" "Reko" "Gergő" "Grisha" "Greig" "Goyo" "'
foreach diminutive of local Grigory {
	replace ameriname = "Grigory" if fname == "`diminutive'"
}

local Gualtiero `" "Waldhar" "Walter" "Walther" "Valter" "Wolter" "Wouter" "Valtteri" "Gaultier" "Gauthier" "Gautier" "Gualtiero" "Guálter" "Bhaltair" "Bhàtair" "Gualterio" "Gwallter" "'
foreach variant of local Gualtiero {
	replace ameriname = "Gualtiero" if fname == "`variant'"
}

local Gualtiero `" "Wally" "Walt" "Wat" "Wate" "'
foreach diminutive of local Gualtiero {
	replace ameriname = "Gualtiero" if fname == "`diminutive'"
}

/* Guarino "No equivalents" */

/* Guarino "No diminutives" */

local Guerino `" "Warin" "Guerino" "Guarin" "'
foreach variant of local Guerino {
	replace ameriname = "Guerino" if fname == "`variant'"
}

/* Guerino "No diminutives" */

/* Guerrino "No equivalents" */

/* Guerrino "No diminutives" */

/* Gueseppe "No equivalents" */

/* Gueseppe "No diminutives" */

/* Guglielino "No equivalents" */

/* Guglielino "No diminutives" */

local Guilherme `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilém" "Vilhelm" "Wilhelmus" "Willem" "William" "Vilhelmo" "Villem" "Vilhelmi" "Viljami" "Guillaume" "Vilmos" "Vilhjálmur" "Uilliam" "Guglielmo" "Vilhelms" "Wöllem" "Wullem" "Vilhelmas" "Illiam" "Wiremu" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Guilherme {
	replace ameriname = "Guilherme" if fname == "`variant'"
}

local Guilherme `" "Vilko" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Billie" "Billy" "Liam" "Will" "Willie" "Vilĉjo" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Willi" "Uilleag" "Ulick" "Vilis" "Wum" "Wilkin" "Wilky" "Wilmot" "Gwil" "'
foreach diminutive of local Guilherme {
	replace ameriname = "Guilherme" if fname == "`diminutive'"
}

/* Guiliano "No equivalents" */

/* Guiliano "No diminutives" */

local Guillaume `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilém" "Vilhelm" "Wilhelmus" "Willem" "William" "Vilhelmo" "Villem" "Vilhelmi" "Viljami" "Guillaume" "Vilmos" "Vilhjálmur" "Uilliam" "Guglielmo" "Vilhelms" "Wöllem" "Wullem" "Vilhelmas" "Illiam" "Wiremu" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Guillaume {
	replace ameriname = "Guillaume" if fname == "`variant'"
}

local Guillaume `" "Vilko" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Billie" "Billy" "Liam" "Will" "Willie" "Vilĉjo" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Willi" "Uilleag" "Ulick" "Vilis" "Wum" "Wilkin" "Wilky" "Wilmot" "Gwil" "'
foreach diminutive of local Guillaume {
	replace ameriname = "Guillaume" if fname == "`diminutive'"
}

local Guillermo `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilém" "Vilhelm" "Wilhelmus" "Willem" "William" "Vilhelmo" "Villem" "Vilhelmi" "Viljami" "Guillaume" "Vilmos" "Vilhjálmur" "Uilliam" "Guglielmo" "Vilhelms" "Wöllem" "Wullem" "Vilhelmas" "Illiam" "Wiremu" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Guillermo {
	replace ameriname = "Guillermo" if fname == "`variant'"
}

local Guillermo `" "Vilko" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Billie" "Billy" "Liam" "Will" "Willie" "Vilĉjo" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Willi" "Uilleag" "Ulick" "Vilis" "Wum" "Wilkin" "Wilky" "Wilmot" "Gwil" "'
foreach diminutive of local Guillermo {
	replace ameriname = "Guillermo" if fname == "`diminutive'"
}

/* Guis "No equivalents" */

/* Guis "No diminutives" */

/* Guiseppa "No equivalents" */

/* Guiseppa "No diminutives" */

/* Guiseppantonio "No equivalents" */

/* Guiseppantonio "No diminutives" */

/* GUISEPPE "No equivalents" */

/* GUISEPPE "No diminutives" */

/* Guiseppi "No equivalents" */

/* Guiseppi "No diminutives" */

/* Guiseppo "No equivalents" */

/* Guiseppo "No diminutives" */

/* Guisseppe "No equivalents" */

/* Guisseppe "No diminutives" */

/* Guistino "No equivalents" */

/* Guistino "No diminutives" */

/* Guisto "No equivalents" */

/* Guisto "No diminutives" */

/* Gumaro "No equivalents" */

/* Gumaro "No diminutives" */

/* Gunder "No equivalents" */

/* Gunder "No diminutives" */

local Gunther `" "Gundahar" "Gunnarr" "Gunnar" "Günter" "Gunter" "Günther" "Gunther" "'
foreach variant of local Gunther {
	replace ameriname = "Gunther" if fname == "`variant'"
}

/* Gunther "No diminutives" */

/* Gunvald "No equivalents" */

/* Gunvald "No diminutives" */

/* Gust "No equivalents" */

/* Gust "No diminutives" */

local Gustaaf `" "Gautstafr" "Gustav" "Gustaaf" "Kustaa" "Kyösti" "Gustave" "Gustaf" "Gusztáv" "Gustavo" "Gustavs" "Gustaw" "Gösta" "Göstav" "'
foreach variant of local Gustaaf {
	replace ameriname = "Gustaaf" if fname == "`variant'"
}

local Gustaaf `" "Guus" "Kusti" "'
foreach diminutive of local Gustaaf {
	replace ameriname = "Gustaaf" if fname == "`diminutive'"
}

local Gustaw `" "Gautstafr" "Gustav" "Gustaaf" "Kustaa" "Kyösti" "Gustave" "Gustaf" "Gusztáv" "Gustavo" "Gustavs" "Gustaw" "Gösta" "Göstav" "'
foreach variant of local Gustaw {
	replace ameriname = "Gustaw" if fname == "`variant'"
}

local Gustaw `" "Guus" "Kusti" "'
foreach diminutive of local Gustaw {
	replace ameriname = "Gustaw" if fname == "`diminutive'"
}

/* Gustof "No equivalents" */

/* Gustof "No diminutives" */

/* Gustov "No equivalents" */

/* Gustov "No diminutives" */

/* Gusztav "No equivalents" */

/* Gusztav "No diminutives" */

local Guy `" "Wido" "Vid" "Vít" "Guy" "Wide" "Guido" "Veit" "Vida" "Gvidas" "Wit" "'
foreach variant of local Guy {
	replace ameriname = "Guy" if fname == "`variant'"
}

/* Guy "No diminutives" */

/* Gysbert "No equivalents" */

/* Gysbert "No diminutives" */

/* Gysbertus "No equivalents" */

/* Gysbertus "No diminutives" */

local Gyula `" "Gyula" "'
foreach variant of local Gyula {
	replace ameriname = "Gyula" if fname == "`variant'"
}

/* Gyula "No diminutives" */

/* Gyuro "No equivalents" */

/* Gyuro "No diminutives" */

/* H "No equivalents" */

/* H "No diminutives" */

local Haakon `" "Hákon" "Hagen" "Haakon" "Håkon" "'
foreach variant of local Haakon {
	replace ameriname = "Haakon" if fname == "`variant'"
}

/* Haakon "No diminutives" */

local Habib `" "Habib" "'
foreach variant of local Habib {
	replace ameriname = "Habib" if fname == "`variant'"
}

/* Habib "No diminutives" */

local Hagop `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakov" "Jakub" "Jakob" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jákup" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Hagop {
	replace ameriname = "Hagop" if fname == "`variant'"
}

local Hagop `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Jacky" "Japik" "Koba" "Jockel" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Jaša" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Hagop {
	replace ameriname = "Hagop" if fname == "`diminutive'"
}

local Haig `" "Haig" "Haik" "'
foreach variant of local Haig {
	replace ameriname = "Haig" if fname == "`variant'"
}

/* Haig "No diminutives" */

local Haik `" "Haig" "Haik" "'
foreach variant of local Haik {
	replace ameriname = "Haik" if fname == "`variant'"
}

/* Haik "No diminutives" */

/* Hain "No equivalents" */

/* Hain "No diminutives" */

/* Halfdan "No equivalents" */

/* Halfdan "No diminutives" */

/* Halil "No equivalents" */

/* Halil "No diminutives" */

local Halvor `" "Hallvarðr" "Hallvard" "Halvard" "Halvor" "'
foreach variant of local Halvor {
	replace ameriname = "Halvor" if fname == "`variant'"
}

/* Halvor "No diminutives" */

local Hamilton `" "Hamilton" "EQUIVALENTS" "'
foreach variant of local Hamilton {
	replace ameriname = "Hamilton" if fname == "`variant'"
}

/* Hamilton "No diminutives" */

/* Hanislaw "No equivalents" */

/* Hanislaw "No diminutives" */

/* Hanna "No equivalents" */

/* Hanna "No diminutives" */

local Hannes `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Evan" "Ian" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Jani" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giovanni" "Ivano" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Janne" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Hannes {
	replace ameriname = "Hannes" if fname == "`variant'"
}

local Hannes `" "Hank" "Jack" "Jackie" "Jake" "Jussi" "Giannino" "Nino" "Jock" "Jockie" "Jocky" "Seoc" "Hampus" "Hasse" "'
foreach diminutive of local Hannes {
	replace ameriname = "Hannes" if fname == "`diminutive'"
}

/* Haralambos "No equivalents" */

/* Haralambos "No diminutives" */

local Harm `" "Hariman" "Herman" "Hermanus" "Harm" "Mannes" "Hermanni" "Armand" "Hermann" "Ármann" "Armando" "Ermanno" "Maan" "German" "'
foreach variant of local Harm {
	replace ameriname = "Harm" if fname == "`variant'"
}

/* Harm "No diminutives" */

/* Harmen "No equivalents" */

/* Harmen "No diminutives" */

local Harris `" "Harris" "'
foreach variant of local Harris {
	replace ameriname = "Harris" if fname == "`variant'"
}

/* Harris "No diminutives" */

local Harvey `" "Haerviu" "Harvey" "Harvie" "Hervey" "Hervé" "'
foreach variant of local Harvey {
	replace ameriname = "Harvey" if fname == "`variant'"
}

local Harvey `" "Harve" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Harvey {
	replace ameriname = "Harvey" if fname == "`diminutive'"
}

local Haskel `" "Iezekiel" "Yechezkel" "Ezechiel" "Hiezecihel" "Ezekiel" "Hesekiel" "Ezequiel" "Chatzkel" "Haskel" "'
foreach variant of local Haskel {
	replace ameriname = "Haskel" if fname == "`variant'"
}

local Haskel `" "Zeke" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Haskel {
	replace ameriname = "Haskel" if fname == "`diminutive'"
}

local Hassan `" "Hassan" "'
foreach variant of local Hassan {
	replace ameriname = "Hassan" if fname == "`variant'"
}

/* Hassan "No diminutives" */

local Hedwig `" "Hadewig" "Hedvika" "Hedvig" "Hadewych" "Edwige" "Hedwig" "Edvige" "Jadvyga" "Jadwiga" "Hedviga" "'
foreach variant of local Hedwig {
	replace ameriname = "Hedwig" if fname == "`variant'"
}

local Hedwig `" "Hedy" "Edda" "Hedda" "Iga" "Jadzia" "'
foreach diminutive of local Hedwig {
	replace ameriname = "Hedwig" if fname == "`diminutive'"
}

local Heikki `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Hynek" "Jindřich" "Henning" "Heike" "Heiko" "Hein" "Hendrik" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Harry" "Henry" "Harri" "Heikki" "Enzo" "Henri" "Anri" "Heiner" "Heinz" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Rico" "Henrikas" "Herkus" "Hinnerk" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "Kike" "Quique" "'
foreach variant of local Heikki {
	replace ameriname = "Heikki" if fname == "`variant'"
}

/* Heikki "No diminutives" */

local Hein `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Hynek" "Jindřich" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Harry" "Henry" "Hendrik" "Harri" "Heikki" "Henri" "Henrikki" "Enzo" "Anri" "Heiner" "Heinz" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Rico" "Henrikas" "Herkus" "Hinnerk" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "Kike" "Quique" "'
foreach variant of local Hein {
	replace ameriname = "Hein" if fname == "`variant'"
}

/* Hein "No diminutives" */

/* Heinr "No equivalents" */

/* Heinr "No diminutives" */

/* Heinrick "No equivalents" */

/* Heinrick "No diminutives" */

local Heinz `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Hynek" "Jindřich" "Henning" "Heike" "Heiko" "Hein" "Hendrik" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Harry" "Henry" "Harri" "Heikki" "Henri" "Henrikki" "Enzo" "Anri" "Heiner" "Heinz" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Rico" "Henrikas" "Herkus" "Hinnerk" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "Kike" "Quique" "'
foreach variant of local Heinz {
	replace ameriname = "Heinz" if fname == "`variant'"
}

/* Heinz "No diminutives" */

/* Heisch "No equivalents" */

/* Heisch "No diminutives" */

local Helena `" "Helena" "Helene" "Elaine" "Elena" "Jelena" "Elin" "Heleen" "Elaina" "Ellen" "Helen" "Hellen" "Eliina" "Elina" "Heleena" "Hélène" "Elene" "Eleni" "Heléna" "Léan" "Ileana" "Elīna" "Helēna" "Jeļena" "Yelena" "Olena" "Elen" "'
foreach variant of local Helena {
	replace ameriname = "Helena" if fname == "`variant'"
}

local Helena `" "Shelena" "Jela" "Jelica" "Jelka" "Alena" "Lenka" "Eli" "Ella" "Lena" "Lene" "Heleentje" "Elle" "Ellie" "Elly" "Lainey" "Laney" "Nell" "Nelle" "Nellie" "Nelly" "Leena" "Heli" "Leni" "Ilinca" "Lenuța" "Alyona" "Alenka" "Lesya" "'
foreach diminutive of local Helena {
	replace ameriname = "Helena" if fname == "`diminutive'"
}

local Helene `" "Helena" "Helene" "Elaine" "Elena" "Jelena" "Elin" "Heleen" "Elaina" "Ellen" "Helen" "Hellen" "Eliina" "Elina" "Heleena" "Hélène" "Elene" "Eleni" "Heléna" "Léan" "Ileana" "Elīna" "Helēna" "Jeļena" "Yelena" "Olena" "Elen" "'
foreach variant of local Helene {
	replace ameriname = "Helene" if fname == "`variant'"
}

local Helene `" "Shelena" "Jela" "Jelica" "Jelka" "Alena" "Lenka" "Eli" "Ella" "Lena" "Lene" "Heleentje" "Elle" "Ellie" "Elly" "Lainey" "Laney" "Nell" "Nelle" "Nellie" "Nelly" "Leena" "Heli" "Leni" "Ilinca" "Lenuța" "Alyona" "Alenka" "Lesya" "'
foreach diminutive of local Helene {
	replace ameriname = "Helene" if fname == "`diminutive'"
}

local Helge `" "Helgi" "Helge" "Oleg" "'
foreach variant of local Helge {
	replace ameriname = "Helge" if fname == "`variant'"
}

/* Helge "No diminutives" */

/* Hellmuth "No equivalents" */

/* Hellmuth "No diminutives" */

/* Helmer "No equivalents" */

/* Helmer "No diminutives" */

local Helmut `" "Helmut" "'
foreach variant of local Helmut {
	replace ameriname = "Helmut" if fname == "`variant'"
}

/* Helmut "No diminutives" */

local Helmuth `" "Helmut" "'
foreach variant of local Helmuth {
	replace ameriname = "Helmuth" if fname == "`variant'"
}

/* Helmuth "No diminutives" */

/* Henach "No equivalents" */

/* Henach "No diminutives" */

/* Hendrich "No equivalents" */

/* Hendrich "No diminutives" */

/* Hendrick "No equivalents" */

/* Hendrick "No diminutives" */

/* Hendricus "No equivalents" */

/* Hendricus "No diminutives" */

/* Hendrikus "No equivalents" */

/* Hendrikus "No diminutives" */

/* Henech "No equivalents" */

/* Henech "No diminutives" */

/* Henirich "No equivalents" */

/* Henirich "No diminutives" */

local Henning `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Hynek" "Jindřich" "Henning" "Heike" "Heiko" "Hein" "Hendrik" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Harry" "Henry" "Harri" "Heikki" "Henri" "Henrikki" "Enzo" "Anri" "Heiner" "Heinz" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Rico" "Henrikas" "Herkus" "Hinnerk" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "Kike" "Quique" "'
foreach variant of local Henning {
	replace ameriname = "Henning" if fname == "`variant'"
}

/* Henning "No diminutives" */

/* Henoch "No equivalents" */

/* Henoch "No diminutives" */

local Henrich `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinnerk" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Henrich {
	replace ameriname = "Henrich" if fname == "`variant'"
}

local Henrich `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Henrich {
	replace ameriname = "Henrich" if fname == "`diminutive'"
}

/* Henrick "No equivalents" */

/* Henrick "No diminutives" */

local Henrique `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinnerk" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Henrique {
	replace ameriname = "Henrique" if fname == "`variant'"
}

local Henrique `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Henrique {
	replace ameriname = "Henrique" if fname == "`diminutive'"
}

/* Herch "No equivalents" */

/* Herch "No diminutives" */

/* Herm "No equivalents" */

/* Herm "No diminutives" */

local Hermanus `" "Hariman" "Herman" "Hermanus" "Hermanni" "Armand" "Hermann" "Ármann" "Armando" "Ermanno" "German" "'
foreach variant of local Hermanus {
	replace ameriname = "Hermanus" if fname == "`variant'"
}

local Hermanus `" "Harm" "Mannes" "Maan" "'
foreach diminutive of local Hermanus {
	replace ameriname = "Hermanus" if fname == "`diminutive'"
}

/* Herold "No equivalents" */

/* Herold "No diminutives" */

/* Herrmann "No equivalents" */

/* Herrmann "No diminutives" */

local Hersh `" "Hersh" "Hirsh" "'
foreach variant of local Hersh {
	replace ameriname = "Hersh" if fname == "`variant'"
}

local Hersh `" "Herschel" "Hershel" "Heshel" "'
foreach diminutive of local Hersh {
	replace ameriname = "Hersh" if fname == "`diminutive'"
}

local Hershel `" "Herschel" "Hershel" "Heshel" "'
foreach variant of local Hershel {
	replace ameriname = "Hershel" if fname == "`variant'"
}

/* Hershel "No diminutives" */

/* Hersz "No equivalents" */

/* Hersz "No diminutives" */

/* Herszel "No equivalents" */

/* Herszel "No diminutives" */

/* Herz "No equivalents" */

/* Herz "No diminutives" */

/* Herzel "No equivalents" */

/* Herzel "No diminutives" */

/* Hessel "No equivalents" */

/* Hessel "No diminutives" */

/* Hilding "No equivalents" */

/* Hilding "No diminutives" */

/* Hilel "No equivalents" */

/* Hilel "No diminutives" */

local Hillel `" "Hillel" "'
foreach variant of local Hillel {
	replace ameriname = "Hillel" if fname == "`variant'"
}

/* Hillel "No diminutives" */

/* Hilmar "No equivalents" */

/* Hilmar "No diminutives" */

/* Hilmer "No equivalents" */

/* Hilmer "No diminutives" */

/* Hilton "No equivalents" */

/* Hilton "No diminutives" */

/* Hinde "No equivalents" */

/* Hinde "No diminutives" */

local Hinrich `" "Heimirich" "Heinrich" "Henricus" "Henrik" "Endika" "Enric" "Jindřich" "Hendrik" "Harry" "Henry" "Harri" "Henri" "Henrikki" "Anri" "Hinrik" "Anraí" "Einrí" "Arrigo" "Enrico" "Henrikas" "Hinnerk" "Hinrich" "Herry" "Henryk" "Henrique" "Eanraig" "Hendry" "Henrich" "Enrique" "'
foreach variant of local Hinrich {
	replace ameriname = "Hinrich" if fname == "`variant'"
}

local Hinrich `" "Hynek" "Henning" "Heike" "Heiko" "Hein" "Henk" "Hennie" "Henny" "Rik" "Hal" "Hank" "Heikki" "Enzo" "Heiner" "Heinz" "Rico" "Herkus" "Kike" "Quique" "'
foreach diminutive of local Hinrich {
	replace ameriname = "Hinrich" if fname == "`diminutive'"
}

/* Hirsche "No equivalents" */

/* Hirsche "No diminutives" */

/* Hirschel "No equivalents" */

/* Hirschel "No diminutives" */

local Hirsh `" "Hersh" "Hirsh" "'
foreach variant of local Hirsh {
	replace ameriname = "Hirsh" if fname == "`variant'"
}

local Hirsh `" "Herschel" "Hershel" "Heshel" "'
foreach diminutive of local Hirsh {
	replace ameriname = "Hirsh" if fname == "`diminutive'"
}

/* Hirsz "No equivalents" */

/* Hirsz "No diminutives" */

local Holger `" "Hólmgeirr" "Holger" "'
foreach variant of local Holger {
	replace ameriname = "Holger" if fname == "`variant'"
}

/* Holger "No diminutives" */

/* Honore "No equivalents" */

/* Honore "No diminutives" */

local Horacio `" "Horatius" "Horace" "Horatio" "Orazio" "Horácio" "Horațiu" "Horacio" "'
foreach variant of local Horacio {
	replace ameriname = "Horacio" if fname == "`variant'"
}

/* Horacio "No diminutives" */

/* Horst "No equivalents" */

/* Horst "No diminutives" */

local Howard `" "Howard" "'
foreach variant of local Howard {
	replace ameriname = "Howard" if fname == "`variant'"
}

local Howard `" "Howie" "'
foreach diminutive of local Howard {
	replace ameriname = "Howard" if fname == "`diminutive'"
}

/* Hristos "No equivalents" */

/* Hristos "No diminutives" */

/* Hryc "No equivalents" */

/* Hryc "No diminutives" */

/* Humberto "No equivalents" */

/* Humberto "No diminutives" */

/* Hzik "No equivalents" */

/* Hzik "No diminutives" */

local Ibrahim `" "Ebrahim" "Ibraheem" "Ibrahim" "Abraam" "Avraham" "Abraham" "Ibragim" "Aabraham" "Abram" "Ábrahám" "Abramo" "Avraamu" "Abraão" "İbrahim" "Ibrahima" "'
foreach variant of local Ibrahim {
	replace ameriname = "Ibrahim" if fname == "`variant'"
}

local Ibrahim `" "Ibro" "Braam" "Bram" "Abe" "Aapo" "Avi" "'
foreach diminutive of local Ibrahim {
	replace ameriname = "Ibrahim" if fname == "`diminutive'"
}

/* Icek "No equivalents" */

/* Icek "No diminutives" */

/* Ichiel "No equivalents" */

/* Ichiel "No diminutives" */

/* Icko "No equivalents" */

/* Icko "No diminutives" */

/* Icze "No equivalents" */

/* Icze "No diminutives" */

local Ida `" "Ida" "Idella" "Idelle" "Iida" "'
foreach variant of local Ida {
	replace ameriname = "Ida" if fname == "`variant'"
}

/* Ida "No diminutives" */

/* Igino "No equivalents" */

/* Igino "No diminutives" */

local Ignac `" "Egnatius" "Iñaki" "Ignasi" "Ignác" "Ignaas" "Ignace" "Ignatz" "Ignazio" "Ignatius" "Ignas" "Ignacy" "Inácio" "Ignatiy" "Ignac" "Ignacij" "Nace" "Ignacio" "'
foreach variant of local Ignac {
	replace ameriname = "Ignac" if fname == "`variant'"
}

local Ignac `" "Iggy" "Nacho" "Nacio" "'
foreach diminutive of local Ignac {
	replace ameriname = "Ignac" if fname == "`diminutive'"
}

local Ignacio `" "Egnatius" "Iñaki" "Ignasi" "Ignác" "Ignaas" "Ignace" "Ignatz" "Ignazio" "Ignatius" "Ignas" "Ignacy" "Inácio" "Ignatiy" "Ignac" "Ignacij" "Nace" "Ignacio" "'
foreach variant of local Ignacio {
	replace ameriname = "Ignacio" if fname == "`variant'"
}

local Ignacio `" "Iggy" "Nacho" "Nacio" "'
foreach diminutive of local Ignacio {
	replace ameriname = "Ignacio" if fname == "`diminutive'"
}

local Ignacy `" "Egnatius" "Iñaki" "Ignasi" "Ignác" "Ignaas" "Ignace" "Ignatz" "Ignazio" "Ignatius" "Ignas" "Ignacy" "Inácio" "Ignatiy" "Ignac" "Ignacij" "Nace" "Ignacio" "'
foreach variant of local Ignacy {
	replace ameriname = "Ignacy" if fname == "`variant'"
}

local Ignacy `" "Iggy" "Nacho" "Nacio" "'
foreach diminutive of local Ignacy {
	replace ameriname = "Ignacy" if fname == "`diminutive'"
}

/* Ignacz "No equivalents" */

/* Ignacz "No diminutives" */

/* Ignasio "No equivalents" */

/* Ignasio "No diminutives" */

local Ignatz `" "Egnatius" "Iñaki" "Ignasi" "Ignác" "Ignaas" "Ignace" "Ignatz" "Ignazio" "Ignatius" "Ignas" "Ignacy" "Inácio" "Ignatiy" "Ignac" "Ignacij" "Nace" "Ignacio" "'
foreach variant of local Ignatz {
	replace ameriname = "Ignatz" if fname == "`variant'"
}

local Ignatz `" "Iggy" "Nacho" "Nacio" "'
foreach diminutive of local Ignatz {
	replace ameriname = "Ignatz" if fname == "`diminutive'"
}

/* Ignaz "No equivalents" */

/* Ignaz "No diminutives" */

local Ike `" "Sahak" "Isaak" "Yitzhak" "Isaac" "Isak" "Izaäk" "Sjaak" "Ike" "Iikka" "Iiro" "Iisakki" "Itzhak" "Izsák" "Isaaku" "Izaak" "Sekel" "'
foreach variant of local Ike {
	replace ameriname = "Ike" if fname == "`variant'"
}

local Ike `" "Sjakie" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Ike {
	replace ameriname = "Ike" if fname == "`diminutive'"
}

local Ilario `" "Hilarius" "Hilary" "Hillar" "Ilari" "Hilaire" "Ilario" "Ealair" "Ellar" "Ilar" "'
foreach variant of local Ilario {
	replace ameriname = "Ilario" if fname == "`variant'"
}

local Ilario `" "Lari" "'
foreach diminutive of local Ilario {
	replace ameriname = "Ilario" if fname == "`diminutive'"
}

local Ilia `" "Ilyas" "Elias" "Eliou" "Eliyyahu" "Helias" "Elijah" "Ilia" "Ilija" "Iliya" "Elia" "Elian" "Eelis" "Eljas" "Élie" "Ilias" "Eliyahu" "Éliás" "Illés" "Elías" "Elis" "Eliasz" "Ilie" "Ilya" "İlyas" "'
foreach variant of local Ilia {
	replace ameriname = "Ilia" if fname == "`variant'"
}

local Ilia `" "Ile" "'
foreach diminutive of local Ilia {
	replace ameriname = "Ilia" if fname == "`diminutive'"
}

local Ilias `" "Ilyas" "Elias" "Eliou" "Eliyyahu" "Helias" "Elijah" "Ilia" "Ilija" "Iliya" "Elia" "Elian" "Eelis" "Eljas" "Élie" "Ilias" "Eliyahu" "Éliás" "Illés" "Elías" "Elis" "Eliasz" "Ilie" "Ilya" "İlyas" "'
foreach variant of local Ilias {
	replace ameriname = "Ilias" if fname == "`variant'"
}

local Ilias `" "Ile" "'
foreach diminutive of local Ilias {
	replace ameriname = "Ilias" if fname == "`diminutive'"
}

local Ilie `" "Ilyas" "Elias" "Eliou" "Eliyyahu" "Helias" "Elijah" "Ilia" "Ilija" "Iliya" "Elia" "Elian" "Eelis" "Eljas" "Élie" "Ilias" "Eliyahu" "Éliás" "Illés" "Elías" "Elis" "Eliasz" "Ilie" "Ilya" "İlyas" "'
foreach variant of local Ilie {
	replace ameriname = "Ilie" if fname == "`variant'"
}

local Ilie `" "Ile" "'
foreach diminutive of local Ilie {
	replace ameriname = "Ilie" if fname == "`diminutive'"
}

local Ilija `" "Ilyas" "Elias" "Eliou" "Eliyyahu" "Helias" "Elijah" "Ilia" "Ilija" "Iliya" "Elia" "Elian" "Eelis" "Eljas" "Élie" "Ilias" "Eliyahu" "Éliás" "Illés" "Elías" "Elis" "Eliasz" "Ilie" "Ilya" "İlyas" "'
foreach variant of local Ilija {
	replace ameriname = "Ilija" if fname == "`variant'"
}

local Ilija `" "Ile" "'
foreach diminutive of local Ilija {
	replace ameriname = "Ilija" if fname == "`diminutive'"
}

/* Ilja "No equivalents" */

/* Ilja "No diminutives" */

/* Ilko "No equivalents" */

/* Ilko "No diminutives" */

local Ilya `" "Ilyas" "Elias" "Eliou" "Eliyyahu" "Helias" "Elijah" "Ilia" "Ilija" "Iliya" "Elia" "Elian" "Eelis" "Eljas" "Élie" "Ilias" "Eliyahu" "Éliás" "Illés" "Elías" "Elis" "Eliasz" "Ilie" "Ilya" "İlyas" "'
foreach variant of local Ilya {
	replace ameriname = "Ilya" if fname == "`variant'"
}

local Ilya `" "Ile" "'
foreach diminutive of local Ilya {
	replace ameriname = "Ilya" if fname == "`diminutive'"
}

local Imre `" "Emmerich" "Amery" "Emery" "Emory" "Émeric" "Imre" "Amerigo" "Américo" "Imrich" "'
foreach variant of local Imre {
	replace ameriname = "Imre" if fname == "`variant'"
}

local Imre `" "Imrus" "'
foreach diminutive of local Imre {
	replace ameriname = "Imre" if fname == "`diminutive'"
}

/* Infant "No equivalents" */

/* Infant "No diminutives" */

local Ingolf `" "Ingulf" "Ingólfr" "Ingolf" "'
foreach variant of local Ingolf {
	replace ameriname = "Ingolf" if fname == "`variant'"
}

local Ingolf `" "Ingo" "Ingi" "Inge" "'
foreach diminutive of local Ingolf {
	replace ameriname = "Ingolf" if fname == "`diminutive'"
}

/* Ingvald "No equivalents" */

/* Ingvald "No diminutives" */

local Ingvar `" "Yngvarr" "Ihar" "Igor" "Ingvar" "Yngvar" "Ihor" "'
foreach variant of local Ingvar {
	replace ameriname = "Ingvar" if fname == "`variant'"
}

/* Ingvar "No diminutives" */

local Innocenzo `" "Innocent" "Innocenzo" "Innocentius" "Innokenti" "Innokentiy" "Innokenty" "Inocencio" "'
foreach variant of local Innocenzo {
	replace ameriname = "Innocenzo" if fname == "`variant'"
}

local Innocenzo `" "Kesha" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Innocenzo {
	replace ameriname = "Innocenzo" if fname == "`diminutive'"
}

local Ioannis `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Ioannis {
	replace ameriname = "Ioannis" if fname == "`variant'"
}

local Ioannis `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Ioannis {
	replace ameriname = "Ioannis" if fname == "`diminutive'"
}

local Ippolito `" "Hippolytos" "Hippolyte" "Ippolito" "Hipolit" "Hipólito" "Ippolit" "'
foreach variant of local Ippolito {
	replace ameriname = "Ippolito" if fname == "`variant'"
}

/* Ippolito "No diminutives" */

/* Ira "No equivalents" */

/* Ira "No diminutives" */

local Irma `" "Emma" "Ima" "Irma" "Ema" "Emmalyn" "Erma" "'
foreach variant of local Irma {
	replace ameriname = "Irma" if fname == "`variant'"
}

local Irma `" "Emmy" "Em" "Emmie" "Emmi" "Irmuska" "'
foreach diminutive of local Irma {
	replace ameriname = "Irma" if fname == "`diminutive'"
}

local Irvine `" "Irvin" "Irvine" "Irving" "'
foreach variant of local Irvine {
	replace ameriname = "Irvine" if fname == "`variant'"
}

/* Irvine "No diminutives" */

local Irving `" "Irvin" "Irvine" "Irving" "'
foreach variant of local Irving {
	replace ameriname = "Irving" if fname == "`variant'"
}

/* Irving "No diminutives" */

/* Isac "No equivalents" */

/* Isac "No diminutives" */

/* Isack "No equivalents" */

/* Isack "No diminutives" */

local Isaia `" "Esaias" "Yesha'yahu" "Isaiah" "Isaias" "Isiah" "Esa" "Ikaia" "Isaia" "Isaija" "Isay" "'
foreach variant of local Isaia {
	replace ameriname = "Isaia" if fname == "`variant'"
}

/* Isaia "No diminutives" */

local Iser `" "Israel" "Yisra'el" "Israhel" "Iser" "Issur" "Sroel" "'
foreach variant of local Iser {
	replace ameriname = "Iser" if fname == "`variant'"
}

local Iser `" "Issy" "'
foreach diminutive of local Iser {
	replace ameriname = "Iser" if fname == "`diminutive'"
}

local Isidore `" "Isidoros" "Isador" "Isadore" "Isidore" "Isidor" "Isidoro" "Isidorus" "Izydor" "Izidor" "Isidro" "'
foreach variant of local Isidore {
	replace ameriname = "Isidore" if fname == "`variant'"
}

local Isidore `" "Issy" "Izzy" "'
foreach diminutive of local Isidore {
	replace ameriname = "Isidore" if fname == "`diminutive'"
}

local Isidoro `" "Isidoros" "Isador" "Isadore" "Isidore" "Isidor" "Isidoro" "Isidorus" "Izydor" "Izidor" "Isidro" "'
foreach variant of local Isidoro {
	replace ameriname = "Isidoro" if fname == "`variant'"
}

local Isidoro `" "Issy" "Izzy" "'
foreach diminutive of local Isidoro {
	replace ameriname = "Isidoro" if fname == "`diminutive'"
}

local Ismael `" "Esmail" "Isma'il" "Ismail" "Ismael" "Yishma'el" "Ismahel" "Ishmael" "Ismo" "İsmail" "'
foreach variant of local Ismael {
	replace ameriname = "Ismael" if fname == "`variant'"
}

/* Ismael "No diminutives" */

/* Israil "No equivalents" */

/* Israil "No diminutives" */

/* Isreal "No equivalents" */

/* Isreal "No diminutives" */

local Issa `" "Yeshua" "Essa" "Isa" "Issa" "Yushua" "Josu" "Iesous" "Yehoshua" "Iesus" "Iosue" "Jesus" "Joshua" "Jozua" "Josué" "Xesús" "Iokua" "Józsua" "Giosuè" "Jesús" "İsa" "'
foreach variant of local Issa {
	replace ameriname = "Issa" if fname == "`variant'"
}

local Issa `" "Josh" "Chucho" "Chus" "Chuy" "'
foreach diminutive of local Issa {
	replace ameriname = "Issa" if fname == "`diminutive'"
}

/* Issaak "No equivalents" */

/* Issaak "No diminutives" */

local Issac `" "Sahak" "Isaak" "Yitzhak" "Isaac" "Isak" "Izaäk" "Issac" "Iisakki" "Itzhak" "Izsák" "Isaaku" "Izaak" "'
foreach variant of local Issac {
	replace ameriname = "Issac" if fname == "`variant'"
}

local Issac `" "Sjaak" "Sjakie" "Ike" "Iikka" "Iiro" "'
foreach diminutive of local Issac {
	replace ameriname = "Issac" if fname == "`diminutive'"
}

/* Issak "No equivalents" */

/* Issak "No diminutives" */

/* Isser "No equivalents" */

/* Isser "No diminutives" */

/* Itchok "No equivalents" */

/* Itchok "No diminutives" */

/* Ite "No equivalents" */

/* Ite "No diminutives" */

/* Itic "No equivalents" */

/* Itic "No diminutives" */

/* Itsik "No equivalents" */

/* Itsik "No diminutives" */

/* Itzak "No equivalents" */

/* Itzak "No diminutives" */

/* Itzchok "No equivalents" */

/* Itzchok "No diminutives" */

/* Itze "No equivalents" */

/* Itze "No diminutives" */

/* Itzek "No equivalents" */

/* Itzek "No diminutives" */

local Itzel `" "Ixchel" "'
foreach variant of local Itzel {
	replace ameriname = "Itzel" if fname == "`variant'"
}

/* Itzel "No diminutives" */

/* Itzka "No equivalents" */

/* Itzka "No diminutives" */

/* Itzke "No equivalents" */

/* Itzke "No diminutives" */

/* Itzko "No equivalents" */

/* Itzko "No diminutives" */

/* Itzok "No equivalents" */

/* Itzok "No diminutives" */

/* Ive "No equivalents" */

/* Ive "No diminutives" */

/* Iven "No equivalents" */

/* Iven "No diminutives" */

/* Iver "No equivalents" */

/* Iver "No diminutives" */

/* Ivo "No equivalents" */

/* Ivo "No diminutives" */

local Ivor `" "Ívarr" "Ivar" "Ivor" "Evander" "Íomhar" "Iomhar" "'
foreach variant of local Ivor {
	replace ameriname = "Ivor" if fname == "`variant'"
}

/* Ivor "No diminutives" */

local Izaak `" "Sahak" "Isaak" "Yitzhak" "Isaac" "Isak" "Izaäk" "Issac" "Iisakki" "Itzhak" "Izsák" "Isaaku" "Izaak" "'
foreach variant of local Izaak {
	replace ameriname = "Izaak" if fname == "`variant'"
}

local Izaak `" "Sjaak" "Sjakie" "Ike" "Iikka" "Iiro" "'
foreach diminutive of local Izaak {
	replace ameriname = "Izaak" if fname == "`diminutive'"
}

/* Izak "No equivalents" */

/* Izak "No diminutives" */

/* Izchok "No equivalents" */

/* Izchok "No diminutives" */

/* Ize "No equivalents" */

/* Ize "No diminutives" */

/* Izek "No equivalents" */

/* Izek "No diminutives" */

local Izidor `" "Isidoros" "Isador" "Isadore" "Isidore" "Isidor" "Isidoro" "Isidorus" "Izydor" "Izidor" "Isidro" "'
foreach variant of local Izidor {
	replace ameriname = "Izidor" if fname == "`variant'"
}

local Izidor `" "Issy" "Izzy" "'
foreach diminutive of local Izidor {
	replace ameriname = "Izidor" if fname == "`diminutive'"
}

/* Izik "No equivalents" */

/* Izik "No diminutives" */

/* Izrael "No equivalents" */

/* Izrael "No diminutives" */

/* J "No equivalents" */

/* J "No diminutives" */

local Jaakko `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jaumet" "Jago" "Jakov" "Jakša" "Jakub" "Ib" "Jakob" "Jeppe" "Cobus" "Coos" "Jaap" "Jacobus" "Kobe" "Kobus" "Koos" "Sjaak" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jaycob" "Jaymes" "Jeb" "Jem" "Jemmy" "Jim" "Koby" "Jaagup" "Jaak" "Jaakob" "Jákup" "Jaakko" "Jacky" "Jacques" "Japik" "Iago" "Iakob" "Koba" "Jockel" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Lapo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Kuba" "Jacó" "Jaime" "Yasha" "Jamie" "Seumas" "Jaka" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "Kapel" "Koppel" "Yankel" "'
foreach variant of local Jaakko {
	replace ameriname = "Jaakko" if fname == "`variant'"
}

local Jaakko `" "Jimi" "Jimmie" "Jimmy" "Jaska" "'
foreach diminutive of local Jaakko {
	replace ameriname = "Jaakko" if fname == "`diminutive'"
}

/* Jacintho "No equivalents" */

/* Jacintho "No diminutives" */

local Jacinto `" "Hyacinthus" "Hyakinthos" "Hyacinthe" "Hyacinth" "Giacinto" "Jacenty" "Jacinto" "'
foreach variant of local Jacinto {
	replace ameriname = "Jacinto" if fname == "`variant'"
}

local Jacinto `" "Jacek" "'
foreach diminutive of local Jacinto {
	replace ameriname = "Jacinto" if fname == "`diminutive'"
}

local JACOB `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakov" "Jakub" "Jakob" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jákup" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local JACOB {
	replace ameriname = "JACOB" if fname == "`variant'"
}

local JACOB `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Jacky" "Japik" "Koba" "Jockel" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Jaša" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local JACOB {
	replace ameriname = "JACOB" if fname == "`diminutive'"
}

/* Jacov "No equivalents" */

/* Jacov "No diminutives" */

/* Jacow "No equivalents" */

/* Jacow "No diminutives" */

/* Jaime "No equivalents" */

/* Jaime "No diminutives" */

local Jakab `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakov" "Jakub" "Jakob" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jákup" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Jakab {
	replace ameriname = "Jakab" if fname == "`variant'"
}

local Jakab `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Jacky" "Japik" "Koba" "Jockel" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Jaša" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Jakab {
	replace ameriname = "Jakab" if fname == "`diminutive'"
}

local Jake `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yakub" "Yaqoob" "Yaqub" "Yuhanna" "Hagop" "Hakob" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jakes" "Jon" "Ivan" "Yan" "Iakobos" "Ioannes" "Yaakov" "Yehochanan" "Yochanan" "Iacobus" "Iohannes" "Jacob" "James" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yakov" "Yanko" "Yoan" "Jan" "Jaume" "Jaumet" "Joan" "Jago" "Jowan" "Ghjuvan" "Ivica" "Jakov" "Jakša" "Janko" "Vanja" "Honza" "Jakub" "Janek" "Hans" "Ib" "Jakob" "Jannick" "Jannik" "Jens" "Jeppe" "Johan" "Johannes" "Cobus" "Coos" "Hanke" "Hanne" "Hannes" "Jaap" "Jacobus" "Jo" "Joop" "Kobe" "Kobus" "Koos" "Sjaak" "Sjakie" "Coby" "Hank" "Jack" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Koby" "Joĉjo" "Johano" "Jaagup" "Jaak" "Jaakob" "Jaan" "Juhan" "Jákup" "Jóannes" "Hannu" "Jaakko" "Jaakoppi" "Jani" "Janne" "Joni" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jacky" "Jacques" "Jean" "Jeannot" "Japik" "Iago" "Xoán" "Iakob" "Ioane" "Ivane" "Koba" "Vano" "Jockel" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Iakopa" "Keoni" "Kimo" "Akiba" "Akiva" "Iván" "Jakab" "Jákob" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Séamas" "Séamus" "Seán" "Sean" "Shamus" "Shane" "Sheamus" "Giacobbe" "Giacomo" "Gian" "Giannino" "Giovanni" "Iacopo" "Ivano" "Jacopo" "Lapo" "Vanni" "Iacomus" "Joannes" "Jānis" "Sjang" "Sjeng" "Jokūbas" "Jonas" "Jovan" "Ean" "Juan" "Hemi" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Iakovu" "Ioannu" "Iwan" "Janusz" "Kuba" "Jacó" "Jaime" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Yasha" "Juhán" "Iain" "Ian" "Jamie" "Jock" "Seoc" "Seumas" "Ján" "Anže" "Jaka" "Janez" "Jaša" "Žan" "Jacobo" "Juanito" "Xuan" "Yago" "Hampus" "Hasse" "Yakup" "Yakiv" "Evan" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "Kapel" "Koppel" "Yankel" "'
foreach variant of local Jake {
	replace ameriname = "Jake" if fname == "`variant'"
}

local Jake `" "Jackie" "Jimi" "Jimmie" "Jimmy" "Jaska" "Nino" "Jockie" "Jocky" "'
foreach diminutive of local Jake {
	replace ameriname = "Jake" if fname == "`diminutive'"
}

local Jakov `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakov" "Jakub" "Jakob" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jákup" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Jakov {
	replace ameriname = "Jakov" if fname == "`variant'"
}

local Jakov `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Jacky" "Japik" "Koba" "Jockel" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Jaša" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Jakov {
	replace ameriname = "Jakov" if fname == "`diminutive'"
}

/* Jakow "No equivalents" */

/* Jakow "No diminutives" */

local Jakub `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakov" "Jakub" "Jakob" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jákup" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Jakub {
	replace ameriname = "Jakub" if fname == "`variant'"
}

local Jakub `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Jacky" "Japik" "Koba" "Jockel" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Jaša" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Jakub {
	replace ameriname = "Jakub" if fname == "`diminutive'"
}

local JAMES `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakov" "Jakub" "Jakob" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jákup" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local JAMES {
	replace ameriname = "JAMES" if fname == "`variant'"
}

local JAMES `" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Jacky" "Japik" "Koba" "Jockel" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Jaša" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local JAMES {
	replace ameriname = "JAMES" if fname == "`diminutive'"
}

local Jamie `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Zhaklina" "Jaume" "Jaumet" "Jago" "Jakov" "Jakša" "Žaklina" "Jakub" "Bine" "Ib" "Jacobine" "Jakob" "Jeppe" "Coba" "Cobus" "Coos" "Jaap" "Jacoba" "Jacobina" "Jacobus" "Jacomina" "Kobe" "Kobus" "Koos" "Mina" "Sjaak" "Sjakie" "Jacquetta" "Jacqui" "Jaci" "Jacki" "Jackie" "Jaime" "Jaimie" "Jaki" "Jakki" "Jami" "Jamie" "Jaye" "Jayla" "Jaylen" "Jaylene" "Jaylin" "Jaylyn" "Jayma" "Jayme" "Jaagup" "Jaak" "Jaakob" "Jákup" "Jaakko" "Jaakoppi" "Jacky" "Jacqueline" "Jacques" "Jacquette" "Japik" "Iago" "Iakob" "Koba" "Jockel" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacoma" "Giacomina" "Giacomo" "Iacopo" "Jacopo" "Lapo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Kuba" "Żaklina" "Jaqueline" "Jacó" "Yasha" "Jaka" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "Kapel" "Koppel" "Yankel" "'
foreach variant of local Jamie {
	replace ameriname = "Jamie" if fname == "`variant'"
}

local Jamie `" "Jaska" "MASCULINE FORMS" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jaumet" "Jago" "Jakov" "Jakša" "Jakub" "Ib" "Jakob" "Jeppe" "Cobus" "Coos" "Jaap" "Jacobus" "Kobe" "Kobus" "Koos" "Sjaak" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jaycob" "Jaymes" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaagup" "Jaak" "Jaakob" "Jákup" "Jaakko" "Jaakoppi" "Jacky" "Jacques" "Japik" "Iago" "Iakob" "Koba" "Jockel" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Lapo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Kuba" "Jacó" "Jaime" "Yasha" "Seumas" "Jaka" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Jamie {
	replace ameriname = "Jamie" if fname == "`diminutive'"
}

local Jamil `" "Gamil" "Jameel" "Jamil" "Cemil" "'
foreach variant of local Jamil {
	replace ameriname = "Jamil" if fname == "`variant'"
}

/* Jamil "No diminutives" */

/* JAN "No equivalents" */

/* JAN "No diminutives" */

/* Janas "No equivalents" */

/* Janas "No diminutives" */

/* Jancu "No equivalents" */

/* Jancu "No diminutives" */

local Jane `" "Lashawn" "Tajuana" "Jone" "Ioanna" "Iohanna" "Joanna" "Ioana" "Ivana" "Yana" "Yanka" "Yoana" "Jana" "Joana" "Johana" "Johanna" "Johanne" "Janna" "Jane" "Janessa" "Janice" "Janis" "Jayna" "Jayne" "Jean" "Jeana" "Jeane" "Jeanna" "Jeanne" "Joan" "Joann" "Joanne" "Johna" "Johnna" "Jonelle" "Seanna" "Shauna" "Shavonne" "Shawna" "Sheena" "Sheenagh" "Shena" "Shevaun" "Shevon" "Janina" "Xoana" "Gianna" "Yanna" "Jóhanna" "Jóna" "Chevonne" "Síne" "Siobhán" "Giovanna" "Jovana" "Jehanne" "Ivanna" "Zhanna" "Seona" "Seonag" "Sìne" "Juana" "Shan" "Siân" "Siwan" "'
foreach variant of local Jane {
	replace ameriname = "Jane" if fname == "`variant'"
}

local Jane `" "Ivanka" "Nina" "Žana" "Iva" "Ivka" "Janička" "Hanna" "Hanne" "Janne" "Jannicke" "Jannike" "Jeanette" "Jonna" "Vanja" "Hannie" "Janine" "Janneke" "Jantine" "Jantje" "Jeanine" "Jeannette" "Jennigje" "Jenny" "Johanneke" "Genette" "Jan" "Janae" "Janeka" "Janel" "Janele" "Janella" "Janelle" "Janene" "Janet" "Janetta" "Janette" "Janey" "Janie" "Janna" "Jannah" "Jannette" "Jannine" "Jaynie" "Jeanie" "Jeannie" "Jeannine" "Jeni" "Jenna" "Jenni" "Jennie" "Jessalyn" "Jessi" "Jessie" "Jessye" "Jo" "Joanie" "Joetta" "Joey" "Jojo" "Joleen" "Jolene" "Jonette" "Joni" "Jonie" "Nena" "Netta" "Nettie" "Hannele" "Ninette" "Nana" "Zsanett" "Sinéad" "Gia" "Gianna" "Giannina" "Giovannetta" "Vanna" "Jovanka" "Jovka" "Vana" "Asia" "Joasia" "Joaninha" "Ionela" "Oana" "Zhannochka" "Seònaid" "Sheona" "Shona" "Sìneag" "Teasag" "Janka" "Juanita" "Siana" "Siani" "Sioned" "MASCULINE FORMS" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hannes" "Joop" "Evan" "Hank" "Ian" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giannino" "Giovanni" "Ivano" "Nino" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Jock" "Jockie" "Jocky" "Seoc" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Hampus" "Hasse" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach diminutive of local Jane {
	replace ameriname = "Jane" if fname == "`diminutive'"
}

/* Janen "No equivalents" */

/* Janen "No diminutives" */

/* Janes "No equivalents" */

/* Janes "No diminutives" */

local Janez `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Žan" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Janez {
	replace ameriname = "Janez" if fname == "`variant'"
}

local Janez `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Janez {
	replace ameriname = "Janez" if fname == "`diminutive'"
}

/* Janhel "No equivalents" */

/* Janhel "No diminutives" */

/* Jankal "No equivalents" */

/* Jankal "No diminutives" */

/* Janke "No equivalents" */

/* Janke "No diminutives" */

/* Jankew "No equivalents" */

/* Jankew "No diminutives" */

local Janko `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Evan" "Ian" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Janne" "Joni" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giovanni" "Ivano" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Žan" "Juanito" "Xuan" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Janko {
	replace ameriname = "Janko" if fname == "`variant'"
}

local Janko `" "Hank" "Jack" "Jackie" "Jake" "Giannino" "Nino" "Jock" "Jockie" "Jocky" "Seoc" "Hampus" "Hasse" "'
foreach diminutive of local Janko {
	replace ameriname = "Janko" if fname == "`diminutive'"
}

/* Janne "No equivalents" */

/* Janne "No diminutives" */

/* Jano "No equivalents" */

/* Jano "No diminutives" */

/* Jans "No equivalents" */

/* Jans "No diminutives" */

local Jantje `" "Lashawn" "Tajuana" "Jone" "Ioanna" "Iohanna" "Joanna" "Ioana" "Ivana" "Ivanka" "Yana" "Yanka" "Yoana" "Jana" "Joana" "Žana" "Iva" "Janička" "Johana" "Hanna" "Hanne" "Janne" "Jeanette" "Johanna" "Johanne" "Jonna" "Vanja" "Hannie" "Janine" "Janneke" "Jantine" "Jantje" "Jeanine" "Jeannette" "Jennigje" "Jenny" "Johanneke" "Genette" "Janae" "Jane" "Janeka" "Janel" "Janele" "Janella" "Janelle" "Janene" "Janessa" "Janet" "Janetta" "Janette" "Janey" "Janice" "Janie" "Janis" "Jannette" "Jannine" "Jayna" "Jayne" "Jaynie" "Jean" "Jeana" "Jeane" "Jeanie" "Jeanna" "Jeanne" "Jeannie" "Jeannine" "Jeni" "Jenna" "Jenni" "Jennie" "Jessalyn" "Jessi" "Jessie" "Jessye" "Jo" "Joan" "Joanie" "Joann" "Joanne" "Joetta" "Joey" "Johna" "Johnna" "Joleen" "Jolene" "Jonelle" "Jonette" "Joni" "Jonie" "Seanna" "Shauna" "Shavonne" "Shawna" "Sheena" "Sheenagh" "Shena" "Shevaun" "Shevon" "Hannele" "Janina" "Janna" "Xoana" "Gianna" "Nana" "Yanna" "Zsanett" "Jóhanna" "Jóna" "Chevonne" "Síne" "Sinéad" "Siobhán" "Giovanna" "Giovannetta" "Vanna" "Jovana" "Jovanka" "Jovka" "Vana" "Jehanne" "Asia" "Joasia" "Joaninha" "Ionela" "Oana" "Ivanna" "Zhanna" "Zhannochka" "Seona" "Seonag" "Seònaid" "Sheona" "Shona" "Sìne" "Sìneag" "Teasag" "Janka" "Juana" "Juanita" "Jannicke" "Jannike" "Shan" "Siân" "Siana" "Siani" "Sioned" "Siwan" "'
foreach variant of local Jantje {
	replace ameriname = "Jantje" if fname == "`variant'"
}

local Jantje `" "Nina" "Ivka" "Jannicke" "Jannike" "Jan" "Janna" "Jannah" "Jojo" "Nena" "Netta" "Nettie" "Ninette" "Gia" "Giannina" "MASCULINE FORMS" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Evan" "Hank" "Ian" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Janne" "Joni" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giannino" "Giovanni" "Ivano" "Nino" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Jock" "Jockie" "Jocky" "Seoc" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Hampus" "Hasse" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach diminutive of local Jantje {
	replace ameriname = "Jantje" if fname == "`diminutive'"
}

/* Jaroslaw "No equivalents" */

/* Jaroslaw "No diminutives" */

/* Jassel "No equivalents" */

/* Jassel "No diminutives" */

/* Jaukel "No equivalents" */

/* Jaukel "No diminutives" */

/* Jechiel "No equivalents" */

/* Jechiel "No diminutives" */

/* Jedrzej "No equivalents" */

/* Jedrzej "No diminutives" */

local Jeffrey `" "Gaufrid" "Gisilfrid" "Godafrid" "Walahfrid" "Guðfriðr" "Godfried" "Geffrey" "Geoffrey" "Godfrey" "Jeffery" "Jeffrey" "Jeffry" "Geoffroy" "Godefroy" "Joffrey" "Gottfried" "Gofraidh" "Séafra" "Siothrún" "Goffredo" "Geoffroi" "Gjord" "Gjurd" "Godtfred" "Godofredo" "Goraidh" "Gottfrid" "Sieffre" "'
foreach variant of local Jeffrey {
	replace ameriname = "Jeffrey" if fname == "`variant'"
}

local Jeffrey `" "Geoff" "Jeff" "Jep" "Fredo" "'
foreach diminutive of local Jeffrey {
	replace ameriname = "Jeffrey" if fname == "`diminutive'"
}

local Jelle `" "Giltbert" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilko" "Vilém" "Vilhelm" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Liam" "Will" "William" "Willie" "Vilĉjo" "Vilhelmo" "Villem" "Jami" "Vilhelmi" "Vilho" "Vili" "Viljami" "Viljo" "Ville" "Guillaume" "Willi" "Vilmos" "Vilhjálmur" "Uilleag" "Uilliam" "Ulick" "Guglielmo" "Vilhelms" "Vilis" "Wöllem" "Wullem" "Wum" "Vilhelmas" "Illiam" "Wiremu" "Wilmot" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwil" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Jelle {
	replace ameriname = "Jelle" if fname == "`variant'"
}

local Jelle `" "Billie" "Billy" "Wilkin" "Wilky" "'
foreach diminutive of local Jelle {
	replace ameriname = "Jelle" if fname == "`diminutive'"
}

/* Jendrzej "No equivalents" */

/* Jendrzej "No diminutives" */

/* Jene "No equivalents" */

/* Jene "No diminutives" */

/* Jenkel "No equivalents" */

/* Jenkel "No diminutives" */

local Jenny `" "Lashawn" "Tajuana" "Guenevere" "Guinevere" "Gwenhwyfar" "Jone" "Ioanna" "Iohanna" "Joanna" "Ioana" "Ivana" "Ivanka" "Yana" "Yanka" "Yoana" "Jana" "Joana" "Jenifer" "Žana" "Iva" "Janička" "Johana" "Hanna" "Hanne" "Janne" "Jeanette" "Johanna" "Johanne" "Jonna" "Vanja" "Hannie" "Janine" "Janneke" "Jantine" "Jantje" "Jeanine" "Jeannette" "Jennigje" "Jenny" "Johanneke" "Genette" "Jan" "Janae" "Janeka" "Janel" "Janele" "Janella" "Janelle" "Janene" "Janet" "Janetta" "Janette" "Janey" "Janie" "Janna" "Jannah" "Jannette" "Jannine" "Jaynie" "Jeanie" "Jeannie" "Jeannine" "Jen" "Jena" "Jenae" "Jenelle" "Jenessa" "Jeni" "Jenn" "Jenna" "Jenni" "Jennie" "Jessalyn" "Jessi" "Jessie" "Jessye" "Jo" "Joanie" "Joetta" "Joey" "Joleen" "Jolene" "Jonette" "Joni" "Jonie" "Hannele" "Janina" "Guenièvre" "Jeanne" "Joanne" "Xoana" "Gianna" "Nana" "Yanna" "Zsanett" "Jóhanna" "Jóna" "Chevonne" "Shavonne" "Shevaun" "Shevon" "Síne" "Sinéad" "Siobhán" "Ginevra" "Giovanna" "Giovannetta" "Vanna" "Jovana" "Jovanka" "Jovka" "Vana" "Jehanne" "Asia" "Joasia" "Joaninha" "Ionela" "Oana" "Ivanna" "Zhanna" "Zhannochka" "Jean" "Seona" "Seonag" "Seònaid" "Sheena" "Sheona" "Shona" "Sìne" "Sìneag" "Teasag" "Janka" "Yenny" "Jannicke" "Jannike" "Genevra" "Gaenor" "Shan" "Siân" "Siana" "Siani" "Sioned" "Siwan" "'
foreach variant of local Jenny {
	replace ameriname = "Jenny" if fname == "`variant'"
}

local Jenny `" "Nina" "Ivka" "Jannicke" "Jannike" "Jan" "Janna" "Jannah" "Jojo" "Nena" "Netta" "Nettie" "Ninette" "Gia" "Giannina" "MASCULINE FORMS" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Evan" "Hank" "Ian" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Janne" "Joni" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giannino" "Giovanni" "Ivano" "Nino" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Jock" "Jockie" "Jocky" "Seoc" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Hampus" "Hasse" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach diminutive of local Jenny {
	replace ameriname = "Jenny" if fname == "`diminutive'"
}

/* Jeno "No equivalents" */

/* Jeno "No diminutives" */

/* Jente "No equivalents" */

/* Jente "No diminutives" */

local Jeremiah `" "Ieremias" "Yirmiyahu" "Hieremias" "Jeremiah" "Jeremy" "Jarmo" "Jeremias" "Jorma" "Jérémie" "Jeremías" "'
foreach variant of local Jeremiah {
	replace ameriname = "Jeremiah" if fname == "`variant'"
}

local Jeremiah `" "Jez" "Jezza" "Jem" "Jemmy" "Jere" "Jerry" "Jarkko" "'
foreach diminutive of local Jeremiah {
	replace ameriname = "Jeremiah" if fname == "`diminutive'"
}

local Jerome `" "Hieronymos" "Hieronymus" "Jeronim" "Jeroen" "Jerome" "Jérôme" "Geronimo" "Gerolamo" "Girolamo" "Ieronimus" "Jerônimo" "Jerónimo" "Gerónimo" "'
foreach variant of local Jerome {
	replace ameriname = "Jerome" if fname == "`variant'"
}

local Jerome `" "Jerko" "Jerry" "'
foreach diminutive of local Jerome {
	replace ameriname = "Jerome" if fname == "`diminutive'"
}

local Jerry `" "Gerold" "Hieronymos" "Hieronymus" "Ieremias" "Yirmiyahu" "Hieremias" "Jeremiah" "Jeremy" "Jerko" "Jeronim" "Gerolt" "Jeroen" "Jez" "Jezza" "Gerry" "Jem" "Jemmy" "Jere" "Jeri" "Jerri" "Jerrie" "Jerry" "Jarkko" "Jarmo" "Jeremias" "Jorma" "Roni" "Gérald" "Géraldine" "Géraud" "Jérémie" "Jérôme" "Gerald" "Gerhold" "Geronimo" "Gearalt" "Gearóid" "Gerolamo" "Giraldo" "Girolamo" "Ieronimus" "Jerônimo" "Geraldo" "Jerónimo" "Gerónimo" "Jeremías" "Gerallt" "MASCULINE FORMS" "Jerald" "Jerold" "Jerrold" "'
foreach variant of local Jerry {
	replace ameriname = "Jerry" if fname == "`variant'"
}

/* Jerry "No diminutives" */

/* Jessie "No equivalents" */

/* Jessie "No diminutives" */

local Jesus `" "Yeshua" "Essa" "Isa" "Issa" "Yushua" "Josu" "Iesous" "Yehoshua" "Iesus" "Iosue" "Jesus" "Joshua" "Jozua" "Josué" "Xesús" "Iokua" "Józsua" "Giosuè" "Jesús" "İsa" "'
foreach variant of local Jesus {
	replace ameriname = "Jesus" if fname == "`variant'"
}

local Jesus `" "Josh" "Chucho" "Chus" "Chuy" "'
foreach diminutive of local Jesus {
	replace ameriname = "Jesus" if fname == "`diminutive'"
}

local Jewel `" "Jewel" "'
foreach variant of local Jewel {
	replace ameriname = "Jewel" if fname == "`variant'"
}

/* Jewel "No diminutives" */

/* Jidel "No equivalents" */

/* Jidel "No diminutives" */

local Jim `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jaumet" "Jago" "Jakov" "Jakša" "Jakub" "Ib" "Jakob" "Jeppe" "Cobus" "Coos" "Jaap" "Jacobus" "Kobe" "Kobus" "Koos" "Sjaak" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Koby" "Jaagup" "Jaak" "Jaakob" "Jákup" "Jaakko" "Jaakoppi" "Jacky" "Jacques" "Japik" "Iago" "Iakob" "Koba" "Jockel" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Lapo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Kuba" "Jacó" "Jaime" "Yasha" "Jamie" "Seumas" "Jaka" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "Kapel" "Koppel" "Yankel" "'
foreach variant of local Jim {
	replace ameriname = "Jim" if fname == "`variant'"
}

local Jim `" "Jimi" "Jimmie" "Jimmy" "Jaska" "'
foreach diminutive of local Jim {
	replace ameriname = "Jim" if fname == "`diminutive'"
}

/* Jindrich "No equivalents" */

/* Jindrich "No diminutives" */

/* Jiri "No equivalents" */

/* Jiri "No diminutives" */

/* Jno "No equivalents" */

/* Jno "No diminutives" */

local Joachim `" "Jokin" "Yehoyakhin" "Yehoyakim" "Jehoiachin" "Jehoiakim" "Joaquim" "Jáchym" "Joakim" "Jokum" "Jochem" "Jaakkima" "Joachim" "Jochen" "Jochim" "Gioacchino" "Gioachino" "Ioachim" "Ioakeim" "Akim" "Yakim" "Joaquín" "'
foreach variant of local Joachim {
	replace ameriname = "Joachim" if fname == "`variant'"
}

local Joachim `" "Chimo" "Quim" "Ximo" "Kim" "Aki" "Kimi" "Achim" "Jo" "Jockel" "'
foreach diminutive of local Joachim {
	replace ameriname = "Joachim" if fname == "`diminutive'"
}

/* Joad "No equivalents" */

/* Joad "No diminutives" */

/* Joan "No equivalents" */

/* Joan "No diminutives" */

/* Joanis "No equivalents" */

/* Joanis "No diminutives" */

local Joaquim `" "Jokin" "Yehoyakhin" "Yehoyakim" "Jehoiachin" "Jehoiakim" "Joaquim" "Jáchym" "Joakim" "Jokum" "Jochem" "Jaakkima" "Joachim" "Jochen" "Jochim" "Gioacchino" "Gioachino" "Ioachim" "Ioakeim" "Akim" "Yakim" "Joaquín" "'
foreach variant of local Joaquim {
	replace ameriname = "Joaquim" if fname == "`variant'"
}

local Joaquim `" "Chimo" "Quim" "Ximo" "Kim" "Aki" "Kimi" "Achim" "Jo" "Jockel" "'
foreach diminutive of local Joaquim {
	replace ameriname = "Joaquim" if fname == "`diminutive'"
}

/* Joaquin "No equivalents" */

/* Joaquin "No diminutives" */

/* Joas "No equivalents" */

/* Joas "No diminutives" */

local Job `" "Ayyub" "Iob" "'Iyyov" "Job" "Iyov" "Eyüp" "'
foreach variant of local Job {
	replace ameriname = "Job" if fname == "`variant'"
}

local Job `" "Joby" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Job {
	replace ameriname = "Job" if fname == "`diminutive'"
}

local Jochem `" "Jokin" "Yehoyakhin" "Yehoyakim" "Jehoiachin" "Jehoiakim" "Joaquim" "Jáchym" "Joakim" "Jokum" "Jochem" "Jaakkima" "Joachim" "Jochen" "Jochim" "Gioacchino" "Gioachino" "Ioachim" "Ioakeim" "Akim" "Yakim" "Joaquín" "'
foreach variant of local Jochem {
	replace ameriname = "Jochem" if fname == "`variant'"
}

local Jochem `" "Chimo" "Quim" "Ximo" "Kim" "Aki" "Kimi" "Achim" "Jo" "Jockel" "'
foreach diminutive of local Jochem {
	replace ameriname = "Jochem" if fname == "`diminutive'"
}

/* Joh "No equivalents" */

/* Joh "No diminutives" */

local JOHAN `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local JOHAN {
	replace ameriname = "JOHAN" if fname == "`variant'"
}

local JOHAN `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local JOHAN {
	replace ameriname = "JOHAN" if fname == "`diminutive'"
}

/* Johanes "No equivalents" */

/* Johanes "No diminutives" */

local Johanna `" "Lashawn" "Tajuana" "Jone" "Ioanna" "Iohanna" "Joanna" "Ioana" "Ivana" "Yana" "Yanka" "Yoana" "Jana" "Joana" "Johana" "Johanna" "Johanne" "Janna" "Jane" "Janessa" "Janice" "Janis" "Jayna" "Jayne" "Jean" "Jeana" "Jeane" "Jeanna" "Jeanne" "Joan" "Joann" "Joanne" "Johna" "Johnna" "Jonelle" "Seanna" "Shauna" "Shavonne" "Shawna" "Sheena" "Sheenagh" "Shena" "Shevaun" "Shevon" "Janina" "Xoana" "Gianna" "Yanna" "Jóhanna" "Jóna" "Chevonne" "Síne" "Siobhán" "Giovanna" "Jovana" "Jehanne" "Ivanna" "Zhanna" "Seona" "Seonag" "Sìne" "Juana" "Shan" "Siân" "Siwan" "'
foreach variant of local Johanna {
	replace ameriname = "Johanna" if fname == "`variant'"
}

local Johanna `" "Ivanka" "Nina" "Žana" "Iva" "Ivka" "Janička" "Hanna" "Hanne" "Janne" "Jannicke" "Jannike" "Jeanette" "Jonna" "Vanja" "Hannie" "Janine" "Janneke" "Jantine" "Jantje" "Jeanine" "Jeannette" "Jennigje" "Jenny" "Johanneke" "Genette" "Jan" "Janae" "Janeka" "Janel" "Janele" "Janella" "Janelle" "Janene" "Janet" "Janetta" "Janette" "Janey" "Janie" "Janna" "Jannah" "Jannette" "Jannine" "Jaynie" "Jeanie" "Jeannie" "Jeannine" "Jeni" "Jenna" "Jenni" "Jennie" "Jessalyn" "Jessi" "Jessie" "Jessye" "Jo" "Joanie" "Joetta" "Joey" "Jojo" "Joleen" "Jolene" "Jonette" "Joni" "Jonie" "Nena" "Netta" "Nettie" "Hannele" "Ninette" "Nana" "Zsanett" "Sinéad" "Gia" "Gianna" "Giannina" "Giovannetta" "Vanna" "Jovanka" "Jovka" "Vana" "Asia" "Joasia" "Joaninha" "Ionela" "Oana" "Zhannochka" "Seònaid" "Sheona" "Shona" "Sìneag" "Teasag" "Janka" "Juanita" "Siana" "Siani" "Sioned" "MASCULINE FORMS" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hannes" "Joop" "Evan" "Hank" "Ian" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giannino" "Giovanni" "Ivano" "Nino" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Jock" "Jockie" "Jocky" "Seoc" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Hampus" "Hasse" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach diminutive of local Johanna {
	replace ameriname = "Johanna" if fname == "`diminutive'"
}

/* Johannas "No equivalents" */

/* Johannas "No diminutives" */

local Johanne `" "Lashawn" "Tajuana" "Jone" "Ioanna" "Iohanna" "Joanna" "Ioana" "Ivana" "Yana" "Yanka" "Yoana" "Jana" "Joana" "Johana" "Johanna" "Johanne" "Janna" "Jane" "Janessa" "Janice" "Janis" "Jayna" "Jayne" "Jean" "Jeana" "Jeane" "Jeanna" "Jeanne" "Joan" "Joann" "Joanne" "Johna" "Johnna" "Jonelle" "Seanna" "Shauna" "Shavonne" "Shawna" "Sheena" "Sheenagh" "Shena" "Shevaun" "Shevon" "Janina" "Xoana" "Gianna" "Yanna" "Jóhanna" "Jóna" "Chevonne" "Síne" "Siobhán" "Giovanna" "Jovana" "Jehanne" "Ivanna" "Zhanna" "Seona" "Seonag" "Sìne" "Juana" "Shan" "Siân" "Siwan" "'
foreach variant of local Johanne {
	replace ameriname = "Johanne" if fname == "`variant'"
}

local Johanne `" "Ivanka" "Nina" "Žana" "Iva" "Ivka" "Janička" "Hanna" "Hanne" "Janne" "Jannicke" "Jannike" "Jeanette" "Jonna" "Vanja" "Hannie" "Janine" "Janneke" "Jantine" "Jantje" "Jeanine" "Jeannette" "Jennigje" "Jenny" "Johanneke" "Genette" "Jan" "Janae" "Janeka" "Janel" "Janele" "Janella" "Janelle" "Janene" "Janet" "Janetta" "Janette" "Janey" "Janie" "Janna" "Jannah" "Jannette" "Jannine" "Jaynie" "Jeanie" "Jeannie" "Jeannine" "Jeni" "Jenna" "Jenni" "Jennie" "Jessalyn" "Jessi" "Jessie" "Jessye" "Jo" "Joanie" "Joetta" "Joey" "Jojo" "Joleen" "Jolene" "Jonette" "Joni" "Jonie" "Nena" "Netta" "Nettie" "Hannele" "Ninette" "Nana" "Zsanett" "Sinéad" "Gia" "Gianna" "Giannina" "Giovannetta" "Vanna" "Jovanka" "Jovka" "Vana" "Asia" "Joasia" "Joaninha" "Ionela" "Oana" "Zhannochka" "Seònaid" "Sheona" "Shona" "Sìneag" "Teasag" "Janka" "Juanita" "Siana" "Siani" "Sioned" "MASCULINE FORMS" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hannes" "Joop" "Evan" "Hank" "Ian" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giannino" "Giovanni" "Ivano" "Nino" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Jock" "Jockie" "Jocky" "Seoc" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Hampus" "Hasse" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach diminutive of local Johanne {
	replace ameriname = "Johanne" if fname == "`diminutive'"
}

/* Johannis "No equivalents" */

/* Johannis "No diminutives" */

/* Johannus "No equivalents" */

/* Johannus "No diminutives" */

local JOHN `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local JOHN {
	replace ameriname = "JOHN" if fname == "`variant'"
}

local JOHN `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local JOHN {
	replace ameriname = "JOHN" if fname == "`diminutive'"
}

/* Johnston "No equivalents" */

/* Johnston "No diminutives" */

/* Johs "No equivalents" */

/* Johs "No diminutives" */

/* Joine "No equivalents" */

/* Joine "No diminutives" */

/* Jojne "No equivalents" */

/* Jojne "No diminutives" */

/* Jon "No equivalents" */

/* Jon "No diminutives" */

/* Jona "No equivalents" */

/* Jona "No diminutives" */

local Jonathan `" "Ionathan" "Yehonatan" "Yonatan" "Jehonathan" "Jonathan" "Jonatan" "Johnathan" "Johnathon" "Jonathon" "Jónatan" "Ionatán" "Gionata" "Jônatas" "'
foreach variant of local Jonathan {
	replace ameriname = "Jonathan" if fname == "`variant'"
}

local Jonathan `" "Jonty" "Jon" "Jonny" "Yoni" "'
foreach diminutive of local Jonathan {
	replace ameriname = "Jonathan" if fname == "`diminutive'"
}

/* Jone "No equivalents" */

/* Jone "No diminutives" */

/* Jones "No equivalents" */

/* Jones "No diminutives" */

/* Jonkel "No equivalents" */

/* Jonkel "No diminutives" */

/* Jono "No equivalents" */

/* Jono "No diminutives" */

/* Jons "No equivalents" */

/* Jons "No diminutives" */

local Joost `" "Iodocus" "Iudocus" "Jodocus" "Judoc" "Judocus" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Jodoc" "Yosif" "Josep" "Josip" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joyce" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Josse" "Juste" "Xosé" "Ioseb" "Soso" "Jost" "Justus" "Sepp" "Seppel" "Iosif" "Josephus" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Giuseppe" "Peppe" "Peppi" "Peppino" "Iosephus" "Iustus" "Jāzeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Jozef" "Jošt" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "Yussel" "'
foreach variant of local Joost {
	replace ameriname = "Joost" if fname == "`variant'"
}

local Joost `" "Joos" "Pino" "'
foreach diminutive of local Joost {
	replace ameriname = "Joost" if fname == "`diminutive'"
}

/* Jorgen "No equivalents" */

/* Jorgen "No diminutives" */

local Jos `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Yosif" "Josep" "Josip" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Xosé" "Ioseb" "Soso" "Sepp" "Seppel" "Iosif" "Josephus" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Giuseppe" "Peppe" "Peppi" "Peppino" "Iosephus" "Jāzeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Jozef" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "Yussel" "'
foreach variant of local Jos {
	replace ameriname = "Jos" if fname == "`variant'"
}

local Jos `" "Pino" "'
foreach diminutive of local Jos {
	replace ameriname = "Jos" if fname == "`diminutive'"
}

/* Josas "No equivalents" */

/* Josas "No diminutives" */

local JOSEF `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local JOSEF {
	replace ameriname = "JOSEF" if fname == "`variant'"
}

local JOSEF `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local JOSEF {
	replace ameriname = "JOSEF" if fname == "`diminutive'"
}

local Josefa `" "Josipa" "Josefa" "Josepha" "Josée" "Josèphe" "Jozefa" "Giuseppa" "Józefa" "Jožefa" "'
foreach variant of local Josefa {
	replace ameriname = "Josefa" if fname == "`variant'"
}

local Josefa `" "Finka" "Ina" "Jozefina" "Jožica" "Josefine" "Josephine" "Jozefien" "Jo" "Jodene" "Jodi" "Jodie" "Jody" "Joetta" "Joey" "Jojo" "Joleen" "Jolene" "Josephina" "Josie" "Posie" "Posy" "Iina" "Josefiina" "Fifi" "Joséphine" "Josette" "Josiane" "Giosetta" "Giuseppina" "Pina" "Józefina" "Josefina" "Jozefína" "Pepca" "Pepita" "MASCULINE FORMS" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Yosif" "Josep" "Josip" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Josephus" "Jozef" "Sjef" "Zef" "Joe" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Xosé" "Ioseb" "Soso" "Sepp" "Seppel" "Iosif" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Giuseppe" "Peppe" "Peppi" "Peppino" "Pino" "Iosephus" "Jāzeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "'
foreach diminutive of local Josefa {
	replace ameriname = "Josefa" if fname == "`diminutive'"
}

/* Josek "No equivalents" */

/* Josek "No diminutives" */

local Josep `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Josep {
	replace ameriname = "Josep" if fname == "`variant'"
}

local Josep `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Josep {
	replace ameriname = "Josep" if fname == "`diminutive'"
}

local Joshua `" "Yeshua" "Essa" "Isa" "Issa" "Yushua" "Josu" "Iesous" "Yehoshua" "Iesus" "Iosue" "Jesus" "Joshua" "Jozua" "Josué" "Xesús" "Iokua" "Józsua" "Giosuè" "Jesús" "İsa" "'
foreach variant of local Joshua {
	replace ameriname = "Joshua" if fname == "`variant'"
}

local Joshua `" "Josh" "Chucho" "Chus" "Chuy" "'
foreach diminutive of local Joshua {
	replace ameriname = "Joshua" if fname == "`diminutive'"
}

/* Josi "No equivalents" */

/* Josi "No diminutives" */

local Josie `" "Finka" "Ina" "Josipa" "Jozefina" "Jožica" "Josefa" "Josefine" "Josephine" "Jozefien" "Jo" "Joetta" "Joey" "Joleen" "Jolene" "Josie" "Posie" "Posy" "Iina" "Josefiina" "Fifi" "Josée" "Josèphe" "Joséphine" "Josette" "Josiane" "Josepha" "Jozefa" "Giosetta" "Giuseppa" "Giuseppina" "Pina" "Józefa" "Józefina" "Josefina" "Jozefína" "Jožefa" "Pepca" "Pepita" "'
foreach variant of local Josie {
	replace ameriname = "Josie" if fname == "`variant'"
}

local Josie `" "Jojo" "MASCULINE FORMS" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Yosif" "Josep" "Josip" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Josephus" "Jozef" "Sjef" "Zef" "Jo" "Joe" "Joey" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Xosé" "Ioseb" "Soso" "Sepp" "Seppel" "Iosif" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Giuseppe" "Peppe" "Peppi" "Peppino" "Pino" "Iosephus" "Jāzeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "'
foreach diminutive of local Josie {
	replace ameriname = "Josie" if fname == "`diminutive'"
}

/* Josiph "No equivalents" */

/* Josiph "No diminutives" */

local Joso `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Yosif" "Josep" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Josephus" "Jozef" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Xosé" "Ioseb" "Soso" "Sepp" "Seppel" "Iosif" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Giuseppe" "Peppe" "Peppi" "Peppino" "Iosephus" "Jāzeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Josip" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "Yussel" "'
foreach variant of local Joso {
	replace ameriname = "Joso" if fname == "`variant'"
}

local Joso `" "Pino" "'
foreach diminutive of local Joso {
	replace ameriname = "Joso" if fname == "`diminutive'"
}

local Josse `" "Iodocus" "Iudocus" "Jodocus" "Judoc" "Judocus" "Jodoc" "Joost" "Joyce" "Josse" "Jost" "Jošt" "'
foreach variant of local Josse {
	replace ameriname = "Josse" if fname == "`variant'"
}

local Josse `" "Joos" "'
foreach diminutive of local Josse {
	replace ameriname = "Josse" if fname == "`diminutive'"
}

/* Jossef "No equivalents" */

/* Jossef "No diminutives" */

/* Jossif "No equivalents" */

/* Jossif "No diminutives" */

/* Joszef "No equivalents" */

/* Joszef "No diminutives" */

/* Joussef "No equivalents" */

/* Joussef "No diminutives" */

local Jovan `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Jovan {
	replace ameriname = "Jovan" if fname == "`variant'"
}

local Jovan `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Jovan {
	replace ameriname = "Jovan" if fname == "`diminutive'"
}

/* Jovo "No equivalents" */

/* Jovo "No diminutives" */

/* Joze "No equivalents" */

/* Joze "No diminutives" */

local Jozo `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Yosif" "Josep" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Josephus" "Jozef" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Xosé" "Ioseb" "Soso" "Sepp" "Seppel" "Iosif" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Giuseppe" "Peppe" "Peppi" "Peppino" "Iosephus" "Jāzeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Josip" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "Yussel" "'
foreach variant of local Jozo {
	replace ameriname = "Jozo" if fname == "`variant'"
}

local Jozo `" "Pino" "'
foreach diminutive of local Jozo {
	replace ameriname = "Jozo" if fname == "`diminutive'"
}

/* Jr "No equivalents" */

/* Jr "No diminutives" */

/* Jsrael "No equivalents" */

/* Jsrael "No diminutives" */

/* Jstvan "No equivalents" */

/* Jstvan "No diminutives" */

/* Jtzig "No equivalents" */

/* Jtzig "No diminutives" */

local Judah `" "Ioudas" "Yehudah" "Iudas" "Judah" "Judas" "Jude" "Yehuda" "Yidel" "'
foreach variant of local Judah {
	replace ameriname = "Judah" if fname == "`variant'"
}

/* Judah "No diminutives" */

/* Jude "No equivalents" */

/* Jude "No diminutives" */

/* Judes "No equivalents" */

/* Judes "No diminutives" */

/* Judka "No equivalents" */

/* Judka "No diminutives" */

/* Judke "No equivalents" */

/* Judke "No diminutives" */

local Juho `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Evan" "Ian" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Jani" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giovanni" "Ivano" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Janne" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Juho {
	replace ameriname = "Juho" if fname == "`variant'"
}

local Juho `" "Hank" "Jack" "Jackie" "Jake" "Jussi" "Giannino" "Nino" "Jock" "Jockie" "Jocky" "Seoc" "Hampus" "Hasse" "'
foreach diminutive of local Juho {
	replace ameriname = "Juho" if fname == "`diminutive'"
}

local Julia `" "Iulia" "Julia" "Yuliya" "Júlia" "Ghjulia" "Julija" "Julie" "Iúile" "Giulia" "Jūlija" "Juliya" "Yulia" "'
foreach variant of local Julia {
	replace ameriname = "Julia" if fname == "`variant'"
}

local Julia `" "Lia" "Lieke" "Jools" "Jules" "Juliet" "Juliette" "Julitta" "Juli" "Juliska" "Lili" "Giulietta" "Julita" "Julinha" "MASCULINE FORMS" "Iulius" "Julius" "Giulio" "Julek" "Juliusz" "Julio" "Iuliu" "Yuli" "Yuliy" "Július" "Julij" "'
foreach diminutive of local Julia {
	replace ameriname = "Julia" if fname == "`diminutive'"
}

local Julien `" "Iulianus" "Julen" "Yulian" "Jolyon" "Julian" "Julyan" "Julien" "Giuliano" "Iulian" "Julián" "'
foreach variant of local Julien {
	replace ameriname = "Julien" if fname == "`variant'"
}

local Julien `" "Jools" "Jules" "'
foreach diminutive of local Julien {
	replace ameriname = "Julien" if fname == "`diminutive'"
}

local Juozas `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Yosif" "Josep" "Josip" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Josephus" "Jozef" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Xosé" "Ioseb" "Soso" "Sepp" "Seppel" "Iosif" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Giuseppe" "Peppe" "Peppi" "Peppino" "Iosephus" "Jāzeps" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "Yussel" "'
foreach variant of local Juozas {
	replace ameriname = "Juozas" if fname == "`variant'"
}

local Juozas `" "Pino" "'
foreach diminutive of local Juozas {
	replace ameriname = "Juozas" if fname == "`diminutive'"
}

/* Jura "No equivalents" */

/* Jura "No diminutives" */

local Juraj `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Juraj {
	replace ameriname = "Juraj" if fname == "`variant'"
}

local Juraj `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jockel" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Juraj {
	replace ameriname = "Juraj" if fname == "`diminutive'"
}

local Jure `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Jure" "Jurica" "Juro" "Jiří" "Georg" "Jørg" "Jørgen" "Jørn" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "Geordie" "George" "Georgie" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Yrjö" "Georges" "Xurxo" "Giorgi" "Goga" "Iuri" "Jörg" "Giorgos" "Yiorgos" "Yorgos" "György" "Gyuri" "Seoirse" "Giorgino" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Varghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jurek" "Jorge" "Jorginho" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yura" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Đurađ" "Đuro" "Juraj" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Jure {
	replace ameriname = "Jure" if fname == "`variant'"
}

local Jure `" "Jockel" "Gino" "'
foreach diminutive of local Jure {
	replace ameriname = "Jure" if fname == "`diminutive'"
}

local Jurgen `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Jurgen {
	replace ameriname = "Jurgen" if fname == "`variant'"
}

local Jurgen `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jockel" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Jurgen {
	replace ameriname = "Jurgen" if fname == "`diminutive'"
}

local Jurgis `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Jurgis {
	replace ameriname = "Jurgis" if fname == "`variant'"
}

local Jurgis `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jockel" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Jurgis {
	replace ameriname = "Jurgis" if fname == "`diminutive'"
}

/* Jurjen "No equivalents" */

/* Jurjen "No diminutives" */

/* Jurko "No equivalents" */

/* Jurko "No diminutives" */

/* Juro "No equivalents" */

/* Juro "No diminutives" */

/* Jusef "No equivalents" */

/* Jusef "No diminutives" */

local Justin `" "Justin" "Giustino" "Iustinus" "Justinas" "Justyn" "Iestyn" "'
foreach variant of local Justin {
	replace ameriname = "Justin" if fname == "`variant'"
}

local Justin `" "Justy" "'
foreach diminutive of local Justin {
	replace ameriname = "Justin" if fname == "`diminutive'"
}

/* Justo "No equivalents" */

/* Justo "No diminutives" */

/* Juzef "No equivalents" */

/* Juzef "No diminutives" */

/* Jvan "No equivalents" */

/* Jvan "No diminutives" */

/* Jwan "No equivalents" */

/* Jwan "No diminutives" */

/* K "No equivalents" */

/* K "No diminutives" */

/* Kaare "No equivalents" */

/* Kaare "No diminutives" */

local Kaarlo `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Carol" "Charles" "Kaarle" "Kaarlo" "Kale" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Siarl" "'
foreach variant of local Kaarlo {
	replace ameriname = "Kaarlo" if fname == "`variant'"
}

local Kaarlo `" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Karcsi" "Carlinhos" "Carlito" "Carlitos" "'
foreach diminutive of local Kaarlo {
	replace ameriname = "Kaarlo" if fname == "`diminutive'"
}

/* Kai "No equivalents" */

/* Kai "No diminutives" */

/* Kaj "No equivalents" */

/* Kaj "No diminutives" */

/* Kalil "No equivalents" */

/* Kalil "No diminutives" */

local Kalle `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Carol" "Charles" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Kale" "Karcsi" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Carlinhos" "Carlito" "Carlitos" "Siarl" "'
foreach variant of local Kalle {
	replace ameriname = "Kalle" if fname == "`variant'"
}

/* Kalle "No diminutives" */

/* Kalmen "No equivalents" */

/* Kalmen "No diminutives" */

local Karlo `" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Carol" "Charles" "Kaarle" "Kaarlo" "Kale" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Siarl" "'
foreach variant of local Karlo {
	replace ameriname = "Karlo" if fname == "`variant'"
}

local Karlo `" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Karcsi" "Carlinhos" "Carlito" "Carlitos" "'
foreach diminutive of local Karlo {
	replace ameriname = "Karlo" if fname == "`diminutive'"
}

/* Karnik "No equivalents" */

/* Karnik "No diminutives" */

local Karsten `" "Kristiyan" "Kristijan" "Carsten" "Christen" "Christian" "Karsten" "Kresten" "Kristen" "Kristian" "Christiaan" "Kristjan" "Krisztián" "Kristján" "Cristiano" "Christianus" "Kristiāns" "Kristijonas" "Hristijan" "Krystian" "Krystyn" "Cristian" "Cristián" "'
foreach variant of local Karsten {
	replace ameriname = "Karsten" if fname == "`variant'"
}

local Karsten `" "Krsto" "Christer" "Kris" "Chris" "Cristi" "Krister" "'
foreach diminutive of local Karsten {
	replace ameriname = "Karsten" if fname == "`diminutive'"
}

/* Kasemir "No equivalents" */

/* Kasemir "No diminutives" */

/* Kasis "No equivalents" */

/* Kasis "No diminutives" */

/* Kasmir "No equivalents" */

/* Kasmir "No diminutives" */

local Kaspar `" "Casper" "Jesper" "Kasper" "Jasper" "Gaspard" "Kaspar" "Gáspár" "Gaspare" "Gasparo" "Caspar" "Gaspar" "Kaspars" "Kasparas" "Kacper" "Gašper" "'
foreach variant of local Kaspar {
	replace ameriname = "Kaspar" if fname == "`variant'"
}

local Kaspar `" "Cas" "'
foreach diminutive of local Kaspar {
	replace ameriname = "Kaspar" if fname == "`diminutive'"
}

local Kasper `" "Casper" "Jesper" "Kasper" "Jasper" "Gaspard" "Kaspar" "Gáspár" "Gaspare" "Gasparo" "Caspar" "Gaspar" "Kaspars" "Kasparas" "Kacper" "Gašper" "'
foreach variant of local Kasper {
	replace ameriname = "Kasper" if fname == "`variant'"
}

local Kasper `" "Cas" "'
foreach diminutive of local Kasper {
	replace ameriname = "Kasper" if fname == "`diminutive'"
}

/* Kazimier "No equivalents" */

/* Kazimier "No diminutives" */

local Kazimierz `" "Kazimír" "Casimir" "Kasimir" "Kázmér" "Casimiro" "Kazimieras" "Kazimir" "Kazimierz" "'
foreach variant of local Kazimierz {
	replace ameriname = "Kazimierz" if fname == "`variant'"
}

local Kazimierz `" "Kazik" "'
foreach diminutive of local Kazimierz {
	replace ameriname = "Kazimierz" if fname == "`diminutive'"
}

local Kazimir `" "Kazimír" "Casimir" "Kasimir" "Kázmér" "Casimiro" "Kazimieras" "Kazimir" "Kazimierz" "'
foreach variant of local Kazimir {
	replace ameriname = "Kazimir" if fname == "`variant'"
}

local Kazimir `" "Kazik" "'
foreach diminutive of local Kazimir {
	replace ameriname = "Kazimir" if fname == "`diminutive'"
}

/* Kazmierz "No equivalents" */

/* Kazmierz "No diminutives" */

/* Kegham "No equivalents" */

/* Kegham "No diminutives" */

local Keith `" "Keith" "'
foreach variant of local Keith {
	replace ameriname = "Keith" if fname == "`variant'"
}

/* Keith "No diminutives" */

local Kevin `" "Kevin" "Kevyn" "Caoimhín" "Cóemgein" "Kevan" "Cefin" "'
foreach variant of local Kevin {
	replace ameriname = "Kevin" if fname == "`variant'"
}

local Kevin `" "Kev" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Kevin {
	replace ameriname = "Kevin" if fname == "`diminutive'"
}

local Kevork `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Đurađ" "Đuro" "Juraj" "Jiří" "Georg" "Jørgen" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "George" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Georges" "Xurxo" "Giorgi" "Iuri" "Giorgos" "Yiorgos" "Yorgos" "György" "Seoirse" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jorge" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Kevork {
	replace ameriname = "Kevork" if fname == "`variant'"
}

local Kevork `" "Jure" "Jurica" "Juro" "Jørg" "Jørn" "Geordie" "Georgie" "Yrjö" "Goga" "Jockel" "Jörg" "Gyuri" "Gino" "Giorgino" "Varghese" "Jurek" "Jorginho" "Yura" "'
foreach diminutive of local Kevork {
	replace ameriname = "Kevork" if fname == "`diminutive'"
}

local Khalil `" "Khaleel" "Khalil" "Halil" "'
foreach variant of local Khalil {
	replace ameriname = "Khalil" if fname == "`variant'"
}

/* Khalil "No diminutives" */

/* Kiriakos "No equivalents" */

/* Kiriakos "No diminutives" */

/* Kirkor "No equivalents" */

/* Kirkor "No diminutives" */

/* Kirsch "No equivalents" */

/* Kirsch "No diminutives" */

/* Kiwe "No equivalents" */

/* Kiwe "No diminutives" */

local Kjeld `" "Ketill" "Keld" "Kjeld" "Ketil" "Kjell" "Kjetil" "Kettil" "'
foreach variant of local Kjeld {
	replace ameriname = "Kjeld" if fname == "`variant'"
}

/* Kjeld "No diminutives" */

local Klas `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Niklas" "Nikolaj" "Nils" "Klaas" "Nick" "Nico" "Nicolaas" "Niek" "Nikolaas" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Kolos" "Miklós" "Miksa" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Claes" "Klas" "Mykola" "'
foreach variant of local Klas {
	replace ameriname = "Klas" if fname == "`variant'"
}

local Klas `" "Colin" "Collin" "Launo" "'
foreach diminutive of local Klas {
	replace ameriname = "Klas" if fname == "`diminutive'"
}

/* Klass "No equivalents" */

/* Klass "No diminutives" */

local Klaus `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Nicolaas" "Niek" "Nikolaas" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Nicolaos" "Kolos" "Miklós" "Miksa" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nikolaj" "Nicolao" "Nicolás" "Claes" "Klas" "Niklas" "Mykola" "'
foreach variant of local Klaus {
	replace ameriname = "Klaus" if fname == "`variant'"
}

local Klaus `" "Colin" "Collin" "Launo" "'
foreach diminutive of local Klaus {
	replace ameriname = "Klaus" if fname == "`diminutive'"
}

local Klemens `" "Kliment" "Climent" "Klement" "Klemens" "Clement" "Clément" "Clemens" "Kelemen" "Clemente" "Klemen" "'
foreach variant of local Klemens {
	replace ameriname = "Klemens" if fname == "`variant'"
}

local Klemens `" "Clem" "Klim" "'
foreach diminutive of local Klemens {
	replace ameriname = "Klemens" if fname == "`diminutive'"
}

local Knud `" "Knútr" "Knud" "Knut" "Canute" "Cnut" "Knute" "'
foreach variant of local Knud {
	replace ameriname = "Knud" if fname == "`variant'"
}

/* Knud "No diminutives" */

local Konstantin `" "Kostandin" "Konstantin" "Kostadin" "Constantijn" "Constantin" "Konstantine" "Konstantinos" "Constantine" "Costantino" "Constantinus" "Konstantyn" "Costache" "Kostyantyn" "Cystennin" "'
foreach variant of local Konstantin {
	replace ameriname = "Konstantin" if fname == "`variant'"
}

local Konstantin `" "Kosta" "Stijn" "Gus" "Costel" "Costică" "Costin" "Dinu" "Kostya" "'
foreach diminutive of local Konstantin {
	replace ameriname = "Konstantin" if fname == "`diminutive'"
}

local Konstantinos `" "Kostandin" "Konstantin" "Kostadin" "Constantijn" "Constantin" "Konstantine" "Konstantinos" "Constantine" "Costantino" "Constantinus" "Konstantyn" "Costache" "Kostyantyn" "Cystennin" "'
foreach variant of local Konstantinos {
	replace ameriname = "Konstantinos" if fname == "`variant'"
}

local Konstantinos `" "Kosta" "Stijn" "Gus" "Costel" "Costică" "Costin" "Dinu" "Kostya" "'
foreach diminutive of local Konstantinos {
	replace ameriname = "Konstantinos" if fname == "`diminutive'"
}

local Konstanty `" "Constant" "Costanzo" "Constans" "Konstanty" "'
foreach variant of local Konstanty {
	replace ameriname = "Konstanty" if fname == "`variant'"
}

/* Konstanty "No diminutives" */

/* Kopel "No equivalents" */

/* Kopel "No diminutives" */

local Koppel `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jaumet" "Jago" "Jakov" "Jakša" "Jakub" "Ib" "Jakob" "Jeppe" "Cobus" "Coos" "Jaap" "Jacobus" "Kobe" "Kobus" "Koos" "Sjaak" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jaycob" "Jaymes" "Jeb" "Jem" "Jemmy" "Jim" "Koby" "Jaagup" "Jaak" "Jaakob" "Jákup" "Jaakko" "Jaakoppi" "Jacky" "Jacques" "Japik" "Iago" "Iakob" "Koba" "Jockel" "Iakopa" "Kimo" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Lapo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Kuba" "Jacó" "Jaime" "Yasha" "Jamie" "Seumas" "Jaka" "Jaša" "Jacobo" "Yago" "Yakup" "Yakiv" "Kapel" "Koppel" "Yankel" "'
foreach variant of local Koppel {
	replace ameriname = "Koppel" if fname == "`variant'"
}

local Koppel `" "Jimi" "Jimmie" "Jimmy" "Jaska" "'
foreach diminutive of local Koppel {
	replace ameriname = "Koppel" if fname == "`diminutive'"
}

/* Kornelis "No equivalents" */

/* Kornelis "No diminutives" */

/* Kornelius "No equivalents" */

/* Kornelius "No diminutives" */

/* Kosti "No equivalents" */

/* Kosti "No diminutives" */

local Krikor `" "Grigor" "Krikor" "Grgur" "Řehoř" "Gregers" "Gregory" "Grégoire" "Grigol" "Gregor" "Gregorios" "Gergely" "Gréagóir" "Gregorio" "Gregorius" "Grigorijs" "Gligor" "Grigorii" "Grzegorz" "Grigore" "Grigori" "Grigoriy" "Grigory" "Griogair" "Grega" "Greger" "Hryhoriy" "'
foreach variant of local Krikor {
	replace ameriname = "Krikor" if fname == "`variant'"
}

local Krikor `" "Grga" "Greg" "Gregg" "Reijo" "Reko" "Gergő" "Grisha" "Greig" "Goyo" "'
foreach diminutive of local Krikor {
	replace ameriname = "Krikor" if fname == "`diminutive'"
}

/* Kristen "No equivalents" */

/* Kristen "No diminutives" */

local Kristoffer `" "Hristofor" "Kristofor" "Kryštof" "Christoffer" "Kristoffer" "Christoffel" "Christopher" "Kristopher" "Christophe" "Christoph" "Christoforos" "Kristóf" "Críostóir" "Cristoforo" "Christophoros" "Christophorus" "Kristaps" "Kristupas" "Krzysztof" "Cristóvão" "Krištof" "Cristóbal" "'
foreach variant of local Kristoffer {
	replace ameriname = "Kristoffer" if fname == "`variant'"
}

local Kristoffer `" "Hristo" "Krsto" "Kris" "Chip" "Chris" "Kit" "Topher" "Risto" "Christie" "Christy" "Krzyś" "Krzysiek" "Kester" "'
foreach diminutive of local Kristoffer {
	replace ameriname = "Kristoffer" if fname == "`diminutive'"
}

local Krsto `" "Hristo" "Hristofor" "Kristiyan" "Krsto" "Kryštof" "Carsten" "Christen" "Christer" "Christian" "Christoffer" "Karsten" "Kresten" "Kris" "Kristen" "Kristian" "Kristoffer" "Chris" "Christiaan" "Christoffel" "Chip" "Christopher" "Kit" "Kristopher" "Topher" "Kristjan" "Risto" "Christophe" "Christoph" "Christoforos" "Kristóf" "Krisztián" "Kristján" "Christie" "Christy" "Críostóir" "Cristiano" "Cristoforo" "Christophoros" "Christianus" "Christophorus" "Kristaps" "Kristiāns" "Kristijonas" "Kristupas" "Hristijan" "Kristijan" "Krystian" "Krystyn" "Krzyś" "Krzysiek" "Krzysztof" "Cristóvão" "Cristi" "Cristian" "Kester" "Krištof" "Cristián" "Cristóbal" "Krister" "'
foreach variant of local Krsto {
	replace ameriname = "Krsto" if fname == "`variant'"
}

/* Krsto "No diminutives" */

/* Kusiel "No equivalents" */

/* Kusiel "No diminutives" */

/* Kyriacos "No equivalents" */

/* Kyriacos "No diminutives" */

local Kyriakos `" "Cyrillus" "Kyriakos" "Kyrillos" "Kiril" "Cyril" "Cyrille" "Ciriaco" "Cirillo" "Cyriacus" "Kirils" "Kyrilu" "Cyryl" "Ciríaco" "Kirill" "Ciril" "Kyrylo" "'
foreach variant of local Kyriakos {
	replace ameriname = "Kyriakos" if fname == "`variant'"
}

local Kyriakos `" "Cy" "Kire" "Kiro" "'
foreach diminutive of local Kyriakos {
	replace ameriname = "Kyriakos" if fname == "`diminutive'"
}

/* L "No equivalents" */

/* L "No diminutives" */

local Ladislaus `" "Vladislav" "Ladislav" "Ladislas" "Ladislaus" "László" "Ladislao" "Volodislavu" "Władysław" "Włodzisław" "'
foreach variant of local Ladislaus {
	replace ameriname = "Ladislaus" if fname == "`variant'"
}

local Ladislaus `" "Vlado" "Vladan" "Laci" "Vlad" "Władek" "Slava" "'
foreach diminutive of local Ladislaus {
	replace ameriname = "Ladislaus" if fname == "`diminutive'"
}

local Ladislav `" "Vladislav" "Ladislav" "Ladislas" "Ladislaus" "László" "Ladislao" "Volodislavu" "Władysław" "Włodzisław" "'
foreach variant of local Ladislav {
	replace ameriname = "Ladislav" if fname == "`variant'"
}

local Ladislav `" "Vlado" "Vladan" "Laci" "Vlad" "Władek" "Slava" "'
foreach diminutive of local Ladislav {
	replace ameriname = "Ladislav" if fname == "`diminutive'"
}

/* Ladislaw "No equivalents" */

/* Ladislaw "No diminutives" */

/* Laib "No equivalents" */

/* Laib "No diminutives" */

local Lambert `" "Lambert" "Lamprecht" "Landebert" "Lammert" "Lamberto" "Lambaer" "'
foreach variant of local Lambert {
	replace ameriname = "Lambert" if fname == "`variant'"
}

local Lambert `" "Baer" "'
foreach diminutive of local Lambert {
	replace ameriname = "Lambert" if fname == "`diminutive'"
}

/* Lambertus "No equivalents" */

/* Lambertus "No diminutives" */

/* Lambros "No equivalents" */

/* Lambros "No diminutives" */

local Lammert `" "Lambert" "Lamprecht" "Landebert" "Lammert" "Lamberto" "Lambaer" "'
foreach variant of local Lammert {
	replace ameriname = "Lammert" if fname == "`variant'"
}

local Lammert `" "Baer" "'
foreach diminutive of local Lammert {
	replace ameriname = "Lammert" if fname == "`diminutive'"
}

/* Lasar "No equivalents" */

/* Lasar "No diminutives" */

/* Laser "No equivalents" */

/* Laser "No diminutives" */

/* Laszlo "No equivalents" */

/* Laszlo "No diminutives" */

/* Laurence "No equivalents" */

/* Laurence "No diminutives" */

local Laurens `" "Laurentius" "Llorenç" "Lovrenco" "Vavřinec" "Lars" "Laurits" "Lauritz" "Lorens" "Laurens" "Lourens" "Lauren" "Laurence" "Lawrence" "Laurent" "Laurenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Laurynas" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Laurens {
	replace ameriname = "Laurens" if fname == "`variant'"
}

local Laurens `" "Lovre" "Lovro" "Lasse" "Lau" "Rens" "Larrie" "Larry" "Laurie" "Lawrie" "Laz" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Lenz" "Loris" "Renzo" "Lor" "Larkin" "Law" "'
foreach diminutive of local Laurens {
	replace ameriname = "Laurens" if fname == "`diminutive'"
}

local Laurent `" "Laurentius" "Llorenç" "Lovrenco" "Vavřinec" "Lars" "Laurits" "Lauritz" "Lorens" "Laurens" "Lourens" "Lauren" "Laurence" "Lawrence" "Laurent" "Laurenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Laurynas" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Laurent {
	replace ameriname = "Laurent" if fname == "`variant'"
}

local Laurent `" "Lovre" "Lovro" "Lasse" "Lau" "Rens" "Larrie" "Larry" "Laurie" "Lawrie" "Laz" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Lenz" "Loris" "Renzo" "Lor" "Larkin" "Law" "'
foreach diminutive of local Laurent {
	replace ameriname = "Laurent" if fname == "`diminutive'"
}

local Lauri `" "Laurentius" "Llorenç" "Lovre" "Lovrenco" "Lovro" "Vavřinec" "Lars" "Lasse" "Laurits" "Lauritz" "Lorens" "Lau" "Laurens" "Lourens" "Rens" "Larrie" "Larry" "Lauren" "Laurence" "Laurie" "Lawrence" "Lawrie" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Laurent" "Laurenz" "Lenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Loris" "Renzo" "Lor" "Laurynas" "Larkin" "Law" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Lauri {
	replace ameriname = "Lauri" if fname == "`variant'"
}

local Lauri `" "Laz" "'
foreach diminutive of local Lauri {
	replace ameriname = "Lauri" if fname == "`diminutive'"
}

local Laurits `" "Laurentius" "Llorenç" "Lovrenco" "Vavřinec" "Lars" "Laurits" "Lauritz" "Lorens" "Laurens" "Lourens" "Lauren" "Laurence" "Lawrence" "Laurent" "Laurenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Laurynas" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Laurits {
	replace ameriname = "Laurits" if fname == "`variant'"
}

local Laurits `" "Lovre" "Lovro" "Lasse" "Lau" "Rens" "Larrie" "Larry" "Laurie" "Lawrie" "Laz" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Lenz" "Loris" "Renzo" "Lor" "Larkin" "Law" "'
foreach diminutive of local Laurits {
	replace ameriname = "Laurits" if fname == "`diminutive'"
}

local Lauritz `" "Laurentius" "Llorenç" "Lovrenco" "Vavřinec" "Lars" "Laurits" "Lauritz" "Lorens" "Laurens" "Lourens" "Lauren" "Laurence" "Lawrence" "Laurent" "Laurenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Laurynas" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Lauritz {
	replace ameriname = "Lauritz" if fname == "`variant'"
}

local Lauritz `" "Lovre" "Lovro" "Lasse" "Lau" "Rens" "Larrie" "Larry" "Laurie" "Lawrie" "Laz" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Lenz" "Loris" "Renzo" "Lor" "Larkin" "Law" "'
foreach diminutive of local Lauritz {
	replace ameriname = "Lauritz" if fname == "`diminutive'"
}

/* Laverio "No equivalents" */

/* Laverio "No diminutives" */

local Lazaros `" "Eleazar" "Lazaros" "'El'azar" "Lazarus" "Lazar" "Lazare" "Lázár" "Lazzaro" "Elazar" "'
foreach variant of local Lazaros {
	replace ameriname = "Lazaros" if fname == "`variant'"
}

/* Lazaros "No diminutives" */

local Lazarus `" "Eleazar" "Lazaros" "'El'azar" "Lazarus" "Lazar" "Lazare" "Lázár" "Lazzaro" "Elazar" "'
foreach variant of local Lazarus {
	replace ameriname = "Lazarus" if fname == "`variant'"
}

/* Lazarus "No diminutives" */

/* Lazo "No equivalents" */

/* Lazo "No diminutives" */

local Lazzaro `" "Eleazar" "Lazaros" "'El'azar" "Lazarus" "Lazar" "Lazare" "Lázár" "Lazzaro" "Elazar" "'
foreach variant of local Lazzaro {
	replace ameriname = "Lazzaro" if fname == "`variant'"
}

/* Lazzaro "No diminutives" */

local Leander `" "Léandre" "Leander" "Leandros" "Leandro" "'
foreach variant of local Leander {
	replace ameriname = "Leander" if fname == "`variant'"
}

/* Leander "No diminutives" */

local Leandro `" "Léandre" "Leander" "Leandros" "Leandro" "'
foreach variant of local Leandro {
	replace ameriname = "Leandro" if fname == "`variant'"
}

/* Leandro "No diminutives" */

/* Leendert "No equivalents" */

/* Leendert "No diminutives" */

/* Leiba "No equivalents" */

/* Leiba "No diminutives" */

/* Leibel "No equivalents" */

/* Leibel "No diminutives" */

/* Leibisch "No equivalents" */

/* Leibisch "No diminutives" */

/* Leibusch "No equivalents" */

/* Leibusch "No diminutives" */

/* Leie "No equivalents" */

/* Leie "No diminutives" */

local Leif `" "Leifr" "Leif" "Leifur" "Leiv" "'
foreach variant of local Leif {
	replace ameriname = "Leif" if fname == "`variant'"
}

/* Leif "No diminutives" */

/* Leil "No equivalents" */

/* Leil "No diminutives" */

/* Leile "No equivalents" */

/* Leile "No diminutives" */

/* Leisor "No equivalents" */

/* Leisor "No diminutives" */

/* Lejb "No equivalents" */

/* Lejb "No diminutives" */

/* Lejba "No equivalents" */

/* Lejba "No diminutives" */

/* Lejzer "No equivalents" */

/* Lejzer "No diminutives" */

/* Lejzor "No equivalents" */

/* Lejzor "No diminutives" */

local Lennart `" "Leonard" "Lennart" "Lenard" "Lennard" "Léonard" "Leonhard" "Leonardo" "Lenart" "'
foreach variant of local Lennart {
	replace ameriname = "Lennart" if fname == "`variant'"
}

local Lennart `" "Len" "Lennie" "Lenny" "Lelle" "'
foreach diminutive of local Lennart {
	replace ameriname = "Lennart" if fname == "`diminutive'"
}

/* Leoluca "No equivalents" */

/* Leoluca "No diminutives" */

/* Leonardus "No equivalents" */

/* Leonardus "No diminutives" */

/* Leone "No equivalents" */

/* Leone "No diminutives" */

/* Leonello "No equivalents" */

/* Leonello "No diminutives" */

local Leonhard `" "Leonard" "Lennart" "Lenard" "Lennard" "Léonard" "Leonhard" "Leonardo" "Lenart" "'
foreach variant of local Leonhard {
	replace ameriname = "Leonhard" if fname == "`variant'"
}

local Leonhard `" "Len" "Lennie" "Lenny" "Lelle" "'
foreach diminutive of local Leonhard {
	replace ameriname = "Leonhard" if fname == "`diminutive'"
}

local Leonidas `" "Leon" "Leonidas" "Leontios" "Leontius" "Levon" "Leo" "Leoš" "Léo" "Léon" "Léonce" "Léonide" "Levan" "Leone" "Leonida" "Leonzio" "Leonas" "Lew" "Leonid" "Leonti" "Leontiy" "Leonty" "Lev" "Lyov" "León" "Leoncio" "'
foreach variant of local Leonidas {
	replace ameriname = "Leonidas" if fname == "`variant'"
}

local Leonidas `" "Lionel" "'
foreach diminutive of local Leonidas {
	replace ameriname = "Leonidas" if fname == "`diminutive'"
}

local Lester `" "Lester" "'
foreach variant of local Lester {
	replace ameriname = "Lester" if fname == "`variant'"
}

local Lester `" "Les" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Lester {
	replace ameriname = "Lester" if fname == "`diminutive'"
}

/* Letterio "No equivalents" */

/* Letterio "No diminutives" */

/* Lev "No equivalents" */

/* Lev "No diminutives" */

local Levi `" "Leui" "Lewi" "Levi" "Leevi" "'
foreach variant of local Levi {
	replace ameriname = "Levi" if fname == "`variant'"
}

/* Levi "No diminutives" */

local Levon `" "Leon" "Leonidas" "Leontios" "Leontius" "Levon" "Leo" "Leoš" "Léo" "Léon" "Léonce" "Léonide" "Levan" "Leone" "Leonida" "Leonzio" "Leonas" "Lew" "Leonid" "Leonti" "Leontiy" "Leonty" "Lev" "Lyov" "León" "Leoncio" "'
foreach variant of local Levon {
	replace ameriname = "Levon" if fname == "`variant'"
}

local Levon `" "Lionel" "'
foreach diminutive of local Levon {
	replace ameriname = "Levon" if fname == "`diminutive'"
}

/* Levy "No equivalents" */

/* Levy "No diminutives" */

local Lew `" "Leon" "Leonidas" "Leontios" "Leontius" "Levon" "Leo" "Leoš" "Léo" "Léon" "Léonce" "Léonide" "Levan" "Leone" "Leonida" "Leonzio" "Leonas" "Lew" "Leonid" "Leonti" "Leontiy" "Leonty" "Lev" "Lyov" "León" "Leoncio" "'
foreach variant of local Lew {
	replace ameriname = "Lew" if fname == "`variant'"
}

local Lew `" "Lionel" "'
foreach diminutive of local Lew {
	replace ameriname = "Lew" if fname == "`diminutive'"
}

local Lewi `" "Leui" "Lewi" "Levi" "Leevi" "'
foreach variant of local Lewi {
	replace ameriname = "Lewi" if fname == "`variant'"
}

/* Lewi "No diminutives" */

/* Lewy "No equivalents" */

/* Lewy "No diminutives" */

/* Libe "No equivalents" */

/* Libe "No diminutives" */

/* Liberato "No equivalents" */

/* Liberato "No diminutives" */

/* Libero "No equivalents" */

/* Libero "No diminutives" */

local Liborio `" "Liborio" "Liborius" "'
foreach variant of local Liborio {
	replace ameriname = "Liborio" if fname == "`variant'"
}

/* Liborio "No diminutives" */

/* Lieb "No equivalents" */

/* Lieb "No diminutives" */

/* Liebe "No equivalents" */

/* Liebe "No diminutives" */

/* Limche "No equivalents" */

/* Limche "No diminutives" */

local Lino `" "Linos" "Linus" "Lino" "Linas" "'
foreach variant of local Lino {
	replace ameriname = "Lino" if fname == "`variant'"
}

/* Lino "No diminutives" */

local Lionel `" "Leon" "Leonidas" "Leontios" "Leontius" "Levon" "Leo" "Leoš" "Lionel" "Levan" "Leone" "Leonida" "Leonzio" "Leonas" "Lew" "Leonid" "Leonti" "Leontiy" "Leonty" "Lev" "Lyov" "León" "Leoncio" "'
foreach variant of local Lionel {
	replace ameriname = "Lionel" if fname == "`variant'"
}

/* Lionel "No diminutives" */

/* Lipa "No equivalents" */

/* Lipa "No diminutives" */

/* Lipe "No equivalents" */

/* Lipe "No diminutives" */

/* Lipman "No equivalents" */

/* Lipman "No diminutives" */

/* Lippe "No equivalents" */

/* Lippe "No diminutives" */

/* Litman "No equivalents" */

/* Litman "No diminutives" */

/* Liugi "No equivalents" */

/* Liugi "No diminutives" */

local Livio `" "Livius" "Livy" "Livio" "Liviu" "'
foreach variant of local Livio {
	replace ameriname = "Livio" if fname == "`variant'"
}

/* Livio "No diminutives" */

local Llewellyn `" "Leolin" "Llewellyn" "Llewelyn" "Llywellyn" "Llywelyn" "'
foreach variant of local Llewellyn {
	replace ameriname = "Llewellyn" if fname == "`variant'"
}

local Llewellyn `" "Llew" "'
foreach diminutive of local Llewellyn {
	replace ameriname = "Llewellyn" if fname == "`diminutive'"
}

local Lloyd `" "Floyd" "Lloyd" "'
foreach variant of local Lloyd {
	replace ameriname = "Lloyd" if fname == "`variant'"
}

/* Lloyd "No diminutives" */

local Lodovico `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Lodovico {
	replace ameriname = "Lodovico" if fname == "`variant'"
}

local Lodovico `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Lodovico {
	replace ameriname = "Lodovico" if fname == "`diminutive'"
}

local Loren `" "Laurentia" "Laurentius" "Llorenç" "Lovre" "Lovrenco" "Lovro" "Vavřinec" "Lars" "Lasse" "Laurits" "Lauritz" "Lorens" "Lau" "Laurens" "Lourens" "Rens" "Larrie" "Larry" "Laryn" "Lauren" "Laurena" "Laurencia" "Laurie" "Lauryn" "Lawrie" "Loren" "Lorena" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Laurence" "Laurent" "Laurenz" "Lenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenza" "Lorenzo" "Loris" "Renzo" "Lor" "Laurynas" "Larkin" "Law" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Loren {
	replace ameriname = "Loren" if fname == "`variant'"
}

local Loren `" "Laz" "MASCULINE FORMS" "Laurentius" "Llorenç" "Lovre" "Lovrenco" "Lovro" "Vavřinec" "Lars" "Lasse" "Laurits" "Lauritz" "Lorens" "Lau" "Laurens" "Lourens" "Rens" "Larrie" "Larry" "Lauren" "Laurence" "Laurie" "Lawrence" "Lawrie" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Laurent" "Laurenz" "Lenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Loris" "Renzo" "Lor" "Laurynas" "Larkin" "Law" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach diminutive of local Loren {
	replace ameriname = "Loren" if fname == "`diminutive'"
}

/* Lorenso "No equivalents" */

/* Lorenso "No diminutives" */

/* Lorentz "No equivalents" */

/* Lorentz "No diminutives" */

local Lorenz `" "Laurentius" "Llorenç" "Lovrenco" "Vavřinec" "Lars" "Laurits" "Lauritz" "Lorens" "Laurens" "Lourens" "Lauren" "Laurence" "Lawrence" "Laurent" "Laurenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Laurynas" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Lorenz {
	replace ameriname = "Lorenz" if fname == "`variant'"
}

local Lorenz `" "Lovre" "Lovro" "Lasse" "Lau" "Rens" "Larrie" "Larry" "Laurie" "Lawrie" "Laz" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Lenz" "Loris" "Renzo" "Lor" "Larkin" "Law" "'
foreach diminutive of local Lorenz {
	replace ameriname = "Lorenz" if fname == "`diminutive'"
}

local Louise `" "Alojzija" "Louise" "Lovise" "Louisa" "Loviise" "Loviisa" "Aloisia" "Luise" "Louiza" "Lujza" "Ludovica" "Luigia" "Luisa" "Liudvika" "Ruiha" "Ludwika" "Luiza" "Luísa" "Alojzia" "Lovisa" "'
foreach variant of local Louise {
	replace ameriname = "Louise" if fname == "`variant'"
}

local Louise `" "Loes" "Lou" "Louella" "Luella" "Lula" "Louisette" "Lulu" "Gina" "Luigina" "Luisella" "Luisina" "Luisita" "MASCULINE FORMS" "Chlodovech" "Clodovicus" "Clovis" "Hludowig" "Ludovicus" "Koldo" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Luděk" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Lowie" "Ludo" "Aloysius" "Lewis" "Louie" "Luĉjo" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Lutz" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Gino" "Lodovico" "Ludovico" "Luigi" "Luigino" "Vico" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Luisinho" "Alojzij" "Lojze" "Ludvik" "Lucho" "Luis" "Love" "Ludde" "'
foreach diminutive of local Louise {
	replace ameriname = "Louise" if fname == "`diminutive'"
}

/* Lowe "No equivalents" */

/* Lowe "No diminutives" */

/* Luca "No equivalents" */

/* Luca "No diminutives" */

local Lucas `" "Loukas" "Lucas" "Luke" "Lluc" "Luka" "Lukáš" "Lukas" "Luuk" "Luukas" "Luc" "Luca" "Lukács" "Lúcás" "Łukasz" "'
foreach variant of local Lucas {
	replace ameriname = "Lucas" if fname == "`variant'"
}

local Lucas `" "Lucky" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Lucas {
	replace ameriname = "Lucas" if fname == "`diminutive'"
}

local Lucia `" "Lucia" "Llúcia" "Luca" "Lucija" "Lucie" "Luus" "Lucinda" "Lucy" "Luce" "Lucinde" "Luzia" "Lūcija" "Liucija" "Łucja" "Lucja" "Lúcia" "Liùsaidh" "Lucía" "Lleucu" "'
foreach variant of local Lucia {
	replace ameriname = "Lucia" if fname == "`variant'"
}

local Lucia `" "Lucilla" "Lucetta" "Lucile" "Lucille" "Lucette" "Lucila" "MASCULINE FORMS" "Loukios" "Lucius" "Lucio" "Lucjusz" "Lúcio" "'
foreach diminutive of local Lucia {
	replace ameriname = "Lucia" if fname == "`diminutive'"
}

local Lucian `" "Loukianos" "Lucianus" "Luken" "Lucijan" "Lucian" "Lucien" "Luciano" "Łucjan" "Lucjan" "'
foreach variant of local Lucian {
	replace ameriname = "Lucian" if fname == "`variant'"
}

/* Lucian "No diminutives" */

local Lucien `" "Loukianos" "Lucianus" "Luken" "Lucijan" "Lucian" "Lucien" "Luciano" "Łucjan" "Lucjan" "'
foreach variant of local Lucien {
	replace ameriname = "Lucien" if fname == "`variant'"
}

/* Lucien "No diminutives" */

local Lucio `" "Loukios" "Lucius" "Lucio" "Lucjusz" "Lúcio" "'
foreach variant of local Lucio {
	replace ameriname = "Lucio" if fname == "`variant'"
}

/* Lucio "No diminutives" */

local Ludovico `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Ludovico {
	replace ameriname = "Ludovico" if fname == "`variant'"
}

local Ludovico `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Ludovico {
	replace ameriname = "Ludovico" if fname == "`diminutive'"
}

local Ludvig `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Ludvig {
	replace ameriname = "Ludvig" if fname == "`variant'"
}

local Ludvig `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Ludvig {
	replace ameriname = "Ludvig" if fname == "`diminutive'"
}

local Ludvik `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Ludvik {
	replace ameriname = "Ludvik" if fname == "`variant'"
}

local Ludvik `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Ludvik {
	replace ameriname = "Ludvik" if fname == "`diminutive'"
}

/* Luige "No equivalents" */

/* Luige "No diminutives" */

local LUIGI `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local LUIGI {
	replace ameriname = "LUIGI" if fname == "`variant'"
}

local LUIGI `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local LUIGI {
	replace ameriname = "LUIGI" if fname == "`diminutive'"
}

local Luigia `" "Alojzija" "Louise" "Lovise" "Louisa" "Loviise" "Loviisa" "Aloisia" "Luise" "Louiza" "Lujza" "Ludovica" "Luigia" "Luisa" "Liudvika" "Ruiha" "Ludwika" "Luiza" "Luísa" "Alojzia" "Lovisa" "'
foreach variant of local Luigia {
	replace ameriname = "Luigia" if fname == "`variant'"
}

local Luigia `" "Loes" "Lou" "Louella" "Luella" "Lula" "Louisette" "Lulu" "Gina" "Luigina" "Luisella" "Luisina" "Luisita" "MASCULINE FORMS" "Chlodovech" "Clodovicus" "Clovis" "Hludowig" "Ludovicus" "Koldo" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Luděk" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Lowie" "Ludo" "Aloysius" "Lewis" "Louie" "Luĉjo" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Lutz" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Gino" "Lodovico" "Ludovico" "Luigi" "Luigino" "Vico" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Luisinho" "Alojzij" "Lojze" "Ludvik" "Lucho" "Luis" "Love" "Ludde" "'
foreach diminutive of local Luigia {
	replace ameriname = "Luigia" if fname == "`diminutive'"
}

local Luigino `" "Chlodovech" "Clodovicus" "Clovis" "Hludowig" "Ludovicus" "Koldo" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Luděk" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Lowie" "Ludo" "Aloysius" "Lewis" "Lou" "Louie" "Luĉjo" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Lutz" "Alajos" "Lajos" "Lúðvík" "Alaois" "Luigino" "Vico" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Luisinho" "Alojzij" "Lojze" "Ludvik" "Lucho" "Luis" "Love" "Ludde" "'
foreach variant of local Luigino {
	replace ameriname = "Luigino" if fname == "`variant'"
}

local Luigino `" "Gino" "'
foreach diminutive of local Luigino {
	replace ameriname = "Luigino" if fname == "`diminutive'"
}

/* Luigio "No equivalents" */

/* Luigio "No diminutives" */

local Luisa `" "Alojzija" "Louise" "Lovise" "Louisa" "Loviise" "Loviisa" "Aloisia" "Luise" "Louiza" "Lujza" "Ludovica" "Luigia" "Luisa" "Liudvika" "Ruiha" "Ludwika" "Luiza" "Luísa" "Alojzia" "Lovisa" "'
foreach variant of local Luisa {
	replace ameriname = "Luisa" if fname == "`variant'"
}

local Luisa `" "Loes" "Lou" "Louella" "Luella" "Lula" "Louisette" "Lulu" "Gina" "Luigina" "Luisella" "Luisina" "Luisita" "MASCULINE FORMS" "Chlodovech" "Clodovicus" "Clovis" "Hludowig" "Ludovicus" "Koldo" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Luděk" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Lowie" "Ludo" "Aloysius" "Lewis" "Louie" "Luĉjo" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Lutz" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Gino" "Lodovico" "Ludovico" "Luigi" "Luigino" "Vico" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Luisinho" "Alojzij" "Lojze" "Ludvik" "Lucho" "Luis" "Love" "Ludde" "'
foreach diminutive of local Luisa {
	replace ameriname = "Luisa" if fname == "`diminutive'"
}

local Luiz `" "Chlodovech" "Clodovicus" "Hludowig" "Ludovicus" "Koldobika" "Loïc" "Lluís" "Alojz" "Alojzije" "Alois" "Ludvík" "Ludvig" "Lodewijk" "Louis" "Aloysius" "Lewis" "Ludoviko" "Ludovic" "Lois" "Ludwig" "Alajos" "Lajos" "Lúðvík" "Alaois" "Aloisio" "Alvise" "Lodovico" "Ludovico" "Luigi" "Ludis" "Ludvigs" "Liudvikas" "Aloys" "Loís" "Alojzy" "Ludwik" "Luiz" "Aloísio" "Luís" "Alojzij" "Ludvik" "Luis" "'
foreach variant of local Luiz {
	replace ameriname = "Luiz" if fname == "`variant'"
}

local Luiz `" "Clovis" "Koldo" "Luděk" "Lowie" "Ludo" "Lou" "Louie" "Luĉjo" "Lutz" "Gino" "Luigino" "Vico" "Luisinho" "Lojze" "Lucho" "Love" "Ludde" "'
foreach diminutive of local Luiz {
	replace ameriname = "Luiz" if fname == "`diminutive'"
}

local Luka `" "Loukas" "Lucas" "Luke" "Lluc" "Luka" "Lukáš" "Lukas" "Luuk" "Luukas" "Luc" "Luca" "Lukács" "Lúcás" "Łukasz" "'
foreach variant of local Luka {
	replace ameriname = "Luka" if fname == "`variant'"
}

local Luka `" "Lucky" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Luka {
	replace ameriname = "Luka" if fname == "`diminutive'"
}

local Lukas `" "Loukas" "Lucas" "Luke" "Lluc" "Luka" "Lukáš" "Lukas" "Luuk" "Luukas" "Luc" "Luca" "Lukács" "Lúcás" "Łukasz" "'
foreach variant of local Lukas {
	replace ameriname = "Lukas" if fname == "`variant'"
}

local Lukas `" "Lucky" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Lukas {
	replace ameriname = "Lukas" if fname == "`diminutive'"
}

local Luke `" "Loukas" "Lucas" "Luke" "Lluc" "Luka" "Lukáš" "Lukas" "Luuk" "Luukas" "Luc" "Luca" "Lukács" "Lúcás" "Łukasz" "'
foreach variant of local Luke {
	replace ameriname = "Luke" if fname == "`variant'"
}

local Luke `" "Lucky" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Luke {
	replace ameriname = "Luke" if fname == "`diminutive'"
}

/* Lupu "No equivalents" */

/* Lupu "No diminutives" */

/* Luzer "No equivalents" */

/* Luzer "No diminutives" */

/* M "No equivalents" */

/* M "No diminutives" */

/* Ma "No equivalents" */

/* Ma "No diminutives" */

local Maarten `" "Martinus" "Mattin" "Martin" "Martí" "Morten" "Maarten" "Marten" "Martijn" "Martti" "Merten" "Márton" "Máirtín" "Martino" "Martynas" "Marcin" "Martim" "Martinho" "Mars" "Martín" "Mårten" "Martyn" "'
foreach variant of local Maarten {
	replace ameriname = "Maarten" if fname == "`variant'"
}

local Maarten `" "Matxin" "Tin" "Tijn" "Martie" "Marty" "Tino" "Tine" "Tinek" "'
foreach diminutive of local Maarten {
	replace ameriname = "Maarten" if fname == "`diminutive'"
}

local Maciej `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Maciej {
	replace ameriname = "Maciej" if fname == "`variant'"
}

local Maciej `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Maciej {
	replace ameriname = "Maciej" if fname == "`diminutive'"
}

local Mads `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Mate" "Matej" "Mateo" "Matija" "Matko" "Mato" "Matěj" "Matouš" "Matyáš" "Mads" "Matthijs" "Thijs" "Ties" "Mat" "Mathew" "Matt" "Mattie" "Matty" "Matias" "Matti" "Matéo" "Mathéo" "Mathias" "Mathieu" "Mathis" "Mathys" "Matthieu" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Mats" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Motya" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Tjaž" "Matías" "'
foreach variant of local Mads {
	replace ameriname = "Mads" if fname == "`variant'"
}

/* Mads "No diminutives" */

/* Maggiorino "No equivalents" */

/* Maggiorino "No diminutives" */

local Magnus `" "Magnus" "Mogens" "Manu" "Mauno" "Maunu" "Mághnus" "Manus" "Magne" "'
foreach variant of local Magnus {
	replace ameriname = "Magnus" if fname == "`variant'"
}

local Magnus `" "Mack" "'
foreach diminutive of local Magnus {
	replace ameriname = "Magnus" if fname == "`diminutive'"
}

/* Maier "No equivalents" */

/* Maier "No diminutives" */

/* Maische "No equivalents" */

/* Maische "No diminutives" */

/* Majer "No equivalents" */

/* Majer "No diminutives" */

local Maks `" "Maximus" "Maksim" "Maxim" "Maxime" "Massimo" "Maksym" "Maks" "Máximo" "Macsen" "Maxen" "'
foreach variant of local Maks {
	replace ameriname = "Maks" if fname == "`variant'"
}

/* Maks "No diminutives" */

local Malcolm `" "Malcolm" "Malcom" "Máel Coluim" "'
foreach variant of local Malcolm {
	replace ameriname = "Malcolm" if fname == "`variant'"
}

/* Malcolm "No diminutives" */

/* Malke "No equivalents" */

/* Malke "No diminutives" */

/* Malvin "No equivalents" */

/* Malvin "No diminutives" */

/* Mandel "No equivalents" */

/* Mandel "No diminutives" */

/* Mane "No equivalents" */

/* Mane "No diminutives" */

/* Manes "No equivalents" */

/* Manes "No diminutives" */

local Manfred `" "Meginfrid" "Manfred" "Manfried" "Manfredo" "'
foreach variant of local Manfred {
	replace ameriname = "Manfred" if fname == "`variant'"
}

local Manfred `" "Meino" "Meine" "Meint" "Menno" "Minke" "Fred" "'
foreach diminutive of local Manfred {
	replace ameriname = "Manfred" if fname == "`diminutive'"
}

local Manfredo `" "Meginfrid" "Manfred" "Manfried" "Manfredo" "'
foreach variant of local Manfredo {
	replace ameriname = "Manfredo" if fname == "`variant'"
}

local Manfredo `" "Meino" "Meine" "Meint" "Menno" "Minke" "Fred" "'
foreach diminutive of local Manfredo {
	replace ameriname = "Manfredo" if fname == "`diminutive'"
}

local Manlio `" "Manlius" "'
foreach variant of local Manlio {
	replace ameriname = "Manlio" if fname == "`variant'"
}

/* Manlio "No diminutives" */

/* Mano "No equivalents" */

/* Mano "No diminutives" */

/* Manro "No equivalents" */

/* Manro "No diminutives" */

/* Mansour "No equivalents" */

/* Mansour "No diminutives" */

/* Mansueto "No equivalents" */

/* Mansueto "No diminutives" */

/* Manvel "No equivalents" */

/* Manvel "No diminutives" */

local Marc `" "Markos" "Marcus" "Marko" "Mark" "Marc" "Margh" "Marek" "Markus" "Marco" "Markku" "Maleko" "Márk" "Marcas" "Markuss" "Marcos" "Mars" "'
foreach variant of local Marc {
	replace ameriname = "Marc" if fname == "`variant'"
}

local Marc `" "Marquinhos" "'
foreach diminutive of local Marc {
	replace ameriname = "Marc" if fname == "`diminutive'"
}

local Marcelino `" "Marcellinus" "Marcellin" "Marcellino" "Marcelino" "'
foreach variant of local Marcelino {
	replace ameriname = "Marcelino" if fname == "`variant'"
}

local Marcelino `" "Celino" "'
foreach diminutive of local Marcelino {
	replace ameriname = "Marcelino" if fname == "`diminutive'"
}

local Marcelle `" "Marcella" "Marcela" "Marcelle" "Marsaili" "'
foreach variant of local Marcelle {
	replace ameriname = "Marcelle" if fname == "`variant'"
}

local Marcelle `" "Marcellette" "Zella" "MASCULINE FORMS" "Marcellus" "Martzel" "Marcel" "Ceel" "Marcell" "Marzell" "Marcello" "Marceli" "Marcelinho" "Marcelo" "'
foreach diminutive of local Marcelle {
	replace ameriname = "Marcelle" if fname == "`diminutive'"
}

local Marcellino `" "Marcellinus" "Marcellin" "Marcellino" "Marcelino" "'
foreach variant of local Marcellino {
	replace ameriname = "Marcellino" if fname == "`variant'"
}

local Marcellino `" "Celino" "'
foreach diminutive of local Marcellino {
	replace ameriname = "Marcellino" if fname == "`diminutive'"
}

local Marcello `" "Marcellus" "Martzel" "Marcel" "Marcell" "Marzell" "Marcello" "Marceli" "Marcelo" "'
foreach variant of local Marcello {
	replace ameriname = "Marcello" if fname == "`variant'"
}

local Marcello `" "Ceel" "Marcelinho" "'
foreach diminutive of local Marcello {
	replace ameriname = "Marcello" if fname == "`diminutive'"
}

local Marciano `" "Marcianus" "Marciano" "'
foreach variant of local Marciano {
	replace ameriname = "Marciano" if fname == "`variant'"
}

/* Marciano "No diminutives" */

local Marcin `" "Martinus" "Mattin" "Martin" "Martí" "Morten" "Maarten" "Marten" "Martijn" "Martti" "Merten" "Márton" "Máirtín" "Martino" "Martynas" "Marcin" "Martim" "Martinho" "Mars" "Martín" "Mårten" "Martyn" "'
foreach variant of local Marcin {
	replace ameriname = "Marcin" if fname == "`variant'"
}

local Marcin `" "Matxin" "Tin" "Tijn" "Martie" "Marty" "Tino" "Tine" "Tinek" "'
foreach diminutive of local Marcin {
	replace ameriname = "Marcin" if fname == "`diminutive'"
}

local Marcos `" "Markos" "Marcus" "Marko" "Mark" "Marc" "Margh" "Marek" "Markus" "Marco" "Markku" "Maleko" "Márk" "Marcas" "Markuss" "Marcos" "Mars" "'
foreach variant of local Marcos {
	replace ameriname = "Marcos" if fname == "`variant'"
}

local Marcos `" "Marquinhos" "'
foreach diminutive of local Marcos {
	replace ameriname = "Marcos" if fname == "`diminutive'"
}

/* Marcu "No equivalents" */

/* Marcu "No diminutives" */

/* Mardiros "No equivalents" */

/* Mardiros "No diminutives" */

local Maren `" "Marina" "Maren" "Marijn" "Marine" "'
foreach variant of local Maren {
	replace ameriname = "Maren" if fname == "`variant'"
}

local Maren `" "Marinela" "Marinka" "Marna" "Rina" "Rini" "Riny" "Marnie" "Ina" "Marinella" "MASCULINE FORMS" "Marinus" "Marin" "Marinko" "Marijn" "Rien" "Rinus" "Marinos" "Marino" "'
foreach diminutive of local Maren {
	replace ameriname = "Maren" if fname == "`diminutive'"
}

local Mariam `" "Mariam" "Maryam" "Maria" "Miren" "Maryia" "Miriam" "Mary" "Mari" "Mariya" "Mara" "Marija" "Marie" "Marja" "Marjo" "Mirjam" "Maleah" "Maralyn" "Maree" "Mariah" "Marilyn" "Marilynn" "Marlyn" "Marylyn" "Maura" "Merilyn" "Merrilyn" "Moira" "Mora" "Maarja" "Maaria" "Marjaana" "Mirjami" "Myriam" "María" "Mariami" "Meri" "Malia" "Mele" "Mariamne" "Mária" "Máire" "Moyra" "Marianna" "Moirrey" "Voirrey" "Mere" "Mariana" "Marya" "Márjá" "Màiri" "Meryem" "Mair" "Mairwen" "'
foreach variant of local Mariam {
	replace ameriname = "Mariam" if fname == "`variant'"
}

local Mariam `" "Maia" "Mariona" "Ona" "Maja" "Mare" "Marica" "Marijeta" "Maša" "Mojca" "Madlenka" "Marika" "Máša" "Maiken" "Majken" "Marianne" "Mia" "Jet" "Maaike" "Manon" "Marieke" "Mariëlle" "Mariëtte" "Marijke" "Marijse" "Marike" "Mariska" "Marita" "Marjan" "Meike" "Mieke" "Miep" "Mies" "Ria" "Mae" "Mamie" "Marian" "Mariel" "Marinda" "Marion" "Maureen" "Maurene" "Maurine" "May" "Mayme" "Mimi" "Mo" "Mollie" "Molly" "Moreen" "Mya" "Pollie" "Polly" "Reenie" "Maarika" "Jaana" "Maija" "Mari" "Maritta" "Marjatta" "Marjukka" "Marjut" "Miia" "Mirja" "Marielle" "Mariette" "Marise" "Maike" "Mareike" "Mariele" "Mitzi" "Mæja" "Mairenn" "Máirín" "Mallaidh" "Mariella" "Marietta" "Malle" "Molle" "Maryla" "Marzena" "Marianita" "Mariazinha" "Manya" "Maryana" "Masha" "Maritza" "My" "Mirele" "'
foreach diminutive of local Mariam {
	replace ameriname = "Mariam" if fname == "`diminutive'"
}

/* Marian "No equivalents" */

/* Marian "No diminutives" */

local Marianna `" "Mariana" "Mariam" "Maryam" "Maria" "Miren" "Maryia" "Miriam" "Mary" "Mari" "Mariya" "Mara" "Marija" "Marijana" "Marjana" "Marie" "Marja" "Marjo" "Mirjam" "Marianna" "Maarja" "Maaria" "Marjaana" "Mirjami" "Myriam" "María" "Mariami" "Meri" "Malia" "Mele" "Mariamne" "Máire" "Maura" "Moira" "Moyra" "Marijona" "Moirrey" "Voirrey" "Mere" "Marzanna" "Marya" "Márjá" "Màiri" "Meryem" "Mair" "Mairwen" "Meiriona" "'
foreach variant of local Marianna {
	replace ameriname = "Marianna" if fname == "`variant'"
}

local Marianna `" "Maia" "Mariona" "Ona" "Maja" "Mare" "Marica" "Marijeta" "Maša" "Mojca" "Madlenka" "Marika" "Máša" "Maiken" "Majken" "Marianne" "Mia" "Jet" "Maaike" "Manon" "Marieke" "Mariëlle" "Mariëtte" "Marijke" "Marijse" "Marike" "Mariska" "Marita" "Marjan" "Meike" "Mieke" "Miep" "Mies" "Ria" "Maarika" "Jaana" "Maija" "Mari" "Maritta" "Marjatta" "Marjukka" "Marjut" "Miia" "Mirja" "Marielle" "Mariette" "Marion" "Marise" "Maike" "Mareike" "Mariele" "Mitzi" "Mæja" "Mairenn" "Máirín" "Mallaidh" "Maureen" "Maurine" "Mariella" "Marietta" "Mimi" "Malle" "Molle" "Marianita" "Mariazinha" "Manya" "Maryana" "Masha" "Maritza" "My" "Mirele" "MASCULINE FORMS" "Marianus" "Marijan" "Marián" "Marian" "Mariano" "Meirion" "Merrion" "'
foreach diminutive of local Marianna {
	replace ameriname = "Marianna" if fname == "`diminutive'"
}

/* Marianno "No equivalents" */

/* Marianno "No diminutives" */

local Marie `" "Mariam" "Maryam" "Maria" "Miren" "Maryia" "Miriam" "Mary" "Mari" "Mariya" "Mara" "Marija" "Marie" "Marja" "Marjo" "Mirjam" "Maleah" "Maralyn" "Maree" "Mariah" "Marilyn" "Marilynn" "Marlyn" "Marylyn" "Maura" "Merilyn" "Merrilyn" "Moira" "Mora" "Maarja" "Maaria" "Marjaana" "Mirjami" "Myriam" "María" "Mariami" "Meri" "Malia" "Mele" "Mariamne" "Mária" "Máire" "Moyra" "Marianna" "Moirrey" "Voirrey" "Mere" "Mariana" "Marya" "Márjá" "Màiri" "Meryem" "Mair" "Mairwen" "'
foreach variant of local Marie {
	replace ameriname = "Marie" if fname == "`variant'"
}

local Marie `" "Maia" "Mariona" "Ona" "Maja" "Mare" "Marica" "Marijeta" "Maša" "Mojca" "Madlenka" "Marika" "Máša" "Maiken" "Majken" "Marianne" "Mia" "Jet" "Maaike" "Manon" "Marieke" "Mariëlle" "Mariëtte" "Marijke" "Marijse" "Marike" "Mariska" "Marita" "Marjan" "Meike" "Mieke" "Miep" "Mies" "Ria" "Mae" "Mamie" "Marian" "Mariel" "Marinda" "Marion" "Maureen" "Maurene" "Maurine" "May" "Mayme" "Mimi" "Mo" "Mollie" "Molly" "Moreen" "Mya" "Pollie" "Polly" "Reenie" "Maarika" "Jaana" "Maija" "Mari" "Maritta" "Marjatta" "Marjukka" "Marjut" "Miia" "Mirja" "Marielle" "Mariette" "Marise" "Maike" "Mareike" "Mariele" "Mitzi" "Mæja" "Mairenn" "Máirín" "Mallaidh" "Mariella" "Marietta" "Malle" "Molle" "Maryla" "Marzena" "Marianita" "Mariazinha" "Manya" "Maryana" "Masha" "Maritza" "My" "Mirele" "'
foreach diminutive of local Marie {
	replace ameriname = "Marie" if fname == "`diminutive'"
}

local Marin `" "Marinus" "Marin" "Marijn" "Marinos" "Marino" "'
foreach variant of local Marin {
	replace ameriname = "Marin" if fname == "`variant'"
}

local Marin `" "Marinko" "Rien" "Rini" "Rinus" "Riny" "'
foreach diminutive of local Marin {
	replace ameriname = "Marin" if fname == "`diminutive'"
}

/* Marion "No equivalents" */

/* Marion "No diminutives" */

/* Maritz "No equivalents" */

/* Maritz "No diminutives" */

local Marius `" "Marius" "Marijo" "Mario" "Marios" "Marijus" "Mariusz" "Mário" "Mars" "'
foreach variant of local Marius {
	replace ameriname = "Marius" if fname == "`variant'"
}

local Marius `" "Marinho" "'
foreach diminutive of local Marius {
	replace ameriname = "Marius" if fname == "`diminutive'"
}

/* Marjan "No equivalents" */

/* Marjan "No diminutives" */

local Mark `" "Markos" "Marcus" "Marko" "Mark" "Marc" "Margh" "Marek" "Markus" "Marco" "Markku" "Maleko" "Márk" "Marcas" "Markuss" "Marcos" "Mars" "'
foreach variant of local Mark {
	replace ameriname = "Mark" if fname == "`variant'"
}

local Mark `" "Marquinhos" "'
foreach diminutive of local Mark {
	replace ameriname = "Mark" if fname == "`diminutive'"
}

/* Marks "No equivalents" */

/* Marks "No diminutives" */

local Marshall `" "Marshal" "'
foreach variant of local Marshall {
	replace ameriname = "Marshall" if fname == "`variant'"
}

/* Marshall "No diminutives" */

local Marten `" "Martinus" "Mattin" "Martin" "Martí" "Morten" "Maarten" "Marten" "Martijn" "Martti" "Merten" "Márton" "Máirtín" "Martino" "Martynas" "Marcin" "Martim" "Martinho" "Mars" "Martín" "Mårten" "Martyn" "'
foreach variant of local Marten {
	replace ameriname = "Marten" if fname == "`variant'"
}

local Marten `" "Matxin" "Tin" "Tijn" "Martie" "Marty" "Tino" "Tine" "Tinek" "'
foreach diminutive of local Marten {
	replace ameriname = "Marten" if fname == "`diminutive'"
}

local Martinus `" "Martinus" "Mattin" "Martin" "Martí" "Morten" "Maarten" "Marten" "Martijn" "Martti" "Merten" "Márton" "Máirtín" "Martino" "Martynas" "Marcin" "Martim" "Martinho" "Mars" "Martín" "Mårten" "Martyn" "'
foreach variant of local Martinus {
	replace ameriname = "Martinus" if fname == "`variant'"
}

local Martinus `" "Matxin" "Tin" "Tijn" "Martie" "Marty" "Tino" "Tine" "Tinek" "'
foreach diminutive of local Martinus {
	replace ameriname = "Martinus" if fname == "`diminutive'"
}

/* Marton "No equivalents" */

/* Marton "No diminutives" */

local Martti `" "Martinus" "Mattin" "Martin" "Martí" "Morten" "Maarten" "Marten" "Martijn" "Martti" "Merten" "Márton" "Máirtín" "Martino" "Martynas" "Marcin" "Martim" "Martinho" "Mars" "Martín" "Mårten" "Martyn" "'
foreach variant of local Martti {
	replace ameriname = "Martti" if fname == "`variant'"
}

local Martti `" "Matxin" "Tin" "Tijn" "Martie" "Marty" "Tino" "Tine" "Tinek" "'
foreach diminutive of local Martti {
	replace ameriname = "Martti" if fname == "`diminutive'"
}

local Mary `" "Mariam" "Maryam" "Maria" "Miren" "Maryia" "Miriam" "Mary" "Mari" "Mariya" "Mara" "Marija" "Marie" "Marja" "Marjo" "Mirjam" "Maleah" "Maralyn" "Maree" "Mariah" "Marilyn" "Marilynn" "Marlyn" "Marylyn" "Maura" "Merilyn" "Merrilyn" "Moira" "Mora" "Maarja" "Maaria" "Marjaana" "Mirjami" "Myriam" "María" "Mariami" "Meri" "Malia" "Mele" "Mariamne" "Mária" "Máire" "Moyra" "Marianna" "Moirrey" "Voirrey" "Mere" "Mariana" "Marya" "Márjá" "Màiri" "Meryem" "Mair" "Mairwen" "'
foreach variant of local Mary {
	replace ameriname = "Mary" if fname == "`variant'"
}

local Mary `" "Maia" "Mariona" "Ona" "Maja" "Mare" "Marica" "Marijeta" "Maša" "Mojca" "Madlenka" "Marika" "Máša" "Maiken" "Majken" "Marianne" "Mia" "Jet" "Maaike" "Manon" "Marieke" "Mariëlle" "Mariëtte" "Marijke" "Marijse" "Marike" "Mariska" "Marita" "Marjan" "Meike" "Mieke" "Miep" "Mies" "Ria" "Mae" "Mamie" "Marian" "Mariel" "Marinda" "Marion" "Maureen" "Maurene" "Maurine" "May" "Mayme" "Mimi" "Mo" "Mollie" "Molly" "Moreen" "Mya" "Pollie" "Polly" "Reenie" "Maarika" "Jaana" "Maija" "Mari" "Maritta" "Marjatta" "Marjukka" "Marjut" "Miia" "Mirja" "Marielle" "Mariette" "Marise" "Maike" "Mareike" "Mariele" "Mitzi" "Mæja" "Mairenn" "Máirín" "Mallaidh" "Mariella" "Marietta" "Malle" "Molle" "Maryla" "Marzena" "Marianita" "Mariazinha" "Manya" "Maryana" "Masha" "Maritza" "My" "Mirele" "'
foreach diminutive of local Mary {
	replace ameriname = "Mary" if fname == "`diminutive'"
}

local Marya `" "Mariam" "Maryam" "Maria" "Miren" "Maryia" "Miriam" "Mary" "Mari" "Mariya" "Mara" "Marija" "Marie" "Marja" "Marjo" "Mirjam" "Maleah" "Maralyn" "Maree" "Mariah" "Marilyn" "Marilynn" "Marlyn" "Marylyn" "Maura" "Merilyn" "Merrilyn" "Moira" "Mora" "Maarja" "Maaria" "Marjaana" "Mirjami" "Myriam" "María" "Mariami" "Meri" "Malia" "Mele" "Mariamne" "Mária" "Máire" "Moyra" "Marianna" "Moirrey" "Voirrey" "Mere" "Mariana" "Marya" "Márjá" "Màiri" "Meryem" "Mair" "Mairwen" "'
foreach variant of local Marya {
	replace ameriname = "Marya" if fname == "`variant'"
}

local Marya `" "Maia" "Mariona" "Ona" "Maja" "Mare" "Marica" "Marijeta" "Maša" "Mojca" "Madlenka" "Marika" "Máša" "Maiken" "Majken" "Marianne" "Mia" "Jet" "Maaike" "Manon" "Marieke" "Mariëlle" "Mariëtte" "Marijke" "Marijse" "Marike" "Mariska" "Marita" "Marjan" "Meike" "Mieke" "Miep" "Mies" "Ria" "Mae" "Mamie" "Marian" "Mariel" "Marinda" "Marion" "Maureen" "Maurene" "Maurine" "May" "Mayme" "Mimi" "Mo" "Mollie" "Molly" "Moreen" "Mya" "Pollie" "Polly" "Reenie" "Maarika" "Jaana" "Maija" "Mari" "Maritta" "Marjatta" "Marjukka" "Marjut" "Miia" "Mirja" "Marielle" "Mariette" "Marise" "Maike" "Mareike" "Mariele" "Mitzi" "Mæja" "Mairenn" "Máirín" "Mallaidh" "Mariella" "Marietta" "Malle" "Molle" "Maryla" "Marzena" "Marianita" "Mariazinha" "Manya" "Maryana" "Masha" "Maritza" "My" "Mirele" "'
foreach diminutive of local Marya {
	replace ameriname = "Marya" if fname == "`diminutive'"
}

/* Maryan "No equivalents" */

/* Maryan "No diminutives" */

/* Masche "No equivalents" */

/* Masche "No diminutives" */

/* Mase "No equivalents" */

/* Mase "No diminutives" */

/* Massimino "No equivalents" */

/* Massimino "No diminutives" */

local Massimo `" "Maximus" "Maksim" "Maxim" "Maxime" "Massimo" "Maksym" "Máximo" "Macsen" "Maxen" "'
foreach variant of local Massimo {
	replace ameriname = "Massimo" if fname == "`variant'"
}

local Massimo `" "Maks" "'
foreach diminutive of local Massimo {
	replace ameriname = "Massimo" if fname == "`diminutive'"
}

local Massoud `" "Masood" "Masoud" "Mas'ud" "Mesud" "Massoud" "'
foreach variant of local Massoud {
	replace ameriname = "Massoud" if fname == "`variant'"
}

/* Massoud "No diminutives" */

/* Mast "No equivalents" */

/* Mast "No diminutives" */

/* Master "No equivalents" */

/* Master "No diminutives" */

local Mat `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Mate" "Matej" "Mateo" "Matija" "Matko" "Mato" "Matěj" "Matouš" "Matyáš" "Mads" "Mathias" "Matthijs" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Mats" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Motya" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Tjaž" "Matías" "'
foreach variant of local Mat {
	replace ameriname = "Mat" if fname == "`variant'"
}

/* Mat "No diminutives" */

local Matej `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Matej {
	replace ameriname = "Matej" if fname == "`variant'"
}

local Matej `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Matej {
	replace ameriname = "Matej" if fname == "`diminutive'"
}

/* Matel "No equivalents" */

/* Matel "No diminutives" */

local Mateo `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Mateo {
	replace ameriname = "Mateo" if fname == "`variant'"
}

local Mateo `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Mateo {
	replace ameriname = "Mateo" if fname == "`diminutive'"
}

/* Mates "No equivalents" */

/* Mates "No diminutives" */

local Mateus `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Mateus {
	replace ameriname = "Mateus" if fname == "`variant'"
}

local Mateus `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Mateus {
	replace ameriname = "Mateus" if fname == "`diminutive'"
}

/* Mathes "No equivalents" */

/* Mathes "No diminutives" */

local Matheus `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Matheus {
	replace ameriname = "Matheus" if fname == "`variant'"
}

local Matheus `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Matheus {
	replace ameriname = "Matheus" if fname == "`diminutive'"
}

local Mathew `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Mathew {
	replace ameriname = "Mathew" if fname == "`variant'"
}

local Mathew `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Mathew {
	replace ameriname = "Mathew" if fname == "`diminutive'"
}

local Mathys `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Mathys {
	replace ameriname = "Mathys" if fname == "`variant'"
}

local Mathys `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Mathys {
	replace ameriname = "Mathys" if fname == "`diminutive'"
}

local Matias `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Matias {
	replace ameriname = "Matias" if fname == "`variant'"
}

local Matias `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Matias {
	replace ameriname = "Matias" if fname == "`diminutive'"
}

local Matija `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Matija {
	replace ameriname = "Matija" if fname == "`variant'"
}

local Matija `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Matija {
	replace ameriname = "Matija" if fname == "`diminutive'"
}

/* Matis "No equivalents" */

/* Matis "No diminutives" */

local Mato `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Mate" "Matko" "Mato" "Matěj" "Matouš" "Matyáš" "Mads" "Mathias" "Matthijs" "Thijs" "Ties" "Mat" "Mathew" "Matt" "Mattie" "Matty" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matej" "Mats" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Motya" "Mateja" "Matija" "Matúš" "Matevž" "Matic" "Matjaž" "Tjaž" "Mateo" "Matías" "'
foreach variant of local Mato {
	replace ameriname = "Mato" if fname == "`variant'"
}

/* Mato "No diminutives" */

local Matt `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Mate" "Matej" "Mateo" "Matija" "Matko" "Mato" "Matěj" "Matouš" "Matyáš" "Mads" "Mathias" "Matthijs" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Mats" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Motya" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Tjaž" "Matías" "'
foreach variant of local Matt {
	replace ameriname = "Matt" if fname == "`variant'"
}

/* Matt "No diminutives" */

/* Mattel "No equivalents" */

/* Mattel "No diminutives" */

local Matti `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Matti {
	replace ameriname = "Matti" if fname == "`variant'"
}

local Matti `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Matti {
	replace ameriname = "Matti" if fname == "`diminutive'"
}

local Mattia `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Mattia {
	replace ameriname = "Mattia" if fname == "`variant'"
}

local Mattia `" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Mattia {
	replace ameriname = "Mattia" if fname == "`diminutive'"
}

/* Matts "No equivalents" */

/* Matts "No diminutives" */

/* Matus "No equivalents" */

/* Matus "No diminutives" */

/* Matyas "No equivalents" */

/* Matyas "No diminutives" */

local Mauricio `" "Maurits" "Maurice" "Morris" "Moritz" "Móric" "Muiris" "Maurizio" "Mauritius" "Maurycy" "Maurício" "Mauricio" "Meuric" "Meurig" "'
foreach variant of local Mauricio {
	replace ameriname = "Mauricio" if fname == "`variant'"
}

local Mauricio `" "Mo" "Moe" "Mauri" "'
foreach diminutive of local Mauricio {
	replace ameriname = "Mauricio" if fname == "`diminutive'"
}

/* Mauritz "No equivalents" */

/* Mauritz "No diminutives" */

local Maurizio `" "Maurits" "Maurice" "Morris" "Moritz" "Móric" "Muiris" "Maurizio" "Mauritius" "Maurycy" "Maurício" "Mauricio" "Meuric" "Meurig" "'
foreach variant of local Maurizio {
	replace ameriname = "Maurizio" if fname == "`variant'"
}

local Maurizio `" "Mo" "Moe" "Mauri" "'
foreach diminutive of local Maurizio {
	replace ameriname = "Maurizio" if fname == "`diminutive'"
}

local Mauro `" "Mauro" "Maurus" "'
foreach variant of local Mauro {
	replace ameriname = "Mauro" if fname == "`variant'"
}

/* Mauro "No diminutives" */

local Maximilian `" "Maximilianus" "Maxmilián" "Maximilian" "Maximiliaan" "Maximillian" "Maximilien" "Miksa" "Massimiliano" "Maksymilian" "Maximiliano" "Maksimilian" "Maximilián" "'
foreach variant of local Maximilian {
	replace ameriname = "Maximilian" if fname == "`variant'"
}

local Maximilian `" "Max" "'
foreach diminutive of local Maximilian {
	replace ameriname = "Maximilian" if fname == "`diminutive'"
}

local Maxwell `" "Maxwell" "'
foreach variant of local Maxwell {
	replace ameriname = "Maxwell" if fname == "`variant'"
}

local Maxwell `" "Max" "'
foreach diminutive of local Maxwell {
	replace ameriname = "Maxwell" if fname == "`diminutive'"
}

/* Mayer "No equivalents" */

/* Mayer "No diminutives" */

/* Meer "No equivalents" */

/* Meer "No diminutives" */

/* Meilach "No equivalents" */

/* Meilach "No diminutives" */

/* Meilech "No equivalents" */

/* Meilech "No diminutives" */

local Meindert `" "Meginhard" "Meindert" "Meinard" "Meinhard" "'
foreach variant of local Meindert {
	replace ameriname = "Meindert" if fname == "`variant'"
}

local Meindert `" "Meino" "Meine" "Meint" "Menno" "Minke" "'
foreach diminutive of local Meindert {
	replace ameriname = "Meindert" if fname == "`diminutive'"
}

local Meir `" "Meir" "Meyer" "'
foreach variant of local Meir {
	replace ameriname = "Meir" if fname == "`variant'"
}

/* Meir "No diminutives" */

/* Mejer "No equivalents" */

/* Mejer "No diminutives" */

local Melchior `" "Melchior" "Melchiorre" "Melchor" "'
foreach variant of local Melchior {
	replace ameriname = "Melchior" if fname == "`variant'"
}

/* Melchior "No diminutives" */

local Melchiorre `" "Melchior" "Melchiorre" "Melchor" "'
foreach variant of local Melchiorre {
	replace ameriname = "Melchiorre" if fname == "`variant'"
}

/* Melchiorre "No diminutives" */

/* Melhem "No equivalents" */

/* Melhem "No diminutives" */

local Melvin `" "Melville" "Melvin" "Melvyn" "'
foreach variant of local Melvin {
	replace ameriname = "Melvin" if fname == "`variant'"
}

local Melvin `" "Mel" "'
foreach diminutive of local Melvin {
	replace ameriname = "Melvin" if fname == "`diminutive'"
}

local Menachem `" "Manaem" "Menachem" "Manahem" "Menahem" "'
foreach variant of local Menachem {
	replace ameriname = "Menachem" if fname == "`variant'"
}

local Menachem `" "Mendel" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Menachem {
	replace ameriname = "Menachem" if fname == "`diminutive'"
}

/* Menasche "No equivalents" */

/* Menasche "No diminutives" */

local Menno `" "Meginfrid" "Meginhard" "Meginrat" "Meino" "Meinrad" "Menno" "Minke" "Meine" "Manfredo" "Manfred" "'
foreach variant of local Menno {
	replace ameriname = "Menno" if fname == "`variant'"
}

/* Menno "No diminutives" */

/* Menotti "No equivalents" */

/* Menotti "No diminutives" */

/* Mercurio "No equivalents" */

/* Mercurio "No diminutives" */

/* Micael "No equivalents" */

/* Micael "No diminutives" */

/* Mich "No equivalents" */

/* Mich "No diminutives" */

/* Michajlo "No equivalents" */

/* Michajlo "No diminutives" */

/* Michale "No equivalents" */

/* Michale "No diminutives" */

/* Michaly "No equivalents" */

/* Michaly "No diminutives" */

local Micheal `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Micheal {
	replace ameriname = "Micheal" if fname == "`variant'"
}

local Micheal `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Micheal {
	replace ameriname = "Micheal" if fname == "`diminutive'"
}

local Michela `" "Mihaela" "Michaela" "Michala" "Mikaela" "Mikkeline" "Michelle" "Makayla" "Mckayla" "Michayla" "Michele" "Mikayla" "Mikhaila" "Michèle" "Micaela" "Michela" "Mihaila" "Michalina" "Miguela" "Mykhaila" "'
foreach variant of local Michela {
	replace ameriname = "Michela" if fname == "`variant'"
}

local Michela `" "Chelle" "Michelyne" "Mikki" "Shell" "Micheline" "Michi" "Lina" "Michelina" "MASCULINE FORMS" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Miho" "Mihovil" "Mijo" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Mick" "Micheal" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mika" "Mikko" "Miska" "Mickaël" "Mikheil" "Misho" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Miksa" "Misi" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Miguelito" "Mihai" "Mihăiță" "Misha" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Miha" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach diminutive of local Michela {
	replace ameriname = "Michela" if fname == "`diminutive'"
}

/* MICHELE "No equivalents" */

/* MICHELE "No diminutives" */

/* Michelino "No equivalents" */

/* Michelino "No diminutives" */

/* Michell "No equivalents" */

/* Michell "No diminutives" */

local Michelle `" "Mihaela" "Michaela" "Michala" "Mikaela" "Mikkeline" "Michelle" "Makayla" "Mckayla" "Michayla" "Michele" "Mikayla" "Mikhaila" "Michèle" "Micaela" "Michela" "Mihaila" "Michalina" "Miguela" "Mykhaila" "'
foreach variant of local Michelle {
	replace ameriname = "Michelle" if fname == "`variant'"
}

local Michelle `" "Chelle" "Michelyne" "Mikki" "Shell" "Micheline" "Michi" "Lina" "Michelina" "MASCULINE FORMS" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Miho" "Mihovil" "Mijo" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Mick" "Micheal" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mika" "Mikko" "Miska" "Mickaël" "Mikheil" "Misho" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Miksa" "Misi" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Miguelito" "Mihai" "Mihăiță" "Misha" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Miha" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach diminutive of local Michelle {
	replace ameriname = "Michelle" if fname == "`diminutive'"
}

/* Michelo "No equivalents" */

/* Michelo "No diminutives" */

local Michiel `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Michiel {
	replace ameriname = "Michiel" if fname == "`variant'"
}

local Michiel `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Michiel {
	replace ameriname = "Michiel" if fname == "`diminutive'"
}

/* Michl "No equivalents" */

/* Michl "No diminutives" */

/* Michle "No equivalents" */

/* Michle "No diminutives" */

/* Mickele "No equivalents" */

/* Mickele "No diminutives" */

/* Mieczyslaw "No equivalents" */

/* Mieczyslaw "No diminutives" */

local Mihael `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Mihael {
	replace ameriname = "Mihael" if fname == "`variant'"
}

local Mihael `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Mihael {
	replace ameriname = "Mihael" if fname == "`diminutive'"
}

local Mihail `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Mihail {
	replace ameriname = "Mihail" if fname == "`variant'"
}

local Mihail `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Mihail {
	replace ameriname = "Mihail" if fname == "`diminutive'"
}

local Mihajlo `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Mihajlo {
	replace ameriname = "Mihajlo" if fname == "`variant'"
}

local Mihajlo `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Mihajlo {
	replace ameriname = "Mihajlo" if fname == "`diminutive'"
}

/* Mihal "No equivalents" */

/* Mihal "No diminutives" */

/* Mihayl "No equivalents" */

/* Mihayl "No diminutives" */

/* Mihran "No equivalents" */

/* Mihran "No diminutives" */

local Mijo `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Bogomil" "Mihail" "Mikhail" "Milan" "Milen" "Milko" "Miquel" "Myghal" "Miho" "Mijo" "Milenko" "Miljenko" "Bohumil" "Michal" "Miloš" "Miloslav" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Mick" "Micheal" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mika" "Mikko" "Miska" "Mickaël" "Mikheil" "Misho" "Michi" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Miksa" "Milán" "Misi" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mile" "Mikaere" "Bogumil" "Miloje" "Milosh" "Mikhailu" "Bogumił" "Michał" "Miłosław" "Miłosz" "Miguel" "Miguelito" "Mihai" "Mihăiță" "Misha" "Mihkkal" "Mìcheal" "Micheil" "Milojica" "Miha" "Mihael" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Mijo {
	replace ameriname = "Mijo" if fname == "`variant'"
}

/* Mijo "No diminutives" */

local Mikael `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Mikael {
	replace ameriname = "Mikael" if fname == "`variant'"
}

local Mikael `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Mikael {
	replace ameriname = "Mikael" if fname == "`diminutive'"
}

local Mikail `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Mikail {
	replace ameriname = "Mikail" if fname == "`variant'"
}

local Mikail `" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Mikail {
	replace ameriname = "Mikail" if fname == "`diminutive'"
}

/* Mikal "No equivalents" */

/* Mikal "No diminutives" */

/* Mikaly "No equivalents" */

/* Mikaly "No diminutives" */

/* Mikas "No equivalents" */

/* Mikas "No diminutives" */

local Mike `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Miho" "Mihovil" "Mijo" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mika" "Mikko" "Miska" "Mickaël" "Mikheil" "Misho" "Michi" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Miksa" "Misi" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Miguelito" "Mihai" "Mihăiță" "Misha" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Miha" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Mike {
	replace ameriname = "Mike" if fname == "`variant'"
}

/* Mike "No diminutives" */

/* Miko "No equivalents" */

/* Miko "No diminutives" */

/* Mikolaj "No equivalents" */

/* Mikolaj "No diminutives" */

local Miksa `" "Nicolaus" "Nikolaos" "Maximilianus" "Mikha'il" "Mikel" "Mitxel" "Nikola" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Nikolai" "Nikolay" "Miquel" "Nicolau" "Myghal" "Mihael" "Mihajlo" "Miho" "Mihovil" "Mijo" "Nikica" "Niko" "Nikša" "Maxmilián" "Michal" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Maximilian" "Mikael" "Mikkel" "Nels" "Niels" "Niklas" "Nikolaj" "Nils" "Klaas" "Maikel" "Maximiliaan" "Michaël" "Michel" "Michiel" "Mick" "Nick" "Nico" "Nicolaas" "Niek" "Nikolaas" "Maximillian" "Micheal" "Mickey" "Micky" "Mike" "Mikey" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Miĉjo" "Miĥaelo" "Mikelo" "Niĉjo" "Nikolao" "Mihkel" "Nigul" "Mikkjal" "Mika" "Mikko" "Miska" "Niilo" "Maximilien" "Mickaël" "Nicolas" "Klaes" "Mikheil" "Misho" "Nika" "Nikoloz" "Nikusha" "Niklaus" "Michi" "Nickolaus" "Nikolaus" "Michail" "Michalis" "Mihalis" "Nicolaos" "Mikala" "Kolos" "Miksa" "Misi" "Mícheál" "Nioclás" "Massimiliano" "Michele" "Niccolò" "Nicola" "Nicolò" "Mihails" "Miķelis" "Nikolajs" "Klaos" "Mykolas" "Nikolche" "Mikaere" "Nikora" "Col" "Nichol" "Nicol" "Mikhailu" "Maksymilian" "Michał" "Mikołaj" "Maximiliano" "Miguel" "Miguelito" "Mihai" "Mihăiță" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Maksimilian" "Misha" "Mihkkal" "Mìcheal" "Micheil" "Neacel" "Mihailo" "Maximilián" "Miha" "Miklavž" "Nicolao" "Nicolás" "Claes" "Klas" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Mykola" "Meical" "'
foreach variant of local Miksa {
	replace ameriname = "Miksa" if fname == "`variant'"
}

local Miksa `" "Max" "Colin" "Collin" "Launo" "'
foreach diminutive of local Miksa {
	replace ameriname = "Miksa" if fname == "`diminutive'"
}

local Mile `" "Milan" "Milen" "Milko" "Mile" "Miloš" "Milán" "Miloje" "Milosh" "Miłosz" "'
foreach variant of local Mile {
	replace ameriname = "Mile" if fname == "`variant'"
}

local Mile `" "Mijo" "Milenko" "Miljenko" "Milojica" "'
foreach diminutive of local Mile {
	replace ameriname = "Mile" if fname == "`diminutive'"
}

local Miles `" "Milo" "Miles" "Myles" "'
foreach variant of local Miles {
	replace ameriname = "Miles" if fname == "`variant'"
}

/* Miles "No diminutives" */

local Milo `" "Milo" "Miles" "Myles" "'
foreach variant of local Milo {
	replace ameriname = "Milo" if fname == "`variant'"
}

/* Milo "No diminutives" */

/* Milos "No equivalents" */

/* Milos "No diminutives" */

local Milovan `" "Milovan" "EQUIVALENTS" "'
foreach variant of local Milovan {
	replace ameriname = "Milovan" if fname == "`variant'"
}

/* Milovan "No diminutives" */

local Milton `" "Milton" "EQUIVALENTS" "'
foreach variant of local Milton {
	replace ameriname = "Milton" if fname == "`variant'"
}

/* Milton "No diminutives" */

/* Milutin "No equivalents" */

/* Milutin "No diminutives" */

/* Minas "No equivalents" */

/* Minas "No diminutives" */

/* Mindel "No equivalents" */

/* Mindel "No diminutives" */

local Mirko `" "Miroslav" "Mirko" "Miro" "Mirek" "Mirosław" "'
foreach variant of local Mirko {
	replace ameriname = "Mirko" if fname == "`variant'"
}

/* Mirko "No diminutives" */

/* Miron "No equivalents" */

/* Miron "No diminutives" */

local Miroslav `" "Miroslav" "Mirosław" "'
foreach variant of local Miroslav {
	replace ameriname = "Miroslav" if fname == "`variant'"
}

local Miroslav `" "Mirko" "Miro" "Mirek" "'
foreach diminutive of local Miroslav {
	replace ameriname = "Miroslav" if fname == "`diminutive'"
}

/* Misko "No equivalents" */

/* Misko "No diminutives" */

/* Miso "No equivalents" */

/* Miso "No diminutives" */

/* Missak "No equivalents" */

/* Missak "No diminutives" */

/* Mitar "No equivalents" */

/* Mitar "No diminutives" */

/* Modestino "No equivalents" */

/* Modestino "No diminutives" */

local Modesto `" "Modeste" "Modesto" "Modestus" "Modestas" "Modest" "'
foreach variant of local Modesto {
	replace ameriname = "Modesto" if fname == "`variant'"
}

/* Modesto "No diminutives" */

local Mohamed `" "Mohamed" "Mahomet" "Mahometus" "Mihammad" "Mohammad" "Mohammed" "Muhammad" "Muhammed" "Mahammad" "Muhamed" "Magomed" "Magomet" "Mukhamed" "Muhamad" "Mehmed" "Mehmet" "Muhammet" "Muhemmet" "'
foreach variant of local Mohamed {
	replace ameriname = "Mohamed" if fname == "`variant'"
}

/* Mohamed "No diminutives" */

/* Moiche "No equivalents" */

/* Moiche "No diminutives" */

/* Mois "No equivalents" */

/* Mois "No diminutives" */

/* Moisei "No equivalents" */

/* Moisei "No diminutives" */

/* Moises "No equivalents" */

/* Moises "No diminutives" */

local Moisey `" "Musa" "Mouses" "Moshe" "Moses" "Moyses" "Mozes" "Moss" "Moïse" "Mose" "Mózes" "Moysei" "Moisés" "Moisey" "'
foreach variant of local Moisey {
	replace ameriname = "Moisey" if fname == "`variant'"
}

/* Moisey "No diminutives" */

local Moishe `" "Musa" "Mouses" "Moshe" "Moses" "Moyses" "Mozes" "Moss" "Moïse" "Mose" "Mózes" "Moysei" "Moisés" "Moisey" "'
foreach variant of local Moishe {
	replace ameriname = "Moishe" if fname == "`variant'"
}

/* Moishe "No diminutives" */

/* Moissey "No equivalents" */

/* Moissey "No diminutives" */

/* Moisze "No equivalents" */

/* Moisze "No diminutives" */

/* Mojse "No equivalents" */

/* Mojse "No diminutives" */

/* Mojsze "No equivalents" */

/* Mojsze "No diminutives" */

/* Mojzesz "No equivalents" */

/* Mojzesz "No diminutives" */

/* Mondel "No equivalents" */

/* Mondel "No diminutives" */

/* Mones "No equivalents" */

/* Mones "No diminutives" */

/* Mor "No equivalents" */

/* Mor "No diminutives" */

/* Morche "No equivalents" */

/* Morche "No diminutives" */

/* Mordehe "No equivalents" */

/* Mordehe "No diminutives" */

/* Mordka "No equivalents" */

/* Mordka "No diminutives" */

/* Mordke "No equivalents" */

/* Mordke "No diminutives" */

/* Mordko "No equivalents" */

/* Mordko "No diminutives" */

/* Mordsche "No equivalents" */

/* Mordsche "No diminutives" */

/* Morgan "No equivalents" */

/* Morgan "No diminutives" */

/* Moris "No equivalents" */

/* Moris "No diminutives" */

/* Morsche "No equivalents" */

/* Morsche "No diminutives" */

/* Mosche "No equivalents" */

/* Mosche "No diminutives" */

/* Moschke "No equivalents" */

/* Moschke "No diminutives" */

/* Moschko "No equivalents" */

/* Moschko "No diminutives" */

local Mose `" "Musa" "Mouses" "Moshe" "Moses" "Moyses" "Mozes" "Moss" "Moïse" "Mose" "Mózes" "Moysei" "Moisés" "Moisey" "'
foreach variant of local Mose {
	replace ameriname = "Mose" if fname == "`variant'"
}

/* Mose "No diminutives" */

local Moshe `" "Musa" "Mouses" "Moshe" "Moses" "Moyses" "Mozes" "Moss" "Moïse" "Mose" "Mózes" "Moysei" "Moisés" "Moisey" "'
foreach variant of local Moshe {
	replace ameriname = "Moshe" if fname == "`variant'"
}

/* Moshe "No diminutives" */

/* Moszek "No equivalents" */

/* Moszek "No diminutives" */

/* Moszko "No equivalents" */

/* Moszko "No diminutives" */

/* Mote "No equivalents" */

/* Mote "No diminutives" */

/* Motie "No equivalents" */

/* Motie "No diminutives" */

local Motke `" "Mordokhay" "Mordecai" "Mordikai" "Motel" "Motke" "'
foreach variant of local Motke {
	replace ameriname = "Motke" if fname == "`variant'"
}

/* Motke "No diminutives" */

/* Motte "No equivalents" */

/* Motte "No diminutives" */

/* Moussa "No equivalents" */

/* Moussa "No diminutives" */

/* Mowscha "No equivalents" */

/* Mowscha "No diminutives" */

/* Mowsche "No equivalents" */

/* Mowsche "No diminutives" */

/* Mowsza "No equivalents" */

/* Mowsza "No diminutives" */

/* Moysche "No equivalents" */

/* Moysche "No diminutives" */

local Mozes `" "Musa" "Mouses" "Moshe" "Moses" "Moyses" "Mozes" "Moss" "Moïse" "Mose" "Mózes" "Moysei" "Moisés" "Moisey" "'
foreach variant of local Mozes {
	replace ameriname = "Mozes" if fname == "`variant'"
}

/* Mozes "No diminutives" */

/* Mr "No equivalents" */

/* Mr "No diminutives" */

/* Myer "No equivalents" */

/* Myer "No diminutives" */

/* Myo "No equivalents" */

/* Myo "No diminutives" */

/* N "No equivalents" */

/* N "No diminutives" */

/* Nachem "No equivalents" */

/* Nachem "No diminutives" */

/* Nachmann "No equivalents" */

/* Nachmann "No diminutives" */

/* Nachmen "No equivalents" */

/* Nachmen "No diminutives" */

/* Naftali "No equivalents" */

/* Naftali "No diminutives" */

/* Naftula "No equivalents" */

/* Naftula "No diminutives" */

/* Naftule "No equivalents" */

/* Naftule "No diminutives" */

/* Naftuli "No equivalents" */

/* Naftuli "No diminutives" */

local Nagib `" "Nagib" "'
foreach variant of local Nagib {
	replace ameriname = "Nagib" if fname == "`variant'"
}

/* Nagib "No diminutives" */

/* Naim "No equivalents" */

/* Naim "No diminutives" */

local Najib `" "Nagib" "'
foreach variant of local Najib {
	replace ameriname = "Najib" if fname == "`variant'"
}

/* Najib "No diminutives" */

/* Nandor "No equivalents" */

/* Nandor "No diminutives" */

local Naoum `" "Naoum" "Nachum" "Nahum" "Naum" "'
foreach variant of local Naoum {
	replace ameriname = "Naoum" if fname == "`variant'"
}

/* Naoum "No diminutives" */

/* Napoleon "No equivalents" */

/* Napoleon "No diminutives" */

/* Napoleone "No equivalents" */

/* Napoleone "No diminutives" */

local Narciso `" "Narcissus" "Narcís" "Narcisse" "Narkissos" "Narciso" "Narcyz" "'
foreach variant of local Narciso {
	replace ameriname = "Narciso" if fname == "`variant'"
}

/* Narciso "No diminutives" */

/* Nassif "No equivalents" */

/* Nassif "No diminutives" */

local Nassim `" "Naseem" "Nasim" "Nassim" "Nesim" "'
foreach variant of local Nassim {
	replace ameriname = "Nassim" if fname == "`variant'"
}

/* Nassim "No diminutives" */

/* Natalino "No equivalents" */

/* Natalino "No diminutives" */

local Natan `" "Nathan" "Natan" "Nosson" "'
foreach variant of local Natan {
	replace ameriname = "Natan" if fname == "`variant'"
}

local Natan `" "Nat" "'
foreach diminutive of local Natan {
	replace ameriname = "Natan" if fname == "`diminutive'"
}

local Nathaniel `" "Nathanael" "Nethanel" "Nathanahel" "Nathaniel" "Nethaneel" "Natanail" "Nathanaël" "Natanaele" "Natanael" "Nataniel" "'
foreach variant of local Nathaniel {
	replace ameriname = "Nathaniel" if fname == "`variant'"
}

local Nathaniel `" "Nat" "'
foreach diminutive of local Nathaniel {
	replace ameriname = "Nathaniel" if fname == "`diminutive'"
}

local Naum `" "Naoum" "Nachum" "Nahum" "Naum" "'
foreach variant of local Naum {
	replace ameriname = "Naum" if fname == "`variant'"
}

/* Naum "No diminutives" */

/* Nazareno "No equivalents" */

/* Nazareno "No diminutives" */

local Nazzareno `" "Nazaire" "Nazario" "Nazzareno" "Nazarenus" "Nazarius" "Nazar" "Nazariy" "'
foreach variant of local Nazzareno {
	replace ameriname = "Nazzareno" if fname == "`variant'"
}

/* Nazzareno "No diminutives" */

/* Neach "No equivalents" */

/* Neach "No diminutives" */

/* Nechame "No equivalents" */

/* Nechame "No diminutives" */

local Neil `" "Neal" "Neil" "Nigel" "Nigellus" "'
foreach variant of local Neil {
	replace ameriname = "Neil" if fname == "`variant'"
}

/* Neil "No diminutives" */

/* Nello "No equivalents" */

/* Nello "No diminutives" */

local Nels `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Nicolaas" "Niek" "Nikolaas" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Niklas" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Kolos" "Miklós" "Miksa" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nikolaj" "Nicolao" "Nicolás" "Claes" "Klas" "Mykola" "'
foreach variant of local Nels {
	replace ameriname = "Nels" if fname == "`variant'"
}

local Nels `" "Colin" "Collin" "Launo" "'
foreach diminutive of local Nels {
	replace ameriname = "Nels" if fname == "`diminutive'"
}

local Nelson `" "Nelson" "'
foreach variant of local Nelson {
	replace ameriname = "Nelson" if fname == "`variant'"
}

/* Nelson "No diminutives" */

local Nestor `" "Nestori" "Nestor" "Nestore" "'
foreach variant of local Nestor {
	replace ameriname = "Nestor" if fname == "`variant'"
}

/* Nestor "No diminutives" */

local Neville `" "Neville" "'
foreach variant of local Neville {
	replace ameriname = "Neville" if fname == "`variant'"
}

/* Neville "No diminutives" */

/* Nicandro "No equivalents" */

/* Nicandro "No diminutives" */

/* Nichan "No equivalents" */

/* Nichan "No diminutives" */

local Nicholas `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nicholas {
	replace ameriname = "Nicholas" if fname == "`variant'"
}

local Nicholas `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nicholas {
	replace ameriname = "Nicholas" if fname == "`diminutive'"
}

local Nick `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Niklas" "Nikolaj" "Nils" "Klaas" "Nick" "Nico" "Niek" "Nic" "Nicky" "Nik" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Nicholas" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Nikolas" "Kolos" "Miklós" "Miksa" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Claes" "Klas" "Mykola" "'
foreach variant of local Nick {
	replace ameriname = "Nick" if fname == "`variant'"
}

local Nick `" "Colin" "Collin" "Launo" "'
foreach diminutive of local Nick {
	replace ameriname = "Nick" if fname == "`diminutive'"
}

/* Nickolaos "No equivalents" */

/* Nickolaos "No diminutives" */

local Nico `" "Nicolaus" "Nikodemos" "Nikolaos" "Nikola" "Nicodemus" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Niklas" "Nikolaj" "Nils" "Klaas" "Nick" "Nico" "Niek" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Teemu" "Nicodème" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Nicolaos" "Kolos" "Miklós" "Miksa" "Nioclás" "Nikolajs" "Klaos" "Nikodim" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Nikodem" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Claes" "Klas" "Mykola" "'
foreach variant of local Nico {
	replace ameriname = "Nico" if fname == "`variant'"
}

local Nico `" "Colin" "Collin" "Launo" "'
foreach diminutive of local Nico {
	replace ameriname = "Nico" if fname == "`diminutive'"
}

local Nicodemo `" "Nikodemos" "Nicodemus" "Nicodème" "Nicodemo" "Nikodim" "Nikodem" "'
foreach variant of local Nicodemo {
	replace ameriname = "Nicodemo" if fname == "`variant'"
}

local Nicodemo `" "Teemu" "'
foreach diminutive of local Nicodemo {
	replace ameriname = "Nicodemo" if fname == "`diminutive'"
}

/* Nicol "No equivalents" */

/* Nicol "No diminutives" */

/* NICOLA "No equivalents" */

/* NICOLA "No diminutives" */

local Nicolaas `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nicolaas {
	replace ameriname = "Nicolaas" if fname == "`variant'"
}

local Nicolaas `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nicolaas {
	replace ameriname = "Nicolaas" if fname == "`diminutive'"
}

local Nicolae `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nicolae {
	replace ameriname = "Nicolae" if fname == "`variant'"
}

local Nicolae `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nicolae {
	replace ameriname = "Nicolae" if fname == "`diminutive'"
}

/* Nicolai "No equivalents" */

/* Nicolai "No diminutives" */

/* Nicolangelo "No equivalents" */

/* Nicolangelo "No diminutives" */

/* Nicolantonio "No equivalents" */

/* Nicolantonio "No diminutives" */

local Nicolaus `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nicolaus {
	replace ameriname = "Nicolaus" if fname == "`variant'"
}

local Nicolaus `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nicolaus {
	replace ameriname = "Nicolaus" if fname == "`diminutive'"
}

/* Nicolay "No equivalents" */

/* Nicolay "No diminutives" */

local Nicole `" "Nikole" "Nikol" "Nika" "Nicol" "Nicola" "Nikola" "Nicole" "Nichola" "Nichole" "Nikkole" "Nikoleta" "Nikora" "Nicolasa" "'
foreach variant of local Nicole {
	replace ameriname = "Nicole" if fname == "`variant'"
}

local Nicole `" "Nikolina" "Lina" "Klasina" "Klazina" "Nicolet" "Nicoline" "Nicky" "Nikki" "Colette" "Coline" "Nicolette" "Nikolett" "Nicoletta" "Nicolina" "Nicoleta" "MASCULINE FORMS" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Niklas" "Nikolaj" "Nils" "Klaas" "Nick" "Nico" "Nicolaas" "Niek" "Nikolaas" "Colin" "Collin" "Nic" "Nicholas" "Nickolas" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Launo" "Niilo" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Kolos" "Miklós" "Miksa" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Claes" "Klas" "'
foreach diminutive of local Nicole {
	replace ameriname = "Nicole" if fname == "`diminutive'"
}

/* Nicoli "No equivalents" */

/* Nicoli "No diminutives" */

/* Nicolino "No equivalents" */

/* Nicolino "No diminutives" */

/* Nicos "No equivalents" */

/* Nicos "No diminutives" */

/* Niklos "No equivalents" */

/* Niklos "No diminutives" */

local Niko `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Niklas" "Nikolaj" "Nils" "Klaas" "Nick" "Nico" "Nicolaas" "Niek" "Nikolaas" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Kolos" "Miklós" "Miksa" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Nicolao" "Nicolás" "Claes" "Klas" "Mykola" "'
foreach variant of local Niko {
	replace ameriname = "Niko" if fname == "`variant'"
}

local Niko `" "Colin" "Collin" "Launo" "'
foreach diminutive of local Niko {
	replace ameriname = "Niko" if fname == "`diminutive'"
}

local Nikolai `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nikolai {
	replace ameriname = "Nikolai" if fname == "`variant'"
}

local Nikolai `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nikolai {
	replace ameriname = "Nikolai" if fname == "`diminutive'"
}

local Nikolaj `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nikolaj {
	replace ameriname = "Nikolaj" if fname == "`variant'"
}

local Nikolaj `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nikolaj {
	replace ameriname = "Nikolaj" if fname == "`diminutive'"
}

local Nikolaos `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nikolaos {
	replace ameriname = "Nikolaos" if fname == "`variant'"
}

local Nikolaos `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nikolaos {
	replace ameriname = "Nikolaos" if fname == "`diminutive'"
}

local Nikolas `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nikolas {
	replace ameriname = "Nikolas" if fname == "`variant'"
}

local Nikolas `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nikolas {
	replace ameriname = "Nikolas" if fname == "`diminutive'"
}

local Nikolaus `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nikolaus {
	replace ameriname = "Nikolaus" if fname == "`variant'"
}

local Nikolaus `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nikolaus {
	replace ameriname = "Nikolaus" if fname == "`diminutive'"
}

local Nikolay `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nikolay {
	replace ameriname = "Nikolay" if fname == "`variant'"
}

local Nikolay `" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nikolay {
	replace ameriname = "Nikolay" if fname == "`diminutive'"
}

/* Nikos "No equivalents" */

/* Nikos "No diminutives" */

/* Nilo "No equivalents" */

/* Nilo "No diminutives" */

/* Nino "No equivalents" */

/* Nino "No diminutives" */

/* Nisen "No equivalents" */

/* Nisen "No diminutives" */

/* Nishan "No equivalents" */

/* Nishan "No diminutives" */

/* Nison "No equivalents" */

/* Nison "No diminutives" */

/* Nissel "No equivalents" */

/* Nissel "No diminutives" */

/* Nissen "No equivalents" */

/* Nissen "No diminutives" */

/* Nissim "No equivalents" */

/* Nissim "No diminutives" */

/* Nisson "No equivalents" */

/* Nisson "No diminutives" */

local Noach `" "Nuh" "Noe" "Noach" "Noah" "Nooa" "Noé" "Nojus" "Noak" "'
foreach variant of local Noach {
	replace ameriname = "Noach" if fname == "`variant'"
}

/* Noach "No diminutives" */

/* Noah "No equivalents" */

/* Noah "No diminutives" */

/* Nochim "No equivalents" */

/* Nochim "No diminutives" */

/* Nochum "No equivalents" */

/* Nochum "No diminutives" */

local Noe `" "Nuh" "Noe" "Noach" "Noah" "Nooa" "Noé" "Nojus" "Noak" "'
foreach variant of local Noe {
	replace ameriname = "Noe" if fname == "`variant'"
}

/* Noe "No diminutives" */

/* Noech "No equivalents" */

/* Noech "No diminutives" */

local Noel `" "Noel" "Noël" "'
foreach variant of local Noel {
	replace ameriname = "Noel" if fname == "`variant'"
}

/* Noel "No diminutives" */

local Norbert `" "Norbert" "Norberto" "Norbaer" "'
foreach variant of local Norbert {
	replace ameriname = "Norbert" if fname == "`variant'"
}

local Norbert `" "Baer" "Bèr" "'
foreach diminutive of local Norbert {
	replace ameriname = "Norbert" if fname == "`diminutive'"
}

local Norberto `" "Norbert" "Norberto" "Norbaer" "'
foreach variant of local Norberto {
	replace ameriname = "Norberto" if fname == "`variant'"
}

local Norberto `" "Baer" "Bèr" "'
foreach diminutive of local Norberto {
	replace ameriname = "Norberto" if fname == "`diminutive'"
}

/* Nossen "No equivalents" */

/* Nossen "No diminutives" */

/* Note "No equivalents" */

/* Note "No diminutives" */

local Novak `" "Novak" "EQUIVALENTS" "'
foreach variant of local Novak {
	replace ameriname = "Novak" if fname == "`variant'"
}

/* Novak "No diminutives" */

/* Nuchem "No equivalents" */

/* Nuchem "No diminutives" */

/* Nuchim "No equivalents" */

/* Nuchim "No diminutives" */

/* Nunziante "No equivalents" */

/* Nunziante "No diminutives" */

/* Nunziato "No equivalents" */

/* Nunziato "No diminutives" */

/* Nusen "No equivalents" */

/* Nusen "No diminutives" */

/* Nussen "No equivalents" */

/* Nussen "No diminutives" */

/* Nute "No equivalents" */

/* Nute "No diminutives" */

local Octave `" "Octavius" "Octave" "Ottavio" "Otávio" "Octávio" "Octavio" "'
foreach variant of local Octave {
	replace ameriname = "Octave" if fname == "`variant'"
}

/* Octave "No diminutives" */

local Octavio `" "Octavius" "Octave" "Ottavio" "Otávio" "Octávio" "Octavio" "'
foreach variant of local Octavio {
	replace ameriname = "Octavio" if fname == "`variant'"
}

/* Octavio "No diminutives" */

local Odd `" "Oddr" "'
foreach variant of local Odd {
	replace ameriname = "Odd" if fname == "`variant'"
}

/* Odd "No diminutives" */

/* Odoardo "No equivalents" */

/* Odoardo "No diminutives" */

/* Ohanes "No equivalents" */

/* Ohanes "No diminutives" */

local Ohannes `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Ohannes {
	replace ameriname = "Ohannes" if fname == "`variant'"
}

local Ohannes `" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Ohannes {
	replace ameriname = "Ohannes" if fname == "`diminutive'"
}

/* Oiva "No equivalents" */

/* Oiva "No diminutives" */

/* Ola "No equivalents" */

/* Ola "No diminutives" */

local Olav `" "Áleifr" "Olaf" "Olav" "Oluf" "Olavi" "Olev" "Uolevi" "Ólafur" "Amhlaoibh" "Olavo" "Amhlaidh" "Aulay" "Olof" "Olov" "'
foreach variant of local Olav {
	replace ameriname = "Olav" if fname == "`variant'"
}

local Olav `" "Ole" "Olli" "Ola" "Olle" "'
foreach diminutive of local Olav {
	replace ameriname = "Olav" if fname == "`diminutive'"
}

local Olavi `" "Áleifr" "Olaf" "Olav" "Oluf" "Olavi" "Olev" "Uolevi" "Ólafur" "Amhlaoibh" "Olavo" "Amhlaidh" "Aulay" "Olof" "Olov" "'
foreach variant of local Olavi {
	replace ameriname = "Olavi" if fname == "`variant'"
}

local Olavi `" "Ole" "Olli" "Ola" "Olle" "'
foreach diminutive of local Olavi {
	replace ameriname = "Olavi" if fname == "`diminutive'"
}

local Oldrich `" "Odalric" "Ulrich" "Oldřich" "Ulrik" "Ulric" "Oldrich" "Urh" "'
foreach variant of local Oldrich {
	replace ameriname = "Oldrich" if fname == "`variant'"
}

local Oldrich `" "Ueli" "Ulli" "Utz" "'
foreach diminutive of local Oldrich {
	replace ameriname = "Oldrich" if fname == "`diminutive'"
}

/* Oleksa "No equivalents" */

/* Oleksa "No diminutives" */

local Olga `" "Helga" "Olga" "Hella" "Helle" "Laila" "Aila" "Aili" "Helka" "Oili" "Áile" "Láilá" "Oľga" "'
foreach variant of local Olga {
	replace ameriname = "Olga" if fname == "`variant'"
}

local Olga `" "Hege" "Olgica" "Olya" "Olja" "MASCULINE FORMS" "Helgi" "Helge" "Oleg" "'
foreach diminutive of local Olga {
	replace ameriname = "Olga" if fname == "`diminutive'"
}

/* Olimpio "No equivalents" */

/* Olimpio "No diminutives" */

/* Olindo "No equivalents" */

/* Olindo "No diminutives" */

/* Olinto "No equivalents" */

/* Olinto "No diminutives" */

local Oliver `" "Oliver" "Olivier" "Olivér" "Oliviero" "Oliwier" "'
foreach variant of local Oliver {
	replace ameriname = "Oliver" if fname == "`variant'"
}

local Oliver `" "Oli" "Ollie" "Noll" "'
foreach diminutive of local Oliver {
	replace ameriname = "Oliver" if fname == "`diminutive'"
}

/* Olivo "No equivalents" */

/* Olivo "No diminutives" */

local Oluf `" "Áleifr" "Olaf" "Olav" "Oluf" "Olavi" "Olev" "Uolevi" "Ólafur" "Amhlaoibh" "Olavo" "Amhlaidh" "Aulay" "Olof" "Olov" "'
foreach variant of local Oluf {
	replace ameriname = "Oluf" if fname == "`variant'"
}

local Oluf `" "Ole" "Olli" "Ola" "Olle" "'
foreach diminutive of local Oluf {
	replace ameriname = "Oluf" if fname == "`diminutive'"
}

/* Omer "No equivalents" */

/* Omer "No diminutives" */

/* Omero "No equivalents" */

/* Omero "No diminutives" */

local Ondrej `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Ondrej {
	replace ameriname = "Ondrej" if fname == "`variant'"
}

local Ondrej `" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Ondrej {
	replace ameriname = "Ondrej" if fname == "`diminutive'"
}

/* Onni "No equivalents" */

/* Onni "No diminutives" */

/* Onorato "No equivalents" */

/* Onorato "No diminutives" */

/* Ontonio "No equivalents" */

/* Ontonio "No diminutives" */

/* Orasio "No equivalents" */

/* Orasio "No diminutives" */

/* Orla "No equivalents" */

/* Orla "No diminutives" */

/* Oronzo "No equivalents" */

/* Oronzo "No diminutives" */

/* Oscher "No equivalents" */

/* Oscher "No diminutives" */

/* Osher "No equivalents" */

/* Osher "No diminutives" */

/* Osias "No equivalents" */

/* Osias "No diminutives" */

local Osip `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Osip {
	replace ameriname = "Osip" if fname == "`variant'"
}

local Osip `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Osip {
	replace ameriname = "Osip" if fname == "`diminutive'"
}

local Osmund `" "Ásmundr" "Osmund" "Åsmund" "Osmond" "Ásmundur" "'
foreach variant of local Osmund {
	replace ameriname = "Osmund" if fname == "`variant'"
}

/* Osmund "No diminutives" */

/* Ossip "No equivalents" */

/* Ossip "No diminutives" */

local Osvald `" "Ansovald" "Ásvaldr" "Oswald" "Osvald" "Ansaldo" "Osvaldo" "Ožbalt" "Ožbej" "'
foreach variant of local Osvald {
	replace ameriname = "Osvald" if fname == "`variant'"
}

local Osvald `" "Oz" "Ozzie" "'
foreach diminutive of local Osvald {
	replace ameriname = "Osvald" if fname == "`diminutive'"
}

local Osvaldo `" "Ansovald" "Ásvaldr" "Oswald" "Osvald" "Ansaldo" "Osvaldo" "Ožbalt" "Ožbej" "'
foreach variant of local Osvaldo {
	replace ameriname = "Osvaldo" if fname == "`variant'"
}

local Osvaldo `" "Oz" "Ozzie" "'
foreach diminutive of local Osvaldo {
	replace ameriname = "Osvaldo" if fname == "`diminutive'"
}

local Oswald `" "Ansovald" "Ásvaldr" "Oswald" "Osvald" "Ansaldo" "Osvaldo" "Ožbalt" "Ožbej" "'
foreach variant of local Oswald {
	replace ameriname = "Oswald" if fname == "`variant'"
}

local Oswald `" "Oz" "Ozzie" "'
foreach diminutive of local Oswald {
	replace ameriname = "Oswald" if fname == "`diminutive'"
}

/* Oswaldo "No equivalents" */

/* Oswaldo "No diminutives" */

/* Otello "No equivalents" */

/* Otello "No diminutives" */

local Ottaviano `" "Octavianus" "Octavian" "Ottaviano" "'
foreach variant of local Ottaviano {
	replace ameriname = "Ottaviano" if fname == "`variant'"
}

/* Ottaviano "No diminutives" */

local Ottavio `" "Octavius" "Octave" "Ottavio" "Otávio" "Octávio" "Octavio" "'
foreach variant of local Ottavio {
	replace ameriname = "Ottavio" if fname == "`variant'"
}

/* Ottavio "No diminutives" */

/* Ottilio "No equivalents" */

/* Ottilio "No diminutives" */

local Ottorino `" "Audo" "Odilo" "Odo" "Otto" "Odilon" "Udo" "Ottó" "Ottorino" "Ode" "Eudes" "'
foreach variant of local Ottorino {
	replace ameriname = "Ottorino" if fname == "`variant'"
}

local Ottorino `" "Rino" "'
foreach diminutive of local Ottorino {
	replace ameriname = "Ottorino" if fname == "`diminutive'"
}

local Ove `" "Agi" "Egino" "Aghi" "Egill" "Egil" "Ove" "Egon" "Uwe" "'
foreach variant of local Ove {
	replace ameriname = "Ove" if fname == "`variant'"
}

/* Ove "No diminutives" */

local Ovidio `" "Ovidius" "Ovid" "Ovidio" "Ovídio" "Ovidiu" "'
foreach variant of local Ovidio {
	replace ameriname = "Ovidio" if fname == "`variant'"
}

/* Ovidio "No diminutives" */

/* Owen "No equivalents" */

/* Owen "No diminutives" */

/* Owsey "No equivalents" */

/* Owsey "No diminutives" */

/* P "No equivalents" */

/* P "No diminutives" */

local Paavo `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Pavo" "Palle" "Poul" "Pauwel" "Paulie" "Paĉjo" "Paŭlo" "Paavo" "Páll" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Paulinho" "Pasha" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Paavo {
	replace ameriname = "Paavo" if fname == "`variant'"
}

/* Paavo "No diminutives" */

local Pablo `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Pablo {
	replace ameriname = "Pablo" if fname == "`variant'"
}

local Pablo `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Pablo {
	replace ameriname = "Pablo" if fname == "`diminutive'"
}

/* Pacifico "No equivalents" */

/* Pacifico "No diminutives" */

local Palmer `" "Palmer" "'
foreach variant of local Palmer {
	replace ameriname = "Palmer" if fname == "`variant'"
}

/* Palmer "No diminutives" */

/* Palmerino "No equivalents" */

/* Palmerino "No diminutives" */

/* Pan "No equivalents" */

/* Pan "No diminutives" */

/* Panaghiotis "No equivalents" */

/* Panaghiotis "No diminutives" */

/* Panagis "No equivalents" */

/* Panagis "No diminutives" */

/* Panajotis "No equivalents" */

/* Panajotis "No diminutives" */

local Panayiotis `" "Panagiotis" "Panayiotis" "'
foreach variant of local Panayiotis {
	replace ameriname = "Panayiotis" if fname == "`variant'"
}

local Panayiotis `" "Panagiotakis" "Panos" "Takis" "'
foreach diminutive of local Panayiotis {
	replace ameriname = "Panayiotis" if fname == "`diminutive'"
}

/* Panayotis "No equivalents" */

/* Panayotis "No diminutives" */

local Pancrazio `" "Pancratius" "Pankratios" "Pancras" "Pankraz" "Pancrazio" "Pankrati" "'
foreach variant of local Pancrazio {
	replace ameriname = "Pancrazio" if fname == "`variant'"
}

/* Pancrazio "No diminutives" */

local Panfilo `" "Pamphilos" "Panfilo" "'
foreach variant of local Panfilo {
	replace ameriname = "Panfilo" if fname == "`variant'"
}

/* Panfilo "No diminutives" */

local Panos `" "Panagiotakis" "Panos" "'
foreach variant of local Panos {
	replace ameriname = "Panos" if fname == "`variant'"
}

local Panos `" "Takis" "'
foreach diminutive of local Panos {
	replace ameriname = "Panos" if fname == "`diminutive'"
}

/* Pantaleo "No equivalents" */

/* Pantaleo "No diminutives" */

local Pantaleone `" "Pantaleon" "'
foreach variant of local Pantaleone {
	replace ameriname = "Pantaleone" if fname == "`variant'"
}

/* Pantaleone "No diminutives" */

/* Pantelis "No equivalents" */

/* Pantelis "No diminutives" */

local Paola `" "Paula" "Pavla" "Paule" "Pála" "Paola" "'
foreach variant of local Paola {
	replace ameriname = "Paola" if fname == "`variant'"
}

local Paola `" "Pavica" "Pauletta" "Paulette" "Paulinha" "MASCULINE FORMS" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Pavo" "Palle" "Poul" "Pauwel" "Paulie" "Paĉjo" "Paŭlo" "Paavo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Paulinho" "Pasha" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach diminutive of local Paola {
	replace ameriname = "Paola" if fname == "`diminutive'"
}

local Paolino `" "Paulinus" "Paolino" "Paulino" "'
foreach variant of local Paolino {
	replace ameriname = "Paolino" if fname == "`variant'"
}

/* Paolino "No diminutives" */

local PAOLO `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local PAOLO {
	replace ameriname = "PAOLO" if fname == "`variant'"
}

local PAOLO `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local PAOLO {
	replace ameriname = "PAOLO" if fname == "`diminutive'"
}

/* Paris "No equivalents" */

/* Paris "No diminutives" */

local Pascual `" "Paskal" "Pasco" "Paškal" "Pascal" "Paschal" "Pasquale" "Paschalis" "Pascual" "'
foreach variant of local Pascual {
	replace ameriname = "Pascual" if fname == "`variant'"
}

local Pascual `" "Paško" "Pasqualino" "'
foreach diminutive of local Pascual {
	replace ameriname = "Pascual" if fname == "`diminutive'"
}

/* Pasguale "No equivalents" */

/* Pasguale "No diminutives" */

/* Pasquala "No equivalents" */

/* Pasquala "No diminutives" */

local PASQUALE `" "Paskal" "Pasco" "Paškal" "Pascal" "Paschal" "Pasquale" "Paschalis" "Pascual" "'
foreach variant of local PASQUALE {
	replace ameriname = "PASQUALE" if fname == "`variant'"
}

local PASQUALE `" "Paško" "Pasqualino" "'
foreach diminutive of local PASQUALE {
	replace ameriname = "PASQUALE" if fname == "`diminutive'"
}

/* Pasquali "No equivalents" */

/* Pasquali "No diminutives" */

local Pasqualino `" "Paskal" "Pasco" "Paškal" "Paško" "Pascal" "Paschal" "Pasqualino" "Paschalis" "Pascual" "'
foreach variant of local Pasqualino {
	replace ameriname = "Pasqualino" if fname == "`variant'"
}

/* Pasqualino "No diminutives" */

local Pat `" "Padrig" "Patricija" "Patrik" "Patricie" "Pat" "Patsy" "Patti" "Pattie" "Patty" "Trecia" "Tresha" "Tricia" "Trish" "Trisha" "Patrice" "Patrick" "Patricia" "Paddy" "Pádraic" "Pádraig" "Pádraigín" "Patrizia" "Patrizio" "Patricius" "Pherick" "Patariki" "Pate" "Patka" "Patrycja" "Patryk" "Patrícia" "Patrício" "Pàdraig" "Patricio" "MASCULINE FORMS" "'
foreach variant of local Pat {
	replace ameriname = "Pat" if fname == "`variant'"
}

/* Pat "No diminutives" */

/* Patk "No equivalents" */

/* Patk "No diminutives" */

local Pauli `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Pauli {
	replace ameriname = "Pauli" if fname == "`variant'"
}

local Pauli `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Pauli {
	replace ameriname = "Pauli" if fname == "`diminutive'"
}

local Paulino `" "Paulinus" "Paolino" "Paulino" "'
foreach variant of local Paulino {
	replace ameriname = "Paulino" if fname == "`variant'"
}

/* Paulino "No diminutives" */

local Paulo `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Paulo {
	replace ameriname = "Paulo" if fname == "`variant'"
}

local Paulo `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Paulo {
	replace ameriname = "Paulo" if fname == "`diminutive'"
}

local Paulus `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Paulus {
	replace ameriname = "Paulus" if fname == "`variant'"
}

local Paulus `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Paulus {
	replace ameriname = "Paulus" if fname == "`diminutive'"
}

/* Paval "No equivalents" */

/* Paval "No diminutives" */

local Pavao `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Pavao {
	replace ameriname = "Pavao" if fname == "`variant'"
}

local Pavao `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Pavao {
	replace ameriname = "Pavao" if fname == "`diminutive'"
}

local Pavlo `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Pavlo {
	replace ameriname = "Pavlo" if fname == "`variant'"
}

local Pavlo `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Pavlo {
	replace ameriname = "Pavlo" if fname == "`diminutive'"
}

local Pavlos `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Pavlos {
	replace ameriname = "Pavlos" if fname == "`variant'"
}

local Pavlos `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Pavlos {
	replace ameriname = "Pavlos" if fname == "`diminutive'"
}

local Pavo `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavo" "Palle" "Poul" "Pauwel" "Paulie" "Paĉjo" "Paŭlo" "Paavo" "Páll" "Paavali" "Pauli" "Paulo" "Pavle" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Paulinho" "Pasha" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Pavo {
	replace ameriname = "Pavo" if fname == "`variant'"
}

/* Pavo "No diminutives" */

/* Pawlo "No equivalents" */

/* Pawlo "No diminutives" */

/* Peisach "No equivalents" */

/* Peisach "No diminutives" */

/* Peissach "No equivalents" */

/* Peissach "No diminutives" */

/* Peitro "No equivalents" */

/* Peitro "No diminutives" */

/* Pejsach "No equivalents" */

/* Pejsach "No diminutives" */

/* Pelligrino "No equivalents" */

/* Pelligrino "No diminutives" */

local Peppino `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Ioses" "Yosef" "Joseph" "Joses" "Yosif" "Josep" "Josip" "Joško" "Joso" "Jozo" "Josef" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Josephus" "Jozef" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Jozefo" "Joosep" "Jooseppi" "Juuso" "Xosé" "Ioseb" "Soso" "Sepp" "Seppel" "Iosif" "Jóska" "József" "Józsi" "Seosamh" "Beppe" "Peppe" "Peppi" "Peppino" "Iosephus" "Jāzeps" "Juozapas" "Juozas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Zé" "Zezé" "Osip" "Seòsaidh" "Jože" "Jožef" "Pepe" "Pepito" "Yosyp" "Yusup" "Yussel" "'
foreach variant of local Peppino {
	replace ameriname = "Peppino" if fname == "`variant'"
}

local Peppino `" "Pino" "'
foreach diminutive of local Peppino {
	replace ameriname = "Peppino" if fname == "`diminutive'"
}

local Percival `" "Perceval" "Percival" "Parsifal" "'
foreach variant of local Percival {
	replace ameriname = "Percival" if fname == "`variant'"
}

local Percival `" "Percy" "'
foreach diminutive of local Percival {
	replace ameriname = "Percival" if fname == "`diminutive'"
}

local Peretz `" "Phares" "Peretz" "Perez" "Pharez" "'
foreach variant of local Peretz {
	replace ameriname = "Peretz" if fname == "`variant'"
}

/* Peretz "No diminutives" */

local Perez `" "Phares" "Peretz" "Perez" "Pharez" "'
foreach variant of local Perez {
	replace ameriname = "Perez" if fname == "`variant'"
}

/* Perez "No diminutives" */

local Pericles `" "Pericles" "Perikles" "'
foreach variant of local Pericles {
	replace ameriname = "Pericles" if fname == "`variant'"
}

/* Pericles "No diminutives" */

/* Perl "No equivalents" */

/* Perl "No diminutives" */

local Pero `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peio" "Peru" "Petri" "Petrus" "Peter" "Per" "Perig" "Pierrick" "Penko" "Petar" "Pere" "Petru" "Pejo" "Perica" "Pero" "Petr" "Peder" "Peer" "Pier" "Piet" "Pieter" "Piers" "Peers" "Pete" "Petro" "Peeter" "Petur" "Pekka" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Peti" "Pétur" "Peadar" "Piaras" "Pierino" "Piero" "Pietro" "Pit" "Petras" "Pece" "Petera" "Petruccio" "Petter" "Pèire" "Piotr" "Pedrinho" "Pedro" "Petrica" "Petia" "Petya" "Pyotr" "Pehr" "Pedr" "'
foreach variant of local Pero {
	replace ameriname = "Pero" if fname == "`variant'"
}

local Pero `" "Pelle" "'
foreach diminutive of local Pero {
	replace ameriname = "Pero" if fname == "`diminutive'"
}

/* Persach "No equivalents" */

/* Persach "No diminutives" */

/* Pesach "No equivalents" */

/* Pesach "No diminutives" */

/* Pesse "No equivalents" */

/* Pesse "No diminutives" */

local Petr `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petur" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Petr {
	replace ameriname = "Petr" if fname == "`variant'"
}

local Petr `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pierino" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Petr {
	replace ameriname = "Petr" if fname == "`diminutive'"
}

local Petras `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petur" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Petras {
	replace ameriname = "Petras" if fname == "`variant'"
}

local Petras `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pierino" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Petras {
	replace ameriname = "Petras" if fname == "`diminutive'"
}

local Petre `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petur" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Petre {
	replace ameriname = "Petre" if fname == "`variant'"
}

local Petre `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pierino" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Petre {
	replace ameriname = "Petre" if fname == "`diminutive'"
}

local Petros `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petur" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Petros {
	replace ameriname = "Petros" if fname == "`variant'"
}

local Petros `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pierino" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Petros {
	replace ameriname = "Petros" if fname == "`diminutive'"
}

local Petru `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petur" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Petru {
	replace ameriname = "Petru" if fname == "`variant'"
}

local Petru `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pierino" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Petru {
	replace ameriname = "Petru" if fname == "`diminutive'"
}

local Petter `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petur" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Petter {
	replace ameriname = "Petter" if fname == "`variant'"
}

local Petter `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pierino" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Petter {
	replace ameriname = "Petter" if fname == "`diminutive'"
}

local Philipp `" "Philippos" "Philippus" "Philip" "Filip" "Felip" "Filippus" "Phillip" "Vilppu" "Philippe" "Philipp" "Filippos" "Fülöp" "Pilib" "Filippo" "Filips" "Pilypas" "Piripi" "Filippu" "Felipe" "Filipe" "Filipp" "Filib" "Pylyp" "'
foreach variant of local Philipp {
	replace ameriname = "Philipp" if fname == "`variant'"
}

local Philipp `" "Flip" "Phil" "Pip" "Felipinho" "'
foreach diminutive of local Philipp {
	replace ameriname = "Philipp" if fname == "`diminutive'"
}

local Philippe `" "Philippos" "Philippus" "Philip" "Filip" "Felip" "Filippus" "Phillip" "Vilppu" "Philippe" "Philipp" "Filippos" "Fülöp" "Pilib" "Filippo" "Filips" "Pilypas" "Piripi" "Filippu" "Felipe" "Filipe" "Filipp" "Filib" "Pylyp" "'
foreach variant of local Philippe {
	replace ameriname = "Philippe" if fname == "`variant'"
}

local Philippe `" "Flip" "Phil" "Pip" "Felipinho" "'
foreach diminutive of local Philippe {
	replace ameriname = "Philippe" if fname == "`diminutive'"
}

local Phillip `" "Philippos" "Philippus" "Philip" "Filip" "Felip" "Filippus" "Phillip" "Vilppu" "Philippe" "Philipp" "Filippos" "Fülöp" "Pilib" "Filippo" "Filips" "Pilypas" "Piripi" "Filippu" "Felipe" "Filipe" "Filipp" "Filib" "Pylyp" "'
foreach variant of local Phillip {
	replace ameriname = "Phillip" if fname == "`variant'"
}

local Phillip `" "Flip" "Phil" "Pip" "Felipinho" "'
foreach diminutive of local Phillip {
	replace ameriname = "Phillip" if fname == "`diminutive'"
}

local Pier `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petur" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local Pier {
	replace ameriname = "Pier" if fname == "`variant'"
}

local Pier `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pierino" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local Pier {
	replace ameriname = "Pier" if fname == "`diminutive'"
}

local Pierino `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peio" "Peru" "Petri" "Petrus" "Peter" "Per" "Perig" "Pierrick" "Penko" "Petar" "Pere" "Petru" "Pejo" "Perica" "Pero" "Petr" "Peder" "Peer" "Pier" "Piet" "Pieter" "Piers" "Peers" "Pete" "Petro" "Peeter" "Petur" "Pekka" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Peti" "Pétur" "Peadar" "Piaras" "Pierino" "Pit" "Petras" "Pece" "Petera" "Petruccio" "Petter" "Pèire" "Piotr" "Pedrinho" "Pedro" "Petrica" "Petia" "Petya" "Pyotr" "Pehr" "Pedr" "'
foreach variant of local Pierino {
	replace ameriname = "Pierino" if fname == "`variant'"
}

local Pierino `" "Pelle" "'
foreach diminutive of local Pierino {
	replace ameriname = "Pierino" if fname == "`diminutive'"
}

local Piet `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peio" "Peru" "Petri" "Petrus" "Peter" "Per" "Perig" "Pierrick" "Penko" "Petar" "Pere" "Petru" "Pejo" "Perica" "Pero" "Petr" "Peder" "Peer" "Piet" "Piers" "Peers" "Pete" "Petro" "Peeter" "Petur" "Pekka" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Peti" "Pétur" "Peadar" "Piaras" "Pier" "Pierino" "Piero" "Pietro" "Pit" "Petras" "Pece" "Petera" "Petruccio" "Petter" "Pèire" "Piotr" "Pedrinho" "Pedro" "Petrica" "Petia" "Petya" "Pyotr" "Pehr" "Pedr" "'
foreach variant of local Piet {
	replace ameriname = "Piet" if fname == "`variant'"
}

local Piet `" "Pelle" "'
foreach diminutive of local Piet {
	replace ameriname = "Piet" if fname == "`diminutive'"
}

local Pietra `" "Petra" "Peta" "Piera" "Pietra" "'
foreach variant of local Pietra {
	replace ameriname = "Pietra" if fname == "`variant'"
}

local Pietra `" "Penka" "Petia" "Petya" "Petrina" "Perrine" "Pierrette" "Pierina" "Pietrina" "MASCULINE FORMS" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peio" "Peru" "Petri" "Petrus" "Peter" "Per" "Perig" "Pierrick" "Penko" "Petar" "Pere" "Petru" "Pejo" "Perica" "Pero" "Petr" "Peder" "Peer" "Pier" "Piet" "Pieter" "Piers" "Peers" "Pete" "Petro" "Peeter" "Petur" "Pekka" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Peti" "Pétur" "Peadar" "Piaras" "Pierino" "Piero" "Pietro" "Pit" "Petras" "Pece" "Petera" "Petruccio" "Petter" "Pèire" "Piotr" "Pedrinho" "Pedro" "Petrica" "Pyotr" "Pehr" "Pelle" "Pedr" "'
foreach diminutive of local Pietra {
	replace ameriname = "Pietra" if fname == "`diminutive'"
}

/* Pietrangelo "No equivalents" */

/* Pietrangelo "No diminutives" */

/* Pietrantonio "No equivalents" */

/* Pietrantonio "No diminutives" */

local PIETRO `" "Botros" "Boutros" "Butrus" "Bedros" "Petros" "Peru" "Petri" "Petrus" "Peter" "Per" "Petar" "Pere" "Petru" "Petr" "Peder" "Pier" "Pieter" "Piers" "Peers" "Petro" "Peeter" "Petur" "Petteri" "Pietari" "Pierre" "Pitter" "Petre" "Pika" "Péter" "Pétur" "Peadar" "Piaras" "Piero" "Pietro" "Petras" "Petera" "Petter" "Pèire" "Piotr" "Pedro" "Pyotr" "Pedr" "'
foreach variant of local PIETRO {
	replace ameriname = "PIETRO" if fname == "`variant'"
}

local PIETRO `" "Peio" "Perig" "Pierrick" "Penko" "Pejo" "Perica" "Pero" "Peer" "Per" "Piet" "Pete" "Pekka" "Peti" "Pierino" "Pit" "Pece" "Petruccio" "Pedrinho" "Petrica" "Petia" "Petya" "Pehr" "Pelle" "'
foreach diminutive of local PIETRO {
	replace ameriname = "PIETRO" if fname == "`diminutive'"
}

/* Pilade "No equivalents" */

/* Pilade "No diminutives" */

local Pinchas `" "Phinees" "Pinchas" "Finees" "Phineas" "Phinehas" "'
foreach variant of local Pinchas {
	replace ameriname = "Pinchas" if fname == "`variant'"
}

/* Pinchas "No diminutives" */

/* Pinches "No equivalents" */

/* Pinches "No diminutives" */

/* Pinchos "No equivalents" */

/* Pinchos "No diminutives" */

/* Pinchus "No equivalents" */

/* Pinchus "No diminutives" */

/* Pincus "No equivalents" */

/* Pincus "No diminutives" */

/* Pine "No equivalents" */

/* Pine "No diminutives" */

/* Pinia "No equivalents" */

/* Pinia "No diminutives" */

/* Pinie "No equivalents" */

/* Pinie "No diminutives" */

/* Pinkas "No equivalents" */

/* Pinkas "No diminutives" */

/* Pinkus "No equivalents" */

/* Pinkus "No diminutives" */

local Pio `" "Pio" "Pius" "Pío" "'
foreach variant of local Pio {
	replace ameriname = "Pio" if fname == "`variant'"
}

/* Pio "No diminutives" */

/* Pioter "No equivalents" */

/* Pioter "No diminutives" */

local Pista `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stevo" "Stipan" "Stipe" "Stipo" "Stjepan" "Štěpán" "Steffen" "Stef" "Stefanus" "Stephan" "Steven" "Ste" "Steph" "Steve" "Stevie" "Tahvo" "Tapani" "Teppo" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "Pista" "Pisti" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Stefek" "Szczepan" "Estevão" "Fane" "Ștefan" "Steafan" "Steaphan" "Steenie" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Pista {
	replace ameriname = "Pista" if fname == "`variant'"
}

/* Pista "No diminutives" */

/* Pjotr "No equivalents" */

/* Pjotr "No diminutives" */

local Placido `" "Placid" "Placide" "Placido" "Placidus" "Plácido" "'
foreach variant of local Placido {
	replace ameriname = "Placido" if fname == "`variant'"
}

/* Placido "No diminutives" */

local Plinio `" "Plinius" "Pliny" "Plinio" "Plínio" "'
foreach variant of local Plinio {
	replace ameriname = "Plinio" if fname == "`variant'"
}

/* Plinio "No diminutives" */

local Pompeo `" "Pompeius" "Pompey" "Pompeo" "'
foreach variant of local Pompeo {
	replace ameriname = "Pompeo" if fname == "`variant'"
}

/* Pompeo "No diminutives" */

/* Pompilio "No equivalents" */

/* Pompilio "No diminutives" */

local Poul `" "Pal" "Pali" "Pavli" "Paulus" "Boulos" "Bulus" "Boghos" "Poghos" "Paulos" "Paul" "Paol" "Pavel" "Pau" "Pol" "Paulu" "Pavao" "Pavle" "Poul" "Pauwel" "Paŭlo" "Páll" "Paavali" "Pauli" "Paulo" "Pavlos" "Pál" "Pól" "Paolo" "Pāvils" "Paulius" "Paora" "Pål" "Pavelu" "Paweł" "Pàl" "Pòl" "Pavol" "Pablo" "Pavlo" "'
foreach variant of local Poul {
	replace ameriname = "Poul" if fname == "`variant'"
}

local Poul `" "Pavo" "Palle" "Paulie" "Paĉjo" "Paavo" "Paulinho" "Pasha" "'
foreach diminutive of local Poul {
	replace ameriname = "Poul" if fname == "`diminutive'"
}

/* Pranas "No equivalents" */

/* Pranas "No diminutives" */

local Prosper `" "Prosper" "Prospero" "Prosperus" "'
foreach variant of local Prosper {
	replace ameriname = "Prosper" if fname == "`variant'"
}

/* Prosper "No diminutives" */

local Prospero `" "Prosper" "Prospero" "Prosperus" "'
foreach variant of local Prospero {
	replace ameriname = "Prospero" if fname == "`variant'"
}

/* Prospero "No diminutives" */

/* Quintilio "No equivalents" */

/* Quintilio "No diminutives" */

/* Quinto "No equivalents" */

/* Quinto "No diminutives" */

local Quirino `" "Quirijn" "Corin" "Quirin" "Quirino" "Quirinus" "'
foreach variant of local Quirino {
	replace ameriname = "Quirino" if fname == "`variant'"
}

/* Quirino "No diminutives" */

/* R "No equivalents" */

/* R "No diminutives" */

local Rachel `" "Rachel" "Rahel" "Rakel" "Rachael" "Racheal" "Rachelle" "Rachyl" "Racquel" "Raquel" "Raschelle" "Raakel" "Ráhel" "Ráichéal" "Rachele" "Rahela" "Ruchel" "'
foreach variant of local Rachel {
	replace ameriname = "Rachel" if fname == "`variant'"
}

local Rachel `" "Rae" "Raelene" "'
foreach diminutive of local Rachel {
	replace ameriname = "Rachel" if fname == "`diminutive'"
}

local Rachele `" "Rachel" "Rahel" "Rakel" "Rachael" "Racheal" "Rachelle" "Rachyl" "Racquel" "Raquel" "Raschelle" "Raakel" "Ráhel" "Ráichéal" "Rachele" "Rahela" "Ruchel" "'
foreach variant of local Rachele {
	replace ameriname = "Rachele" if fname == "`variant'"
}

local Rachele `" "Rae" "Raelene" "'
foreach diminutive of local Rachele {
	replace ameriname = "Rachele" if fname == "`diminutive'"
}

/* Rachid "No equivalents" */

/* Rachid "No diminutives" */

/* Rachmiel "No equivalents" */

/* Rachmiel "No diminutives" */

/* Rachmil "No equivalents" */

/* Rachmil "No diminutives" */

local Rada `" "Rada" "Radana" "MASCULINE FORMS" "Rade" "Radovan" "Radek" "Radúz" "Radu" "'
foreach variant of local Rada {
	replace ameriname = "Rada" if fname == "`variant'"
}

/* Rada "No diminutives" */

local Rade `" "Radko" "Radoslav" "Rayko" "Rayno" "Rade" "Radek" "Radoš" "Radovan" "Radúz" "Milorad" "Racław" "Radosław" "Radu" "'
foreach variant of local Rade {
	replace ameriname = "Rade" if fname == "`variant'"
}

/* Rade "No diminutives" */

/* Rafaele "No equivalents" */

/* Rafaele "No diminutives" */

/* Rafail "No equivalents" */

/* Rafail "No diminutives" */

local Raffael `" "Raphael" "Rafa'el" "Rafaël" "Raphaël" "Rafael" "Raffael" "Raffaele" "Raffaello" "Rafał" "'
foreach variant of local Raffael {
	replace ameriname = "Raffael" if fname == "`variant'"
}

local Raffael `" "Raf" "Rafinha" "Rafa" "'
foreach diminutive of local Raffael {
	replace ameriname = "Raffael" if fname == "`diminutive'"
}

local Raffaela `" "Raphaëlle" "Raffaela" "Raphaela" "Raffaella" "Rafaela" "MASCULINE FORMS" "Raphael" "Rafa'el" "Raf" "Rafaël" "Raphaël" "Rafael" "Raffael" "Raffaele" "Raffaello" "Rafał" "Rafinha" "Rafa" "'
foreach variant of local Raffaela {
	replace ameriname = "Raffaela" if fname == "`variant'"
}

/* Raffaela "No diminutives" */

local RAFFAELE `" "Raphael" "Rafa'el" "Rafaël" "Raphaël" "Rafael" "Raffael" "Raffaele" "Raffaello" "Rafał" "'
foreach variant of local RAFFAELE {
	replace ameriname = "RAFFAELE" if fname == "`variant'"
}

local RAFFAELE `" "Raf" "Rafinha" "Rafa" "'
foreach diminutive of local RAFFAELE {
	replace ameriname = "RAFFAELE" if fname == "`diminutive'"
}

/* Raffaelle "No equivalents" */

/* Raffaelle "No diminutives" */

local Raffaello `" "Raphael" "Rafa'el" "Rafaël" "Raphaël" "Rafael" "Raffael" "Raffaele" "Raffaello" "Rafał" "'
foreach variant of local Raffaello {
	replace ameriname = "Raffaello" if fname == "`variant'"
}

local Raffaello `" "Raf" "Rafinha" "Rafa" "'
foreach diminutive of local Raffaello {
	replace ameriname = "Raffaello" if fname == "`diminutive'"
}

/* Raffaelo "No equivalents" */

/* Raffaelo "No diminutives" */

local Ragnar `" "Raganhar" "Rainer" "Reiner" "Ragnarr" "Ragnar" "Reinier" "Rayner" "Rainier" "Raniero" "Reneer" "Rainerio" "'
foreach variant of local Ragnar {
	replace ameriname = "Ragnar" if fname == "`variant'"
}

local Ragnar `" "Rain" "Nero" "'
foreach diminutive of local Ragnar {
	replace ameriname = "Ragnar" if fname == "`diminutive'"
}

local Ragnvald `" "Raginald" "Reinald" "Reinhold" "Ragnvaldr" "Ragnvald" "Reinoud" "Reinout" "Reginald" "Reynold" "Ronald" "Reino" "Renaud" "Reynaud" "Raghnall" "Rinaldo" "Reinaldo" "Reynaldo" "Ronaldo" "Ranald" "Rheinallt" "'
foreach variant of local Ragnvald {
	replace ameriname = "Ragnvald" if fname == "`variant'"
}

local Ragnvald `" "Reg" "Reggie" "Ron" "Ronnie" "Ronny" "'
foreach diminutive of local Ragnvald {
	replace ameriname = "Ragnvald" if fname == "`diminutive'"
}

/* Raimond "No equivalents" */

/* Raimond "No diminutives" */

local Raimondo `" "Raginmund" "Raimund" "Erramun" "Ramon" "Raymond" "Raymund" "Raimo" "Reima" "Reimund" "Réamann" "Redmond" "Redmund" "Raimondo" "Raimonds" "Remao" "Raimondas" "Rajmund" "Raymundo" "Raimundo" "Ramón" "'
foreach variant of local Raimondo {
	replace ameriname = "Raimondo" if fname == "`variant'"
}

local Raimondo `" "Ray" "Mao" "'
foreach diminutive of local Raimondo {
	replace ameriname = "Raimondo" if fname == "`diminutive'"
}

local Ramiro `" "Raginmar" "Ramirus" "Ramiro" "'
foreach variant of local Ramiro {
	replace ameriname = "Ramiro" if fname == "`variant'"
}

/* Ramiro "No diminutives" */

local Raoul `" "Radulf" "Ráðúlfr" "Ralf" "Ralph" "Rafe" "Raoul" "Raul" "Raúl" "'
foreach variant of local Raoul {
	replace ameriname = "Raoul" if fname == "`variant'"
}

local Raoul `" "Ralphie" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Raoul {
	replace ameriname = "Raoul" if fname == "`diminutive'"
}

local Raphael `" "Raphael" "Rafa'el" "Rafaël" "Raphaël" "Rafael" "Raffael" "Raffaele" "Raffaello" "Rafał" "'
foreach variant of local Raphael {
	replace ameriname = "Raphael" if fname == "`variant'"
}

local Raphael `" "Raf" "Rafinha" "Rafa" "'
foreach diminutive of local Raphael {
	replace ameriname = "Raphael" if fname == "`diminutive'"
}

local Rasmus `" "Erasmos" "Rasmus" "Erasmo" "Erasmus" "Erazem" "'
foreach variant of local Rasmus {
	replace ameriname = "Rasmus" if fname == "`variant'"
}

local Rasmus `" "Elmo" "Ermo" "'
foreach diminutive of local Rasmus {
	replace ameriname = "Rasmus" if fname == "`diminutive'"
}

local Raul `" "Radulf" "Ráðúlfr" "Ralf" "Ralph" "Rafe" "Raoul" "Raul" "Raúl" "'
foreach variant of local Raul {
	replace ameriname = "Raul" if fname == "`variant'"
}

local Raul `" "Ralphie" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Raul {
	replace ameriname = "Raul" if fname == "`diminutive'"
}

local Ray `" "Raginmund" "Raimund" "Erramun" "Ramon" "Ray" "Raimo" "Reima" "Raymond" "Reimund" "Réamann" "Redmond" "Redmund" "Raimondo" "Raimonds" "Mao" "Remao" "Raimondas" "Rajmund" "Raymundo" "Raimundo" "Ramón" "'
foreach variant of local Ray {
	replace ameriname = "Ray" if fname == "`variant'"
}

/* Ray "No diminutives" */

local Reggie `" "Raginald" "Reinald" "Reinhold" "Ragnvaldr" "Ragnvald" "Reinoud" "Reinout" "Reg" "Reggie" "Ron" "Ronnie" "Ronny" "Reino" "Renaud" "Reynaud" "Raghnall" "Rinaldo" "Reinaldo" "Reynaldo" "Ronaldo" "Ranald" "Ronald" "Rheinallt" "'
foreach variant of local Reggie {
	replace ameriname = "Reggie" if fname == "`variant'"
}

/* Reggie "No diminutives" */

local Reidar `" "Hreiðarr" "'
foreach variant of local Reidar {
	replace ameriname = "Reidar" if fname == "`variant'"
}

/* Reidar "No diminutives" */

local Reinhard `" "Raginhard" "Rainard" "Reinhard" "Raynard" "Reynard" "Renard" "'
foreach variant of local Reinhard {
	replace ameriname = "Reinhard" if fname == "`variant'"
}

/* Reinhard "No diminutives" */

local Reino `" "Raginald" "Reinald" "Reinhold" "Ragnvaldr" "Ragnvald" "Reinoud" "Reinout" "Reginald" "Reynold" "Ronald" "Reino" "Renaud" "Reynaud" "Raghnall" "Rinaldo" "Reinaldo" "Reynaldo" "Ronaldo" "Ranald" "Rheinallt" "'
foreach variant of local Reino {
	replace ameriname = "Reino" if fname == "`variant'"
}

local Reino `" "Reg" "Reggie" "Ron" "Ronnie" "Ronny" "'
foreach diminutive of local Reino {
	replace ameriname = "Reino" if fname == "`diminutive'"
}

/* Reise "No equivalents" */

/* Reise "No diminutives" */

/* Reisel "No equivalents" */

/* Reisel "No diminutives" */

/* Remi "No equivalents" */

/* Remi "No diminutives" */

local Remigio `" "Rémi" "Rémy" "Remigio" "Remigius" "Remigiusz" "'
foreach variant of local Remigio {
	replace ameriname = "Remigio" if fname == "`variant'"
}

/* Remigio "No diminutives" */

local Remo `" "Remo" "Remus" "'
foreach variant of local Remo {
	replace ameriname = "Remo" if fname == "`variant'"
}

/* Remo "No diminutives" */

/* Remy "No equivalents" */

/* Remy "No diminutives" */

local Renzo `" "Laurentius" "Llorenç" "Lovre" "Lovrenco" "Lovro" "Vavřinec" "Lars" "Lasse" "Laurits" "Lauritz" "Lorens" "Lau" "Laurens" "Lourens" "Rens" "Larrie" "Larry" "Lauren" "Laurence" "Laurie" "Lawrence" "Lawrie" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Laurent" "Laurenz" "Lenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Loris" "Renzo" "Lor" "Laurynas" "Larkin" "Law" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "Lorenzo" "'
foreach variant of local Renzo {
	replace ameriname = "Renzo" if fname == "`variant'"
}

local Renzo `" "Laz" "'
foreach diminutive of local Renzo {
	replace ameriname = "Renzo" if fname == "`diminutive'"
}

local Reuben `" "Rouben" "Ruben" "Reuven" "Reuben" "Ruuben" "Rubem" "Rubens" "Rúben" "Rubén" "'
foreach variant of local Reuben {
	replace ameriname = "Reuben" if fname == "`variant'"
}

local Reuben `" "Rube" "'
foreach diminutive of local Reuben {
	replace ameriname = "Reuben" if fname == "`diminutive'"
}

/* Rezso "No equivalents" */

/* Rezso "No diminutives" */

local Rich `" "Richard" "Ricohard" "Ricard" "Rikard" "Dick" "Rich" "Richie" "Rick" "Rickey" "Ricki" "Rickie" "Ricky" "Ritchie" "Rikhard" "Riku" "Richárd" "Rikárd" "Risteárd" "Riccardo" "Rihards" "Ričardas" "Dicun" "Hudde" "Ryszard" "Ricardo" "Riško" "Rišo" "Rihard" "Rico" "Rhisiart" "'
foreach variant of local Rich {
	replace ameriname = "Rich" if fname == "`variant'"
}

/* Rich "No diminutives" */

/* Richd "No equivalents" */

/* Richd "No diminutives" */

local Rinaldo `" "Raginald" "Reinald" "Reinhold" "Ragnvaldr" "Ragnvald" "Reinoud" "Reinout" "Reginald" "Reynold" "Ronald" "Reino" "Renaud" "Reynaud" "Raghnall" "Rinaldo" "Reinaldo" "Reynaldo" "Ronaldo" "Ranald" "Rheinallt" "'
foreach variant of local Rinaldo {
	replace ameriname = "Rinaldo" if fname == "`variant'"
}

local Rinaldo `" "Reg" "Reggie" "Ron" "Ronnie" "Ronny" "'
foreach diminutive of local Rinaldo {
	replace ameriname = "Rinaldo" if fname == "`diminutive'"
}

local Rino `" "Audo" "Odilo" "Odo" "Otto" "Ianuarius" "Januarius" "Severinus" "Severin" "Søren" "Odilon" "Séverin" "Sören" "Udo" "Ottó" "Rino" "Victorinus" "Ode" "Eudes" "Seweryn" "Severino" "Victorino" "Jenaro" "Seve" "'
foreach variant of local Rino {
	replace ameriname = "Rino" if fname == "`variant'"
}

/* Rino "No diminutives" */

local Risto `" "Hristo" "Hristofor" "Kristofor" "Krsto" "Kryštof" "Christoffer" "Kris" "Kristoffer" "Christoffel" "Chip" "Chris" "Christopher" "Kit" "Kristopher" "Topher" "Risto" "Christophe" "Christoph" "Christoforos" "Kristóf" "Christie" "Christy" "Críostóir" "Cristoforo" "Christophoros" "Christophorus" "Kristaps" "Kristupas" "Krzyś" "Krzysiek" "Krzysztof" "Cristóvão" "Kester" "Krištof" "Cristóbal" "'
foreach variant of local Risto {
	replace ameriname = "Risto" if fname == "`variant'"
}

/* Risto "No diminutives" */

/* Riven "No equivalents" */

/* Riven "No diminutives" */

/* Riwe "No equivalents" */

/* Riwe "No diminutives" */

/* Riwen "No equivalents" */

/* Riwen "No diminutives" */

/* Riwke "No equivalents" */

/* Riwke "No diminutives" */

/* Riziero "No equivalents" */

/* Riziero "No diminutives" */

local ROBERT `" "Hrodebert" "Hrodpreht" "Robert" "Roparzh" "Robrecht" "Rupert" "Roopertti" "Ruprecht" "Róbert" "Roibeárd" "Roberto" "Roberts" "Robertas" "Raibeart" "Ruperto" "'
foreach variant of local ROBERT {
	replace ameriname = "ROBERT" if fname == "`variant'"
}

local ROBERT `" "Bob" "Brecht" "Rob" "Robbe" "Robin" "Bobbie" "Bobby" "Robbie" "Robby" "Pertti" "Roope" "Robi" "Berto" "Hob" "Hopkin" "Rab" "Rabbie" "Hopcyn" "'
foreach diminutive of local ROBERT {
	replace ameriname = "ROBERT" if fname == "`diminutive'"
}

local Robin `" "Hrodebert" "Hrodpreht" "Robert" "Roparzh" "Bob" "Brecht" "Rob" "Robbe" "Robin" "Robbie" "Robby" "Pertti" "Roope" "Roopertti" "Rupert" "Ruprecht" "Róbert" "Robi" "Roibeárd" "Berto" "Roberto" "Roberts" "Robertas" "Hob" "Rab" "Rabbie" "Raibeart" "Ruperto" "'
foreach variant of local Robin {
	replace ameriname = "Robin" if fname == "`variant'"
}

local Robin `" "Bobbie" "Bobby" "Hopkin" "Hopcyn" "'
foreach diminutive of local Robin {
	replace ameriname = "Robin" if fname == "`diminutive'"
}

/* Rocca "No equivalents" */

/* Rocca "No diminutives" */

local ROCCO `" "Rocco" "Rochus" "Roc" "Roko" "Rokus" "Roch" "Roque" "Rok" "'
foreach variant of local ROCCO {
	replace ameriname = "ROCCO" if fname == "`variant'"
}

local ROCCO `" "Rocky" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local ROCCO {
	replace ameriname = "ROCCO" if fname == "`diminutive'"
}

local Rochus `" "Rocco" "Rochus" "Roc" "Roko" "Rokus" "Roch" "Roque" "Rok" "'
foreach variant of local Rochus {
	replace ameriname = "Rochus" if fname == "`variant'"
}

local Rochus `" "Rocky" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Rochus {
	replace ameriname = "Rochus" if fname == "`diminutive'"
}

local Roderick `" "Hroderich" "Roderic" "Roderick" "Rodrigue" "Rodrigo" "Rorie" "Rory" "Ruaidhrí" "Ruaidrí" "Ruairí" "Ruairi" "Ruairidh" "Ruaraidh" "Ruaridh" "Rhydderch" "'
foreach variant of local Roderick {
	replace ameriname = "Roderick" if fname == "`variant'"
}

local Roderick `" "Rod" "Roddy" "Roi" "Rui" "Ruy" "'
foreach diminutive of local Roderick {
	replace ameriname = "Roderick" if fname == "`diminutive'"
}

local Rodrigo `" "Hroderich" "Roderic" "Roderick" "Rodrigue" "Rodrigo" "'
foreach variant of local Rodrigo {
	replace ameriname = "Rodrigo" if fname == "`variant'"
}

local Rodrigo `" "Rod" "Roddy" "Roi" "Rui" "Ruy" "'
foreach diminutive of local Rodrigo {
	replace ameriname = "Rodrigo" if fname == "`diminutive'"
}

/* Roelf "No equivalents" */

/* Roelf "No diminutives" */

local Roelof `" "Hrodulf" "Hrolf" "Hrólfr" "Hróðólfr" "Hroðulf" "Hrothulf" "Rudolf" "Rolf" "Rodolf" "Roelof" "Rodolph" "Rollo" "Rolo" "Rolph" "Rudolph" "Rodolphe" "Rodolfo" "Roul" "'
foreach variant of local Roelof {
	replace ameriname = "Roelof" if fname == "`variant'"
}

local Roelof `" "Roel" "Ruud" "Rudy" "Ruedi" "Rudi" "Fito" "Rodolfito" "'
foreach diminutive of local Roelof {
	replace ameriname = "Roelof" if fname == "`diminutive'"
}

/* Rogelio "No equivalents" */

/* Rogelio "No diminutives" */

local Roland `" "Hrodland" "Roeland" "Roland" "Rolland" "Rowland" "Loránd" "Lóránt" "Orlando" "Rolando" "Roldão" "Rolan" "Roldán" "'
foreach variant of local Roland {
	replace ameriname = "Roland" if fname == "`variant'"
}

local Roland `" "Roel" "Roly" "Rowley" "'
foreach diminutive of local Roland {
	replace ameriname = "Roland" if fname == "`diminutive'"
}

local Rolando `" "Hrodland" "Roeland" "Roland" "Rolland" "Rowland" "Loránd" "Lóránt" "Orlando" "Rolando" "Roldão" "Rolan" "Roldán" "'
foreach variant of local Rolando {
	replace ameriname = "Rolando" if fname == "`variant'"
}

local Rolando `" "Roel" "Roly" "Rowley" "'
foreach diminutive of local Rolando {
	replace ameriname = "Rolando" if fname == "`diminutive'"
}

local Romain `" "Romà" "Roman" "Romain" "Román" "Romano" "Romeo" "Romolo" "Romaeus" "Romanus" "Romulus" "'
foreach variant of local Romain {
	replace ameriname = "Romain" if fname == "`variant'"
}

local Romain `" "Roma" "'
foreach diminutive of local Romain {
	replace ameriname = "Romain" if fname == "`diminutive'"
}

local Romano `" "Romà" "Roman" "Romain" "Román" "Romano" "Romeo" "Romolo" "Romaeus" "Romanus" "Romulus" "'
foreach variant of local Romano {
	replace ameriname = "Romano" if fname == "`variant'"
}

local Romano `" "Roma" "'
foreach diminutive of local Romano {
	replace ameriname = "Romano" if fname == "`diminutive'"
}

local Romeo `" "Romà" "Roman" "Romain" "Román" "Romano" "Romeo" "Romolo" "Romaeus" "Romanus" "Romulus" "'
foreach variant of local Romeo {
	replace ameriname = "Romeo" if fname == "`variant'"
}

local Romeo `" "Roma" "'
foreach diminutive of local Romeo {
	replace ameriname = "Romeo" if fname == "`diminutive'"
}

/* Romildo "No equivalents" */

/* Romildo "No diminutives" */

local Romolo `" "Romà" "Roman" "Romain" "Román" "Romano" "Romeo" "Romolo" "Romaeus" "Romanus" "Romulus" "'
foreach variant of local Romolo {
	replace ameriname = "Romolo" if fname == "`variant'"
}

local Romolo `" "Roma" "'
foreach diminutive of local Romolo {
	replace ameriname = "Romolo" if fname == "`diminutive'"
}

/* Romualdo "No equivalents" */

/* Romualdo "No diminutives" */

/* Rosa "No equivalents" */

/* Rosa "No diminutives" */

/* Rosalino "No equivalents" */

/* Rosalino "No diminutives" */

/* Rosano "No equivalents" */

/* Rosano "No diminutives" */

local Rosaria `" "Roser" "Rosaria" "Rosário" "Rosario" "'
foreach variant of local Rosaria {
	replace ameriname = "Rosaria" if fname == "`variant'"
}

local Rosaria `" "Charo" "MASCULINE FORMS" "'
foreach diminutive of local Rosaria {
	replace ameriname = "Rosaria" if fname == "`diminutive'"
}

local Rosina `" "Roza" "Ruzha" "Rozalija" "Rozika" "Ruža" "Ružica" "Růžena" "Rosa" "Roos" "Roosje" "Rosalie" "Rosabel" "Rosabella" "Rose" "Rosie" "Rosy" "Roselle" "Rosette" "Rosine" "Rosalía" "Róza" "Rozália" "Rózsa" "Rózsi" "Róis" "Róisín" "Rosheen" "Lia" "Rosella" "Rosetta" "Rosina" "Rosalia" "Rozālija" "Rožė" "Róża" "Rozalia" "Rosália" "Rosinha" "Rozaliya" "Zala" "Rosita" "Raisa" "Raisel" "'
foreach variant of local Rosina {
	replace ameriname = "Rosina" if fname == "`variant'"
}

/* Rosina "No diminutives" */

/* Rosolino "No equivalents" */

/* Rosolino "No diminutives" */

local Rowland `" "Hrodland" "Roeland" "Roland" "Rolland" "Rowland" "Loránd" "Lóránt" "Orlando" "Rolando" "Roldão" "Rolan" "Roldán" "'
foreach variant of local Rowland {
	replace ameriname = "Rowland" if fname == "`variant'"
}

local Rowland `" "Roel" "Roly" "Rowley" "'
foreach diminutive of local Rowland {
	replace ameriname = "Rowland" if fname == "`diminutive'"
}

local Ruben `" "Rouben" "Ruben" "Reuven" "Reuben" "Ruuben" "Rubem" "Rubens" "Rúben" "Rubén" "'
foreach variant of local Ruben {
	replace ameriname = "Ruben" if fname == "`variant'"
}

local Ruben `" "Rube" "'
foreach diminutive of local Ruben {
	replace ameriname = "Ruben" if fname == "`diminutive'"
}

local Ruchel `" "Rachel" "Rahel" "Rakel" "Rachael" "Racheal" "Rachelle" "Rachyl" "Racquel" "Raquel" "Raschelle" "Raakel" "Ráhel" "Ráichéal" "Rachele" "Rahela" "Ruchel" "'
foreach variant of local Ruchel {
	replace ameriname = "Ruchel" if fname == "`variant'"
}

local Ruchel `" "Rae" "Raelene" "'
foreach diminutive of local Ruchel {
	replace ameriname = "Ruchel" if fname == "`diminutive'"
}

local Rudi `" "Hrodulf" "Hrolf" "Hrólfr" "Hróðólfr" "Hroðulf" "Hrothulf" "Rudolf" "Rolf" "Rodolf" "Roel" "Roelof" "Ruud" "Rodolph" "Rollo" "Rolo" "Rolph" "Rudolph" "Rudy" "Rodolphe" "Ruedi" "Rudi" "Rodolfo" "Roul" "Rodolfito" "Roffe" "'
foreach variant of local Rudi {
	replace ameriname = "Rudi" if fname == "`variant'"
}

local Rudi `" "Fito" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Rudi {
	replace ameriname = "Rudi" if fname == "`diminutive'"
}

local Rudolph `" "Hrodulf" "Hrolf" "Hrólfr" "Hróðólfr" "Hroðulf" "Hrothulf" "Rudolf" "Rolf" "Rodolf" "Roelof" "Rodolph" "Rollo" "Rolo" "Rolph" "Rudolph" "Rodolphe" "Rodolfo" "Roul" "'
foreach variant of local Rudolph {
	replace ameriname = "Rudolph" if fname == "`variant'"
}

local Rudolph `" "Roel" "Ruud" "Rudy" "Ruedi" "Rudi" "Fito" "Rodolfito" "'
foreach diminutive of local Rudolph {
	replace ameriname = "Rudolph" if fname == "`diminutive'"
}

local Ruggero `" "Hrodger" "Hróarr" "Hróðgeirr" "Hroðgar" "Hrothgar" "Roger" "Rogier" "Rutger" "Rodger" "Rüdiger" "Ruggero" "Ruggiero" "Roar" "Rogério" "'
foreach variant of local Ruggero {
	replace ameriname = "Ruggero" if fname == "`variant'"
}

local Ruggero `" "Rodge" "'
foreach diminutive of local Ruggero {
	replace ameriname = "Ruggero" if fname == "`diminutive'"
}

local Ruggiero `" "Hrodger" "Hróarr" "Hróðgeirr" "Hroðgar" "Hrothgar" "Roger" "Rogier" "Rutger" "Rodger" "Rüdiger" "Ruggero" "Ruggiero" "Roar" "Rogério" "'
foreach variant of local Ruggiero {
	replace ameriname = "Ruggiero" if fname == "`variant'"
}

local Ruggiero `" "Rodge" "'
foreach diminutive of local Ruggiero {
	replace ameriname = "Ruggiero" if fname == "`diminutive'"
}

local Rune `" "Rúni" "Rune" "'
foreach variant of local Rune {
	replace ameriname = "Rune" if fname == "`variant'"
}

/* Rune "No diminutives" */

local Rupert `" "Hrodebert" "Hrodpreht" "Robert" "Roparzh" "Robrecht" "Rupert" "Roopertti" "Ruprecht" "Róbert" "Roibeárd" "Roberto" "Roberts" "Robertas" "Raibeart" "Ruperto" "'
foreach variant of local Rupert {
	replace ameriname = "Rupert" if fname == "`variant'"
}

local Rupert `" "Bob" "Brecht" "Rob" "Robbe" "Robin" "Bobbie" "Bobby" "Robbie" "Robby" "Pertti" "Roope" "Robi" "Berto" "Hob" "Hopkin" "Rab" "Rabbie" "Hopcyn" "'
foreach diminutive of local Rupert {
	replace ameriname = "Rupert" if fname == "`diminutive'"
}

local Russell `" "Russel" "Russell" "'
foreach variant of local Russell {
	replace ameriname = "Russell" if fname == "`variant'"
}

local Russell `" "Russ" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Russell {
	replace ameriname = "Russell" if fname == "`diminutive'"
}

/* Ruven "No equivalents" */

/* Ruven "No diminutives" */

/* Ruvin "No equivalents" */

/* Ruvin "No diminutives" */

/* Ruwen "No equivalents" */

/* Ruwen "No diminutives" */

/* Ruwin "No equivalents" */

/* Ruwin "No diminutives" */

/* S "No equivalents" */

/* S "No diminutives" */

/* Sabastiano "No equivalents" */

/* Sabastiano "No diminutives" */

local Sabino `" "Sabinus" "Sabino" "Savino" "'
foreach variant of local Sabino {
	replace ameriname = "Sabino" if fname == "`variant'"
}

/* Sabino "No diminutives" */

/* Said "No equivalents" */

/* Said "No diminutives" */

local Salamon `" "Sulaiman" "Sulayman" "Salomon" "Shelomoh" "Solomon" "Shlomo" "Suleiman" "Salamon" "Salomão" "Salomón" "Süleyman" "Zalman" "'
foreach variant of local Salamon {
	replace ameriname = "Salamon" if fname == "`variant'"
}

local Salamon `" "Suljo" "Sol" "'
foreach diminutive of local Salamon {
	replace ameriname = "Salamon" if fname == "`diminutive'"
}

/* Salem "No equivalents" */

/* Salem "No diminutives" */

local Salim `" "Saleem" "Salim" "Selim" "'
foreach variant of local Salim {
	replace ameriname = "Salim" if fname == "`variant'"
}

/* Salim "No diminutives" */

local Sally `" "Sara" "Sarah" "Sarra" "Sára" "Sadie" "Sallie" "Sally" "Sarina" "Saara" "Saija" "Salli" "Sari" "Kala" "Sarit" "Sári" "Sárika" "Sarita" "Sassa" "Suri" "Tzeitel" "'
foreach variant of local Sally {
	replace ameriname = "Sally" if fname == "`variant'"
}

local Sally `" "Sal" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Sally {
	replace ameriname = "Sally" if fname == "`diminutive'"
}

local Salman `" "Salman" "'
foreach variant of local Salman {
	replace ameriname = "Salman" if fname == "`variant'"
}

/* Salman "No diminutives" */

/* Salmen "No equivalents" */

/* Salmen "No diminutives" */

/* Salmon "No equivalents" */

/* Salmon "No diminutives" */

/* Saloman "No equivalents" */

/* Saloman "No diminutives" */

local Salvador `" "Salvatore" "Salvator" "Salvador" "'
foreach variant of local Salvador {
	replace ameriname = "Salvador" if fname == "`variant'"
}

local Salvador `" "Sal" "Tore" "'
foreach diminutive of local Salvador {
	replace ameriname = "Salvador" if fname == "`diminutive'"
}

/* Salvadore "No equivalents" */

/* Salvadore "No diminutives" */

/* Salvatire "No equivalents" */

/* Salvatire "No diminutives" */

/* Salvatne "No equivalents" */

/* Salvatne "No diminutives" */

local Salvator `" "Salvatore" "Salvator" "Salvador" "'
foreach variant of local Salvator {
	replace ameriname = "Salvator" if fname == "`variant'"
}

local Salvator `" "Sal" "Tore" "'
foreach diminutive of local Salvator {
	replace ameriname = "Salvator" if fname == "`diminutive'"
}

local SALVATORE `" "Salvatore" "Salvator" "Salvador" "'
foreach variant of local SALVATORE {
	replace ameriname = "SALVATORE" if fname == "`variant'"
}

local SALVATORE `" "Sal" "Tore" "'
foreach diminutive of local SALVATORE {
	replace ameriname = "SALVATORE" if fname == "`diminutive'"
}

/* Salvatori "No equivalents" */

/* Salvatori "No diminutives" */

/* Salvatoro "No equivalents" */

/* Salvatoro "No diminutives" */

/* Salvatue "No equivalents" */

/* Salvatue "No diminutives" */

/* Sami "No equivalents" */

/* Sami "No diminutives" */

/* Saml "No equivalents" */

/* Saml "No diminutives" */

local Sammy `" "Samouel" "Sampson" "Shemu'el" "Shimshon" "Samson" "Samuhel" "Samuel" "Samuil" "Samantha" "Sam" "Sammi" "Sammie" "Sammy" "Sami" "Samppa" "Samu" "Samuli" "Shmuel" "Sámuel" "Samanta" "Samuele" "Sansone" "Samoil" "Samuilu" "Sawyl" "'
foreach variant of local Sammy {
	replace ameriname = "Sammy" if fname == "`variant'"
}

/* Sammy "No diminutives" */

local Samouel `" "Samouel" "Shemu'el" "Samuhel" "Samuel" "Samuil" "Samuli" "Shmuel" "Sámuel" "Samuele" "Samoil" "Samuilu" "Sawyl" "'
foreach variant of local Samouel {
	replace ameriname = "Samouel" if fname == "`variant'"
}

local Samouel `" "Sam" "Sammie" "Sammy" "Sami" "Samppa" "Samu" "'
foreach diminutive of local Samouel {
	replace ameriname = "Samouel" if fname == "`diminutive'"
}

local Samson `" "Sampson" "Shimshon" "Samson" "Sansone" "'
foreach variant of local Samson {
	replace ameriname = "Samson" if fname == "`variant'"
}

local Samson `" "Sam" "Sammie" "Sammy" "'
foreach diminutive of local Samson {
	replace ameriname = "Samson" if fname == "`diminutive'"
}

local Samu `" "Samouel" "Shemu'el" "Samuhel" "Samuel" "Samuil" "Sam" "Sammie" "Sammy" "Sami" "Samppa" "Samu" "Shmuel" "Samuele" "Samoil" "Samuilu" "Sawyl" "'
foreach variant of local Samu {
	replace ameriname = "Samu" if fname == "`variant'"
}

/* Samu "No diminutives" */

local Samuele `" "Samouel" "Shemu'el" "Samuhel" "Samuel" "Samuil" "Samuli" "Shmuel" "Sámuel" "Samuele" "Samoil" "Samuilu" "Sawyl" "'
foreach variant of local Samuele {
	replace ameriname = "Samuele" if fname == "`variant'"
}

local Samuele `" "Sam" "Sammie" "Sammy" "Sami" "Samppa" "Samu" "'
foreach diminutive of local Samuele {
	replace ameriname = "Samuele" if fname == "`diminutive'"
}

local Samuil `" "Samouel" "Shemu'el" "Samuhel" "Samuel" "Samuil" "Samuli" "Shmuel" "Sámuel" "Samuele" "Samoil" "Samuilu" "Sawyl" "'
foreach variant of local Samuil {
	replace ameriname = "Samuil" if fname == "`variant'"
}

local Samuil `" "Sam" "Sammie" "Sammy" "Sami" "Samppa" "Samu" "'
foreach diminutive of local Samuil {
	replace ameriname = "Samuil" if fname == "`diminutive'"
}

local Sander `" "Aleksander" "Skender" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Sasho" "Àlex" "Alexandre" "Sandi" "Saša" "Aleš" "Alexandr" "Alex" "Sander" "Lex" "Xander" "Al" "Alec" "Sandy" "Zander" "Aleĉjo" "Aleksandro" "Ale" "Aleksanteri" "Samppa" "Santeri" "Santtu" "Sacha" "Sasha" "Aleksandre" "Sandro" "Sascha" "Sándor" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aca" "Ace" "Aco" "Aleksandru" "Sikandar" "Eskandar" "Aleks" "Olek" "Xande" "Xandinho" "Alexandru" "Sandu" "Sanya" "Shura" "Alasdair" "Alastair" "Alistair" "Alister" "Ally" "Sawney" "Sašo" "Alejandro" "İskender" "Oleksander" "Oleksandr" "Oles" "Sender" "'
foreach variant of local Sander {
	replace ameriname = "Sander" if fname == "`variant'"
}

local Sander `" "Sanyi" "'
foreach diminutive of local Sander {
	replace ameriname = "Sander" if fname == "`diminutive'"
}

/* Sane "No equivalents" */

/* Sane "No diminutives" */

local Santa `" "Santa" "'
foreach variant of local Santa {
	replace ameriname = "Santa" if fname == "`variant'"
}

local Santa `" "Santina" "Santuzza" "MASCULINE FORMS" "Santino" "'
foreach diminutive of local Santa {
	replace ameriname = "Santa" if fname == "`diminutive'"
}

/* Sante "No equivalents" */

/* Sante "No diminutives" */

/* Santi "No equivalents" */

/* Santi "No diminutives" */

local Santiago `" "Xanti" "Santiago" "'
foreach variant of local Santiago {
	replace ameriname = "Santiago" if fname == "`variant'"
}

local Santiago `" "Dídac" "Didacus" "Thiago" "Diogo" "Tiago" "Diego" "'
foreach diminutive of local Santiago {
	replace ameriname = "Santiago" if fname == "`diminutive'"
}

local Santino `" "Santino" "'
foreach variant of local Santino {
	replace ameriname = "Santino" if fname == "`variant'"
}

/* Santino "No diminutives" */

/* Santolo "No equivalents" */

/* Santolo "No diminutives" */

local Sara `" "Sara" "Sarah" "Sarra" "Sára" "Sera" "Saara" "Sari" "Kala" "Suri" "'
foreach variant of local Sara {
	replace ameriname = "Sara" if fname == "`variant'"
}

local Sara `" "Sadie" "Sal" "Sallie" "Sally" "Sarina" "Saija" "Salli" "Sarit" "Sári" "Sárika" "Sarita" "Sassa" "'
foreach diminutive of local Sara {
	replace ameriname = "Sara" if fname == "`diminutive'"
}

local Sarkis `" "Sergius" "Sargis" "Sarkis" "Sergei" "Sergej" "Sergey" "Sergi" "Serge" "Sergio" "Sergiusz" "Sérgio" "Serghei" "Sergiu" "'
foreach variant of local Sarkis {
	replace ameriname = "Sarkis" if fname == "`variant'"
}

/* Sarkis "No diminutives" */

local Saul `" "Saoul" "Sha'ul" "Saul" "Sauli" "Saulius" "'
foreach variant of local Saul {
	replace ameriname = "Saul" if fname == "`variant'"
}

/* Saul "No diminutives" */

local Sava `" "Sava" "Saba" "Sabas" "Sabbas" "Savva" "'
foreach variant of local Sava {
	replace ameriname = "Sava" if fname == "`variant'"
}

/* Sava "No diminutives" */

/* Saverino "No equivalents" */

/* Saverino "No diminutives" */

local Savino `" "Sabinus" "Sabino" "Savino" "'
foreach variant of local Savino {
	replace ameriname = "Savino" if fname == "`variant'"
}

/* Savino "No diminutives" */

/* Savo "No equivalents" */

/* Savo "No diminutives" */

/* Sawel "No equivalents" */

/* Sawel "No diminutives" */

/* Schabse "No equivalents" */

/* Schabse "No diminutives" */

/* Schaie "No equivalents" */

/* Schaie "No diminutives" */

/* Schaja "No equivalents" */

/* Schaja "No diminutives" */

/* Schame "No equivalents" */

/* Schame "No diminutives" */

/* Scheie "No equivalents" */

/* Scheie "No diminutives" */

/* Scheindel "No equivalents" */

/* Scheindel "No diminutives" */

/* Scheine "No equivalents" */

/* Scheine "No diminutives" */

/* Schepsel "No equivalents" */

/* Schepsel "No diminutives" */

/* Schie "No equivalents" */

/* Schie "No diminutives" */

/* Schiel "No equivalents" */

/* Schiel "No diminutives" */

/* Schije "No equivalents" */

/* Schije "No diminutives" */

/* Schike "No equivalents" */

/* Schike "No diminutives" */

/* Schimen "No equivalents" */

/* Schimen "No diminutives" */

/* Schimon "No equivalents" */

/* Schimon "No diminutives" */

/* Schlaime "No equivalents" */

/* Schlaime "No diminutives" */

/* Schleime "No equivalents" */

/* Schleime "No diminutives" */

/* Schlema "No equivalents" */

/* Schlema "No diminutives" */

/* Schlioma "No equivalents" */

/* Schlioma "No diminutives" */

/* Schlojme "No equivalents" */

/* Schlojme "No diminutives" */

/* Schloma "No equivalents" */

/* Schloma "No diminutives" */

/* Schlome "No equivalents" */

/* Schlome "No diminutives" */

/* Schmel "No equivalents" */

/* Schmel "No diminutives" */

/* Schmerel "No equivalents" */

/* Schmerel "No diminutives" */

/* Schmerl "No equivalents" */

/* Schmerl "No diminutives" */

/* Schmil "No equivalents" */

/* Schmil "No diminutives" */

/* Schmuil "No equivalents" */

/* Schmuil "No diminutives" */

/* Schoel "No equivalents" */

/* Schoel "No diminutives" */

/* Scholim "No equivalents" */

/* Scholim "No diminutives" */

/* Scholom "No equivalents" */

/* Scholom "No diminutives" */

/* Schulem "No equivalents" */

/* Schulem "No diminutives" */

/* Schulim "No equivalents" */

/* Schulim "No diminutives" */

/* Schumel "No equivalents" */

/* Schumel "No diminutives" */

/* Schye "No equivalents" */

/* Schye "No diminutives" */

/* Scipione "No equivalents" */

/* Scipione "No diminutives" */

local Sebastian `" "Sebastijan" "Sebastian" "Sebastiaan" "Sébastien" "Sebestyén" "Sebastiano" "Sebastianus" "Sebastião" "Sevastian" "Sevastyan" "Sebastjan" "Sebastián" "'
foreach variant of local Sebastian {
	replace ameriname = "Sebastian" if fname == "`variant'"
}

local Sebastian `" "Bas" "Bastiaan" "Sepi" "Seppo" "Bastien" "Bastian" "Boštjan" "'
foreach diminutive of local Sebastian {
	replace ameriname = "Sebastian" if fname == "`diminutive'"
}

/* Secondino "No equivalents" */

/* Secondino "No diminutives" */

/* Secondo "No equivalents" */

/* Secondo "No diminutives" */

/* Selde "No equivalents" */

/* Selde "No diminutives" */

/* Selik "No equivalents" */

/* Selik "No diminutives" */

/* Selim "No equivalents" */

/* Selim "No diminutives" */

local Selman `" "Salman" "'
foreach variant of local Selman {
	replace ameriname = "Selman" if fname == "`variant'"
}

/* Selman "No diminutives" */

/* Seman "No equivalents" */

/* Seman "No diminutives" */

local Semen `" "Ximun" "Simon" "Symeon" "Shimon" "Simeon" "Šimun" "Šimon" "Siemen" "Simo" "Simoni" "Simone" "Simonas" "Ximeno" "Simen" "Simonu" "Symeonu" "Szymon" "Simão" "Simion" "Semen" "Semyon" "Jimeno" "Simón" "Symon" "'
foreach variant of local Semen {
	replace ameriname = "Semen" if fname == "`variant'"
}

local Semen `" "Šime" "Šimo" "Siem" "Sime" "Simo" "Shimmel" "'
foreach diminutive of local Semen {
	replace ameriname = "Semen" if fname == "`diminutive'"
}

local Sender `" "Aleksander" "Skender" "Alexander" "Alexandros" "Iskandar" "Aleksandr" "Alesander" "Aliaksandr" "Aleksandar" "Sasho" "Àlex" "Alexandre" "Sandi" "Saša" "Aleš" "Alexandr" "Alex" "Sander" "Lex" "Xander" "Al" "Alec" "Sandy" "Zander" "Aleĉjo" "Aleksandro" "Ale" "Aleksanteri" "Samppa" "Santeri" "Santtu" "Sacha" "Sasha" "Aleksandre" "Sandro" "Sascha" "Sándor" "Alastar" "Alessandro" "Aleksandrs" "Aleksandras" "Aca" "Ace" "Aco" "Aleksandru" "Sikandar" "Eskandar" "Aleks" "Olek" "Xande" "Xandinho" "Alexandru" "Sandu" "Sanya" "Shura" "Alasdair" "Alastair" "Alistair" "Alister" "Ally" "Sawney" "Sašo" "Alejandro" "İskender" "Oleksander" "Oleksandr" "Oles" "Sender" "'
foreach variant of local Sender {
	replace ameriname = "Sender" if fname == "`variant'"
}

local Sender `" "Sanyi" "'
foreach diminutive of local Sender {
	replace ameriname = "Sender" if fname == "`diminutive'"
}

local Serafin `" "Séraphin" "Serafeim" "Serafino" "Seraphinus" "Serafim" "Serafin" "'
foreach variant of local Serafin {
	replace ameriname = "Serafin" if fname == "`variant'"
}

/* Serafin "No diminutives" */

local Sergey `" "Sergius" "Sargis" "Sarkis" "Sergei" "Sergej" "Sergey" "Sergi" "Serge" "Sergio" "Sergiusz" "Sérgio" "Serghei" "Sergiu" "'
foreach variant of local Sergey {
	replace ameriname = "Sergey" if fname == "`variant'"
}

/* Sergey "No diminutives" */

local Sergio `" "Sergius" "Sargis" "Sarkis" "Sergei" "Sergej" "Sergey" "Sergi" "Serge" "Sergio" "Sergiusz" "Sérgio" "Serghei" "Sergiu" "'
foreach variant of local Sergio {
	replace ameriname = "Sergio" if fname == "`variant'"
}

/* Sergio "No diminutives" */

/* Setrak "No equivalents" */

/* Setrak "No diminutives" */

local Settimio `" "Septimius" "Settimio" "'
foreach variant of local Settimio {
	replace ameriname = "Settimio" if fname == "`variant'"
}

/* Settimio "No diminutives" */

/* Settimo "No equivalents" */

/* Settimo "No diminutives" */

local Severin `" "Severinus" "Severin" "Søren" "Séverin" "Sören" "Severino" "Seweryn" "'
foreach variant of local Severin {
	replace ameriname = "Severin" if fname == "`variant'"
}

local Severin `" "Rino" "Seve" "'
foreach diminutive of local Severin {
	replace ameriname = "Severin" if fname == "`diminutive'"
}

local Severino `" "Severinus" "Severin" "Søren" "Séverin" "Sören" "Severino" "Seweryn" "'
foreach variant of local Severino {
	replace ameriname = "Severino" if fname == "`variant'"
}

local Severino `" "Rino" "Seve" "'
foreach diminutive of local Severino {
	replace ameriname = "Severino" if fname == "`diminutive'"
}

local Shmuel `" "Samouel" "Shemu'el" "Samuhel" "Samuel" "Samuil" "Samuli" "Shmuel" "Sámuel" "Samuele" "Samoil" "Samuilu" "Sawyl" "'
foreach variant of local Shmuel {
	replace ameriname = "Shmuel" if fname == "`variant'"
}

local Shmuel `" "Sam" "Sammie" "Sammy" "Sami" "Samppa" "Samu" "'
foreach diminutive of local Shmuel {
	replace ameriname = "Shmuel" if fname == "`diminutive'"
}

/* Shmul "No equivalents" */

/* Shmul "No diminutives" */

/* Sholem "No equivalents" */

/* Sholem "No diminutives" */

local Siegfried `" "Sigifrid" "Sigfrøðr" "Siegfried" "Sigfrido" "Zygfryd" "Sigfrid" "'
foreach variant of local Siegfried {
	replace ameriname = "Siegfried" if fname == "`variant'"
}

local Siegfried `" "Sikke" "Sigi" "'
foreach diminutive of local Siegfried {
	replace ameriname = "Siegfried" if fname == "`diminutive'"
}

local Siegmund `" "Sigimund" "Sigismund" "Sigmundr" "Zikmund" "Sigmund" "Siegmund" "Zsigmond" "Zygmunt" "Žigmund" "'
foreach variant of local Siegmund {
	replace ameriname = "Siegmund" if fname == "`variant'"
}

local Siegmund `" "Zsiga" "Žiga" "'
foreach diminutive of local Siegmund {
	replace ameriname = "Siegmund" if fname == "`diminutive'"
}

/* Sigfrid "No equivalents" */

/* Sigfrid "No diminutives" */

/* Sigismondo "No equivalents" */

/* Sigismondo "No diminutives" */

local Sigismund `" "Sigimund" "Sigismund" "Sigmundr" "Zikmund" "Sigmund" "Siegmund" "Zsigmond" "Zygmunt" "Žigmund" "'
foreach variant of local Sigismund {
	replace ameriname = "Sigismund" if fname == "`variant'"
}

local Sigismund `" "Zsiga" "Žiga" "'
foreach diminutive of local Sigismund {
	replace ameriname = "Sigismund" if fname == "`diminutive'"
}

local Signe `" "Signý" "Signe" "Signy" "'
foreach variant of local Signe {
	replace ameriname = "Signe" if fname == "`variant'"
}

/* Signe "No diminutives" */

local Sigrid `" "Sigríðr" "Sigrid" "Sigfrid" "'
foreach variant of local Sigrid {
	replace ameriname = "Sigrid" if fname == "`variant'"
}

local Sigrid `" "Siri" "Siiri" "'
foreach diminutive of local Sigrid {
	replace ameriname = "Sigrid" if fname == "`diminutive'"
}

/* Sigvald "No equivalents" */

/* Sigvald "No diminutives" */

local Sigvard `" "Sigiward" "Siward" "Sigurðr" "Sigeweard" "Sigurd" "Sieuwerd" "Sjoerd" "Siegward" "Sigurður" "Sjurd" "Sigvard" "'
foreach variant of local Sigvard {
	replace ameriname = "Sigvard" if fname == "`variant'"
}

/* Sigvard "No diminutives" */

local Silvano `" "Silvanus" "Silas" "Silouanos" "Sylvanus" "Sylvain" "Silvano" "'
foreach variant of local Silvano {
	replace ameriname = "Silvano" if fname == "`variant'"
}

/* Silvano "No diminutives" */

/* Silverio "No equivalents" */

/* Silverio "No diminutives" */

local Silvester `" "Silvestr" "Sylvester" "Silvester" "Sylvestre" "Szilveszter" "Silvestro" "Sylwester" "Silvestre" "'
foreach variant of local Silvester {
	replace ameriname = "Silvester" if fname == "`variant'"
}

local Silvester `" "Vester" "Sly" "'
foreach diminutive of local Silvester {
	replace ameriname = "Silvester" if fname == "`diminutive'"
}

local Silvestre `" "Silvestr" "Sylvester" "Silvester" "Sylvestre" "Szilveszter" "Silvestro" "Sylwester" "Silvestre" "'
foreach variant of local Silvestre {
	replace ameriname = "Silvestre" if fname == "`variant'"
}

local Silvestre `" "Vester" "Sly" "'
foreach diminutive of local Silvestre {
	replace ameriname = "Silvestre" if fname == "`diminutive'"
}

local Silvestro `" "Silvestr" "Sylvester" "Silvester" "Sylvestre" "Szilveszter" "Silvestro" "Sylwester" "Silvestre" "'
foreach variant of local Silvestro {
	replace ameriname = "Silvestro" if fname == "`variant'"
}

local Silvestro `" "Vester" "Sly" "'
foreach diminutive of local Silvestro {
	replace ameriname = "Silvestro" if fname == "`diminutive'"
}

local Silvia `" "Silviya" "Sílvia" "Silvija" "Silvie" "Sylvia" "Silvia" "Sylvie" "Szilvia" "Sylwia" "'
foreach variant of local Silvia {
	replace ameriname = "Silvia" if fname == "`variant'"
}

local Silvia `" "Silva" "Sylvi" "Sølvi" "MASCULINE FORMS" "Silvijo" "Silvio" "Silvius" "Silviu" "'
foreach diminutive of local Silvia {
	replace ameriname = "Silvia" if fname == "`diminutive'"
}

/* Silvino "No equivalents" */

/* Silvino "No diminutives" */

/* Siman "No equivalents" */

/* Siman "No diminutives" */

/* Simcha "No equivalents" */

/* Simcha "No diminutives" */

local Sime `" "Ximun" "Simon" "Symeon" "Shimon" "Simeon" "Šime" "Šimo" "Šimun" "Šimon" "Siem" "Siemen" "Simo" "Simoni" "Simone" "Simonas" "Sime" "Ximeno" "Simen" "Simonu" "Symeonu" "Szymon" "Simão" "Simion" "Semen" "Semyon" "Jimeno" "Simón" "Symon" "Shimmel" "'
foreach variant of local Sime {
	replace ameriname = "Sime" if fname == "`variant'"
}

/* Sime "No diminutives" */

local Simen `" "Ximun" "Simon" "Symeon" "Shimon" "Simeon" "Šimun" "Šimon" "Siemen" "Simo" "Simoni" "Simone" "Simonas" "Ximeno" "Simen" "Simonu" "Symeonu" "Szymon" "Simão" "Simion" "Semen" "Semyon" "Jimeno" "Simón" "Symon" "'
foreach variant of local Simen {
	replace ameriname = "Simen" if fname == "`variant'"
}

local Simen `" "Šime" "Šimo" "Siem" "Sime" "Simo" "Shimmel" "'
foreach diminutive of local Simen {
	replace ameriname = "Simen" if fname == "`diminutive'"
}

local Simeon `" "Ximun" "Simon" "Symeon" "Shimon" "Simeon" "Šimun" "Šimon" "Siemen" "Simo" "Simoni" "Simone" "Simonas" "Ximeno" "Simen" "Simonu" "Symeonu" "Szymon" "Simão" "Simion" "Semen" "Semyon" "Jimeno" "Simón" "Symon" "'
foreach variant of local Simeon {
	replace ameriname = "Simeon" if fname == "`variant'"
}

local Simeon `" "Šime" "Šimo" "Siem" "Sime" "Simo" "Shimmel" "'
foreach diminutive of local Simeon {
	replace ameriname = "Simeon" if fname == "`diminutive'"
}

local Simion `" "Ximun" "Simon" "Symeon" "Shimon" "Simeon" "Šimun" "Šimon" "Siemen" "Simo" "Simoni" "Simone" "Simonas" "Ximeno" "Simen" "Simonu" "Symeonu" "Szymon" "Simão" "Simion" "Semen" "Semyon" "Jimeno" "Simón" "Symon" "'
foreach variant of local Simion {
	replace ameriname = "Simion" if fname == "`variant'"
}

local Simion `" "Šime" "Šimo" "Siem" "Sime" "Simo" "Shimmel" "'
foreach diminutive of local Simion {
	replace ameriname = "Simion" if fname == "`diminutive'"
}

local Simo `" "Ximun" "Simon" "Symeon" "Shimon" "Simeon" "Šimun" "Šimon" "Siemen" "Simo" "Simoni" "Simone" "Simonas" "Ximeno" "Simen" "Simonu" "Symeonu" "Szymon" "Simão" "Simion" "Semen" "Semyon" "Jimeno" "Simón" "Symon" "'
foreach variant of local Simo {
	replace ameriname = "Simo" if fname == "`variant'"
}

local Simo `" "Šime" "Šimo" "Siem" "Sime" "Shimmel" "'
foreach diminutive of local Simo {
	replace ameriname = "Simo" if fname == "`diminutive'"
}

/* Simone "No equivalents" */

/* Simone "No diminutives" */

/* Simson "No equivalents" */

/* Simson "No diminutives" */

/* Sipke "No equivalents" */

/* Sipke "No diminutives" */

local Sisto `" "Sixte" "Sisto" "Xystos" "Sixtus" "'
foreach variant of local Sisto {
	replace ameriname = "Sisto" if fname == "`variant'"
}

/* Sisto "No diminutives" */

/* Sivert "No equivalents" */

/* Sivert "No diminutives" */

local Sjoerd `" "Sigiward" "Siward" "Sigurðr" "Sigeweard" "Sigurd" "Sieuwerd" "Sjoerd" "Siegward" "Sigurður" "Sjurd" "Sigvard" "'
foreach variant of local Sjoerd {
	replace ameriname = "Sjoerd" if fname == "`variant'"
}

/* Sjoerd "No diminutives" */

local Slavko `" "Slaven" "Slavko" "Slava" "'
foreach variant of local Slavko {
	replace ameriname = "Slavko" if fname == "`variant'"
}

/* Slavko "No diminutives" */

/* Sloime "No equivalents" */

/* Sloime "No diminutives" */

/* Smiel "No equivalents" */

/* Smiel "No diminutives" */

/* Smil "No equivalents" */

/* Smil "No diminutives" */

/* Smul "No equivalents" */

/* Smul "No diminutives" */

local Sofia `" "Sophia" "Sofiya" "Sofia" "Sofija" "Sofie" "Žofie" "Sophie" "Sohvi" "Sopio" "Zsófia" "Soffía" "Zofia" "Sofya" "Žofia" "Sofía" "'
foreach variant of local Sofia {
	replace ameriname = "Sofia" if fname == "`variant'"
}

local Sofia `" "Sonja" "Soňa" "Vivi" "Sonia" "Sonya" "Sophy" "Sonje" "Szonja" "Zsófika" "Zosia" "'
foreach diminutive of local Sofia {
	replace ameriname = "Sofia" if fname == "`diminutive'"
}

local Solly `" "Sulaiman" "Sulayman" "Salomon" "Shelomoh" "Solomon" "Suljo" "Suleiman" "Salamon" "Sol" "Solly" "Salomão" "Salomón" "'
foreach variant of local Solly {
	replace ameriname = "Solly" if fname == "`variant'"
}

/* Solly "No diminutives" */

/* Soloman "No equivalents" */

/* Soloman "No diminutives" */

/* Sore "No equivalents" */

/* Sore "No diminutives" */

/* Soren "No equivalents" */

/* Soren "No diminutives" */

local Sotirios `" "Sotirios" "Sotiris" "'
foreach variant of local Sotirios {
	replace ameriname = "Sotirios" if fname == "`variant'"
}

/* Sotirios "No diminutives" */

/* Souren "No equivalents" */

/* Souren "No diminutives" */

local Spiridon `" "Spiridon" "Spyridon" "Espiridión" "'
foreach variant of local Spiridon {
	replace ameriname = "Spiridon" if fname == "`variant'"
}

local Spiridon `" "Spiro" "Spiros" "Spyro" "Spyros" "'
foreach diminutive of local Spiridon {
	replace ameriname = "Spiridon" if fname == "`diminutive'"
}

local Spiro `" "Spiridon" "Spiro" "Spiros" "Spyro" "Spyros" "Spyridon" "Espiridión" "'
foreach variant of local Spiro {
	replace ameriname = "Spiro" if fname == "`variant'"
}

/* Spiro "No diminutives" */

local Spiros `" "Spiridon" "Spiro" "Spiros" "Spyro" "Spyros" "Spyridon" "Espiridión" "'
foreach variant of local Spiros {
	replace ameriname = "Spiros" if fname == "`variant'"
}

/* Spiros "No diminutives" */

local Spyridon `" "Spiridon" "Spyridon" "Espiridión" "'
foreach variant of local Spyridon {
	replace ameriname = "Spyridon" if fname == "`variant'"
}

local Spyridon `" "Spiro" "Spiros" "Spyro" "Spyros" "'
foreach diminutive of local Spyridon {
	replace ameriname = "Spyridon" if fname == "`diminutive'"
}

local Spyros `" "Spiridon" "Spiro" "Spiros" "Spyro" "Spyros" "Spyridon" "Espiridión" "'
foreach variant of local Spyros {
	replace ameriname = "Spyros" if fname == "`variant'"
}

/* Spyros "No diminutives" */

local Sroel `" "Israel" "Yisra'el" "Israhel" "Iser" "Issur" "Sroel" "'
foreach variant of local Sroel {
	replace ameriname = "Sroel" if fname == "`variant'"
}

local Sroel `" "Issy" "'
foreach diminutive of local Sroel {
	replace ameriname = "Sroel" if fname == "`diminutive'"
}

/* Srol "No equivalents" */

/* Srol "No diminutives" */

/* Sruel "No equivalents" */

/* Sruel "No diminutives" */

local Stamatios `" "Stamatios" "Stamatis" "'
foreach variant of local Stamatios {
	replace ameriname = "Stamatios" if fname == "`variant'"
}

/* Stamatios "No diminutives" */

/* Stanisl "No equivalents" */

/* Stanisl "No diminutives" */

/* Stanislao "No equivalents" */

/* Stanislao "No diminutives" */

local Stanislas `" "Stanislav" "Stanislas" "Stanislovas" "Stanisław" "'
foreach variant of local Stanislas {
	replace ameriname = "Stanislas" if fname == "`variant'"
}

local Stanislas `" "Stanko" "Slava" "Stas" "Stane" "'
foreach diminutive of local Stanislas {
	replace ameriname = "Stanislas" if fname == "`diminutive'"
}

local Stanislav `" "Stanislav" "Stanislas" "Stanislovas" "Stanisław" "'
foreach variant of local Stanislav {
	replace ameriname = "Stanislav" if fname == "`variant'"
}

local Stanislav `" "Stanko" "Slava" "Stas" "Stane" "'
foreach diminutive of local Stanislav {
	replace ameriname = "Stanislav" if fname == "`diminutive'"
}

/* Stanislawa "No equivalents" */

/* Stanislawa "No diminutives" */

local Stanko `" "Stanko" "Stanislav" "Stanislas" "Stanislovas" "Stanisław" "Slava" "Stas" "Stane" "'
foreach variant of local Stanko {
	replace ameriname = "Stanko" if fname == "`variant'"
}

/* Stanko "No diminutives" */

/* Stasis "No equivalents" */

/* Stasis "No diminutives" */

local Stefania `" "Štefanija" "Štěpánka" "Stefanie" "Stefana" "Stefani" "Stephani" "Stephania" "Stephanie" "Stephany" "Étiennette" "Stéphanie" "Kekepania" "Stefánia" "Stefania" "Stefanija" "Estefânia" "Ștefania" "Štefánia" "Estefanía" "'
foreach variant of local Stefania {
	replace ameriname = "Stefania" if fname == "`variant'"
}

local Stefania `" "Štefa" "Štefica" "Steph" "Stevie" "Steffi" "Steffie" "Fanni" "Stefcia" "MASCULINE FORMS" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stevo" "Stipan" "Stipe" "Stipo" "Stjepan" "Štěpán" "Steffen" "Stef" "Stefanus" "Stephan" "Steven" "Ste" "Steve" "Tahvo" "Tapani" "Teppo" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Pista" "Pisti" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Stefek" "Szczepan" "Estevão" "Fane" "Ștefan" "Steafan" "Steaphan" "Steenie" "Estavan" "Esteban" "Staffan" "'
foreach diminutive of local Stefania {
	replace ameriname = "Stefania" if fname == "`diminutive'"
}

local Stefanos `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stefanos {
	replace ameriname = "Stefanos" if fname == "`variant'"
}

local Stefanos `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Stefanos {
	replace ameriname = "Stefanos" if fname == "`diminutive'"
}

/* Stefen "No equivalents" */

/* Stefen "No diminutives" */

local Steffen `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Steffen {
	replace ameriname = "Steffen" if fname == "`variant'"
}

local Steffen `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Steffen {
	replace ameriname = "Steffen" if fname == "`diminutive'"
}

/* Stefo "No equivalents" */

/* Stefo "No diminutives" */

local Stelios `" "Stelios" "Stylianos" "'
foreach variant of local Stelios {
	replace ameriname = "Stelios" if fname == "`variant'"
}

/* Stelios "No diminutives" */

local Sten `" "Steinn" "Steen" "Sten" "Stein" "'
foreach variant of local Sten {
	replace ameriname = "Sten" if fname == "`variant'"
}

/* Sten "No diminutives" */

local Stepan `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stepan {
	replace ameriname = "Stepan" if fname == "`variant'"
}

local Stepan `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Stepan {
	replace ameriname = "Stepan" if fname == "`diminutive'"
}

local Stephan `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stephan {
	replace ameriname = "Stephan" if fname == "`variant'"
}

local Stephan `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Stephan {
	replace ameriname = "Stephan" if fname == "`diminutive'"
}

/* Stergios "No equivalents" */

/* Stergios "No diminutives" */

local Stevan `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stevan {
	replace ameriname = "Stevan" if fname == "`variant'"
}

local Stevan `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Stevan {
	replace ameriname = "Stevan" if fname == "`diminutive'"
}

local Steve `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stevo" "Stipan" "Stipe" "Stipo" "Stjepan" "Štěpán" "Steffen" "Stef" "Stefanus" "Stephan" "Steven" "Ste" "Steph" "Steve" "Stevie" "Tahvo" "Tapani" "Teppo" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Pista" "Pisti" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Stefek" "Szczepan" "Estevão" "Fane" "Ștefan" "Steafan" "Steaphan" "Steenie" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Steve {
	replace ameriname = "Steve" if fname == "`variant'"
}

/* Steve "No diminutives" */

local Steven `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Steven {
	replace ameriname = "Steven" if fname == "`variant'"
}

local Steven `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Steven {
	replace ameriname = "Steven" if fname == "`diminutive'"
}

local Stevo `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Stevo" "Stipe" "Stipo" "Štěpán" "Steffen" "Stef" "Stefanus" "Stephan" "Steven" "Ste" "Steph" "Steve" "Stevie" "Tahvo" "Tapani" "Teppo" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Pista" "Pisti" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Stefek" "Szczepan" "Estevão" "Fane" "Ștefan" "Steafan" "Steaphan" "Steenie" "Štefan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stevo {
	replace ameriname = "Stevo" if fname == "`variant'"
}

/* Stevo "No diminutives" */

local Stewart `" "Stewart" "Stuart" "'
foreach variant of local Stewart {
	replace ameriname = "Stewart" if fname == "`variant'"
}

local Stewart `" "Stew" "'
foreach diminutive of local Stewart {
	replace ameriname = "Stewart" if fname == "`diminutive'"
}

local Stig `" "Stigr" "Stig" "'
foreach variant of local Stig {
	replace ameriname = "Stig" if fname == "`variant'"
}

/* Stig "No diminutives" */

local Stipan `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stipan {
	replace ameriname = "Stipan" if fname == "`variant'"
}

local Stipan `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Stipan {
	replace ameriname = "Stipan" if fname == "`diminutive'"
}

local Stipe `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Stevo" "Stipe" "Stipo" "Štěpán" "Steffen" "Stef" "Stefanus" "Stephan" "Steven" "Ste" "Steph" "Steve" "Stevie" "Tahvo" "Tapani" "Teppo" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Pista" "Pisti" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Stefek" "Szczepan" "Estevão" "Fane" "Ștefan" "Steafan" "Steaphan" "Steenie" "Stevan" "Stjepan" "Štefan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stipe {
	replace ameriname = "Stipe" if fname == "`variant'"
}

/* Stipe "No diminutives" */

local Stjepan `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Stjepan {
	replace ameriname = "Stjepan" if fname == "`variant'"
}

local Stjepan `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Stjepan {
	replace ameriname = "Stjepan" if fname == "`diminutive'"
}

local Stojan `" "Stoyan" "Stojan" "'
foreach variant of local Stojan {
	replace ameriname = "Stojan" if fname == "`variant'"
}

/* Stojan "No diminutives" */

/* Strul "No equivalents" */

/* Strul "No diminutives" */

local Stuart `" "Stewart" "Stuart" "'
foreach variant of local Stuart {
	replace ameriname = "Stuart" if fname == "`variant'"
}

local Stuart `" "Stew" "'
foreach diminutive of local Stuart {
	replace ameriname = "Stuart" if fname == "`diminutive'"
}

local Sture `" "Sture" "'
foreach variant of local Sture {
	replace ameriname = "Sture" if fname == "`variant'"
}

/* Sture "No diminutives" */

local Stylianos `" "Stelios" "Stylianos" "'
foreach variant of local Stylianos {
	replace ameriname = "Stylianos" if fname == "`variant'"
}

/* Stylianos "No diminutives" */

/* Sucher "No equivalents" */

/* Sucher "No diminutives" */

/* Sulo "No equivalents" */

/* Sulo "No diminutives" */

/* Sure "No equivalents" */

/* Sure "No diminutives" */

/* Sussel "No equivalents" */

/* Sussel "No diminutives" */

local Svante `" "Svantepolk" "Svatopluk" "Svante" "Svetopolk" "Świętopełk" "Svyatopolk" "'
foreach variant of local Svante {
	replace ameriname = "Svante" if fname == "`variant'"
}

/* Svante "No diminutives" */

local Svend `" "Sveinn" "Sven" "Svend" "Soini" "Svein" "'
foreach variant of local Svend {
	replace ameriname = "Svend" if fname == "`variant'"
}

/* Svend "No diminutives" */

local Sverre `" "Sverrir" "'
foreach variant of local Sverre {
	replace ameriname = "Sverre" if fname == "`variant'"
}

/* Sverre "No diminutives" */

/* Sygmund "No equivalents" */

/* Sygmund "No diminutives" */

local Sylvester `" "Silvestr" "Sylvester" "Silvester" "Sylvestre" "Szilveszter" "Silvestro" "Sylwester" "Silvestre" "'
foreach variant of local Sylvester {
	replace ameriname = "Sylvester" if fname == "`variant'"
}

local Sylvester `" "Vester" "Sly" "'
foreach diminutive of local Sylvester {
	replace ameriname = "Sylvester" if fname == "`diminutive'"
}

/* Symcha "No equivalents" */

/* Symcha "No diminutives" */

/* Szaja "No equivalents" */

/* Szaja "No diminutives" */

local Szczepan `" "Stephanos" "Stepan" "Estebe" "Eztebe" "Stephanus" "Stephen" "Stefan" "Esteve" "Štefan" "Stevan" "Stipan" "Stjepan" "Štěpán" "Steffen" "Stefanus" "Stephan" "Steven" "Tahvo" "Tapani" "Étienne" "Stéphane" "Estevo" "Stepane" "Stefanos" "István" "Stefán" "Stiofán" "Stefano" "Stefans" "Steponas" "Tipene" "Estienne" "Estève" "Stefanu" "Szczepan" "Estevão" "Ștefan" "Steafan" "Steaphan" "Estavan" "Esteban" "Staffan" "Steffan" "'
foreach variant of local Szczepan {
	replace ameriname = "Szczepan" if fname == "`variant'"
}

local Szczepan `" "Stevo" "Stipe" "Stipo" "Stef" "Ste" "Steph" "Steve" "Stevie" "Teppo" "Pista" "Pisti" "Stefek" "Fane" "Steenie" "'
foreach diminutive of local Szczepan {
	replace ameriname = "Szczepan" if fname == "`diminutive'"
}

/* Szlama "No equivalents" */

/* Szlama "No diminutives" */

/* Szloma "No equivalents" */

/* Szloma "No diminutives" */

/* Szmul "No equivalents" */

/* Szmul "No diminutives" */

/* Szul "No equivalents" */

/* Szul "No diminutives" */

/* Szulim "No equivalents" */

/* Szulim "No diminutives" */

/* Szyja "No equivalents" */

/* Szyja "No diminutives" */

local Szymon `" "Ximun" "Simon" "Symeon" "Shimon" "Simeon" "Šimun" "Šimon" "Siemen" "Simo" "Simoni" "Simone" "Simonas" "Ximeno" "Simen" "Simonu" "Symeonu" "Szymon" "Simão" "Simion" "Semen" "Semyon" "Jimeno" "Simón" "Symon" "'
foreach variant of local Szymon {
	replace ameriname = "Szymon" if fname == "`variant'"
}

local Szymon `" "Šime" "Šimo" "Siem" "Sime" "Simo" "Shimmel" "'
foreach diminutive of local Szymon {
	replace ameriname = "Szymon" if fname == "`diminutive'"
}

/* T "No equivalents" */

/* T "No diminutives" */

/* Tadensz "No equivalents" */

/* Tadensz "No diminutives" */

/* Tadeus "No equivalents" */

/* Tadeus "No diminutives" */

local Tadeusz `" "Thaddaios" "Thaddeus" "Thaddaeus" "Tadija" "Tadeáš" "Taddeo" "Tadas" "Tadeusz" "Tadeu" "Faddei" "Faddey" "Tadej" "Tadeo" "'
foreach variant of local Tadeusz {
	replace ameriname = "Tadeusz" if fname == "`variant'"
}

local Tadeusz `" "Tad" "'
foreach diminutive of local Tadeusz {
	replace ameriname = "Tadeusz" if fname == "`diminutive'"
}

/* Tage "No equivalents" */

/* Tage "No diminutives" */

/* Tamas "No equivalents" */

/* Tamas "No diminutives" */

/* Tanios "No equivalents" */

/* Tanios "No diminutives" */

/* Tannous "No equivalents" */

/* Tannous "No diminutives" */

/* Tanous "No equivalents" */

/* Tanous "No diminutives" */

/* Taube "No equivalents" */

/* Taube "No diminutives" */

local Teodoro `" "Tewodros" "Theodoros" "Theodorus" "Toros" "Teodor" "Todor" "Theodor" "Theodoor" "Theodore" "Théodore" "Tedore" "Tivadar" "Tódor" "Teodoro" "Teodors" "Tudor" "Fedor" "Feodor" "Fyodor" "Fedir" "'
foreach variant of local Teodoro {
	replace ameriname = "Teodoro" if fname == "`variant'"
}

local Teodoro `" "Teo" "Theo" "Ted" "Teddy" "Teuvo" "Théo" "Thei" "Toše" "Toshe" "Téo" "Fedya" "'
foreach diminutive of local Teodoro {
	replace ameriname = "Teodoro" if fname == "`diminutive'"
}

local Teofil `" "Theophilos" "Theophilus" "Theofilus" "Théophile" "Theophil" "Teofilo" "Teofil" "Teófilo" "Feofil" "'
foreach variant of local Teofil {
	replace ameriname = "Teofil" if fname == "`variant'"
}

local Teofil `" "Theo" "Téo" "'
foreach diminutive of local Teofil {
	replace ameriname = "Teofil" if fname == "`diminutive'"
}

local Terence `" "Terentius" "Terance" "Terence" "Terrance" "Terrence" "Terenti" "Terenzio" "Terentiy" "'
foreach variant of local Terence {
	replace ameriname = "Terence" if fname == "`variant'"
}

local Terence `" "Tel" "'
foreach diminutive of local Terence {
	replace ameriname = "Terence" if fname == "`diminutive'"
}

local Teresa `" "Terese" "Tereza" "Terezija" "Terezie" "Teresa" "Theresa" "Therese" "Theresia" "Thérèse" "Terézia" "Toiréasa" "Treasa" "Therasia" "Teresia" "'
foreach variant of local Teresa {
	replace ameriname = "Teresa" if fname == "`variant'"
}

local Teresa `" "Tena" "Tess" "Thera" "Trees" "Teri" "Terri" "Terrie" "Terry" "Tessa" "Tessie" "Tracee" "Tracey" "Traci" "Tracie" "Tracy" "Teca" "Teréz" "Terezinha" "Teresinha" "Tere" "Teresita" "Tessan" "'
foreach diminutive of local Teresa {
	replace ameriname = "Teresa" if fname == "`diminutive'"
}

local Teunis `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Doncho" "Antoni" "Ante" "Anto" "Antonijo" "Antonio" "Antun" "Tonći" "Tonči" "Toni" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Anthony" "Antony" "Tony" "Anĉjo" "Antono" "Tõnis" "Anttoni" "Antón" "Antonios" "Antonis" "Akoni" "Anakoni" "Antal" "Tóni" "Antonello" "Tonino" "Tonio" "Antoon" "Antanas" "Antonij" "Antônio" "António" "Toninho" "Antonije" "Tone" "Toño" "'
foreach variant of local Teunis {
	replace ameriname = "Teunis" if fname == "`variant'"
}

/* Teunis "No diminutives" */

/* Tewel "No equivalents" */

/* Tewel "No diminutives" */

local Theo `" "Tewodros" "Baldo" "Theobald" "Theudobald" "Theodoros" "Theodorus" "Theophilos" "Theophilus" "Toros" "Teodor" "Todor" "Teo" "Theodor" "Theo" "Ted" "Teddy" "Tibby" "Teuvo" "Théo" "Théodore" "Théophile" "Thibault" "Tedore" "Theophil" "Tivadar" "Tódor" "Teobaldo" "Teodoro" "Teofilo" "Teodors" "Thei" "Tybalt" "Toše" "Toshe" "Teofil" "Téo" "Teófilo" "Tudor" "Fedor" "Fedya" "Feodor" "Feofil" "Fyodor" "Fedir" "'
foreach variant of local Theo {
	replace ameriname = "Theo" if fname == "`variant'"
}

/* Theo "No diminutives" */

local Theobald `" "Theobald" "Theudobald" "Thibault" "Teobaldo" "Tybalt" "'
foreach variant of local Theobald {
	replace ameriname = "Theobald" if fname == "`variant'"
}

local Theobald `" "Baldo" "Boele" "Theo" "Tibby" "Teo" "Téo" "'
foreach diminutive of local Theobald {
	replace ameriname = "Theobald" if fname == "`diminutive'"
}

local Theodore `" "Tewodros" "Theodoros" "Theodorus" "Toros" "Teodor" "Todor" "Theodor" "Theodoor" "Theodore" "Théodore" "Tedore" "Tivadar" "Tódor" "Teodoro" "Teodors" "Tudor" "Fedor" "Feodor" "Fyodor" "Fedir" "'
foreach variant of local Theodore {
	replace ameriname = "Theodore" if fname == "`variant'"
}

local Theodore `" "Teo" "Theo" "Ted" "Teddy" "Teuvo" "Théo" "Thei" "Toše" "Toshe" "Téo" "Fedya" "'
foreach diminutive of local Theodore {
	replace ameriname = "Theodore" if fname == "`diminutive'"
}

/* Theodoro "No equivalents" */

/* Theodoro "No diminutives" */

local Theodorus `" "Tewodros" "Theodoros" "Theodorus" "Toros" "Teodor" "Todor" "Theodor" "Theodoor" "Theodore" "Théodore" "Tedore" "Tivadar" "Tódor" "Teodoro" "Teodors" "Tudor" "Fedor" "Feodor" "Fyodor" "Fedir" "'
foreach variant of local Theodorus {
	replace ameriname = "Theodorus" if fname == "`variant'"
}

local Theodorus `" "Teo" "Theo" "Ted" "Teddy" "Teuvo" "Théo" "Thei" "Toše" "Toshe" "Téo" "Fedya" "'
foreach diminutive of local Theodorus {
	replace ameriname = "Theodorus" if fname == "`diminutive'"
}

local Theofanis `" "Theophanes" "Theofanis" "Feofan" "'
foreach variant of local Theofanis {
	replace ameriname = "Theofanis" if fname == "`variant'"
}

/* Theofanis "No diminutives" */

/* Theofil "No equivalents" */

/* Theofil "No diminutives" */

/* Theophiel "No equivalents" */

/* Theophiel "No diminutives" */

local Theophil `" "Theophilos" "Theophilus" "Theofilus" "Théophile" "Theophil" "Teofilo" "Teofil" "Teófilo" "Feofil" "'
foreach variant of local Theophil {
	replace ameriname = "Theophil" if fname == "`variant'"
}

local Theophil `" "Theo" "Téo" "'
foreach diminutive of local Theophil {
	replace ameriname = "Theophil" if fname == "`diminutive'"
}

/* Theophile "No equivalents" */

/* Theophile "No diminutives" */

local Thor `" "Thor" "Tor" "Þór" "Þórr" "'
foreach variant of local Thor {
	replace ameriname = "Thor" if fname == "`variant'"
}

/* Thor "No diminutives" */

/* Thoralf "No equivalents" */

/* Thoralf "No diminutives" */

/* Thorleif "No equivalents" */

/* Thorleif "No diminutives" */

local Thorsten `" "Þórsteinn" "Thorsten" "Torsten" "Torsti" "Thorstein" "Torstein" "'
foreach variant of local Thorsten {
	replace ameriname = "Thorsten" if fname == "`variant'"
}

/* Thorsten "No diminutives" */

local Thorvald `" "Þórvaldr" "Thorvald" "Torvald" "'
foreach variant of local Thorvald {
	replace ameriname = "Thorvald" if fname == "`variant'"
}

/* Thorvald "No diminutives" */

/* Thure "No equivalents" */

/* Thure "No diminutives" */

local Tibor `" "Tiburtius" "Tibor" "Tiborc" "Tiburcio" "'
foreach variant of local Tibor {
	replace ameriname = "Tibor" if fname == "`variant'"
}

/* Tibor "No diminutives" */

local Tim `" "Timoteus" "Timotheos" "Timotheus" "Timothy" "Timotei" "Tim" "Timo" "Timmy" "Timothé" "Timothée" "Timoteo" "Timotej" "Timoti" "Timothei" "Tymoteusz" "Timofei" "Timofey" "'
foreach variant of local Tim {
	replace ameriname = "Tim" if fname == "`variant'"
}

/* Tim "No diminutives" */

local Timothy `" "Timoteus" "Timotheos" "Timotheus" "Timothy" "Timotei" "Timothé" "Timothée" "Timoteo" "Timotej" "Timoti" "Timothei" "Tymoteusz" "Timofei" "Timofey" "'
foreach variant of local Timothy {
	replace ameriname = "Timothy" if fname == "`variant'"
}

local Timothy `" "Tim" "Timo" "Timmy" "'
foreach diminutive of local Timothy {
	replace ameriname = "Timothy" if fname == "`diminutive'"
}

/* Tindaro "No equivalents" */

/* Tindaro "No diminutives" */

local Tito `" "Titus" "Titos" "Tiitus" "Tito" "Titas" "Titu" "Tytus" "Tit" "'
foreach variant of local Tito {
	replace ameriname = "Tito" if fname == "`variant'"
}

/* Tito "No diminutives" */

/* Tobia "No equivalents" */

/* Tobia "No diminutives" */

local Tobias `" "Tobias" "Toviyyah" "Tobiah" "Toby" "Topias" "Tovia" "Tuvya" "Tobiasz" "Tevye" "'
foreach variant of local Tobias {
	replace ameriname = "Tobias" if fname == "`variant'"
}

local Tobias `" "Topi" "'
foreach diminutive of local Tobias {
	replace ameriname = "Tobias" if fname == "`diminutive'"
}

local Todor `" "Tewodros" "Theodoros" "Theodorus" "Toros" "Teodor" "Todor" "Theodor" "Theodoor" "Theodore" "Théodore" "Tedore" "Tivadar" "Tódor" "Teodoro" "Teodors" "Tudor" "Fedor" "Feodor" "Fyodor" "Fedir" "'
foreach variant of local Todor {
	replace ameriname = "Todor" if fname == "`variant'"
}

local Todor `" "Teo" "Theo" "Ted" "Teddy" "Teuvo" "Théo" "Thei" "Toše" "Toshe" "Téo" "Fedya" "'
foreach diminutive of local Todor {
	replace ameriname = "Todor" if fname == "`diminutive'"
}

local Toivo `" "Toivo" "EQUIVALENTS" "'
foreach variant of local Toivo {
	replace ameriname = "Toivo" if fname == "`variant'"
}

/* Toivo "No diminutives" */

/* Toma "No equivalents" */

/* Toma "No diminutives" */

/* Tomaso "No equivalents" */

/* Tomaso "No diminutives" */

local Tomasz `" "Te'oma" "Thomas" "Toma" "Tomàs" "Tomo" "Tomáš" "Toomas" "Tuomas" "Tuomo" "Tamás" "Tómas" "Tomás" "Tommaso" "Toms" "Tomas" "Tamati" "Thoma" "Tomasz" "Tomé" "Foma" "Tàmhas" "Tavish" "Tòmas" "Tomaž" "Tomos" "'
foreach variant of local Tomasz {
	replace ameriname = "Tomasz" if fname == "`variant'"
}

local Tomasz `" "Tomica" "Maas" "Tom" "Thom" "Tommie" "Tommy" "Tomi" "Tommi" "Tomek" "Tam" "Twm" "'
foreach diminutive of local Tomasz {
	replace ameriname = "Tomasz" if fname == "`diminutive'"
}

/* Tome "No equivalents" */

/* Tome "No diminutives" */

/* Tommasino "No equivalents" */

/* Tommasino "No diminutives" */

local Tommy `" "Te'oma" "Thomas" "Toma" "Tomàs" "Tomica" "Tomo" "Tomáš" "Maas" "Tom" "Thom" "Tommie" "Tommy" "Toomas" "Tomi" "Tommi" "Tuomas" "Tuomo" "Tamás" "Tómas" "Tomás" "Tommaso" "Toms" "Tomas" "Tamati" "Thoma" "Tomasz" "Tomek" "Tomé" "Foma" "Tam" "Tàmhas" "Tavish" "Tòmas" "Tomaž" "Tomos" "Twm" "'
foreach variant of local Tommy {
	replace ameriname = "Tommy" if fname == "`variant'"
}

/* Tommy "No diminutives" */

local Tomo `" "Te'oma" "Thomas" "Toma" "Tomàs" "Tomica" "Tomo" "Tomáš" "Toomas" "Tuomas" "Tuomo" "Tamás" "Tómas" "Tomás" "Tommaso" "Toms" "Tomas" "Tamati" "Tomislav" "Thoma" "Tomasz" "Tomé" "Foma" "Tàmhas" "Tavish" "Tòmas" "Tomaž" "Tomos" "'
foreach variant of local Tomo {
	replace ameriname = "Tomo" if fname == "`variant'"
}

local Tomo `" "Tomica" "Maas" "Tom" "Thom" "Tommie" "Tommy" "Tomi" "Tommi" "Tomek" "Tam" "Twm" "'
foreach diminutive of local Tomo {
	replace ameriname = "Tomo" if fname == "`diminutive'"
}

/* Toni "No equivalents" */

/* Toni "No diminutives" */

local Tony `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Doncho" "Antoni" "Ante" "Anto" "Antonijo" "Antonio" "Antun" "Tonći" "Tonči" "Toni" "Antonie" "Antoon" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Tony" "Anĉjo" "Antono" "Tõnis" "Anttoni" "Antón" "Antonios" "Antonis" "Akoni" "Anakoni" "Antal" "Tóni" "Antonello" "Tonino" "Tonio" "Antanas" "Antonij" "Antônio" "António" "Toninho" "Antonije" "Tone" "Toño" "'
foreach variant of local Tony {
	replace ameriname = "Tony" if fname == "`variant'"
}

/* Tony "No diminutives" */

local Tor `" "Thor" "Tor" "Þór" "Þórr" "'
foreach variant of local Tor {
	replace ameriname = "Tor" if fname == "`variant'"
}

/* Tor "No diminutives" */

/* Tore "No equivalents" */

/* Tore "No diminutives" */

local Torsten `" "Þórsteinn" "Thorsten" "Torsten" "Torsti" "Thorstein" "Torstein" "'
foreach variant of local Torsten {
	replace ameriname = "Torsten" if fname == "`variant'"
}

/* Torsten "No diminutives" */

local Torvald `" "Þórvaldr" "Thorvald" "Torvald" "'
foreach variant of local Torvald {
	replace ameriname = "Torvald" if fname == "`variant'"
}

/* Torvald "No diminutives" */

local Toufik `" "Tawfiq" "Toufik" "Taufik" "'
foreach variant of local Toufik {
	replace ameriname = "Toufik" if fname == "`variant'"
}

/* Toufik "No diminutives" */

/* Tranquillo "No equivalents" */

/* Tranquillo "No diminutives" */

local Trevor `" "Trevor" "Trefor" "'
foreach variant of local Trevor {
	replace ameriname = "Trevor" if fname == "`variant'"
}

local Trevor `" "Trev" "'
foreach diminutive of local Trevor {
	replace ameriname = "Trevor" if fname == "`diminutive'"
}

local Trygve `" "Tryggvi" "Trygve" "Tryggve" "'
foreach variant of local Trygve {
	replace ameriname = "Trygve" if fname == "`variant'"
}

/* Trygve "No diminutives" */

local Tullio `" "Tullius" "Tully" "Tullio" "Túlio" "Tulio" "'
foreach variant of local Tullio {
	replace ameriname = "Tullio" if fname == "`variant'"
}

/* Tullio "No diminutives" */

local Ture `" "Þórir" "Thore" "Tore" "Tuure" "Ture" "'
foreach variant of local Ture {
	replace ameriname = "Ture" if fname == "`variant'"
}

local Ture `" "Tuukka" "'
foreach diminutive of local Ture {
	replace ameriname = "Ture" if fname == "`diminutive'"
}

/* Ubaldo "No equivalents" */

/* Ubaldo "No diminutives" */

local Ulderico `" "Hulderic" "Ulderico" "'
foreach variant of local Ulderico {
	replace ameriname = "Ulderico" if fname == "`variant'"
}

/* Ulderico "No diminutives" */

local Ulisse `" "Ulysses" "Ulysse" "Odysseus" "Ulisse" "Ulisses" "Ulises" "'
foreach variant of local Ulisse {
	replace ameriname = "Ulisse" if fname == "`variant'"
}

/* Ulisse "No diminutives" */

local Ulrich `" "Odalric" "Ulrich" "Oldřich" "Ulrik" "Ulric" "Oldrich" "Urh" "'
foreach variant of local Ulrich {
	replace ameriname = "Ulrich" if fname == "`variant'"
}

local Ulrich `" "Ueli" "Ulli" "Utz" "'
foreach diminutive of local Ulrich {
	replace ameriname = "Ulrich" if fname == "`diminutive'"
}

/* Uno "No equivalents" */

/* Uno "No diminutives" */

local Urbano `" "Ourbanos" "Urbanus" "Urban" "Urbain" "Orbán" "Urbano" "'
foreach variant of local Urbano {
	replace ameriname = "Urbano" if fname == "`variant'"
}

/* Urbano "No diminutives" */

/* Urho "No equivalents" */

/* Urho "No diminutives" */

/* Uscher "No equivalents" */

/* Uscher "No diminutives" */

/* Uszer "No equivalents" */

/* Uszer "No diminutives" */

/* V "No equivalents" */

/* V "No diminutives" */

/* Vaclar "No equivalents" */

/* Vaclar "No diminutives" */

/* Vaclaw "No equivalents" */

/* Vaclaw "No diminutives" */

/* Vadav "No equivalents" */

/* Vadav "No diminutives" */

/* Vahan "No equivalents" */

/* Vahan "No diminutives" */

/* Vahram "No equivalents" */

/* Vahram "No diminutives" */

/* Vaino "No equivalents" */

/* Vaino "No diminutives" */

local Valdemar `" "Waldomar" "Valdimárr" "Uladzimir" "Vladimir" "Vladimír" "Valdemar" "Waldemar" "Vladimer" "Voldemārs" "Valdemaras" "Vladimiras" "Voldemaras" "Vladimeru" "Volodimeru" "Włodzimierz" "Vladilen" "Vladlen" "Volodymyr" "Wolodymyr" "'
foreach variant of local Valdemar {
	replace ameriname = "Valdemar" if fname == "`variant'"
}

local Valdemar `" "Vlado" "Vlatko" "Vladan" "Valto" "Lado" "Valdis" "Valdas" "Waldek" "Włodek" "Volodya" "Vova" "'
foreach diminutive of local Valdemar {
	replace ameriname = "Valdemar" if fname == "`diminutive'"
}

local Valent `" "Valentinus" "Balendin" "Valentin" "Tin" "Valent" "Valentijn" "Val" "Valentine" "Bálint" "Tino" "Valentino" "Walenty" "Vali" "Ualan" "Valentín" "Tine" "Tinek" "Valentyn" "Folant" "'
foreach variant of local Valent {
	replace ameriname = "Valent" if fname == "`variant'"
}

/* Valent "No diminutives" */

local Valentin `" "Valentinus" "Balendin" "Valentin" "Valentijn" "Valentine" "Bálint" "Valentino" "Walenty" "Ualan" "Valentín" "Valentyn" "Folant" "'
foreach variant of local Valentin {
	replace ameriname = "Valentin" if fname == "`variant'"
}

local Valentin `" "Tin" "Valent" "Val" "Tino" "Vali" "Tine" "Tinek" "'
foreach diminutive of local Valentin {
	replace ameriname = "Valentin" if fname == "`diminutive'"
}

/* Valentine "No equivalents" */

/* Valentine "No diminutives" */

local Valerio `" "Valerius" "Valeri" "Valère" "Valerio" "Valērijs" "Walery" "Valério" "Valeriu" "Valeriy" "Valery" "Valero" "'
foreach variant of local Valerio {
	replace ameriname = "Valerio" if fname == "`variant'"
}

local Valerio `" "Vali" "'
foreach diminutive of local Valerio {
	replace ameriname = "Valerio" if fname == "`diminutive'"
}

/* Valfrid "No equivalents" */

/* Valfrid "No diminutives" */

local Valter `" "Waldhar" "Walter" "Walther" "Valter" "Wolter" "Wouter" "Valtteri" "Gaultier" "Gauthier" "Gautier" "Gualtiero" "Guálter" "Bhaltair" "Bhàtair" "Gualterio" "Gwallter" "'
foreach variant of local Valter {
	replace ameriname = "Valter" if fname == "`variant'"
}

local Valter `" "Wally" "Walt" "Wat" "Wate" "'
foreach diminutive of local Valter {
	replace ameriname = "Valter" if fname == "`diminutive'"
}

local Vartan `" "Vardan" "'
foreach variant of local Vartan {
	replace ameriname = "Vartan" if fname == "`variant'"
}

/* Vartan "No diminutives" */

local Vasco `" "Vasco" "Velasco" "'
foreach variant of local Vasco {
	replace ameriname = "Vasco" if fname == "`variant'"
}

/* Vasco "No diminutives" */

local Vasil `" "Vasil" "Basileios" "Basilius" "Basil" "Pasi" "Basile" "Vasilios" "Vasilis" "Vassilis" "Basilio" "Vasilii" "Bazyli" "Vasile" "Vasili" "Vasiliy" "Vasily" "Vassily" "Vasilije" "Vasyl" "Wasyl" "'
foreach variant of local Vasil {
	replace ameriname = "Vasil" if fname == "`variant'"
}

local Vasil `" "Vasko" "Baz" "Bazza" "Vaso" "Vasilica" "Vaska" "Vasya" "'
foreach diminutive of local Vasil {
	replace ameriname = "Vasil" if fname == "`diminutive'"
}

local Vasile `" "Vasil" "Basileios" "Basilius" "Basil" "Pasi" "Basile" "Vasilios" "Vasilis" "Vassilis" "Basilio" "Vasilii" "Bazyli" "Vasile" "Vasili" "Vasiliy" "Vasily" "Vassily" "Vasilije" "Vasyl" "Wasyl" "'
foreach variant of local Vasile {
	replace ameriname = "Vasile" if fname == "`variant'"
}

local Vasile `" "Vasko" "Baz" "Bazza" "Vaso" "Vasilica" "Vaska" "Vasya" "'
foreach diminutive of local Vasile {
	replace ameriname = "Vasile" if fname == "`diminutive'"
}

local Vasilios `" "Vasil" "Basileios" "Basilius" "Basil" "Pasi" "Basile" "Vasilios" "Vasilis" "Vassilis" "Basilio" "Vasilii" "Bazyli" "Vasile" "Vasili" "Vasiliy" "Vasily" "Vassily" "Vasilije" "Vasyl" "Wasyl" "'
foreach variant of local Vasilios {
	replace ameriname = "Vasilios" if fname == "`variant'"
}

local Vasilios `" "Vasko" "Baz" "Bazza" "Vaso" "Vasilica" "Vaska" "Vasya" "'
foreach diminutive of local Vasilios {
	replace ameriname = "Vasilios" if fname == "`diminutive'"
}

local Vaso `" "Vasil" "Basileios" "Basilius" "Vasko" "Baz" "Bazza" "Basil" "Pasi" "Basile" "Vaso" "Basilio" "Vasilii" "Bazyli" "Vasile" "Vasilica" "Vasili" "Vasiliy" "Vasily" "Vaska" "Vassily" "Vasya" "Vasyl" "Wasyl" "'
foreach variant of local Vaso {
	replace ameriname = "Vaso" if fname == "`variant'"
}

/* Vaso "No diminutives" */

/* Vassil "No equivalents" */

/* Vassil "No diminutives" */

/* Vazul "No equivalents" */

/* Vazul "No diminutives" */

local Velvel `" "Velvel" "'
foreach variant of local Velvel {
	replace ameriname = "Velvel" if fname == "`variant'"
}

/* Velvel "No diminutives" */

/* Venanzio "No equivalents" */

/* Venanzio "No diminutives" */

/* Vencenzo "No equivalents" */

/* Vencenzo "No diminutives" */

/* Vendel "No equivalents" */

/* Vendel "No diminutives" */

/* Vendelin "No equivalents" */

/* Vendelin "No diminutives" */

/* Ventura "No equivalents" */

/* Ventura "No diminutives" */

/* Vergilio "No equivalents" */

/* Vergilio "No diminutives" */

local Verner `" "Warinhari" "Verner" "Werner" "'
foreach variant of local Verner {
	replace ameriname = "Verner" if fname == "`variant'"
}

local Verner `" "Wessel" "Wetzel" "'
foreach diminutive of local Verner {
	replace ameriname = "Verner" if fname == "`diminutive'"
}

local Vernon `" "Vernon" "'
foreach variant of local Vernon {
	replace ameriname = "Vernon" if fname == "`variant'"
}

local Vernon `" "Vern" "'
foreach diminutive of local Vernon {
	replace ameriname = "Vernon" if fname == "`diminutive'"
}

local Vicente `" "Bikendi" "Vicenç" "Vicent" "Vincenc" "Vincent" "Vinzent" "Vinzenz" "Bence" "Vince" "Uinseann" "Vincente" "Vincenzo" "Vincentius" "Vincentas" "Wincenty" "Vicente" "Vikenti" "Vikentiy" "Vikentije" "'
foreach variant of local Vicente {
	replace ameriname = "Vicente" if fname == "`variant'"
}

local Vicente `" "Vinko" "Cenek" "Vin" "Vince" "Vinnie" "Vinny" "Enzo" "'
foreach diminutive of local Vicente {
	replace ameriname = "Vicente" if fname == "`diminutive'"
}

/* Vicenty "No equivalents" */

/* Vicenty "No diminutives" */

/* Vicenzo "No equivalents" */

/* Vicenzo "No diminutives" */

local Vid `" "Wido" "Vitus" "Vid" "Vít" "Guy" "Wide" "Guido" "Veit" "Vida" "Vito" "Gvidas" "Wit" "'
foreach variant of local Vid {
	replace ameriname = "Vid" if fname == "`variant'"
}

/* Vid "No diminutives" */

local Viggo `" "Vígi" "Viggo" "'
foreach variant of local Viggo {
	replace ameriname = "Viggo" if fname == "`variant'"
}

/* Viggo "No diminutives" */

/* Vigilio "No equivalents" */

/* Vigilio "No diminutives" */

/* Vilem "No equivalents" */

/* Vilem "No diminutives" */

local Vilhelm `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilém" "Vilhelm" "Wilhelmus" "Willem" "William" "Vilhelmo" "Villem" "Vilhelmi" "Viljami" "Guillaume" "Vilmos" "Vilhjálmur" "Uilliam" "Guglielmo" "Vilhelms" "Wöllem" "Wullem" "Vilhelmas" "Illiam" "Wiremu" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Vilhelm {
	replace ameriname = "Vilhelm" if fname == "`variant'"
}

local Vilhelm `" "Vilko" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Billie" "Billy" "Liam" "Will" "Willie" "Vilĉjo" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Willi" "Uilleag" "Ulick" "Vilis" "Wum" "Wilkin" "Wilky" "Wilmot" "Gwil" "'
foreach diminutive of local Vilhelm {
	replace ameriname = "Vilhelm" if fname == "`diminutive'"
}

local Vilho `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilko" "Vilém" "Vilhelm" "Jelle" "Pim" "Wil" "Wilhelmus" "Willem" "Willy" "Wim" "Bill" "Liam" "Will" "William" "Willie" "Vilĉjo" "Vilhelmo" "Villem" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Guillaume" "Willi" "Vilmos" "Vilhjálmur" "Uilleag" "Uilliam" "Ulick" "Guglielmo" "Vilhelms" "Vilis" "Wöllem" "Wullem" "Wum" "Vilhelmas" "Illiam" "Wiremu" "Wilmot" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwil" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Vilho {
	replace ameriname = "Vilho" if fname == "`variant'"
}

local Vilho `" "Billie" "Billy" "Wilkin" "Wilky" "'
foreach diminutive of local Vilho {
	replace ameriname = "Vilho" if fname == "`diminutive'"
}

local Viljo `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilko" "Vilém" "Vilhelm" "Jelle" "Pim" "Wil" "Wilhelmus" "Willem" "Willy" "Wim" "Bill" "Liam" "Will" "William" "Willie" "Vilĉjo" "Vilhelmo" "Villem" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Guillaume" "Willi" "Vilmos" "Vilhjálmur" "Uilleag" "Uilliam" "Ulick" "Guglielmo" "Vilhelms" "Vilis" "Wöllem" "Wullem" "Wum" "Vilhelmas" "Illiam" "Wiremu" "Wilmot" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwil" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Viljo {
	replace ameriname = "Viljo" if fname == "`variant'"
}

local Viljo `" "Billie" "Billy" "Wilkin" "Wilky" "'
foreach diminutive of local Viljo {
	replace ameriname = "Viljo" if fname == "`diminutive'"
}

local Vilmos `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilém" "Vilhelm" "Wilhelmus" "Willem" "William" "Vilhelmo" "Villem" "Vilhelmi" "Viljami" "Guillaume" "Vilmos" "Vilhjálmur" "Uilliam" "Guglielmo" "Vilhelms" "Wöllem" "Wullem" "Vilhelmas" "Illiam" "Wiremu" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Vilmos {
	replace ameriname = "Vilmos" if fname == "`variant'"
}

local Vilmos `" "Vilko" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Billie" "Billy" "Liam" "Will" "Willie" "Vilĉjo" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Willi" "Uilleag" "Ulick" "Vilis" "Wum" "Wilkin" "Wilky" "Wilmot" "Gwil" "'
foreach diminutive of local Vilmos {
	replace ameriname = "Vilmos" if fname == "`diminutive'"
}

/* Vincas "No equivalents" */

/* Vincas "No diminutives" */

local Vincenc `" "Bikendi" "Vicenç" "Vicent" "Vincenc" "Vincent" "Vinzent" "Vinzenz" "Bence" "Vince" "Uinseann" "Vincente" "Vincenzo" "Vincentius" "Vincentas" "Wincenty" "Vicente" "Vikenti" "Vikentiy" "Vikentije" "'
foreach variant of local Vincenc {
	replace ameriname = "Vincenc" if fname == "`variant'"
}

local Vincenc `" "Vinko" "Cenek" "Vin" "Vince" "Vinnie" "Vinny" "Enzo" "'
foreach diminutive of local Vincenc {
	replace ameriname = "Vincenc" if fname == "`diminutive'"
}

/* Vincenjo "No equivalents" */

/* Vincenjo "No diminutives" */

/* Vincenro "No equivalents" */

/* Vincenro "No diminutives" */

local Vincente `" "Bikendi" "Vicenç" "Vicent" "Vincenc" "Vincent" "Vinzent" "Vinzenz" "Bence" "Vince" "Uinseann" "Vincente" "Vincenzo" "Vincentius" "Vincentas" "Wincenty" "Vicente" "Vikenti" "Vikentiy" "Vikentije" "'
foreach variant of local Vincente {
	replace ameriname = "Vincente" if fname == "`variant'"
}

local Vincente `" "Vinko" "Cenek" "Vin" "Vince" "Vinnie" "Vinny" "Enzo" "'
foreach diminutive of local Vincente {
	replace ameriname = "Vincente" if fname == "`diminutive'"
}

/* Vincento "No equivalents" */

/* Vincento "No diminutives" */

/* Vincenty "No equivalents" */

/* Vincenty "No diminutives" */

/* Vincenz "No equivalents" */

/* Vincenz "No diminutives" */

local Vincenza `" "Vincenza" "'
foreach variant of local Vincenza {
	replace ameriname = "Vincenza" if fname == "`variant'"
}

local Vincenza `" "Vinka" "MASCULINE FORMS" "Bikendi" "Vicenç" "Vicent" "Vinko" "Cenek" "Vincenc" "Vincent" "Vin" "Vince" "Vinnie" "Vinny" "Enzo" "Vinzent" "Vinzenz" "Bence" "Uinseann" "Vincente" "Vincenzo" "Vincentius" "Vincentas" "Wincenty" "Vicente" "Vikenti" "Vikentiy" "Vikentije" "'
foreach diminutive of local Vincenza {
	replace ameriname = "Vincenza" if fname == "`diminutive'"
}

/* Vincenzino "No equivalents" */

/* Vincenzino "No diminutives" */

/* Vincenzio "No equivalents" */

/* Vincenzio "No diminutives" */

local VINCENZO `" "Bikendi" "Vicenç" "Vicent" "Vincenc" "Vincent" "Vinzent" "Vinzenz" "Bence" "Vince" "Uinseann" "Vincente" "Vincenzo" "Vincentius" "Vincentas" "Wincenty" "Vicente" "Vikenti" "Vikentiy" "Vikentije" "'
foreach variant of local VINCENZO {
	replace ameriname = "VINCENZO" if fname == "`variant'"
}

local VINCENZO `" "Vinko" "Cenek" "Vin" "Vince" "Vinnie" "Vinny" "Enzo" "'
foreach diminutive of local VINCENZO {
	replace ameriname = "VINCENZO" if fname == "`diminutive'"
}

local Vinko `" "Bikendi" "Vicenç" "Vicent" "Vinko" "Cenek" "Vincenc" "Vincent" "Vin" "Vince" "Vinnie" "Vinny" "Enzo" "Vinzent" "Vinzenz" "Bence" "Uinseann" "Vincente" "Vincenzo" "Vincentius" "Vincentas" "Wincenty" "Vicente" "Vikenti" "Vikentiy" "Vikentije" "'
foreach variant of local Vinko {
	replace ameriname = "Vinko" if fname == "`variant'"
}

/* Vinko "No diminutives" */

/* Virginio "No equivalents" */

/* Virginio "No diminutives" */

local Vita `" "Vita" "Vida" "MASCULINE FORMS" "Vitus" "Vid" "Vít" "Veit" "Vito" "Wit" "'
foreach variant of local Vita {
	replace ameriname = "Vita" if fname == "`variant'"
}

/* Vita "No diminutives" */

local Vitale `" "Vitale" "Vitalis" "Vitalijus" "Vitali" "Vitaliy" "Vitaly" "Vidal" "'
foreach variant of local Vitale {
	replace ameriname = "Vitale" if fname == "`variant'"
}

local Vitale `" "Vitalik" "'
foreach diminutive of local Vitale {
	replace ameriname = "Vitale" if fname == "`diminutive'"
}

/* Vitaliano "No equivalents" */

/* Vitaliano "No diminutives" */

/* Vitantonio "No equivalents" */

/* Vitantonio "No diminutives" */

/* Vittario "No equivalents" */

/* Vittario "No diminutives" */

local Vittore `" "Bittor" "Viktor" "Víctor" "Victor" "Vítor" "Vittore" "Viktoras" "Wiktor" "Gwythyr" "'
foreach variant of local Vittore {
	replace ameriname = "Vittore" if fname == "`variant'"
}

local Vittore `" "Vic" "Vitya" "'
foreach diminutive of local Vittore {
	replace ameriname = "Vittore" if fname == "`diminutive'"
}

local Vittoria `" "Viktoria" "Viktoriya" "Viktorija" "Viktorie" "Victoria" "Victoire" "Wikolia" "Viktória" "Vittoria" "Wiktoria" "Vitória" "'
foreach variant of local Vittoria {
	replace ameriname = "Vittoria" if fname == "`variant'"
}

local Vittoria `" "Latoya" "Toya" "Tori" "Toria" "Tory" "Vic" "Vicki" "Vickie" "Vicky" "Vikki" "MASCULINE FORMS" "Vittorio" "Victorius" "'
foreach diminutive of local Vittoria {
	replace ameriname = "Vittoria" if fname == "`diminutive'"
}

local Vittorino `" "Vittorino" "Victorinus" "Victorino" "'
foreach variant of local Vittorino {
	replace ameriname = "Vittorino" if fname == "`variant'"
}

local Vittorino `" "Rino" "'
foreach diminutive of local Vittorino {
	replace ameriname = "Vittorino" if fname == "`diminutive'"
}

local Vivian `" "Vivian" "Vivyan" "Viviane" "Vivien" "Bébinn" "Bébhinn" "Bébhionn" "Béibhinn" "Bevin" "Vivianus" "'
foreach variant of local Vivian {
	replace ameriname = "Vivian" if fname == "`variant'"
}

local Vivian `" "Vivi" "'
foreach diminutive of local Vivian {
	replace ameriname = "Vivian" if fname == "`diminutive'"
}

local Vladimir `" "Waldomar" "Valdimárr" "Uladzimir" "Vladimir" "Vladimír" "Valdemar" "Waldemar" "Vladimer" "Voldemārs" "Valdemaras" "Vladimiras" "Voldemaras" "Vladimeru" "Volodimeru" "Włodzimierz" "Vladilen" "Vladlen" "Volodymyr" "Wolodymyr" "'
foreach variant of local Vladimir {
	replace ameriname = "Vladimir" if fname == "`variant'"
}

local Vladimir `" "Vlado" "Vlatko" "Vladan" "Valto" "Lado" "Valdis" "Valdas" "Waldek" "Włodek" "Volodya" "Vova" "'
foreach diminutive of local Vladimir {
	replace ameriname = "Vladimir" if fname == "`diminutive'"
}

local Vladislav `" "Vladislav" "Ladislav" "Ladislas" "Ladislaus" "László" "Ladislao" "Volodislavu" "Władysław" "Włodzisław" "'
foreach variant of local Vladislav {
	replace ameriname = "Vladislav" if fname == "`variant'"
}

local Vladislav `" "Vlado" "Vladan" "Laci" "Vlad" "Władek" "Slava" "'
foreach diminutive of local Vladislav {
	replace ameriname = "Vladislav" if fname == "`diminutive'"
}

/* Vladislaw "No equivalents" */

/* Vladislaw "No diminutives" */

local Vojtech `" "Vojtěch" "Voitsekh" "Wojciech" "Vojtech" "'
foreach variant of local Vojtech {
	replace ameriname = "Vojtech" if fname == "`variant'"
}

local Vojtech `" "Wojtek" "'
foreach diminutive of local Vojtech {
	replace ameriname = "Vojtech" if fname == "`diminutive'"
}

/* W "No equivalents" */

/* W "No diminutives" */

/* Waclav "No equivalents" */

/* Waclav "No diminutives" */

/* Wadih "No equivalents" */

/* Wadih "No diminutives" */

/* Wadislaw "No equivalents" */

/* Wadislaw "No diminutives" */

/* Wadyslaw "No equivalents" */

/* Wadyslaw "No diminutives" */

/* Waino "No equivalents" */

/* Waino "No diminutives" */

/* Wajciech "No equivalents" */

/* Wajciech "No diminutives" */

local Waldemar `" "Waldomar" "Valdimárr" "Uladzimir" "Vladimir" "Vladimír" "Valdemar" "Waldemar" "Vladimer" "Voldemārs" "Valdemaras" "Vladimiras" "Voldemaras" "Vladimeru" "Volodimeru" "Włodzimierz" "Vladilen" "Vladlen" "Volodymyr" "Wolodymyr" "'
foreach variant of local Waldemar {
	replace ameriname = "Waldemar" if fname == "`variant'"
}

local Waldemar `" "Vlado" "Vlatko" "Vladan" "Valto" "Lado" "Valdis" "Valdas" "Waldek" "Włodek" "Volodya" "Vova" "'
foreach diminutive of local Waldemar {
	replace ameriname = "Waldemar" if fname == "`diminutive'"
}

/* Walentin "No equivalents" */

/* Walentin "No diminutives" */

local Walenty `" "Valentinus" "Balendin" "Valentin" "Valentijn" "Valentine" "Bálint" "Valentino" "Walenty" "Ualan" "Valentín" "Valentyn" "Folant" "'
foreach variant of local Walenty {
	replace ameriname = "Walenty" if fname == "`variant'"
}

local Walenty `" "Tin" "Valent" "Val" "Tino" "Vali" "Tine" "Tinek" "'
foreach diminutive of local Walenty {
	replace ameriname = "Walenty" if fname == "`diminutive'"
}

/* Walfrid "No equivalents" */

/* Walfrid "No diminutives" */

local Walker `" "Walker" "EQUIVALENTS" "'
foreach variant of local Walker {
	replace ameriname = "Walker" if fname == "`variant'"
}

/* Walker "No diminutives" */

local Wallace `" "Wallace" "'
foreach variant of local Wallace {
	replace ameriname = "Wallace" if fname == "`variant'"
}

local Wallace `" "Wally" "'
foreach diminutive of local Wallace {
	replace ameriname = "Wallace" if fname == "`diminutive'"
}

local Wally `" "Waldhar" "Walter" "Walther" "Valter" "Wolter" "Wouter" "Wally" "Walt" "Wat" "Valtteri" "Gaultier" "Gauthier" "Gautier" "Wate" "Gualtiero" "Guálter" "Bhaltair" "Bhàtair" "Gualterio" "Gwallter" "'
foreach variant of local Wally {
	replace ameriname = "Wally" if fname == "`variant'"
}

local Wally `" "Watse" "'
foreach diminutive of local Wally {
	replace ameriname = "Wally" if fname == "`diminutive'"
}

local Walther `" "Waldhar" "Walter" "Walther" "Valter" "Wolter" "Wouter" "Valtteri" "Gaultier" "Gauthier" "Gautier" "Gualtiero" "Guálter" "Bhaltair" "Bhàtair" "Gualterio" "Gwallter" "'
foreach variant of local Walther {
	replace ameriname = "Walther" if fname == "`variant'"
}

local Walther `" "Wally" "Walt" "Wat" "Wate" "'
foreach diminutive of local Walther {
	replace ameriname = "Walther" if fname == "`diminutive'"
}

/* Wanio "No equivalents" */

/* Wanio "No diminutives" */

local Warren `" "Warren" "EQUIVALENTS" "'
foreach variant of local Warren {
	replace ameriname = "Warren" if fname == "`variant'"
}

/* Warren "No diminutives" */

/* Wasil "No equivalents" */

/* Wasil "No diminutives" */

/* Waslaw "No equivalents" */

/* Waslaw "No diminutives" */

/* Wassily "No equivalents" */

/* Wassily "No diminutives" */

/* Wazlaw "No equivalents" */

/* Wazlaw "No diminutives" */

/* Welvel "No equivalents" */

/* Welvel "No diminutives" */

local Wendel `" "Wandal" "Wendel" "'
foreach variant of local Wendel {
	replace ameriname = "Wendel" if fname == "`variant'"
}

local Wendel `" "Wandalin" "Wendelin" "Vendelín" "'
foreach diminutive of local Wendel {
	replace ameriname = "Wendel" if fname == "`diminutive'"
}

local Wendelin `" "Wandalin" "Wendelin" "Vendelín" "'
foreach variant of local Wendelin {
	replace ameriname = "Wendelin" if fname == "`variant'"
}

/* Wendelin "No diminutives" */

local Wenzel `" "Ventseslav" "Václav" "Věnceslav" "Wenzel" "Wenzeslaus" "Wenceslas" "Wenceslaus" "Vencel" "Venceslao" "Veceslav" "Venceslaus" "Vecheslav" "Wacław" "Więcesław" "Veaceslav" "Vyacheslav" "Venceslás" "'
foreach variant of local Wenzel {
	replace ameriname = "Wenzel" if fname == "`variant'"
}

local Wenzel `" "Slava" "'
foreach diminutive of local Wenzel {
	replace ameriname = "Wenzel" if fname == "`diminutive'"
}

local Wesley `" "Wesley" "Westley" "'
foreach variant of local Wesley {
	replace ameriname = "Wesley" if fname == "`variant'"
}

local Wesley `" "Wes" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Wesley {
	replace ameriname = "Wesley" if fname == "`diminutive'"
}

/* Wicenty "No equivalents" */

/* Wicenty "No diminutives" */

/* Wictor "No equivalents" */

/* Wictor "No diminutives" */

local Wiebe `" "Wigberht" "Wigbrand" "Wiebe" "Wybert" "'
foreach variant of local Wiebe {
	replace ameriname = "Wiebe" if fname == "`variant'"
}

local Wiebe `" "Wibo" "'
foreach diminutive of local Wiebe {
	replace ameriname = "Wiebe" if fname == "`diminutive'"
}

/* Wigdor "No equivalents" */

/* Wigdor "No diminutives" */

local Wiktor `" "Bittor" "Viktor" "Víctor" "Victor" "Vítor" "Vittore" "Viktoras" "Wiktor" "Gwythyr" "'
foreach variant of local Wiktor {
	replace ameriname = "Wiktor" if fname == "`variant'"
}

local Wiktor `" "Vic" "Vitya" "'
foreach diminutive of local Wiktor {
	replace ameriname = "Wiktor" if fname == "`diminutive'"
}

/* Wilford "No equivalents" */

/* Wilford "No diminutives" */

/* Wilh "No equivalents" */

/* Wilh "No diminutives" */

local Wilhelmus `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilém" "Vilhelm" "Wilhelmus" "Willem" "William" "Vilhelmo" "Villem" "Vilhelmi" "Viljami" "Guillaume" "Vilmos" "Vilhjálmur" "Uilliam" "Guglielmo" "Vilhelms" "Wöllem" "Wullem" "Vilhelmas" "Illiam" "Wiremu" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Wilhelmus {
	replace ameriname = "Wilhelmus" if fname == "`variant'"
}

local Wilhelmus `" "Vilko" "Jelle" "Pim" "Wil" "Willy" "Wim" "Bill" "Billie" "Billy" "Liam" "Will" "Willie" "Vilĉjo" "Jami" "Vilho" "Vili" "Viljo" "Ville" "Willi" "Uilleag" "Ulick" "Vilis" "Wum" "Wilkin" "Wilky" "Wilmot" "Gwil" "'
foreach diminutive of local Wilhelmus {
	replace ameriname = "Wilhelmus" if fname == "`diminutive'"
}

/* Wilho "No equivalents" */

/* Wilho "No diminutives" */

local Will `" "Wilhelm" "Willahelm" "Gwilherm" "Guillem" "Vilim" "Vilko" "Vilém" "Vilhelm" "Jelle" "Pim" "Wil" "Wilhelmus" "Willem" "Willy" "Wim" "Bill" "Liam" "Will" "Willie" "Vilĉjo" "Vilhelmo" "Villem" "Jami" "Vilhelmi" "Vilho" "Vili" "Viljami" "Viljo" "Ville" "Guillaume" "Willi" "Vilmos" "Vilhjálmur" "Uilleag" "Uilliam" "Ulick" "Guglielmo" "Vilhelms" "Vilis" "Wöllem" "Wullem" "Wum" "Vilhelmas" "Illiam" "Wiremu" "Wilmot" "Guilherme" "Uilleam" "Viliam" "Viljem" "Guillermo" "Gwil" "Gwilim" "Gwillym" "Gwilym" "'
foreach variant of local Will {
	replace ameriname = "Will" if fname == "`variant'"
}

local Will `" "Billie" "Billy" "Wilkin" "Wilky" "'
foreach diminutive of local Will {
	replace ameriname = "Will" if fname == "`diminutive'"
}

local Willis `" "Willis" "'
foreach variant of local Willis {
	replace ameriname = "Willis" if fname == "`variant'"
}

/* Willis "No diminutives" */

local Wilson `" "Wilson" "'
foreach variant of local Wilson {
	replace ameriname = "Wilson" if fname == "`variant'"
}

/* Wilson "No diminutives" */

/* Wincas "No equivalents" */

/* Wincas "No diminutives" */

/* Wincent "No equivalents" */

/* Wincent "No diminutives" */

local Wincenty `" "Bikendi" "Vicenç" "Vicent" "Vincenc" "Vincent" "Vinzent" "Vinzenz" "Bence" "Vince" "Uinseann" "Vincente" "Vincenzo" "Vincentius" "Vincentas" "Wincenty" "Vicente" "Vikenti" "Vikentiy" "Vikentije" "'
foreach variant of local Wincenty {
	replace ameriname = "Wincenty" if fname == "`variant'"
}

local Wincenty `" "Vinko" "Cenek" "Vin" "Vince" "Vinnie" "Vinny" "Enzo" "'
foreach diminutive of local Wincenty {
	replace ameriname = "Wincenty" if fname == "`diminutive'"
}

/* Winston "No equivalents" */

/* Winston "No diminutives" */

local Witold `" "Widald" "Witold" "Vytautas" "Witołd" "'
foreach variant of local Witold {
	replace ameriname = "Witold" if fname == "`variant'"
}

local Witold `" "Witek" "DIMINUTIVES AND SHORT FORMS" "'
foreach diminutive of local Witold {
	replace ameriname = "Witold" if fname == "`diminutive'"
}

/* Wladek "No equivalents" */

/* Wladek "No diminutives" */

/* Wladimir "No equivalents" */

/* Wladimir "No diminutives" */

/* Wladisl "No equivalents" */

/* Wladisl "No diminutives" */

/* Wladislaus "No equivalents" */

/* Wladislaus "No diminutives" */

/* Wladislav "No equivalents" */

/* Wladislav "No diminutives" */

/* Wladislawa "No equivalents" */

/* Wladislawa "No diminutives" */

/* Wladyslav "No equivalents" */

/* Wladyslav "No diminutives" */

/* Wladzslaw "No equivalents" */

/* Wladzslaw "No diminutives" */

local Wolfgang `" "Vulfgang" "Wolfgang" "'
foreach variant of local Wolfgang {
	replace ameriname = "Wolfgang" if fname == "`variant'"
}

local Wolfgang `" "Wolf" "'
foreach diminutive of local Wolfgang {
	replace ameriname = "Wolfgang" if fname == "`diminutive'"
}

/* Wolke "No equivalents" */

/* Wolke "No diminutives" */

/* Woolf "No equivalents" */

/* Woolf "No diminutives" */

local Wouter `" "Waldhar" "Walter" "Walther" "Valter" "Wolter" "Wouter" "Valtteri" "Gaultier" "Gauthier" "Gautier" "Gualtiero" "Guálter" "Bhaltair" "Bhàtair" "Gualterio" "Gwallter" "'
foreach variant of local Wouter {
	replace ameriname = "Wouter" if fname == "`variant'"
}

local Wouter `" "Wally" "Walt" "Wat" "Wate" "'
foreach diminutive of local Wouter {
	replace ameriname = "Wouter" if fname == "`diminutive'"
}

local Wulf `" "Wolf" "Úlfr" "Uffe" "Ulf" "Wolfe" "Wulf" "'
foreach variant of local Wulf {
	replace ameriname = "Wulf" if fname == "`variant'"
}

/* Wulf "No diminutives" */

local Xaver `" "Xabier" "Xavier" "Saveriu" "Xavior" "Xzavier" "Zavier" "Xaver" "Saverio" "Ksawery" "Javier" "'
foreach variant of local Xaver {
	replace ameriname = "Xaver" if fname == "`variant'"
}

local Xaver `" "Xabi" "Xavi" "'
foreach diminutive of local Xaver {
	replace ameriname = "Xaver" if fname == "`diminutive'"
}

local Xavier `" "Xabier" "Xavier" "Saveriu" "Xavior" "Xzavier" "Zavier" "Xaver" "Saverio" "Ksawery" "Javier" "'
foreach variant of local Xavier {
	replace ameriname = "Xavier" if fname == "`variant'"
}

local Xavier `" "Xabi" "Xavi" "'
foreach diminutive of local Xavier {
	replace ameriname = "Xavier" if fname == "`diminutive'"
}

/* Yacob "No equivalents" */

/* Yacob "No diminutives" */

/* Yakob "No equivalents" */

/* Yakob "No diminutives" */

/* Yan "No equivalents" */

/* Yan "No diminutives" */

/* Yanos "No equivalents" */

/* Yanos "No diminutives" */

/* Yervant "No equivalents" */

/* Yervant "No diminutives" */

/* Yohan "No equivalents" */

/* Yohan "No diminutives" */

/* Yohann "No equivalents" */

/* Yohann "No diminutives" */

local Yosef `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Yosef {
	replace ameriname = "Yosef" if fname == "`variant'"
}

local Yosef `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Yosef {
	replace ameriname = "Yosef" if fname == "`diminutive'"
}

/* Yosel "No equivalents" */

/* Yosel "No diminutives" */

/* Yossel "No equivalents" */

/* Yossel "No diminutives" */

local Yousef `" "Yousef" "Youssef" "Yusef" "Yusuf" "Hovsep" "Yusif" "Joseba" "Josepe" "Ioseph" "Yosef" "Joseph" "Yosif" "Josep" "Josip" "Josef" "Josephus" "Jozef" "Jozefo" "Joosep" "Jooseppi" "Xosé" "Ioseb" "Iosif" "József" "Seosamh" "Giuseppe" "Iosephus" "Jāzeps" "Juozapas" "Josif" "Hohepa" "Josèp" "Iosifu" "Józef" "José" "Osip" "Seòsaidh" "Jožef" "Yosyp" "Yusup" "'
foreach variant of local Yousef {
	replace ameriname = "Yousef" if fname == "`variant'"
}

local Yousef `" "Ioses" "Joses" "Joško" "Joso" "Jozo" "Jef" "Joep" "Joop" "Joos" "Joost" "Jos" "Sjef" "Zef" "Jo" "Joe" "Joey" "Jojo" "Joĉjo" "Juuso" "Soso" "Sepp" "Seppel" "Jóska" "Józsi" "Beppe" "Peppe" "Peppi" "Peppino" "Pino" "Juozas" "Zé" "Zezé" "Jože" "Pepe" "Pepito" "Yussel" "'
foreach diminutive of local Yousef {
	replace ameriname = "Yousef" if fname == "`diminutive'"
}

/* Yozef "No equivalents" */

/* Yozef "No diminutives" */

/* Yozsef "No equivalents" */

/* Yozsef "No diminutives" */

/* Yrjo "No equivalents" */

/* Yrjo "No diminutives" */

/* Ysak "No equivalents" */

/* Ysak "No diminutives" */

/* Ysrael "No equivalents" */

/* Ysrael "No diminutives" */

local Yudel `" "Ioudas" "Yehudah" "Iudas" "Judah" "Judas" "Jude" "Yehuda" "Yidel" "'
foreach variant of local Yudel {
	replace ameriname = "Yudel" if fname == "`variant'"
}

/* Yudel "No diminutives" */

/* Yvan "No equivalents" */

/* Yvan "No diminutives" */

local Yves `" "Ivo" "Erwan" "Erwann" "Yvo" "Yves" "Ives" "Iwo" "'
foreach variant of local Yves {
	replace ameriname = "Yves" if fname == "`variant'"
}

local Yves `" "Yvon" "'
foreach diminutive of local Yves {
	replace ameriname = "Yves" if fname == "`diminutive'"
}

/* Zalel "No equivalents" */

/* Zalel "No diminutives" */

/* Zalik "No equivalents" */

/* Zalik "No diminutives" */

local Zalman `" "Sulaiman" "Sulayman" "Salomon" "Shelomoh" "Solomon" "Shlomo" "Suleiman" "Salamon" "Salomão" "Salomón" "Süleyman" "Zalman" "'
foreach variant of local Zalman {
	replace ameriname = "Zalman" if fname == "`variant'"
}

local Zalman `" "Suljo" "Sol" "'
foreach diminutive of local Zalman {
	replace ameriname = "Zalman" if fname == "`diminutive'"
}

/* Zalmen "No equivalents" */

/* Zalmen "No diminutives" */

local Zelig `" "Selig" "Zelig" "'
foreach variant of local Zelig {
	replace ameriname = "Zelig" if fname == "`variant'"
}

/* Zelig "No diminutives" */

/* Zelik "No equivalents" */

/* Zelik "No diminutives" */

/* Zelman "No equivalents" */

/* Zelman "No diminutives" */

/* Zigmund "No equivalents" */

/* Zigmund "No diminutives" */

/* Zoltan "No equivalents" */

/* Zoltan "No diminutives" */

/* Zygmund "No equivalents" */

/* Zygmund "No diminutives" */

local Zygmunt `" "Sigimund" "Sigismund" "Sigmundr" "Zikmund" "Sigmund" "Siegmund" "Zsigmond" "Zygmunt" "Žigmund" "'
foreach variant of local Zygmunt {
	replace ameriname = "Zygmunt" if fname == "`variant'"
}

local Zygmunt `" "Zsiga" "Žiga" "'
foreach diminutive of local Zygmunt {
	replace ameriname = "Zygmunt" if fname == "`diminutive'"
}




/* New ones */

local Abe `" "Ebrahim" "Ibraheem" "Ibrahim" "Abraam" "Avraham" "Abraham" "Ibro" "Ibragim" "Braam" "Bram" "Abe" "Aabraham" "Aapo" "Abram" "Avi" "Ábrahám" "Abramo" "Avraamu" "Abraão" "İbrahim" "Ibrahima" "'
foreach variant of local Abe {
	replace ameriname = "Abe" if fname == "`variant'"
}

/* Abe `" "No diminutives" "' */

local Abram `" "Avram" "Abram" "Avrum" "'
foreach variant of local Abram {
	replace ameriname = "Abram" if fname == "`variant'"
}

/* Abram `" "No diminutives" "' */

local Alf `" "Alf" "Alfr" "Alv" "'
foreach variant of local Alf {
	replace ameriname = "Alf" if fname == "`variant'"
}

/* Alf `" "No diminutives" "' */

local Ali `" "'Ali" "Ali" "Alikhan" "'
foreach variant of local Ali {
	replace ameriname = "Ali" if fname == "`variant'"
}

/* Ali `" "No diminutives" "' */

local Alma `" "Alma" "'
foreach variant of local Alma {
	replace ameriname = "Alma" if fname == "`variant'"
}

/* Alma `" "No diminutives" "' */

local Alte `" "Alte" "MASCULINE FORMS" "'
foreach variant of local Alte {
	replace ameriname = "Alte" if fname == "`variant'"
}

/* Alte `" "No diminutives" "' */

local Andor `" "Arnórr" "Arnþórr" "Arnór" "Arnþór" "Andor" "'
foreach variant of local Andor {
	replace ameriname = "Andor" if fname == "`variant'"
}

/* Andor `" "No diminutives" "' */

local Andrea `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Andrea {
	replace ameriname = "Andrea" if fname == "`variant'"
}

local Andrea `" "Diminutives:" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Andrea {
	replace ameriname = "Andrea" if fname == "`diminutive'"
}

local Anne `" "Quanna" "Ane" "Anne" "Anna" "Hanna" "Channah" "Hannah" "Ana" "Aina" "Hana" "Jana" "Hanne" "Annelien" "Anissa" "Ann" "Keanna" "Chanah" "Annabella" "Ona" "Anabela" "Anabel" "Hena" "Henda" "Hene" "Henye" "'
foreach variant of local Anne {
	replace ameriname = "Anne" if fname == "`variant'"
}

local Anne `" "Diminutives:" "Annick" "Ani" "Anka" "Anaïs" "Anica" "Anita" "Anja" "Ankica" "Nensi" "Aneta" "Ane" "Anika" "Annette" "Anke" "Anneke" "Annet" "Annie" "Annika" "Anouk" "Ans" "Antje" "Anneka" "Nan" "Nancy" "Nanette" "Nannie" "Nanny" "Nettie" "Nita" "Anu" "Anneli" "Anni" "Anniina" "Annikki" "Annukka" "Hannele" "Niina" "Ninon" "Anina" "Annett" "Anett" "Anikó" "Annuska" "Panna" "Panni" "Nainsí" "Annetta" "Anniken" "Ania" "Hania" "Anca" "Annushka" "Anushka" "Anya" "Annag" "Nandag" "Anoushka" "Anouska" "Hendel" "'
foreach diminutive of local Anne {
	replace ameriname = "Anne" if fname == "`diminutive'"
}

local Ante `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Doncho" "Antoni" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Antonie" "Antoon" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Anthony" "Antony" "Tony" "Anĉjo" "Antono" "Tõnis" "Anttoni" "Antón" "Antonios" "Antonis" "Akoni" "Anakoni" "Antal" "Tóni" "Antonello" "Antonio" "Tonino" "Tonio" "Antanas" "Antonij" "Antônio" "António" "Toninho" "Antonije" "Tone" "Toño" "'
foreach variant of local Ante {
	replace ameriname = "Ante" if fname == "`variant'"
}

/* Ante `" "No diminutives" "' */

local Antonie `" "Antonia" "Antonija" "Antonie" "Antía" "Antónia" "Antônia" "'
foreach variant of local Antonie {
	replace ameriname = "Antonie" if fname == "`variant'"
}

local Antonie `" "Diminutives:" "Latonya" "Donka" "Antica" "Antonela" "Nela" "Tonka" "Teuna" "Antonette" "Nia" "Toni" "Tonia" "Tonya" "Toini" "Antoinette" "Toinette" "Antonella" "Antonietta" "Nella" "Tonina" "MASCULINE FORMS" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Doncho" "Antoni" "Ante" "Anto" "Antonijo" "Antonio" "Antun" "Tonći" "Tonči" "Antonie" "Antoon" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Anthony" "Antony" "Tony" "Anĉjo" "Antono" "Tõnis" "Anttoni" "Antón" "Antonios" "Antonis" "Akoni" "Anakoni" "Antal" "Tóni" "Antonello" "Tonino" "Tonio" "Antanas" "Antonij" "Antônio" "António" "Toninho" "Antonije" "Tone" "Toño" "'
foreach diminutive of local Antonie {
	replace ameriname = "Antonie" if fname == "`diminutive'"
}

local Arne `" "Ari" "Árni" "Arne" "Aarne" "'
foreach variant of local Arne {
	replace ameriname = "Arne" if fname == "`variant'"
}

/* Arne `" "No diminutives" "' */

local Auguste `" "Augustus" "August" "Aukusti" "Auguste" "Augusto" "Augusts" "Augustas" "Avgust" "'
foreach variant of local Auguste {
	replace ameriname = "Auguste" if fname == "`variant'"
}

local Auguste `" "Diminutives:" "Guus" "Gus" "Aku" "Kusti" "'
foreach diminutive of local Auguste {
	replace ameriname = "Auguste" if fname == "`diminutive'"
}

local Augustine `" "Augustinus" "Agustí" "Augustin" "Augustín" "Augustijn" "Augustine" "Austen" "Austin" "Austyn" "Ágoston" "Agostino" "Augustinas" "Augustyn" "Agostinho" "Avguštin" "Agustín" "Awstin" "'
foreach variant of local Augustine {
	replace ameriname = "Augustine" if fname == "`variant'"
}

local Augustine `" "Diminutives:" "Dino" "Tin" "Stijn" "Tijn" "Auke" "'
foreach diminutive of local Augustine {
	replace ameriname = "Augustine" if fname == "`diminutive'"
}

local Basil `" "Vasil" "Basileios" "Basilius" "Basil" "Pasi" "Basile" "Vasilios" "Vasilis" "Vassilis" "Basilio" "Vasilii" "Bazyli" "Vasile" "Vasili" "Vasiliy" "Vasily" "Vassily" "Vasilije" "Vasyl" "Wasyl" "'
foreach variant of local Basil {
	replace ameriname = "Basil" if fname == "`variant'"
}

local Basil `" "Diminutives:" "Vasko" "Baz" "Bazza" "Vaso" "Vasilica" "Vaska" "Vasya" "'
foreach diminutive of local Basil {
	replace ameriname = "Basil" if fname == "`diminutive'"
}

local Ben `" "Binyamin" "Beniamin" "Benjamin" "Benedikt" "Benjamín" "Bendt" "Bent" "Ben" "Benj" "Benji" "Benjy" "Bennie" "Benny" "Pentti" "Benoit" "Bieito" "Peni" "Bence" "Benedek" "Benjámin" "Benedetto" "Beniamino" "Benito" "Bettino" "Benedictus" "Bendiks" "Benas" "Benediktas" "Benjaminas" "Venijamin" "Veniaminu" "Benedykt" "Benedito" "Benjamim" "Bento" "Veniamin" "Venyamin" "Bengt" "Bünyamin" "Benesh" "'
foreach variant of local Ben {
	replace ameriname = "Ben" if fname == "`variant'"
}

/* Ben `" "No diminutives" "' */

local Carol `" "Charlize" "Carolina" "Carolus" "Karl" "Carla" "Carles" "Carlos" "Karla" "Karlo" "Karolina" "Lina" "Kája" "Karel" "Karolína" "Carl" "Caroline" "Charlotte" "Ina" "Karoline" "Line" "Lotte" "Carola" "Carolien" "Lien" "Calleigh" "Callie" "Cari" "Carol" "Carrie" "Carry" "Caryl" "Charles" "Kallie" "Karrie" "Lottie" "Tottie" "Totty" "Iina" "Kaarle" "Kaarlo" "Karoliina" "Liina" "Lotta" "Carole" "Charline" "Carolin" "Karola" "Kale" "Károly" "Lili" "Séarlait" "Séarlas" "Carlo" "Carlotta" "Sjarel" "Karolis" "Karol" "Carlota" "Charlotta" "Siarl" "'
foreach variant of local Carol {
	replace ameriname = "Carol" if fname == "`variant'"
}

local Carol `" "Diminutives:" "Charley" "Charlie" "Chas" "Chaz" "Chip" "Chuck" "Kalle" "Charlot" "Karcsi" "Carlinhos" "Carlito" "Carlitos" "MASCULINE FORMS" "Carolus" "Karl" "Carles" "Carlos" "Karlo" "Karel" "Carl" "Charles" "Kaarle" "Kaarlo" "Kale" "Károly" "Séarlas" "Carlo" "Sjarel" "Karolis" "Karol" "Carol" "Siarl" "'
foreach diminutive of local Carol {
	replace ameriname = "Carol" if fname == "`diminutive'"
}

local Christen `" "Kristiyan" "Kristijan" "Carsten" "Christen" "Christian" "Karsten" "Kresten" "Kristen" "Kristian" "Christiaan" "Kristjan" "Krisztián" "Kristján" "Cristiano" "Christianus" "Kristiāns" "Kristijonas" "Hristijan" "Krystian" "Krystyn" "Cristian" "Cristián" "'
foreach variant of local Christen {
	replace ameriname = "Christen" if fname == "`variant'"
}

local Christen `" "Diminutives:" "Krsto" "Christer" "Kris" "Chris" "Cristi" "Krister" "'
foreach diminutive of local Christen {
	replace ameriname = "Christen" if fname == "`diminutive'"
}

local Colin `" "Colin" "Coilean" "Colombo" "Columba" "Cailean" "Callum" "Calum" "'
foreach variant of local Colin {
	replace ameriname = "Colin" if fname == "`variant'"
}

local Colin `" "Diminutives:" "Coleman" "Kolman" "Koloman" "Colombano" "Columbanus" "'
foreach diminutive of local Colin {
	replace ameriname = "Colin" if fname == "`diminutive'"
}

local Dan `" "Dan" "'
foreach variant of local Dan {
	replace ameriname = "Dan" if fname == "`variant'"
}

/* Dan `" "No diminutives" "' */

local Demeter `" "Demetria" "Demeter" "Demetra" "Dimitra" "'
foreach variant of local Demeter {
	replace ameriname = "Demeter" if fname == "`variant'"
}

local Demeter `" "Diminutives:" "Demi" "MASCULINE FORMS" "Demetrios" "Demetrius" "Dimitar" "Mitre" "Dmitar" "Dimitri" "Dimitrios" "Dimitris" "Demeter" "Dömötör" "Demetrio" "Dimitrij" "Dmitrei" "Demétrio" "Dumitru" "Mitica" "Dima" "Dmitri" "Dmitrii" "Dmitriy" "Dmitry" "Mitya" "Dimitrije" "Mitja" "Dmytro" "'
foreach diminutive of local Demeter {
	replace ameriname = "Demeter" if fname == "`diminutive'"
}

local Dick `" "Richard" "Ricohard" "Ricard" "Rikard" "Dick" "Rich" "Richie" "Rick" "Rickey" "Ricki" "Rickie" "Ricky" "Ritchie" "Rikhard" "Riku" "Richárd" "Rikárd" "Risteárd" "Riccardo" "Rihards" "Ričardas" "Dicun" "Hudde" "Ryszard" "Ricardo" "Riško" "Rišo" "Rihard" "Rico" "Rhisiart" "'
foreach variant of local Dick {
	replace ameriname = "Dick" if fname == "`variant'"
}

/* Dick `" "No diminutives" "' */

local Ela `" "Zabel" "Elixabete" "Elisabet" "Elisheba" "Elisabeth" "Elizabeth" "Elisaveta" "Elizabeta" "Alžběta" "Eliška" "Eli" "Elise" "Ella" "Else" "Isabella" "Lilly" "Lis" "Lisa" "Lisbet" "Lise" "Lissi" "Betje" "Elly" "Els" "Elsje" "Ilse" "Isa" "Isabelle" "Lies" "Liesbeth" "Liese" "Liesje" "Lijsbeth" "Bella" "Belle" "Bess" "Bessie" "Beth" "Betsy" "Bette" "Bettie" "Betty" "Bettye" "Buffy" "Elisa" "Elissa" "Eliza" "Elle" "Ellie" "Elsa" "Elsabeth" "Elsie" "Elyse" "Elyzabeth" "Ibbie" "Isabel" "Isbel" "Isebella" "Issy" "Izabelle" "Izzy" "Leesa" "Libbie" "Libby" "Liddy" "Lilian" "Liliana" "Lilibet" "Lilibeth" "Lillian" "Lilliana" "Liz" "Liza" "Lizbeth" "Lizette" "Lizzie" "Lizzy" "Sabella" "Tetty" "Eliisabet" "Liis" "Liisa" "Liisi" "Liisu" "Eliisa" "Babette" "Élisabeth" "Élise" "Lili" "Liliane" "Lilianne" "Bet" "Lys" "Sabela" "Elisabed" "Eliso" "Bettina" "Elli" "Ilsa" "Isabell" "Liesa" "Liesel" "Liesl" "Lilli" "Lisbeth" "Elisavet" "Elikapeka" "Elisheva" "Bözsi" "Erzsébet" "Erzsi" "Izabella" "Liliána" "Zsóka" "Elísabet" "Eilís" "Eilish" "Isibéal" "Sibéal" "Elisabetta" "Elžbieta" "Elzė" "Beti" "Veta" "Ealisaid" "Ibb" "Liss" "Isabèl" "Elisabeti" "Ela" "Iza" "Izabel" "Lílian" "Belinha" "Elisabete" "Isabela" "Elisabeta" "Elizaveta" "Lizaveta" "Yelizaveta" "Beileag" "Ealasaid" "Elspet" "Elspeth" "Iseabail" "Ishbel" "Isobel" "Lileas" "Lilias" "Lillias" "Jela" "Jelisaveta" "Alžbeta" "Špela" "Ysabel" "Yelyzaveta" "Bethan" "'
foreach variant of local Ela {
	replace ameriname = "Ela" if fname == "`variant'"
}

local Ela `" "Diminutives:" "Leanna" "Liana" "Lillia" "Lisette" "Lysette" "Betje" "'
foreach diminutive of local Ela {
	replace ameriname = "Ela" if fname == "`diminutive'"
}

local Eli `" "Eli" "Heli" "Ely" "'
foreach variant of local Eli {
	replace ameriname = "Eli" if fname == "`variant'"
}

/* Eli `" "No diminutives" "' */

local Elke `" "Kalisha" "Talisha" "Adalheidis" "Adela" "Adelais" "Alícia" "Adéla" "Heidi" "Aleid" "Aleida" "Alida" "Elke" "Ada" "Addie" "Addy" "Adelaide" "Adele" "Adelia" "Adella" "Adelle" "Alease" "Alecia" "Aleesha" "Alesha" "Alesia" "Ali" "Alice" "Alicia" "Alise" "Alisha" "Alishia" "Alisia" "Alison" "Alissa" "Alisya" "Allie" "Allison" "Allissa" "Ally" "Allycia" "Allyson" "Alyce" "Alycia" "Alys" "Alysa" "Alyse" "Alysha" "Alysia" "Alyson" "Alyssa" "Alyssia" "Elicia" "Lecia" "Lesia" "Lisha" "Lyssa" "Aliisa" "Alisa" "Alli" "Adélaïde" "Adèle" "Alix" "Heida" "Adél" "Adelaida" "Alíz" "Aliz" "Ailís" "Aalis" "Adelajda" "Alicja" "Aileas" "Alica" "Alis" "'
foreach variant of local Elke {
	replace ameriname = "Elke" if fname == "`variant'"
}

local Elke `" "Diminutives:" "Adelina" "Adalyn" "Adalynn" "Adeline" "Adelyn" "Alene" "Aline" "Delia" "Della" "Aada" "Ada" "Line" "Alina" "Adelita" "'
foreach diminutive of local Elke {
	replace ameriname = "Elke" if fname == "`diminutive'"
}

local Ellis `" "Ellis" "'
foreach variant of local Ellis {
	replace ameriname = "Ellis" if fname == "`variant'"
}

/* Ellis `" "No diminutives" "' */

local Endre `" "Andre" "Deandre" "Andreas" "Ander" "Andrew" "Andrei" "Andrey" "Andreu" "Andria" "Andrej" "Andrija" "Andro" "Ondřej" "Anders" "Andries" "Andres" "Andrus" "Antero" "André" "Andor" "András" "Endre" "Aindréas" "Aindriú" "Andrea" "Andrejs" "Andris" "Andrius" "Anaru" "Andrzej" "Jędrzej" "Ándaras" "Aindrea" "Ondrej" "Andraž" "Andrés" "Andriy" "Andras" "'
foreach variant of local Endre {
	replace ameriname = "Endre" if fname == "`variant'"
}

local Endre `" "Diminutives:" "Andie" "Andy" "Dre" "Drew" "Antti" "Atte" "Tero" "Andro" "Andris" "Bandi" "Dand" "'
foreach diminutive of local Endre {
	replace ameriname = "Endre" if fname == "`diminutive'"
}

local Finn `" "Finn" "Fionn" "Fion" "'
foreach variant of local Finn {
	replace ameriname = "Finn" if fname == "`variant'"
}

local Finn `" "Diminutives:" "Finnagán" "Finnán" "Fionnán" "'
foreach diminutive of local Finn {
	replace ameriname = "Finn" if fname == "`diminutive'"
}

local Franco `" "Franco" "Frank" "Franck" "'
foreach variant of local Franco {
	replace ameriname = "Franco" if fname == "`variant'"
}

local Franco `" "Diminutives:" "Frankie" "'
foreach diminutive of local Franco {
	replace ameriname = "Franco" if fname == "`diminutive'"
}

local Frank `" "Franco" "Frank" "Franck" "'
foreach variant of local Frank {
	replace ameriname = "Frank" if fname == "`variant'"
}

local Frank `" "Diminutives:" "Frankie" "'
foreach diminutive of local Frank {
	replace ameriname = "Frank" if fname == "`diminutive'"
}

local Gabriele `" "Jabril" "Jibril" "Gabriel" "Gavri'el" "Gavrail" "Gavril" "Dzhabrail" "Gabrijel" "Gabriël" "Kaapo" "Kaapro" "Gavriil" "Gavriel" "Gábor" "Gábriel" "Gabriele" "Gabriels" "Gabrielius" "Gavriilu" "Gavrilo" "Cebrail" "Havryil" "Gavrel" "'
foreach variant of local Gabriele {
	replace ameriname = "Gabriele" if fname == "`variant'"
}

local Gabriele `" "Diminutives:" "Biel" "Gabby" "Gabe" "Gabi" "'
foreach diminutive of local Gabriele {
	replace ameriname = "Gabriele" if fname == "`diminutive'"
}

local Gerd `" "Gerhard" "Gerard" "Cai" "Caj" "Kai" "Kaj" "Kay" "Geert" "Gerd" "Gerry" "Gert" "Gerrard" "Jerrard" "Gérard" "Gerrit" "Jorrit" "Jurre" "Jurryt" "Gellért" "Gearóid" "Gerardo" "Gherardo" "Sjra" "'
foreach variant of local Gerd {
	replace ameriname = "Gerd" if fname == "`variant'"
}

/* Gerd `" "No diminutives" "' */

local German `" "Germanus" "Kerman" "German" "Jermaine" "Germain" "Germano" "Germán" "'
foreach variant of local German {
	replace ameriname = "German" if fname == "`variant'"
}

/* German `" "No diminutives" "' */

local Hanna `" "Quanna" "Ane" "Anne" "Anna" "Hanna" "Channah" "Hannah" "Ana" "Aina" "Hana" "Jana" "Hanne" "Annelien" "Anissa" "Ann" "Keanna" "Chanah" "Annabella" "Ona" "Anabela" "Anabel" "Hena" "Henda" "Hene" "Henye" "'
foreach variant of local Hanna {
	replace ameriname = "Hanna" if fname == "`variant'"
}

local Hanna `" "Diminutives:" "Annick" "Ani" "Anka" "Anaïs" "Anica" "Anita" "Anja" "Ankica" "Nensi" "Aneta" "Ane" "Anika" "Annette" "Anke" "Anneke" "Annet" "Annie" "Annika" "Anouk" "Ans" "Antje" "Anneka" "Nan" "Nancy" "Nanette" "Nannie" "Nanny" "Nettie" "Nita" "Anu" "Anneli" "Anni" "Anniina" "Annikki" "Annukka" "Hannele" "Niina" "Ninon" "Anina" "Annett" "Anett" "Anikó" "Annuska" "Panna" "Panni" "Nainsí" "Annetta" "Anniken" "Ania" "Hania" "Anca" "Annushka" "Anushka" "Anya" "Annag" "Nandag" "Anoushka" "Anouska" "Hendel" "'
foreach diminutive of local Hanna {
	replace ameriname = "Hanna" if fname == "`diminutive'"
}

local Ira `" "'Ira'" "Ira" "'
foreach variant of local Ira {
	replace ameriname = "Ira" if fname == "`variant'"
}

/* Ira `" "No diminutives" "' */

local Ivo `" "Ivo" "Erwan" "Erwann" "Yvo" "Yves" "Ives" "Iwo" "'
foreach variant of local Ivo {
	replace ameriname = "Ivo" if fname == "`variant'"
}

local Ivo `" "Diminutives:" "Yvon" "'
foreach diminutive of local Ivo {
	replace ameriname = "Ivo" if fname == "`diminutive'"
}

local Jaime `" "Yakub" "Yaqoob" "Yaqub" "Hagop" "Hakob" "Jakes" "Iakobos" "Yaakov" "Iacobus" "Jacob" "James" "Yakov" "Jaume" "Jago" "Jakov" "Jakub" "Jakob" "Jacobus" "Sjaak" "Jaycob" "Jaymes" "Jaagup" "Jaakob" "Jákup" "Jaakoppi" "Jacques" "Iago" "Iakob" "Iakopa" "Kimo" "Akiba" "Akiva" "Jakab" "Jákob" "Séamas" "Séamus" "Shamus" "Sheamus" "Giacobbe" "Giacomo" "Iacopo" "Jacopo" "Iacomus" "Jokūbas" "Hemi" "Iakovu" "Jacó" "Jaime" "Seumas" "Jacobo" "Yago" "Yakup" "Yakiv" "'
foreach variant of local Jaime {
	replace ameriname = "Jaime" if fname == "`variant'"
}

local Jaime `" "Diminutives:" "Jaumet" "Jakša" "Ib" "Jeppe" "Cobus" "Coos" "Jaap" "Kobe" "Kobus" "Koos" "Sjakie" "Coby" "Jae" "Jake" "Jamey" "Jay" "Jeb" "Jem" "Jemmy" "Jim" "Jimi" "Jimmie" "Jimmy" "Koby" "Jaak" "Jaakko" "Jaska" "Jacky" "Japik" "Koba" "Jockel" "Lapo" "Kuba" "Yasha" "Jamie" "Jaka" "Jaša" "Kapel" "Koppel" "Yankel" "'
foreach diminutive of local Jaime {
	replace ameriname = "Jaime" if fname == "`diminutive'"
}

local Jan `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Žan" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Jan {
	replace ameriname = "Jan" if fname == "`variant'"
}

local Jan `" "Diminutives:" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Jan {
	replace ameriname = "Jan" if fname == "`diminutive'"
}

local Janne `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Hannes" "Hans" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Janne {
	replace ameriname = "Janne" if fname == "`variant'"
}

local Janne `" "Diminutives:" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Ianto" "'
foreach diminutive of local Janne {
	replace ameriname = "Janne" if fname == "`diminutive'"
}

local Jean `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Žan" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Jean {
	replace ameriname = "Jean" if fname == "`variant'"
}

local Jean `" "Diminutives:" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Jean {
	replace ameriname = "Jean" if fname == "`diminutive'"
}

local Jessie `" "Lashawn" "Tajuana" "Jone" "Ioanna" "Yiskah" "Iohanna" "Iscah" "Jescha" "Joanna" "Ioana" "Ivana" "Ivanka" "Yana" "Yanka" "Yoana" "Jana" "Joana" "Žana" "Iva" "Janička" "Johana" "Hanna" "Hanne" "Janne" "Jeanette" "Jessica" "Johanna" "Johanne" "Jonna" "Vanja" "Hannie" "Janine" "Janna" "Janneke" "Jantine" "Jantje" "Jeanine" "Jeannette" "Jennigje" "Jenny" "Johanneke" "Genette" "Jan" "Janae" "Janeka" "Janel" "Janele" "Janella" "Janelle" "Janene" "Janet" "Janetta" "Janette" "Janey" "Janie" "Jannah" "Jannette" "Jannine" "Jaynie" "Jeanie" "Jeannie" "Jeannine" "Jeni" "Jenna" "Jenni" "Jennie" "Jess" "Jessa" "Jessalyn" "Jessi" "Jessie" "Jessye" "Jo" "Joanie" "Joetta" "Joey" "Joleen" "Jolene" "Jonette" "Joni" "Jonie" "Hannele" "Janina" "Jeanne" "Joanne" "Xoana" "Jessika" "Gianna" "Nana" "Yanna" "Iekika" "Zsanett" "Jóhanna" "Jóna" "Chevonne" "Shavonne" "Shevaun" "Shevon" "Síne" "Sinéad" "Siobhán" "Gessica" "Giovanna" "Giovannetta" "Vanna" "Jovana" "Jovanka" "Jovka" "Vana" "Jehanne" "Asia" "Joasia" "Joaninha" "Ionela" "Oana" "Ivanna" "Zhanna" "Zhannochka" "Seona" "Seònaid" "Sheona" "Shona" "Sìneag" "Teasag" "Janka" "Juana" "Juanita" "Yessica" "Jannicke" "Jannike" "Shan" "Siân" "Siana" "Siani" "Sioned" "Siwan" "'
foreach variant of local Jessie {
	replace ameriname = "Jessie" if fname == "`variant'"
}

local Jessie `" "Diminutives:" "Nina" "Ivka" "Jannicke" "Jannike" "Jan" "Janna" "Jannah" "Jojo" "Nena" "Netta" "Nettie" "Ninette" "Gia" "Giannina" "MASCULINE FORMS" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Evan" "Hank" "Ian" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Janne" "Joni" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giannino" "Giovanni" "Ivano" "Nino" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Jock" "Jockie" "Jocky" "Seoc" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Hampus" "Hasse" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach diminutive of local Jessie {
	replace ameriname = "Jessie" if fname == "`diminutive'"
}

local Joan `" "Lashawn" "Tajuana" "Jone" "Ioanna" "Iohanna" "Joanna" "Ioana" "Ivana" "Yana" "Yanka" "Yoana" "Jana" "Joana" "Johana" "Johanna" "Johanne" "Janna" "Jane" "Janessa" "Janice" "Janis" "Jayna" "Jayne" "Jean" "Jeana" "Jeane" "Jeanna" "Jeanne" "Joan" "Joann" "Joanne" "Johna" "Johnna" "Jonelle" "Seanna" "Shauna" "Shavonne" "Shawna" "Sheena" "Sheenagh" "Shena" "Shevaun" "Shevon" "Janina" "Xoana" "Gianna" "Yanna" "Jóhanna" "Jóna" "Chevonne" "Síne" "Siobhán" "Giovanna" "Jovana" "Jehanne" "Ivanna" "Zhanna" "Seona" "Seonag" "Sìne" "Juana" "Shan" "Siân" "Siwan" "'
foreach variant of local Joan {
	replace ameriname = "Joan" if fname == "`variant'"
}

local Joan `" "Diminutives:" "Ivanka" "Nina" "Žana" "Iva" "Ivka" "Janička" "Hanna" "Hanne" "Janne" "Jannicke" "Jannike" "Jeanette" "Jonna" "Vanja" "Hannie" "Janine" "Janneke" "Jantine" "Jantje" "Jeanine" "Jeannette" "Jennigje" "Jenny" "Johanneke" "Genette" "Jan" "Janae" "Janeka" "Janel" "Janele" "Janella" "Janelle" "Janene" "Janet" "Janetta" "Janette" "Janey" "Janie" "Janna" "Jannah" "Jannette" "Jannine" "Jaynie" "Jeanie" "Jeannie" "Jeannine" "Jeni" "Jenna" "Jenni" "Jennie" "Jessalyn" "Jessi" "Jessie" "Jessye" "Jo" "Joanie" "Joetta" "Joey" "Jojo" "Joleen" "Jolene" "Jonette" "Joni" "Jonie" "Nena" "Netta" "Nettie" "Hannele" "Ninette" "Nana" "Zsanett" "Sinéad" "Gia" "Gianna" "Giannina" "Giovannetta" "Vanna" "Jovanka" "Jovka" "Vana" "Asia" "Joasia" "Joaninha" "Ionela" "Oana" "Zhannochka" "Seònaid" "Sheona" "Shona" "Sìneag" "Teasag" "Janka" "Juanita" "Siana" "Siani" "Sioned" "MASCULINE FORMS" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hannes" "Joop" "Evan" "Hank" "Ian" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giannino" "Giovanni" "Ivano" "Nino" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Jock" "Jockie" "Jocky" "Seoc" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Hampus" "Hasse" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach diminutive of local Joan {
	replace ameriname = "Joan" if fname == "`diminutive'"
}

local Jon `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Jon {
	replace ameriname = "Jon" if fname == "`variant'"
}

local Jon `" "Diminutives:" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Jon {
	replace ameriname = "Jon" if fname == "`diminutive'"
}

local Jonas `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Jonas {
	replace ameriname = "Jonas" if fname == "`variant'"
}

local Jonas `" "Diminutives:" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Jonas {
	replace ameriname = "Jonas" if fname == "`diminutive'"
}

local Jone `" "Lashawn" "Tajuana" "Jone" "Ioanna" "Iohanna" "Joanna" "Ioana" "Ivana" "Yana" "Yanka" "Yoana" "Jana" "Joana" "Johana" "Johanna" "Johanne" "Janna" "Jane" "Janessa" "Janice" "Janis" "Jayna" "Jayne" "Jean" "Jeana" "Jeane" "Jeanna" "Jeanne" "Joan" "Joann" "Joanne" "Johna" "Johnna" "Jonelle" "Seanna" "Shauna" "Shavonne" "Shawna" "Sheena" "Sheenagh" "Shena" "Shevaun" "Shevon" "Janina" "Xoana" "Gianna" "Yanna" "Jóhanna" "Jóna" "Chevonne" "Síne" "Siobhán" "Giovanna" "Jovana" "Jehanne" "Ivanna" "Zhanna" "Seona" "Seonag" "Sìne" "Juana" "Shan" "Siân" "Siwan" "'
foreach variant of local Jone {
	replace ameriname = "Jone" if fname == "`variant'"
}

local Jone `" "Diminutives:" "Ivanka" "Nina" "Žana" "Iva" "Ivka" "Janička" "Hanna" "Hanne" "Janne" "Jannicke" "Jannike" "Jeanette" "Jonna" "Vanja" "Hannie" "Janine" "Janneke" "Jantine" "Jantje" "Jeanine" "Jeannette" "Jennigje" "Jenny" "Johanneke" "Genette" "Jan" "Janae" "Janeka" "Janel" "Janele" "Janella" "Janelle" "Janene" "Janet" "Janetta" "Janette" "Janey" "Janie" "Janna" "Jannah" "Jannette" "Jannine" "Jaynie" "Jeanie" "Jeannie" "Jeannine" "Jeni" "Jenna" "Jenni" "Jennie" "Jessalyn" "Jessi" "Jessie" "Jessye" "Jo" "Joanie" "Joetta" "Joey" "Jojo" "Joleen" "Jolene" "Jonette" "Joni" "Jonie" "Nena" "Netta" "Nettie" "Hannele" "Ninette" "Nana" "Zsanett" "Sinéad" "Gia" "Gianna" "Giannina" "Giovannetta" "Vanna" "Jovanka" "Jovka" "Vana" "Asia" "Joasia" "Joaninha" "Ionela" "Oana" "Zhannochka" "Seònaid" "Sheona" "Shona" "Sìneag" "Teasag" "Janka" "Juanita" "Siana" "Siani" "Sioned" "MASCULINE FORMS" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hannes" "Joop" "Evan" "Hank" "Ian" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Gian" "Giannino" "Giovanni" "Ivano" "Nino" "Vanni" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Jock" "Jockie" "Jocky" "Seoc" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Hampus" "Hasse" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach diminutive of local Jone {
	replace ameriname = "Jone" if fname == "`diminutive'"
}

local Juan `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Juan {
	replace ameriname = "Juan" if fname == "`variant'"
}

local Juan `" "Diminutives:" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Juan {
	replace ameriname = "Juan" if fname == "`diminutive'"
}

local Jude `" "Ioudas" "Yehudah" "Iudas" "Judah" "Judas" "Jude" "Yehuda" "Yidel" "'
foreach variant of local Jude {
	replace ameriname = "Jude" if fname == "`variant'"
}

/* Jude `" "No diminutives" "' */

local Jules `" "Iulius" "Julius" "Jules" "Giulio" "Juliusz" "Julio" "Iuliu" "Yuli" "Yuliy" "Július" "Julij" "'
foreach variant of local Jules {
	replace ameriname = "Jules" if fname == "`variant'"
}

local Jules `" "Diminutives:" "Julek" "'
foreach diminutive of local Jules {
	replace ameriname = "Jules" if fname == "`diminutive'"
}

local Juro `" "Gjergj" "Georgios" "Georgius" "Gevorg" "Kevork" "Gorka" "Georgi" "Jordi" "Jory" "Jure" "Jurica" "Juro" "Jiří" "Georg" "Jørg" "Jørgen" "Jørn" "Joeri" "Joris" "Jurgen" "Jurriaan" "Sjors" "Geordie" "George" "Georgie" "Georgo" "Jyri" "Jyrki" "Yrjänä" "Yrjö" "Georges" "Xurxo" "Giorgi" "Goga" "Iuri" "Jörg" "Giorgos" "Yiorgos" "Yorgos" "György" "Gyuri" "Seoirse" "Giorgino" "Giorgio" "Georgijs" "Georgs" "Juris" "Jurgis" "Jürgen" "Gjorgji" "Gorgi" "Geevarghese" "Varghese" "Jurian" "Yrian" "Georgei" "Gøran" "Ørjan" "Jerzy" "Jurek" "Jorge" "Jorginho" "Gheorghe" "Georgiy" "Georgy" "Yegor" "Yura" "Yuri" "Yuriy" "Deòrsa" "Seòras" "Djordje" "Djuradj" "Djuro" "Đorđe" "Đurađ" "Đuro" "Juraj" "Jurij" "Göran" "Jöran" "Jörgen" "Örjan" "Siôr" "Siors" "Siorus" "'
foreach variant of local Juro {
	replace ameriname = "Juro" if fname == "`variant'"
}

local Juro `" "Diminutives:" "Jockel" "Gino" "'
foreach diminutive of local Juro {
	replace ameriname = "Juro" if fname == "`diminutive'"
}

local Kai `" "Gerhard" "Gaios" "Nicolaus" "Nikolaos" "Caius" "Cornelius" "Gaius" "Nikola" "Nikolai" "Nikolay" "Gerard" "Nicolau" "Nikica" "Niko" "Nikša" "Kornel" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Cees" "Corné" "Geert" "Gerd" "Gerry" "Gert" "Kees" "Klaas" "Nick" "Nico" "Niek" "Connie" "Gerrard" "Jerrard" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Corneille" "Gérard" "Nicolas" "Jurre" "Klaes" "Gaioz" "Korneli" "Nika" "Nikoloz" "Nikusha" "Nicolaos" "Gellért" "Kolos" "Kornél" "Miklós" "Miksa" "Gearóid" "Nioclás" "Cornelio" "Gerardo" "Gherardo" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Sjra" "Kajus" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Caio" "Cornélio" "Cornel" "Corneliu" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nikolaj" "Nicolao" "Nicolás" "Claes" "Klas" "Mykola" "'
foreach variant of local Kai {
	replace ameriname = "Kai" if fname == "`variant'"
}

local Kai `" "Diminutives:" "Colin" "Collin" "Launo" "'
foreach diminutive of local Kai {
	replace ameriname = "Kai" if fname == "`diminutive'"
}

local Kaj `" "Gerhard" "Gaios" "Nicolaus" "Nikolaos" "Caius" "Cornelius" "Gaius" "Nikola" "Nikolai" "Nikolay" "Gerard" "Nicolau" "Nikica" "Niko" "Nikša" "Kornel" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Cees" "Corné" "Cornelis" "Geert" "Gerd" "Gerrit" "Gerry" "Gert" "Kees" "Kerneels" "Klaas" "Nick" "Nico" "Nicolaas" "Niek" "Nikolaas" "Connie" "Gerrard" "Jerrard" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Niklas" "Corneille" "Gérard" "Nicolas" "Jorrit" "Jurre" "Jurryt" "Klaes" "Gaioz" "Korneli" "Nika" "Nikoloz" "Nikusha" "Niklaus" "Gerhardt" "Nickolaus" "Nikolaus" "Nicolaos" "Gellért" "Kolos" "Kornél" "Miklós" "Miksa" "Gearóid" "Nioclás" "Cornelio" "Gerardo" "Gherardo" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Sjra" "Kajus" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Caio" "Cornélio" "Cornel" "Corneliu" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nikolaj" "Nicolao" "Nicolás" "Claes" "Klas" "Mykola" "'
foreach variant of local Kaj {
	replace ameriname = "Kaj" if fname == "`variant'"
}

local Kaj `" "Diminutives:" "Colin" "Collin" "Launo" "'
foreach diminutive of local Kaj {
	replace ameriname = "Kaj" if fname == "`diminutive'"
}

local Kristen `" "Kristiyan" "Kristijan" "Carsten" "Christen" "Christian" "Karsten" "Kresten" "Kristen" "Kristian" "Christiaan" "Kristjan" "Krisztián" "Kristján" "Cristiano" "Christianus" "Kristiāns" "Kristijonas" "Hristijan" "Krystian" "Krystyn" "Cristian" "Cristián" "'
foreach variant of local Kristen {
	replace ameriname = "Kristen" if fname == "`variant'"
}

local Kristen `" "Diminutives:" "Krsto" "Christer" "Kris" "Chris" "Cristi" "Krister" "'
foreach diminutive of local Kristen {
	replace ameriname = "Kristen" if fname == "`diminutive'"
}

local Laurence `" "Laurentius" "Llorenç" "Lovrenco" "Vavřinec" "Lars" "Laurits" "Lauritz" "Lorens" "Laurens" "Lourens" "Lauren" "Laurence" "Lawrence" "Laurent" "Laurenz" "Lorenz" "Lavrentios" "Lőrinc" "Lárus" "Labhrás" "Lorenzo" "Laurynas" "Lorencio" "Wawrzyniec" "Lourenço" "Laurențiu" "Lavrenti" "Lavrentiy" "Lavrenty" "Labhrainn" "Vavrinec" "Lovrenc" "'
foreach variant of local Laurence {
	replace ameriname = "Laurence" if fname == "`variant'"
}

local Laurence `" "Diminutives:" "Lovre" "Lovro" "Lasse" "Lau" "Rens" "Larrie" "Larry" "Laurie" "Lawrie" "Laz" "Loren" "Lorin" "Lorrin" "Lari" "Lassi" "Lauri" "Enzo" "Lenz" "Loris" "Renzo" "Lor" "Larkin" "Law" "'
foreach diminutive of local Laurence {
	replace ameriname = "Laurence" if fname == "`diminutive'"
}

local Leone `" "Leon" "Leonidas" "Leontios" "Leontius" "Levon" "Leo" "Leoš" "Léo" "Léon" "Léonce" "Léonide" "Levan" "Leone" "Leonida" "Leonzio" "Leonas" "Lew" "Leonid" "Leonti" "Leontiy" "Leonty" "Lev" "Lyov" "León" "Leoncio" "'
foreach variant of local Leone {
	replace ameriname = "Leone" if fname == "`variant'"
}

local Leone `" "Diminutives:" "Lionel" "'
foreach diminutive of local Leone {
	replace ameriname = "Leone" if fname == "`diminutive'"
}

local Lev `" "Leon" "Leonidas" "Leontios" "Leontius" "Levon" "Leo" "Leoš" "Léo" "Léon" "Léonce" "Léonide" "Levan" "Leone" "Leonida" "Leonzio" "Leonas" "Lew" "Leonid" "Leonti" "Leontiy" "Leonty" "Lev" "Lyov" "León" "Leoncio" "'
foreach variant of local Lev {
	replace ameriname = "Lev" if fname == "`variant'"
}

local Lev `" "Diminutives:" "Lionel" "'
foreach diminutive of local Lev {
	replace ameriname = "Lev" if fname == "`diminutive'"
}

local Luca `" "Loukas" "Lucas" "Luke" "Lluc" "Luka" "Lukáš" "Lukas" "Luuk" "Luukas" "Luc" "Luca" "Lukács" "Lúcás" "Łukasz" "'
foreach variant of local Luca {
	replace ameriname = "Luca" if fname == "`variant'"
}

local Luca `" "Diminutives:" "Lucky" "'
foreach diminutive of local Luca {
	replace ameriname = "Luca" if fname == "`diminutive'"
}

local Marian `" "Mariam" "Maryam" "Maia" "Maria" "Miren" "Maryia" "Miriam" "Mary" "Mari" "Mariya" "Mariona" "Maja" "Mara" "Mare" "Marica" "Marija" "Marijeta" "Maša" "Mojca" "Madlenka" "Marie" "Marika" "Máša" "Maiken" "Majken" "Marianne" "Mia" "Maaike" "Manon" "Marieke" "Mariëlle" "Mariëtte" "Marijke" "Marijse" "Marike" "Mariska" "Marita" "Marja" "Marjan" "Marjo" "Meike" "Mieke" "Miep" "Mies" "Mirjam" "Ria" "Mae" "Mamie" "Marian" "Mariel" "Marinda" "Marion" "Maureen" "Maurene" "Maurine" "May" "Mayme" "Mimi" "Moreen" "Mya" "Maarika" "Maarja" "Jaana" "Maaria" "Maija" "Maritta" "Marjaana" "Marjatta" "Marjukka" "Marjut" "Miia" "Mirja" "Mirjami" "Marielle" "Mariette" "Marise" "Myriam" "Maike" "Mareike" "María" "Mariami" "Meri" "Mariele" "Mitzi" "Malia" "Mele" "Mariamne" "Mária" "Mæja" "Máire" "Mairenn" "Máirín" "Maura" "Moira" "Moyra" "Marianna" "Mariella" "Marietta" "Moirrey" "Voirrey" "Mere" "Malle" "Molle" "Maryla" "Marzena" "Mariana" "Marianita" "Mariazinha" "Manya" "Marya" "Maryana" "Masha" "Márjá" "Màiri" "Maritza" "My" "Meryem" "Mair" "Mairwen" "Mirele" "'
foreach variant of local Marian {
	replace ameriname = "Marian" if fname == "`variant'"
}

local Marian `" "Diminutives:" "Ona" "Jet" "Mo" "Mollie" "Molly" "Pollie" "Polly" "Reenie" "Mallaidh" "'
foreach diminutive of local Marian {
	replace ameriname = "Marian" if fname == "`diminutive'"
}

local Marion `" "Mariam" "Maryam" "Maia" "Maria" "Miren" "Maryia" "Miriam" "Mary" "Mari" "Mariya" "Mariona" "Maja" "Mara" "Mare" "Marica" "Marija" "Marijeta" "Maša" "Mojca" "Madlenka" "Marie" "Marika" "Máša" "Maiken" "Majken" "Marianne" "Mia" "Maaike" "Manon" "Marieke" "Mariëlle" "Mariëtte" "Marijke" "Marijse" "Marike" "Mariska" "Marita" "Marja" "Marjan" "Marjo" "Meike" "Mieke" "Miep" "Mies" "Mirjam" "Ria" "Mae" "Mamie" "Marian" "Mariel" "Marinda" "Marion" "Maureen" "Maurene" "Maurine" "May" "Mayme" "Mimi" "Moreen" "Mya" "Maarika" "Maarja" "Jaana" "Maaria" "Maija" "Maritta" "Marjaana" "Marjatta" "Marjukka" "Marjut" "Miia" "Mirja" "Mirjami" "Marielle" "Mariette" "Marise" "Maike" "Mareike" "María" "Mariami" "Meri" "Mariele" "Mitzi" "Malia" "Mele" "Mariamne" "Mária" "Mæja" "Máire" "Mairenn" "Máirín" "Maura" "Moira" "Moyra" "Marianna" "Mariella" "Marietta" "Moirrey" "Voirrey" "Mere" "Malle" "Molle" "Maryla" "Marzena" "Mariana" "Marianita" "Mariazinha" "Manya" "Marya" "Maryana" "Masha" "Márjá" "Màiri" "Maritza" "My" "Meryem" "Mair" "Mairwen" "Mirele" "'
foreach variant of local Marion {
	replace ameriname = "Marion" if fname == "`variant'"
}

local Marion `" "Diminutives:" "Ona" "Jet" "Mo" "Mollie" "Molly" "Pollie" "Polly" "Reenie" "Mallaidh" "'
foreach diminutive of local Marion {
	replace ameriname = "Marion" if fname == "`diminutive'"
}

local Marjan `" "Mariam" "Maryam" "Maia" "Maria" "Miren" "Maryia" "Miriam" "Mary" "Mari" "Mariya" "Mariona" "Maja" "Mara" "Mare" "Marica" "Marija" "Marijeta" "Maša" "Mojca" "Madlenka" "Marie" "Marika" "Máša" "Maiken" "Majken" "Marianne" "Mia" "Maaike" "Manon" "Marieke" "Mariëlle" "Mariëtte" "Marijke" "Marijse" "Marike" "Mariska" "Marita" "Marjan" "Meike" "Mieke" "Miep" "Mies" "Ria" "Mae" "Maleah" "Mamie" "Maralyn" "Maree" "Mariah" "Marian" "Mariel" "Marilyn" "Marilynn" "Marinda" "Marion" "Marlyn" "Marylyn" "Maura" "Maureen" "Maurene" "Maurine" "May" "Mayme" "Merilyn" "Merrilyn" "Mimi" "Moira" "Mora" "Moreen" "Mya" "Maarika" "Maarja" "Mirjam" "Jaana" "Maaria" "Maija" "Maritta" "Marja" "Marjaana" "Marjatta" "Marjo" "Marjukka" "Marjut" "Miia" "Mirja" "Mirjami" "Marielle" "Mariette" "Marise" "Myriam" "Maike" "Mareike" "María" "Mariami" "Meri" "Mariele" "Mitzi" "Malia" "Mele" "Mariamne" "Mária" "Mæja" "Máire" "Mairenn" "Máirín" "Moyra" "Marianna" "Mariella" "Marietta" "Moirrey" "Voirrey" "Mere" "Malle" "Molle" "Maryla" "Marzena" "Mariana" "Marianita" "Mariazinha" "Manya" "Marya" "Maryana" "Masha" "Márjá" "Màiri" "Maritza" "My" "Meryem" "Mair" "Mairwen" "Mirele" "'
foreach variant of local Marjan {
	replace ameriname = "Marjan" if fname == "`variant'"
}

local Marjan `" "Diminutives:" "Ona" "Jet" "Mo" "Mollie" "Molly" "Pollie" "Polly" "Reenie" "Mallaidh" "'
foreach diminutive of local Marjan {
	replace ameriname = "Marjan" if fname == "`diminutive'"
}

local Mate `" "Matia" "Matthaios" "Matthias" "Mattithyahu" "Mattityahu" "Mattheus" "Matthew" "Mattithiah" "Matey" "Mateu" "Matej" "Mateo" "Matija" "Matěj" "Matouš" "Matyáš" "Mathias" "Matthijs" "Mathew" "Matias" "Matti" "Matéo" "Mathéo" "Mathieu" "Mathis" "Mathys" "Matthieu" "Mate" "Matthäus" "Mattias" "Makaio" "Máté" "Mátyás" "Maitiú" "Matteo" "Mattia" "Matas" "Matteus" "Matthei" "Matthia" "Maciej" "Mateusz" "Matheus" "Mateus" "Matei" "Matfey" "Matvei" "Matvey" "Mateja" "Matúš" "Matevž" "Matic" "Matjaž" "Matías" "'
foreach variant of local Mate {
	replace ameriname = "Mate" if fname == "`variant'"
}

local Mate `" "Diminutives:" "Mate" "Matko" "Mato" "Mads" "Thijs" "Ties" "Mat" "Matt" "Mattie" "Matty" "Mats" "Motya" "Tjaž" "'
foreach diminutive of local Mate {
	replace ameriname = "Mate" if fname == "`diminutive'"
}

local Michal `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "'
foreach variant of local Michal {
	replace ameriname = "Michal" if fname == "`variant'"
}

local Michal `" "Diminutives:" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Michal {
	replace ameriname = "Michal" if fname == "`diminutive'"
}

local Michele `" "Mikha'il" "Mikel" "Mitxel" "Michael" "Mikhael" "Mikha'el" "Mihail" "Mikhail" "Miquel" "Myghal" "Mihael" "Mihajlo" "Mihovil" "Michal" "Mikael" "Mikkel" "Maikel" "Michaël" "Michel" "Michiel" "Micheal" "Miĥaelo" "Mikelo" "Mihkel" "Mikkjal" "Mickaël" "Mikheil" "Michail" "Michalis" "Mihalis" "Mikala" "Mihály" "Mícheál" "Michele" "Mihails" "Miķelis" "Mykolas" "Mikaere" "Mikhailu" "Michał" "Miguel" "Mihai" "Mihkkal" "Mìcheal" "Micheil" "Mihailo" "Miguelangel" "Mikail" "Mikhailo" "Mykhail" "Mykhailo" "Mykhaylo" "Meical" "Mihangel" "'
foreach variant of local Michele {
	replace ameriname = "Michele" if fname == "`variant'"
}

local Michele `" "Diminutives:" "Miho" "Mijo" "Mick" "Mickey" "Micky" "Mike" "Mikey" "Miĉjo" "Mika" "Mikko" "Miska" "Misho" "Michel" "Michi" "Miksa" "Misi" "Miguelito" "Mihăiță" "Misha" "Miha" "'
foreach diminutive of local Michele {
	replace ameriname = "Michele" if fname == "`diminutive'"
}

local Miron `" "Myron" "Miron" "'
foreach variant of local Miron {
	replace ameriname = "Miron" if fname == "`variant'"
}

/* Miron `" "No diminutives" "' */

local Morgan `" "Morcant" "Morgan" "'
foreach variant of local Morgan {
	replace ameriname = "Morgan" if fname == "`variant'"
}

/* Morgan `" "No diminutives" "' */

local Nicol `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nicol {
	replace ameriname = "Nicol" if fname == "`variant'"
}

local Nicol `" "Diminutives:" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nicol {
	replace ameriname = "Nicol" if fname == "`diminutive'"
}

local Nicola `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nicola {
	replace ameriname = "Nicola" if fname == "`variant'"
}

local Nicola `" "Diminutives:" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nicola {
	replace ameriname = "Nicola" if fname == "`diminutive'"
}

local Niels `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Nikica" "Niko" "Nikša" "Mikoláš" "Mikula" "Mikuláš" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Nicolaas" "Niek" "Nikolaas" "Nic" "Nicholas" "Nickolas" "Nicky" "Nik" "Nikolas" "Niĉjo" "Nikolao" "Nigul" "Niilo" "Niklas" "Nicolas" "Klaes" "Nika" "Nikoloz" "Nikusha" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Kolos" "Miklós" "Miksa" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Klaos" "Nikolche" "Nikora" "Col" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Nicu" "Nicușor" "Kolya" "Neacel" "Miklavž" "Nikolaj" "Nicolao" "Nicolás" "Claes" "Klas" "Mykola" "'
foreach variant of local Niels {
	replace ameriname = "Niels" if fname == "`variant'"
}

local Niels `" "Diminutives:" "Colin" "Collin" "Launo" "'
foreach diminutive of local Niels {
	replace ameriname = "Niels" if fname == "`diminutive'"
}

local Nikola `" "Nicolaus" "Nikolaos" "Nikola" "Nikolai" "Nikolay" "Nicolau" "Mikoláš" "Mikula" "Mikuláš" "Niklas" "Nikolaj" "Nicolaas" "Nikolaas" "Nicholas" "Nickolas" "Nikolas" "Nikolao" "Nigul" "Nicolas" "Nikoloz" "Niklaus" "Nickolaus" "Nikolaus" "Nicolaos" "Miklós" "Nioclás" "Niccolò" "Nicola" "Nicolò" "Nikolajs" "Nikora" "Nichol" "Nicol" "Mikołaj" "Neculai" "Nicolae" "Neacel" "Miklavž" "Nicolao" "Nicolás" "Mykola" "'
foreach variant of local Nikola {
	replace ameriname = "Nikola" if fname == "`variant'"
}

local Nikola `" "Diminutives:" "Nikica" "Niko" "Nikša" "Cai" "Caj" "Claus" "Kai" "Kaj" "Kay" "Klaus" "Nels" "Niels" "Nils" "Klaas" "Nick" "Nico" "Niek" "Colin" "Collin" "Nic" "Nicky" "Nik" "Niĉjo" "Launo" "Niilo" "Klaes" "Nika" "Nikusha" "Kolos" "Miksa" "Klaos" "Nikolche" "Col" "Nicu" "Nicușor" "Kolya" "Claes" "Klas" "'
foreach diminutive of local Nikola {
	replace ameriname = "Nikola" if fname == "`diminutive'"
}

local Nino `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Antoninus" "Yahya" "Yuhanna" "Hovhannes" "Hovik" "Hovo" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yanick" "Yann" "Yannic" "Yannick" "Ioan" "Ivo" "Yanko" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Ivica" "Janko" "Vanja" "Antonín" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Jens" "Johan" "Johannes" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Evan" "Hank" "Ian" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Van" "Joĉjo" "Johano" "Jaan" "Juhan" "Jóannes" "Hannu" "Jani" "Janne" "Joni" "Jouni" "Juha" "Juhana" "Juhani" "Juho" "Jukka" "Jussi" "Antonin" "Jean" "Jeannot" "Xoán" "Ioane" "Ivane" "Vano" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "Jancsi" "Janika" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Nino" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hankin" "Hann" "Jackin" "Jankin" "Jehan" "Zuan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Ioann" "Vanya" "Juhán" "Iain" "Jock" "Jockie" "Jocky" "Seoc" "Ján" "Anže" "Janez" "Žan" "Juanito" "Xuan" "Hampus" "Hasse" "Ianto" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Nino {
	replace ameriname = "Nino" if fname == "`variant'"
}

/* Nino `" "No diminutives" "' */

local Noah `" "Nuh" "Noe" "Noach" "Noah" "Nooa" "Noé" "Nojus" "Noak" "'
foreach variant of local Noah {
	replace ameriname = "Noah" if fname == "`variant'"
}

/* Noah `" "No diminutives" "' */

local Ola `" "Áleifr" "Olaf" "Olav" "Ole" "Oluf" "Olavi" "Olev" "Olli" "Uolevi" "Ólafur" "Amhlaoibh" "Ola" "Olavo" "Amhlaidh" "Aulay" "Olle" "'
foreach variant of local Ola {
	replace ameriname = "Ola" if fname == "`variant'"
}

/* Ola `" "No diminutives" "' */

local Orla `" "Órfhlaith" "Orla" "Orlagh" "'
foreach variant of local Orla {
	replace ameriname = "Orla" if fname == "`variant'"
}

/* Orla `" "No diminutives" "' */

local Owen `" "Eugenios" "Eugenius" "Owain" "Yvain" "Ywain" "Evgeni" "Eugen" "Evžen" "Eugene" "Owen" "Eugène" "Uxío" "Eugenio" "Eugenijus" "Evgenij" "Eugeniusz" "Eugênio" "Evgeniy" "Evgeny" "Yevgeni" "Yevgeniy" "Yevgeny" "Yevgen" "Yevhen" "Yevheniy" "'
foreach variant of local Owen {
	replace ameriname = "Owen" if fname == "`variant'"
}

local Owen `" "Diminutives:" "Gene" "Genya" "Zhenya" "'
foreach diminutive of local Owen {
	replace ameriname = "Owen" if fname == "`diminutive'"
}

local Paris `" "Paris" "'
foreach variant of local Paris {
	replace ameriname = "Paris" if fname == "`variant'"
}

/* Paris `" "No diminutives" "' */

local Rosa `" "Hrodohaidis" "Rothaid" "Roza" "Ruzha" "Rozalija" "Ruža" "Růžena" "Rosa" "Roos" "Rosalie" "Rosabel" "Rosabella" "Rose" "Rosalía" "Róza" "Rozália" "Rózsa" "Róis" "Rosalia" "Rozālija" "Rožė" "Rohese" "Rohesia" "Royse" "Róża" "Rozalia" "Rosália" "Rozaliya" "Raisa" "'
foreach variant of local Rosa {
	replace ameriname = "Rosa" if fname == "`variant'"
}

local Rosa `" "Diminutives:" "Rozika" "Ružica" "Roosje" "Rosie" "Rosy" "Roselle" "Rosette" "Rosine" "Rózsi" "Róisín" "Rosheen" "Lia" "Rosella" "Rosetta" "Rosina" "Rosinha" "Zala" "Rosita" "Raisel" "'
foreach diminutive of local Rosa {
	replace ameriname = "Rosa" if fname == "`diminutive'"
}

local Sam `" "Samouel" "Sampson" "Shemu'el" "Shimshon" "Samson" "Samuhel" "Samuel" "Samuil" "Samantha" "Sam" "Sammi" "Sammie" "Sammy" "Sami" "Samppa" "Samu" "Samuli" "Shmuel" "Sámuel" "Samanta" "Samuele" "Sansone" "Samoil" "Samuilu" "Sawyl" "'
foreach variant of local Sam {
	replace ameriname = "Sam" if fname == "`variant'"
}

/* Sam `" "No diminutives" "' */

local Sami `" "Samouel" "Shemu'el" "Samuhel" "Samuel" "Samuil" "Sam" "Sammie" "Sammy" "Sami" "Samppa" "Samu" "Shmuel" "Sámuel" "Samuele" "Samoil" "Samuilu" "Sawyl" "'
foreach variant of local Sami {
	replace ameriname = "Sami" if fname == "`variant'"
}

/* Sami `" "No diminutives" "' */

local Sigfrid `" "Sigifrid" "Sigfrøðr" "Siegfried" "Sigfrido" "Zygfryd" "Sigfrid" "'
foreach variant of local Sigfrid {
	replace ameriname = "Sigfrid" if fname == "`variant'"
}

local Sigfrid `" "Diminutives:" "Sikke" "Sigi" "'
foreach diminutive of local Sigfrid {
	replace ameriname = "Sigfrid" if fname == "`diminutive'"
}

local Simone `" "Simona" "Šimona" "Cymone" "Simone" "Jimena" "Ximena" "'
foreach variant of local Simone {
	replace ameriname = "Simone" if fname == "`variant'"
}

local Simone `" "Diminutives:" "Simonette" "Simonetta" "MASCULINE FORMS" "Ximun" "Simon" "Symeon" "Shimon" "Simeon" "Šime" "Šimo" "Šimun" "Šimon" "Siem" "Siemen" "Simo" "Simoni" "Simone" "Simonas" "Sime" "Ximeno" "Simen" "Simonu" "Symeonu" "Szymon" "Simão" "Simion" "Semen" "Semyon" "Jimeno" "Simón" "Symon" "'
foreach diminutive of local Simone {
	replace ameriname = "Simone" if fname == "`diminutive'"
}

local Tom `" "Te'oma" "Thomas" "Toma" "Tomàs" "Tomica" "Tomo" "Tomáš" "Maas" "Tom" "Thom" "Tommie" "Tommy" "Toomas" "Tomi" "Tommi" "Tuomas" "Tuomo" "Tamás" "Tómas" "Tomás" "Tommaso" "Toms" "Tomas" "Tamati" "Thoma" "Tomasz" "Tomek" "Tomé" "Foma" "Tam" "Tàmhas" "Tavish" "Tòmas" "Tomaž" "Tomos" "Twm" "'
foreach variant of local Tom {
	replace ameriname = "Tom" if fname == "`variant'"
}

/* Tom `" "No diminutives" "' */

local Toma `" "Thamar" "Tamar" "Tamara" "Tamera" "Tami" "Tamia" "Tammara" "Tammi" "Tammie" "Tammy" "Tamra" "Tamari" "Toma" "'
foreach variant of local Toma {
	replace ameriname = "Toma" if fname == "`variant'"
}

/* Toma `" "No diminutives" "' */

local Toni `" "Antoine" "Antwan" "Antonius" "Andoni" "Antton" "Andon" "Anton" "Doncho" "Antoni" "Ante" "Anto" "Tonći" "Tonči" "Toni" "Antonie" "Antoon" "Teun" "Teunis" "Theun" "Theunis" "Ton" "Toon" "Anthony" "Antony" "Tony" "Anĉjo" "Antono" "Tõnis" "Antón" "Antonios" "Antonis" "Akoni" "Anakoni" "Antal" "Tóni" "Antonello" "Antonio" "Tonino" "Tonio" "Antanas" "Antonij" "Antônio" "António" "Toninho" "Antonije" "Tone" "Toño" "'
foreach variant of local Toni {
	replace ameriname = "Toni" if fname == "`variant'"
}

/* Toni `" "No diminutives" "' */

local Tore `" "Þórir" "Thore" "Tore" "Tuure" "Ture" "'
foreach variant of local Tore {
	replace ameriname = "Tore" if fname == "`variant'"
}

local Tore `" "Diminutives:" "Tuukka" "'
foreach diminutive of local Tore {
	replace ameriname = "Tore" if fname == "`diminutive'"
}

local Valentine `" "Valentinus" "Balendin" "Valentin" "Valentijn" "Valentine" "Bálint" "Valentino" "Walenty" "Ualan" "Valentín" "Valentyn" "Folant" "'
foreach variant of local Valentine {
	replace ameriname = "Valentine" if fname == "`variant'"
}

local Valentine `" "Diminutives:" "Tin" "Valent" "Val" "Tino" "Vali" "Tine" "Tinek" "'
foreach diminutive of local Valentine {
	replace ameriname = "Valentine" if fname == "`diminutive'"
}

local Yan `" "Deshaun" "Deshawn" "Keshaun" "Keshawn" "Rashaun" "Rashawn" "Gjon" "Yahya" "Yuhanna" "Hovhannes" "Ohannes" "Ganix" "Ion" "Jon" "Ivan" "Yan" "Ioannes" "Yehochanan" "Yochanan" "Iohannes" "Jehohanan" "Johanan" "John" "Yann" "Ioan" "Yoan" "Jan" "Joan" "Jowan" "Ghjuvan" "Jens" "Johan" "Johannes" "Evan" "Ian" "Sean" "Shane" "Shaun" "Shawn" "Shayne" "Johano" "Jaan" "Juhan" "Jóannes" "Jani" "Janne" "Joni" "Jouni" "Juhana" "Juhani" "Jean" "Xoán" "Ioane" "Ivane" "Johann" "Gianni" "Giannis" "Ioannis" "Yanni" "Yannis" "Yianni" "Yiannis" "Keoni" "Iván" "János" "Jóhann" "Jóhannes" "Jón" "Yohanes" "Eoin" "Seán" "Giovanni" "Ivano" "Joannes" "Jānis" "Sjang" "Sjeng" "Jonas" "Jovan" "Ean" "Juan" "Hann" "Jehan" "Jone" "Ioannu" "Iwan" "Janusz" "João" "Ioann" "Juhán" "Iain" "Ján" "Anže" "Janez" "Xuan" "Iefan" "Ieuan" "Ifan" "Siôn" "'
foreach variant of local Yan {
	replace ameriname = "Yan" if fname == "`variant'"
}

local Yan `" "Diminutives:" "Hovik" "Hovo" "Yanick" "Yannic" "Yannick" "Ivo" "Yanko" "Ivica" "Janko" "Vanja" "Honza" "Janek" "Hans" "Jannick" "Jannik" "Hanke" "Hanne" "Hannes" "Jo" "Joop" "Hank" "Jack" "Jackie" "Jake" "Johnie" "Johnnie" "Johnny" "Van" "Joĉjo" "Hannu" "Juha" "Juho" "Jukka" "Jussi" "Jeannot" "Vano" "Jancsi" "Jani" "Janika" "Gian" "Gianni" "Giannino" "Nino" "Vanni" "Hankin" "Jackin" "Jankin" "Zuan" "Joãozinho" "Iancu" "Ionel" "Ionuț" "Nelu" "Vanya" "Jock" "Jockie" "Jocky" "Seoc" "Žan" "Juanito" "Hampus" "Hasse" "Janne" "Ianto" "'
foreach diminutive of local Yan {
	replace ameriname = "Yan" if fname == "`diminutive'"
}

