## Getting and Cleaning Data

## Course Project

## Download files and save to data folder

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists("data")) {
    dir.create("data")
}

download.file(fileUrl, destfile = "./data/Dataset.zip")

unzip(zipfile = "./data/Dataset.zip", exdir = "./data")

## Merge the training and test sets to create one data set.

# Read Activity Files

ActivityTest <- read.table("./test/y_test.txt", header = FALSE)
ActivityTrain <- read.table("./train/y_train.txt", header = FALSE)

# Read Subject Files

SubjectTest <- read.table("./test/subject_test.txt", header = FALSE)
SubjectTrain <- read.table("./train/subject_train.txt", header = FALSE)

# Read Features Files

FeaturesTest <- read.table("./test/X_test.txt", header = FALSE)
FeaturesTrain <- read.table("./train/X_train.txt", header = FALSE)

# Combine data tables by row

subjectDat <- rbind(SubjectTrain, SubjectTest)
activityDat <- rbind(ActivityTrain, ActivityTest)
featuresDat <- rbind(FeaturesTrain, FeaturesTest)

# Assign column names to data tables

names(subjectDat) <- c("subject")
names(activityDat) <- c("activity")

featuresNames <- read.table("features.txt", header = FALSE)
names(featuresDat) <- featuresNames$V2

# Combine columns to create one data frame

datCombine <- cbind(subjectDat, activityDat)
dat <- cbind(featuresDat, datCombine)

## Extract only the measurements on the mean and standard deviation for each measurement

library(dplyr)

# subset features with "mean()" and "std()"

subFeaturesNames <- featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]

# subset dat by subFeaturesNames

selectNames <- c(as.character(subFeaturesNames), "subject", "activity")
dat <- subset(dat,select=selectNames)


## Use descriptive activity names to name the activities in the data set

# Read Activity Labels

ActivityLabels <- read.table("activity_labels.txt", header = FALSE)

# use Activity Labels to replace values in activity column

dat$activity <- factor(dat$activity, labels = ActivityLabels$V2)

## Appropriately label the data set with descriptive variable names

names(dat) <- gsub("^t", "time", names(dat))
names(dat) <- gsub("^f", "frequency", names(dat))
names(dat) <- gsub("Acc", "Accelerometer", names(dat))
names(dat) <- gsub("Gyro", "Gyroscope", names(dat))
names(dat) <- gsub("Mag", "Magnitude", names(dat))
names(dat) <- gsub("BodyBody", "Body", names(dat))
names(dat) <- gsub("mean", "Mean", names(dat))
names(dat) <- gsub("std", "StandardDeviation", names(dat))

## Remove special characters

names(dat) <- gsub("[\\(\\)-]", "", names(dat))

## Create a second, independent tidy data set with the average of each variable for each activity and each subject

new_dat <- aggregate(. ~ subject + activity, dat, mean)
new_dat <- new_dat[order(new_dat$subject, new_dat$activity),]

write.table(new_dat, file = "tidydata.txt", row.names = FALSE)