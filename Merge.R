# Load the existing data
setwd("~/Dropbox/Zach/MyData/")

load("ethnicity_data_italians_december.Rda")

names(ethnicity_data)
names(data)
head(ethnicity_data)
tail(data)

#data <- ethnicity_data

# Add the new data to the existing data
data <- rbind(data, ethnicity_data)

# Save the cleaned dataframe to a Rda file
save(data, file = "data.Rda")


load("data.Rda")

library(foreign)
write.dta(data, "datas.dta", convert.factors = c("string"))

