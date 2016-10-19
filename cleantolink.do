/* This file cleans the brothers file for linking to the 1920, 1930 and 1940 
United States Census IPUMS. 

The goals are to 

1) Pre-process first names
2) Standardize first names according to NYSIIS
3) Generate year of birth codes
4) Generate race codes

*/ 

clear all

//set more off, permanently
set more off

//use "/hdir/0/monicah/Desktop/EIbrothers18921924.dta"
//cd "/hdir/0/monicah/Desktop/All"

/*
use "/Users/rohanalexander/Desktop/EIbrothers18921924.dta"
cd "/Users/rohanalexander/Desktop"
*/

cd "C:\Users\u1001662\Google Drive\EI18921924\Stata_files\brothers"


*do "C:\Users\u1001662\Google Drive\EI18921924\dofiles\cleanoriginOCT102016.do"

use "EIbrothersbpl.dta"

rename fname fnameorig

/*Standardize names*/

gen fname=word(fname, 1)
drop if strpos(fname,"...")!=0
replace fname=subinstr(fname,".","",.)
replace fname=subinstr(fname,"?","",.)
gen finitial=substr(fname, 1,1)
drop if fname==""


* do cleannameOCT112016.do


/*The following would be done for the standardize names*/
preserve
	collapse (first) IDnum, by(fname)
	nysiis ameriname, gen(amerinameny)
	save fnameship.dta, replace
restore

preserve
	collapse (first) IDnum, by(lname)
	nysiis lname, gen(lnameny)
	save lnameship.dta, replace
restore

drop _merge
merge m:1 fname using fnameship.dta

drop _merge
merge m:1 lname using lnameship.dta

erase fnameship.dta
erase lnameship.dta


destring dateArrivedYear, gen(yrimmig)
destring age, gen(agearr) force

gen yob=yrimmig-agearr

drop if bpl==. | mtonugue==.

/*Drop any observations whose brother is now missing*/

gen ind=1
gen IDfloor=round(IDnum/100)*100
egen double hhiddup=group(lname port ship IDfloor dateArrivedYear)
	

egen hhidtotaldup=total(ind), by(hhiddup)

drop if hhidtotaldup==1 

keep hhiddup fname lname ameriname amerinameny lnameny fnameorig yrimmig agearr yob mtongue bpl finitial
rename hhiddup hhid
compress

save "EIbrothersclean.dta", replace
