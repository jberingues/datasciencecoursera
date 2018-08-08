Readme.md
================

Getting and Cleaning Data Project
---------------------------------

### Course instructions

Create one R script called run\_analysis.R that does the following:<br/>

1.  Merges the training and the test sets to create one data set.<br/>
2.  Extracts only the measurements on the mean and standard deviation for each measurement.<br/>
3.  Uses descriptive activity names to name the activities in the data set.<br/>
4.  Appropriately labels the data set with descriptive variable names.<br/>
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br/>

### Data source

Description:<br/> <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones><br/>

Original data:<br/> [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)<br/>

### Implementation

**Script:** `run_analysis.R` <br/>

1.  Read all files<br/>
2.  Join data (x, y and subject from test and train)<br/>
3.  Set column names<br/>
4.  Collect all data in one dataset<br/>
5.  Select just desired columns<br/>
6.  Create new dataset with average of selected observations<br/>
7.  Save files<br/>

### Operation

1.  Download run\_analysis.R script on the working directory<br/>
2.  Download the dataset on the working directory. Data on a directory called "UCI HAR Dataset"<br/>
3.  Run the script<br/>
