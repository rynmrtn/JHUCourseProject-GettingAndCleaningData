# This script should: 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

# Data Cleaning functions that need to be executed. Implementations below.
mergedData <- MergeAndFilterTestAndTrainingSets()
mergedDataWithActivityLabels <- JoinActivityNames(mergedData)
GroupAndSummarize(mergedDataWithActivityLabels)

MergeAndFilterTestAndTrainingSets <- function() {
    # Setup some information that will be re-used by both training and test data sets during the merge
    measurementColNames <- MeasurementColumnNames()
    meanAndStdColumnIndices <- MeanAndStdColumnsIndices(measurementColNames)
    subjectColumnName <- c("SubjectId")
    activityColumnName <- c("ActivityId")
    
    #
    # Bootstrap all of the test data in preparation for merge
    #
    
    subjectTestData <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
    colnames(subjectTestData) <- subjectColumnName
    
    # TODO: Possible to read in only the mean and std columns instead of the whole data set?
    measurementTestData <- read.table("data/UCI HAR Dataset/test/X_test.txt")
    colnames(measurementTestData) <- measurementColNames
    # Subset the test data to only contain mean and std values for accelerometer measurements
    subMeasurementTestData <- measurementTestData[, meanAndStdColumnIndices]
    
    activityTestData <- read.table("data/UCI HAR Dataset/test/y_test.txt")
    colnames(activityTestData) <- activityColumnName
    
    #
    # Bootstrap all of the training data in preparation for merge
    #
    
    subjectTrainingData <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
    colnames(subjectTrainingData) <- subjectColumnName
    
    # TODO: Possible to read in only the mean and std columns instead of the whole data set?
    measurementTrainingData <- read.table("data/UCI HAR Dataset/train/X_train.txt")
    colnames(measurementTrainingData) <- measurementColNames
    
    # Subset the training data to only contain mean and std values for accelerometer measurements
    subMeasurementTrainingData <- measurementTrainingData[, meanAndStdColumnIndices]
    
    activityTrainingData <- read.table("data/UCI HAR Dataset/train/y_train.txt")
    colnames(activityTrainingData) <- activityColumnName
    
    # rbind the cbind'd columns
    rbind(cbind(subjectTestData, subMeasurementTestData, activityTestData), 
        cbind(subjectTrainingData, subMeasurementTrainingData, activityTrainingData))
}


JoinActivityNames <- function(mergedData) {
    activityLabels <- read.table("data/UCI HAR Dataset/activity_labels.txt")
    colnames(activityLabels) <- c("ActivityId", "Activity")
    
    mergedDataWithActivities <- merge(activityLabels, mergedData, all = TRUE)
    
    mergedDataWithActivities
}


GroupAndSummarize <- function(mergedDataWithActivityLabels) {    
    groupedData <- group_by(mergedDataWithActivityLabels, SubjectId, Activity)
    
    groupedData %>% summarise_each(funs(mean))
}


MeasurementColumnNames <- function() {
    measurementColDf <- read.table("data/UCI HAR Dataset/features.txt")
    
    as.vector(measurementColDf[,2])
}

MeanAndStdColumnsIndices <- function(measurementColumnNames) {
    grep("mean|std", measurementColumnNames)
}

