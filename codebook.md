---
title: "codebook.md"
output: html_document
---
# CODEBOOK #
---
The tidy data set generated by the script __run_analysis()__ contains 88 variables. It has 180 observations, one for every combination of subject and activity.

The first variable in the tidy data set is the "Subject". Its value is the subject id. The second variable is the "Activity". Its value is one of the descriptive activity labels. The remaining variables are the averages of the original measurents that have the string "mean" or "std" in their measurement names. The averages were computed by aggregating over the subject and activity. The names of the averaged variables in the tidy data set are created by prepending the substring "mean\_of\_" to the original measurement name. The units of each of these averaged variables are the same as the units of the original measurements from which the averages were computed.