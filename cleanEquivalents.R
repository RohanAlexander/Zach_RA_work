#install.packages("magrittr")
library(magrittr)

# Set working directory
setwd("~/Dropbox/PhD/Zach/Test/temp")

# Get a list of the files that have the variants for each name
files <- list.files(path = "~/Dropbox/PhD/Zach/Test/temp", pattern = "*.Rda", full.names = T, recursive = FALSE)

# Initialize a vector for storing the results
theNames <- NA

# Loop through each of the data files. For each file load it, grab the parts that relevant, then add it to the storage vector
for (file in files) {
  
  load(file)
  
  # First check that there is equivalents data (the page returns data even when the name doesn't have equivalents)
  if (!is.na(match("EQUIVALENTS", page_text))) {
    # Get the position of the start and end of the equivalent names
    start <- match("EQUIVALENTS", page_text) + 1
    stop <- min(match("DIMINUTIVES AND SHORT FORMS", page_text), match("FEMININE FORMS", page_text), match("OTHER FORMS", page_text), length(page_text), na.rm = TRUE) - 1
    # These are the names that are considered equivalent to that of the name in the file name
    equivalents <- page_text[start : stop] %>%
      unique()
    theNames <- c(theNames, file, "Equivalents:", equivalents)
  } else {
    theNames <- c(theNames, file, "No equivalents")
  }
  
  if (!is.na(match("DIMINUTIVES AND SHORT FORMS", page_text))) {
    start <- match("DIMINUTIVES AND SHORT FORMS", page_text) + 1
    stop <- min(match("FEMININE FORMS", page_text), match("OTHER FORMS", page_text), length(page_text), na.rm = TRUE) - 1
    
    # These are the names that are considered diminutives of the name in the file name
    diminutives <- page_text[start : stop] %>%
      unique()
    theNames <- c(theNames, file, "Diminutives:", diminutives)
  } else {
    theNames <- c(theNames, file, "No diminutives")
  }
}

# Write the output to a text file
fileConn <- file("output.txt")
writeLines(theNames, fileConn)
close(fileConn)
