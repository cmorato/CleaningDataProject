Getting and Cleaning Data 
=================================================

##Course Project CodeBook
=================================================
This file describes the variables, data, and procedures for run_analysis.R.  
* A full description of where and how the data was obtained: : 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
Source of the original data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 - Read x_train.txt, y_train.txt and subject_train.txt from the "./UCI_HAR_Dataset/train" folder and temporary store them in *trainData*, *trainLabel* and *trainSubject* variables respectively.       
 - Read x_test.txt, y_test.txt and subject_test.txt from the "./UCI_HAR_Dataset/test" folder and temporary store them in *testData*, *testLabel* and *testsubject* variables respectively.  
 - Merge *testData* and *trainData* to generate a 10299x561 data frame, *X_Total*; following the same approach, merge *testLabel* and *trainLabel* to generate a 10299x1 data frame, *Y_Total*; and finally, merge *testSubject* and *trainSubject* to generate a 10299x1 data frame, *S_Total*.  
 - Read the features.txt file from the "./UCI_HAR_Dataset" folder and store the data in the variable *features*. Extract the valid measurements on the mean and standard deviation. This results of this process is a 66 indices list. We get a subset of *X_Total* with the 66 corresponding columns.    
 - Read the activity_labels.txt file from the "./UCI_HAR_Dataset"" folder and store the data in  *activity*.  
 - Modify the values of *Y_Total* according to the *activity* data frame.  
 - Combine the *S_Total*, *Y_Total* and *X_Total* by column in order to get a new cleaned 10299x68 data frame, *cleanedData*.   
 - Save the variable *cleanedData* into the file "merged_data.txt". (First Dataset) 
 - Finally, generate the second tidy dataset with the average of each measurement for each activity and each subject. 30 unique subjects and 6 unique activities, which result in a 180 combinations are represented in this dataset.
 - Save the variable *result* into the file "data_with_means.txt". 
 
