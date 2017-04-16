library(dplyr)
filename <- "dataset.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
}

## Read labels/features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityId", "activityName"))
allFeatures <- read.table("UCI HAR Dataset/features.txt", col.names = c("Id", "Feature"))
desiredFeatures <- grep("std|mean", allFeatures$Feature)
featureNames <- allFeatures$Feature[desiredFeatures]

##Read test data
testData <- read.table("UCI HAR Dataset/test/X_test.txt")[desiredFeatures]
colnames(testData) <- featureNames
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("activityId"))
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject"))
testCombined <- cbind(testSubjects, testActivity, testData)

##Read train data
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")[desiredFeatures]
colnames(trainData) <- featureNames
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("activityId"))
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject"))
trainCombined <- cbind(trainSubjects, trainActivity, trainData)

#Combine them and merge the activity names in
allCombined <- rbind(testCombined, trainCombined)
allCombined <- merge(allCombined, activityLabels, by="activityId")

#Change activityId with the name of the activity
allCombined$activityId <- allCombined$activityName
allCombined <- select(allCombined, -activityName)
colnames(allCombined)[1] <- "activityName"

#Get mean of all values by subject and activity
avgByActivityAndSubject <- aggregate(. ~ Subject + activityName, allCombined, mean)
avgByActivityAndSubject <- avgByActivityAndSubject[order(avgByActivityAndSubject$activityName, avgByActivityAndSubject$Subject),]

#Write it
write.table(avgByActivityAndSubject, "averages.txt", row.name=FALSE)
