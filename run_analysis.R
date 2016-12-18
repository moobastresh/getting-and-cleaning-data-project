if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

library(data.table)
library(reshape2)

setwd("/Users/yz/Desktop/data science John Hopkins/getting and cleaning data/UCI HAR Dataset")

# load X_test, y_test, X_train, y_train, subject_test, subject_train data
X_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
X_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
subject_test<-read.table("test/subject_test.txt")
subject_train<-read.table("train/subject_train.txt")

# load feature file that contains all the 561 features
features<-read.table("features.txt")[,2]

# load the 6 activity labels
activity_labels<-read.table("activity_labels.txt")[,2]

# put the corresponding activity labels in the second column
y_test[,2] = activity_labels[y_test[,1]]
y_train[,2] = activity_labels[y_train[,1]]

# rename the column names
names(X_test)=features
names(X_train)=features
names(y_test) = c("Activity_ID", "Activity_Label")
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_test)="subject"
names(subject_train)="subject"

# bind the subject, y and X data into one
test_data<-cbind(subject_test,y_test,X_test)
train_data<-cbind(subject_train,y_train,X_train)

# merge the test and train data into one
total_data<-rbind(test_data,train_data)

# extract only the features that contain "mean" or "std"
mean_std<-grep("mean|std",colnames(total_data))

# bind the subject, Activity_ID, Activity_Label and the features that contain "mean" or "std" together
data<-total_data[,c(1,2,3,mean_std)]

first_labels<-c("subject","Activity_ID","Activity_Label")

# reshape the data frame
data1<-melt(data, id = first_labels, measure.vars = colnames(total_data)[mean_std])

# compute the average of each variable for each subject and each activity
tidy_data<-dcast(data1, subject+Activity_Label~variable, mean)

# write the file
write.table(tidy_data, file="/Users/yz/Desktop/data science John Hopkins/getting and cleaning data/human_activity_recognition/tidy_data.txt")
