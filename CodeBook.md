# Code book for the Coursera Course Project Module 3: *Getting and Cleaning Data*

#### This code book decribes the data and variables used in the `tidydata.txt` file in this repository.

## The Data

#### The `tidydata.txt` file contains space-separated values.

#### The first row are the names of the variables, described in the Variables section below, and the following rows contain the values of the variables.

## Variables

* `subject` : The ID of the test subject. Ranges from 1 to 30.

* `activity` : Type of activity performed when the corresponding measurements were taken. It has 6 values:

	+ `WALKING` : subject was walking
	+ `WALKING_UPSTAIRS` : subject was walking upstairs
	+ `WALKING_DOWNSTAIRS` : subject was walking downstair
	+ `SITTING` : subject was sitting
	+ `STANDING` : subject was standing
	+ `LAYING` : subject was laying


* Measurements : A total of 66 measurements are contained in the data, pertaining to time-domain and frequency-domain signals. Data is described by acceleration measurements (`Accelerometer`), gyroscope measurements (`Gyroscope`), and magnitudes of 3D signals (`Magnitude`), with both mean and standard deviation derived.

## Transformations

#### The original data used for the Project can be found here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### The following transformations were applied to the source data:

1. The training and test sets were merged to create one data set.
2. The measurements on the mean and standard deviation only for each measurement were extracted.
3. Descriptive activity names were applied to the `activity` column in the data set.
4. Descriptive variable names were applied to the rest of the variable names in the data set.
	+ Special characters were removed.
	+ Initial `f` was expanded to `frequency`, `t` to `time`.
	+ `Acc`, `Gyro`, `Mag`, `BodyBody`, `mean`, `std` were corrected and replaced with its corresponding full names `Accelerometer`, `Gyroscope`, `Magnitude`, `Body`, `Mean` and `StandardDeviation`.
5. Using the data set produced in 4, a final data set was created with the average of each variable for each activity and each subject.

#### The transformations listed above were implemented by the `run_analysis.R` R script.

