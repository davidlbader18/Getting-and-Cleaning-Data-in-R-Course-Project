## setwd("~/R/Cleaning Data Course Project")
library(utils)
library(dplyr)

## combines entries in corresponding rows to create new rows
join_tabs <- function(file1,file2,folder="~/R/Cleaning Data Course Project/UCI HAR Dataset") {
  
  file1 <- file.path(folder,file1)
  file2 <- file.path(folder,file2)
  
  tab1 <- read.table(file1)
  tab2 <- read.table(file2)
  
  rbind(tab1,tab2)
}

gen_cols <- function(folder="~/R/Cleaning Data Course Project/UCI HAR Dataset",file="features.txt") {
  
  file <- file.path(folder,file)
  
  features <- read.table(file)
  
  ## retrieves column numbers
  col_nums <- grep("mean|std",features[,2])
  ## retrieves corresponding names
  col_names <- grep("mean|std",features[,2],value=TRUE)
  
  ## cleans up names by removing non-alphabetic characters
  col_names <- gsub("[^a-zA-Z]","",col_names)
  
  ## creates list that matches column indices with corresponding names
  list("col_numbers"=col_nums,"col_names"=col_names)
  
}
