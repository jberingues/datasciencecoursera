#-------------------------------Libraries---------------------------
library(tidyverse)
#-----------------------------Read datasets-------------------------
#Read all data sets
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
ColumnNames <- read.table("UCI HAR Dataset/features.txt")
Activities <- read.table("UCI HAR Dataset/activity_labels.txt")
#Join data on one dataset
x_global <- rbind(x_test, x_train)
y_global <- rbind(y_test, y_train)
subject_global <- rbind(subject_test, subject_train)
#Set column names
names(x_global) <- make.unique(as.character(ColumnNames$V2), sep = "_") #Because we have repeated column names
names(subject_global) <- "Subject"
names(y_global) <- "ActivityCode"
names(Activities) <- c("ActivityCode", "Activity")
#Add data extracted to one data set
DataSet <- cbind(x_global, y_global, subject_global)
#Select just desired columns and use activity names
DataSet <- DataSet %>%
    select(grep("std|mean",colnames(DataSet)), ActivityCode, Subject) %>%
    left_join(Activities, by = "ActivityCode")
#Create independent dataset with the average of each variable for each activity and each subject
AverageDataSet <- DataSet %>%
    group_by(Activity, Subject) %>%
    summarise_all(funs(mean))
#Store data on disk
write.table(DataSet, "Std_Mean selected UCI HAR Dataset.txt")
write.table(AverageDataSet, "Std_Mean selected UCI HAR Dataset_avg.txt")
