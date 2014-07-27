README for Getting and Cleaning Data Course Project
========================================================
This project demonstrates my ability to collect, work with, and clean a data set. We prepare a tidy dataset that can be used for later analysis. 

We start with data collected from the accelerometers in Samsung Galaxy S smartphones. This data is located at...
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script run_analysis.R shows all the steps we took to develop the tidy data set called tidydataset.txt. 

We first merge the training and the test sets to create one data set. We read in a training and test set for x, y, and subject. 

We then use rbind on the x training and test sets to create a "merged" dataframe. We add feature names to the merged dataset by using the names found in features.txt. 

We then use rbind on the y training and test sets to create a y merged dataframe. We add activity labels to the y merged dataset by using the descriptive activity names in activity_labels.txt. 

We then cbind the x merged and y merged datsets to create merged1.

We rbind the subject test and training data and add a subject column to the merged1 dataset to create merged2. 

We keep only the measurements on the mean and standard deviation for each measurement. 

We then export a tidy dataset to a text file using write.table().

See CodeBook.md for details on the variables.
