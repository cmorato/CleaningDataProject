Getting and Cleaning Data 
========================================
This is a repository for the code written for the Getting and Cleaning Data Course Project.
##Course Project
========================================
All project-related materials and the UCI HAR Dataset are included in this repository.
* First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "UCI_HAR_Dataset".
  - Copy UCI_HAR_Dataset folder into R/Getting and Cleaning Data/Project/
* Make sure the folder "UCI_HAR_Dataset" and the run_analysis.R script are both in the current working directory.
  - setwd("R/Getting and Cleaning Data/Project/")
  - Put run_analysis.R into R/Getting and Cleaning Data/Project/
* Second, use source("run_analysis.R") command in RStudio. 
* Third, two output files are generated in the current working directory:
  - merged_data.txt: it contains a data frame called cleanedData with 10299*68 dimension.
  - data_with_means.txt: it contains a data frame called result with 180*68 dimension.
* Finally, use data <- read.table("data_with_means.txt") command in RStudio to read the file. It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 * 6 = 180 rows.
