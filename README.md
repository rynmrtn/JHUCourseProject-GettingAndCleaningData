# Project Description

The provided data set contains files with accelerometer measurements, an activity being performed, and the subject performing the activity. 

A weak link in the chain of data analysis is the processing of raw data into a data form that is suitable for analysis. We will cover steps 1, 2, and 3 to prepare our data for analysis:

1. Raw Data
2. Processing Script(s)
3. Tidy Data
4. Data Analysis
5. Communication of findings from Analysis

The `run_analysis.R` script takes separate subject , accelerometer measurement, and physical activity files for both test and training sets. These files are then labeled, reduced, combined, and grouped to create a tidy data set that is more suitable for analysis.

## Method Description

* `MergeAndFilterTestAndTrainingSets()`: For both the test and training sets, this method loads each subject, measurement, and activity data files, adds appropriate labels (column headers), reduces the measurements to _all_ mean (including `meanFreq`) and standard deviation measurements, and binds them together. To maintain order, the columns of each set are bound using `cbind` before `rbind` is used to combine the two together.
* `JoinActivityNames(mergedData)`: A fairly simple method that loads the file containing activity labels, sets the column names, and performs a merge (join). `ActivityId` is used as the label in both the activityLabels data frame and the merged data from the test and training set.
* `GroupAndSummarize`: This method uses the `group_by` method from the `dplyr` package to group the merged and labeled data by `SubjectId` and `Activity`. The `summarise_each` method is then used to apply the mean function to each each unique group of SubjectId/Activity pairs. This results in 6 activities * 30 subjects across all columns, or 180 observations across all variables (columns)

# Original Assignment Description

## Purpose
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Grading
You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

    1. a tidy data set as described below, 
    2. a link to a Github repository with your script for performing the analysis, and 
    3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Description

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[Human Activity Recognition](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

Here are the data for the project: 

[Project Data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

You should create one R script called run_analysis.R that does the following: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
