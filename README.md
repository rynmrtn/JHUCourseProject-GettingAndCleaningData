# Project Description

This repository contains a data processing script and documented methodology for transforming a raw data set with accelerometer measurements, an activity being performed, and the subject (or individual) performing the activity. 

A weak link in the chain of data analysis is the processing of raw data into a data form that is suitable for analysis. We will cover steps 1, 2, and 3 to prepare our data for analysis:

1. Raw Data
2. Processing Script(s)
3. Tidy Data
4. Data Analysis
5. Communication of findings from Analysis

The `run_analysis.R` script takes separate subject, accelerometer measurement, and physical activity files for both test and training sets. These files are then labeled, combined, grouped, and processed to create a tidy data set that is more suitable for analysis. Further details are described in the _Method Description_ below.

For additional details on the variables and analysis, please refer to CodeBook.md

## Method Description

* `MergeAndFilterTestAndTrainingSets()`: For both the test and training sets, this method loads each subject, measurement, and activity data files, adds appropriate labels (column headers) to each variable, reduces the measurements to _all_ mean (including `meanFreq`) and standard deviation measurements, and binds them together. To maintain order, the columns of each set are bound using `cbind` before `rbind` is used to combine the two together. Labels are added before row and column binding to ensure that data is aligned to the appropriate variable. This method returns a properly labeled data frame with column bound subject, measurement, and activity data where the test and training sets are row bound together. We call this `mergedData` going forward.

* `JoinActivityNames(mergedData)`: A fairly simple method that loads the file containing activity labels, sets the column names, and performs a merge (or join). `ActivityId` is used as the join column as it is present in both the activityLabels data frame and the merged data containing the test and training set. This returns the mergedData with an additional column representing the textual representation of the `Activity`. 

* `GroupAndSummarize(mergedDataWithActivityLabels)`: This method uses the `group_by` method from the `dplyr` package to group the merged data by `SubjectId` and `Activity`. The `summarise_each` method is then used to apply the mean function to each each unique group of SubjectId/Activity pairs. This results in a data frame where the mean of each measurement is calculated across 6 activities and 30 subjects across all columns, or 180 observations across all variables.
