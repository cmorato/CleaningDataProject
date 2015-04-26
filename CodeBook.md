Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, data, and procedures for run_analysis.R.  
* A full description of where and how the data was obtained: : 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
Source of the original data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:   
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "./UCI_HAR_Dataset/train" folder and temporary store them in *trainData*, *trainLabel* and *trainSubject* variables respectively.       
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "./UCI_HAR_Dataset/test" folder and temporary store them in *testData*, *testLabel* and *testsubject* variables respectively.  
 3. Merge *testData* and *trainData* to generate a 10299x561 data frame, *X_Total*; following the same approach, merge *testLabel* and *trainLabel* to generate a 10299x1 data frame, *Y_Total*; and finally, merge *testSubject* and *trainSubject* to generate a 10299x1 data frame, *S_Total*.  
 4. Read the features.txt file from the "./UCI_HAR_Dataset" folder and store the data in a variable called *features*. We only extract the valid measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of *X_Total* with the 66 corresponding columns.    
 5. Read the activity_labels.txt file from the "./UCI_HAR_Dataset"" folder and store the data in a variable called *activity*.  
 6. Transform the values of *Y_Total* according to the *activity* data frame.  
 7. Combine the *S_Total*, *Y_Total* and *X_Total* by column to get a new cleaned 10299x68 data frame, *cleanedData*. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.  
 8. Save the *cleanedData* out to "merged_data.txt" file in current working directory.  
 9. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination.
 10. Save the *result* in "data_with_means.txt" file in the current working directory. 
 
