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


