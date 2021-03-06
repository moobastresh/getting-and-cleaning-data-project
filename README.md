# getting-and-cleaning-data-project
Human Activity Recognition Using Smartphones Data Set
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The tidy data meets the following requirements:

a. Merges the training and the test sets to create one data set.

b. Extracts only the measurements on the mean and standard deviation for each measurement.

c. Uses descriptive activity names to name the activities in the data set.

d. Appropriately labels the data set with descriptive variable names.

e. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To achieve this, I create a file "run_analysis.R". It first load the data from the test and train datasets. 
All the files in the test/train are binded together.
The column names of the X.test/X.train are changed by the "features". 
The binded test and train data are merged together. 
I only extract the features with "mean" or "std" in them, and make a new data table. 
Finally I compute the average of each feature for each subject and each activity label. 
It generates a file "tidy_data.txt" as an output. 

The "CodeBook.md" explains the variables of tidy_data, and how they are generated. 
