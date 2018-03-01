## install / load package

devtools::install_github("reconhub/epitrix")
library(epitrix)


## load data

library(readxl)
linelist <- read_excel("linelist.xlsx", 
                       col_types = 
                         c("text","text", "date", "text", "date", "date", 
                           "text", "text", "text"))


## anonymise first name + last name

hash_names(linelist$first_name, linelist$last_name)


## anonymise first name + last name + age

res <- hash_names(linelist$first_name, 
                  linelist$last_name, 
                  linelist$date_of_birth)


## salting

res <- hash_names(linelist$first_name, 
                  linelist$last_name, 
                  linelist$date_of_birth, 
                  salt = 1:10)


## save labels and create new data.frame

lab <- as.character(res$hash_short)
df <- cbind(labels = lab, linelist[, -c(1,2)])


## save the new data.frame as .csv

write.csv(df, file = "new_dataset.csv")