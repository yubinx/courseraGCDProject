# README

Four files are included in the repo for fulfillment of the course project of Coursera/Getting and Cleaning Data. They are run_analysis.R, CodeBook.md, README.md and projectOutput.txt (tidy dataset).

In this course project, data collected from the Samsung Galaxy S smartphone were cleaned following the four steps outlined as follows.

 * Merges the training and the test sets to create one data set.
 * Extracts only the measurements on the mean and standard deviation for each measurement. 
 * Uses descriptive activity names to name the activities in the data set.
 * Appropriately labels the data set with descriptive variable names.
 * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A description of the wearable computing project can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the raw data can be accessed [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Some notes of the run_analysis.R:
* When running the script, the working directory needs to be customized/checked to make sure that the raw data files are located at the specified working directory.
* When selecting all the mean and standard deviation measurements, keyword "mean()" and "std()" were used. This might vary depending on your understanding of project requirements. I ended up having 68 columns/variables (one subject number, one activity type and 66 meansurements) in the tidy dataset by specifying the search pattern as ```pattern <- "mean\\(\\)|std\\(\\)"```.