# About R script
The script performs 5 steps as follows to clean the data about recognizing human activity using smartphones.
1) Merges training and test data set together
2) Extracts the measurements on the mean and standard deviation for each measurement
3) Uses descriptive activity names to name the activities in the data set
4) Labels the data set with descriptive variable names
5) Create a second independent tidy data set with average of each variable for each activity and each subject

# Variables used
activityLabels -- Used to hold the mapping of activityIds to activityNames
allFeatures -- Holds a mapping of Id to Feature
desiredFeatures -- Holds only the position of features relating to standard deviation or mean
featureNames -- Holds the name of the features relating to standard deviation or mean

testData -- Data read from X_test.txt. Holds all the desired features
testActivity -- Data read from y_test.txt. Holds the activityIds
testSubjects -- Data read from subject_test.txt. Holds the subjectId
testCombined -- Column combined output of all three above values.

trainData, trainActivity, trainSubjects, trainCombined do the same as above, but for the train dataset.

allCombined -- Holds the combination or all test and train datasets. We clean the output to remove activityId to replace it with the activityName.

avgByActivityAndSubject -- Holds the mean of all features grouped by subject and activity.
