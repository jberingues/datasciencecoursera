Codebook
================

### Source data

Data has been obtained from:<br/> Human Activity Recognition Using Smartphones Dataset<br/> Version 1.0<br/> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.<br/> Smartlab - Non Linear Complex Systems Laboratory<br/> DITEN - Universit‡ degli Studi di Genova.<br/> Via Opera Pia 11A, I-16145, Genoa, Italy.<br/> <activityrecognition@smartlab.ws><br/> [www.smartlab.ws](www.smartlab.ws)<br/> <br/> Files used:<br/>

-   'features.txt': List of all features.<br/>
-   'activity\_labels.txt': Links the class labels with their activity name.<br/>
-   'train/X\_train.txt': Training set.<br/>
-   'train/y\_train.txt': Training labels.<br/>
-   'test/X\_test.txt': Test set.<br/>
-   'test/y\_test.txt': Test labels.<br/>
-   'train/subject\_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. <br/>
-   'test/subject\_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. <br/> <br/>

### Data transformation

Training and test sets merged to create one data set.<br/> Measurements on the mean and standard deviation for each measurement extracted, rest of measurements discarded.<br/> Descriptive activity names used to name the activities in the data set.<br/> Appropriate labels used on the data set with descriptive variable names.<br/>

### Data set files description

-   'Std\_Mean selected UCI HAR Dataset.txt': Mean and standard deviation on the measurements done <br/>
-   'Std\_Mean selected UCI HAR Dataset\_avg.txt': Mean of each variable for every subject and activity<br/>
-   'run\_analysis.R': R code used to generate data files<br/>

### Data set description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.<br/>

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). <br/>

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). <br/>

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.<br/>

tBodyAcc-XYZ<br/> tGravityAcc-XYZ<br/> tBodyAccJerk-XYZ<br/> tBodyGyro-XYZ<br/> tBodyGyroJerk-XYZ<br/> tBodyAccMag<br/> tGravityAccMag<br/> tBodyAccJerkMag<br/> tBodyGyroMag<br/> tBodyGyroJerkMag<br/> fBodyAcc-XYZ<br/> fBodyAccJerk-XYZ<br/> fBodyGyro-XYZ<br/> fBodyAccMag<br/> fBodyAccJerkMag<br/> fBodyGyroMag<br/> fBodyGyroJerkMag<br/> <br/> The set of variables that were estimated from these signals are: <br/> <br/> mean(): Mean value<br/> std(): Standard deviation<br/>
