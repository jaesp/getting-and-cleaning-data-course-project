# Coursera Course Project Module 3: *Getting and Cleaning Data*

### This repository contains the following files:

* `README.md`, provides an overview of the data set and how it was created.
* `CodeBook.md`, the code book, describes the contents of the data set.
* `run_analysis.R`, the R script used to create the data set.
* `tidy_data.txt`, the data set created.

### The R script `run_analysis.R` was used to create the data set. It downloads the source data set and transforms it to produce a tidy data set by implementing the following steps:

* Download and unzip the source data if it doesn't exist.
* Reads the data.
* Merge training and test data sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* Writes the data set to the `tidydata.txt` file.