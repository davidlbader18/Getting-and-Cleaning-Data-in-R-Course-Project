setwd("~/R/Cleaning Data Course Project")
source("run_analysis_functs.R")
library(utils)
library(dplyr)

## joins the corresponding data, label, and subject tables for the train and
## test data sets
tot_data <- join_tabs("train/X_train.txt","test/X_test.txt")
tot_label <- join_tabs("train/y_train.txt","test/y_test.txt")
tot_subject <- join_tabs("train/subject_train.txt","test/subject_test.txt")

## obtains activity text labels
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## obtains the list of numerical indices and column names for all columns
## containing "mean" or "std" in their descriptions
cols <- gen_cols()

## selects only the columns we wish to keep by using the numeric indices
## we retrieved from the features file
tot_data <- select(tot_data,cols[[1]])

## match returns a integor vector consisting of all the 
## generates a factor consisting of all the corresponding names
## given by act_labels for each integer value originally in tot_label
tot_label <- act_labels[match(tot_label[,1],act_labels[,1]),2]

## adds the activity labels and subject number columns to the
## table of mean and std dev observations
tot_set <- cbind(tot_data,tot_label,tot_subject)

## renames the column names to reflect the data contained
names(tot_set) <- c(cols[[2]],"activitylabel","subject")

## groups the data by activity name and subject number, then
## averages all the entries per column for each activity-subject pair
averages <- 
  tot_set %>% 
  group_by(activitylabel,subject) %>%
  summarize_all(mean)
