run_analysis <- function () {
  ## read the activity labels
  activity_labels <- read.table("activity_labels.txt")
  ## read the feature names
  features <- read.table("features.txt")
  ## read the training data
  subject_train <- read.table("train/subject_train.txt")
  X_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")
  ## read the test data
  subject_test <- read.table("test/subject_test.txt")
  X_test <- read.table("test/X_test.txt")
  y_test <- read.table("test/y_test.txt")
  ## merge the training and test data
  subject_all <- rbind(subject_train, subject_test)
  X_all <- rbind(X_train, X_test)
  y_all <- rbind(y_train, y_test)
  ## set the column names of the merged data
  colnames(subject_all)[1] <- "Subject"
  colnames(y_all)[1] <- "Activity"
  ## the column names of the measurements are taken from the feature names
  for (i in 1:561) {
    colnames(X_all)[i] <- as.character(features[i, 2])
  }
  ## assign descriptive activity labels to the activity ids
  y_named <- data.frame(y_all)
  y_named[ , 1] <- as.character(activity_labels[y_all[ , 1], 2])
  ## create combined data set with subject, descriptive activity labels and the measurements
  combined <- cbind(subject_all, y_named, X_all)
  ## Extract only those features whose names contain the substring "mean" or "std"
  features_mean <- grep("mean", features[ , 2], ignore.case = TRUE)
  features_std <- grep("std", features[ , 2], ignore.case = TRUE)
  ## merge the features and sort them in ascending order so that the original order is maintained
  features_mean_std <- c(features_mean, features_std)
  sorted_features_mean_std <- sort(features_mean_std)
  ## exctract only the columns that have "mean" and "std" in their names
  X_mean_std <- X_all[ , c(sorted_features_mean_std)]
  ## compute average for all the extracted measurements grouped by subject and activity
  aggregated <- aggregate(X_mean_std, by=list(subject_all$Subject, y_all$Activity), FUN=mean, na.rm=TRUE)
  ## assign descriptive activity labels to the activities in the aggregated data set
  aggregated[ , 2] <- as.character(activity_labels[aggregated[ , 2], 2])
  ## assign column names to the columns in the aggregated data set
  colnames(aggregated)[1] <- "Subject"
  colnames(aggregated)[2] <- "Activity"
  ## prepend the substring "mean_of_" to all the averaged measurements in the aggregated data set
  for (i in 3:ncol(aggregated)) {
    colnames(aggregated)[i] <- paste("mean_of_", colnames(aggregated)[i], sep="")
  }
  ## save the tidy data set
  write.table(aggregated, "result_tidy.txt", sep = " ")
}