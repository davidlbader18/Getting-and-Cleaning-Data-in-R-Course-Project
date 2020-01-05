---
title: "README.md"
Output: a data frame named "averages" containing averages arranged by group.
---

# run_analysis.R

The main script that performs the cleaning and tidying of the dataset, as described in the exercise instructions and which are listed below:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# run_analysis_functs.R

This script contains two functions used as helpers for the main script. Both involve reading data from files and preparing it in some fashion for use in the main script.

* join_tabs
  + Takes the name of two files that contain similar variables and returns the row-combined dataset.
* gen_cols
  + extracts the numerical indices and column names from the file 'features.txt' for all columns with either "mean" or "std" in their names, cleans up the names and returns the filtered indices and cleaned-up names in a list.