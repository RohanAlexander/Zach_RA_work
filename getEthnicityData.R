########################################
# Purpose: This script gathers data on single, males, aged 0-20 at the time they passed through Ellis Island.
# The data will be used to study European immigration to the US, specifically if there was much of a difference in the experiences of brothers.
# No claim is made to the data - this script just makes it more usable.
# Author: Rohan Alexander
# Email: rohan.alexander@anu.edu.au
########################################

#install.packages("rvest")
#install.packages("magrittr")
#install.packages("mail")

library(rvest)
library(magrittr)
library(mail)

# How many pages does the script need to loop over? Each page delivers 500 results, so just adjust the middle number until it matches the number of results that you have.
pages <- seq(4001, 57056, 500)
#pages <- seq(1, 2, 500)

# Initialize a dataframe that will be filled with the results. You don't need it if you're loading one you've already got.
ethnicity_data <- NULL
#or
#setwd("~/Dropbox/Zach")
#load("ethnicity_data.Rda")

#http://www.jewishgen.org/databases/EIDB/engine/gold.php?uid=14679468953971467946964114&username=&password=&time=1468295441239&referrer=httpwww.jewishgen.orgdatabasesEIDBellisgold.html&mode=running&fail=0&ETHS=439&FLD=name&FLD=age&FLD=town&FLD=sex&FLD=ship&FLD=mdyoa&FLD=marital&FLD=port&FLD=yob&FLD=pid&MONTH=12&SAGE=0&EAGE=20&CGD=M&MRTL=S&pagesize=500&SRT=port&DIRECTION=asc&offset=501&totalNumber=57056

# Loop through the pages of results
for (page in pages) {
  # Create the URL for the current page
  url <- paste0("http://www.jewishgen.org/databases/EIDB/engine/gold.php?uid=14679468953971467946964114&username=&password=&time=1468295441239&referrer=httpwww.jewishgen.orgdatabasesEIDBellisgold.html&mode=running&fail=0&ETHS=439&FLD=name&FLD=age&FLD=town&FLD=sex&FLD=ship&FLD=mdyoa&FLD=marital&FLD=port&FLD=yob&FLD=pid&MONTH=12&SAGE=0&EAGE=20&CGD=M&MRTL=S&pagesize=500&SRT=port&DIRECTION=asc&offset=", page, "&totalNumber=57056")
  
  # Parse the html
  page_table <- url %>% read_html()
  # Look for table tags
  page_data <- page_table %>% html_node("table")
  # Convert list to a dataframe
  page_data <- html_table(page_data, header = TRUE, fill = TRUE)
  # Clean the messy dataframe
  page_data <- page_data[-c(1:20), -c(12:41)]
  # Update the names of the dataframe
  names(page_data) <- c("tableRank", "fullName", "residence", "age", "born", "gender", "maritalStatus", "arrived", "ship", "port", "passengerID")
  # Append the data from this page (500 results) to the existing data
  ethnicity_data <- rbind(ethnicity_data, page_data)
  # Clean up
  rm(page_table, page_data)
  print(paste("Done with offset", page, "at", Sys.time()))
  
  # Be a polite visitor and space out each request by 45 seconds
  if (length(pages) != match(page, pages)) {
    Sys.sleep(45)
  } else {
    print("All done!")
  }
}   

# Send emails
#sendmail("rohan.p.alexander@gmail.com", "R notice", "Calculation finished.\nFetch your data!")

# Save the dataframe as a Rda file
setwd("~/Desktop/Zach")
save(ethnicity_data, file = "ethnicity_data_italians_december.Rda")





#Debris
# http://www.jewishgen.org/databases/EIDB/ellisgold.html?
