#Course project for [Getting and Cleaning Data](https://www.coursera.org/course/getdata). 

Contains small analysis of "Human Activity Recognition Using Smartphones" dataset ([link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip))

Task literally said:
```
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
```

To reproduce this analysis you will have to:

1. Download dataset
2. Unpack it to "data" directory
3. Make sure you have R with installed "data.table" and "dplyr" packages
4. Run "run_analysis.R" script. It will produce "data_sum.csv" dataset (task item 5)

Also check code book "codebook.txt".

:smile:
