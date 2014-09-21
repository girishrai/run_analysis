---
title: "README.rmd"
output: html_document
---
# README #
---
Please use the following instructions to execute the script run_analysis.R for the course project: 
+ The source file run_analysis.R must be in the top level directory in which the Samsung data is stored. So, if the top level directory for the Samsung data is "UCI HAR Dataset", the script run_analysis.R must be stored in the same directory "UCI HAR Dataset". 
+ The working directory must be set to the top level directory in which the Samsung data is stored. So, if the top level directory for the Samsung data is "UCI HAR Dataset", the working directory must be set to the same. 
+ To execute the script from the R console, set your working directory to the top level directory which contains the Samsung data and the script, run the command __source("run_analysis.R")__, followed by the command __run_analysis()__.
+ The script will save the generated tidy text to the output file _result_tidy.txt_ in the same top level directory.
+ The output file can be read into the R console using the command __result <- read.table("result_tidy.txt")__
+ The output text file has observations for each subject, activity combination. There are 88 variables including the subject, activity and all the measurements which contain the substring 'mean' or 'std' in their names. The order of the features is kept the same as in the training and test data files. More information about the observations and the variables is provided in the file __codebook.md__.

The code in the R script does the following:
+ Merges the training and the test sets to create one data set.
+ Extracts only the measurements which contain the substring "mean" or "std" in the measurement name.
+ The activity id is replaced with descriptive activity names.
+ Labels the variables of the resulting data set. 
+ Creates an aggregated tidy data set which contains the average of the measurements extracted in step 2. The measurements are grouped by subject and activity.
+ The activity id is replaced with descriptive activity names in the aggregated data set.
+ Labels the variables of the aggregated data set. The substring "mean_of_" if prepended to the original measurement names.
+ Saves the tidy data set to the file __result_tidy.txt__

