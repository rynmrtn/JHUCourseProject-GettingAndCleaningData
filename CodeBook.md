# Code Book

This code book provides a listing of the variables as well as descriptions (as applicable) of the data processing performed by `run_analysis.md`

    SubjectId
        Description: The identifier of an individual who performed the activity measured by an accelerometer. Subjects remain anonymous and are denoted as unique individuals by this identifier. 

        In this study, there are 30 participants. SubjectId will be a numeric value between 1:30.

    ActivityId/Activity
        Description: ActivityId corresponds to the of the activity performed by SubjectId. Activity is the textual representation of the activity.
        ActivityId          Activity
        1                   WALKING
        2                   WALKING_UPSTAIRS
        3                   WALKING_DOWNSTAIRS
        4                   SITTING
        5                   STANDING
        6                   LAYING

    Measurements (multiple columns)
        Description: Measurement columns represent several environmental factors that play into the captured measurement. This raw data is pre-calculated and cannot be broken out into separate columns. Measurements are represented by a segmented string: 

        [t|f][Body|Gravity][Acc|Gyro][Jerk|Mag]-[mean()|meanFreq()|std()]-[X|Y|Z] as detailed:

        1. [t|f]: t represents raw time-based measurements. f represents measurements transformed using the Fast Fourier Transform.
        2. [Body|Gravity]: Body or Gravity acceleration signals
        3. [Acc|Gyro]: Accelerometer measurement of linear acceleration or Gyroscope measurement of angular velocity.
        4. [Jerk?|Mag?]: If present, Jerk represents the rate of change in the acceleration. Mag is the magnitude of the three-dimensional signals as calculated using the Euclidean norm.
        5. [mean()|meanFreq()|std()]: The processed mean, mean frequency, and standard deviation of the measurement. Other manipulations are not in the scope of this study.
        6. [X|Y|Z]: The 3-dimensional axis of the measurement

        For example, tBodyGyroJerk-std()-X is the standard deviation (std) of the rate of change (Jerk) of the angular velocity signal (Gyro) of the body (Body) over time (t) as measured along the X axis.

    





    Continue to work through the variables, including mean, meanFreq, and std measurements.



