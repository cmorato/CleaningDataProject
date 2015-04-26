
# Getting and Cleaning Data
# Project

# Step 1. 
# Merges the training and the test sets to create one data set.
# setwd("~/Documents/R/Cleaning Data/project/")
trainData <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
testData <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
dim(trainData) # Dim = 7352*561
dim(testData) # Dim 2947*561

X_Total <- rbind(trainData, testData)
dim(X_Total) # Dim 10299*561


trainSubject <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
testSubject <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")

S_Total <- rbind(trainSubject, testSubject)
dim(S_Total) # Dim 10299*1


trainLabel <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
testLabel <- read.table("./UCI_HAR_Dataset/test/y_test.txt")

Y_Total <- rbind(trainLabel, testLabel)
dim(Y_Total) # Dim 10299*1

# Step2. 
# Extracts only the measurements on the mean and standard 
# deviation for each measurement. 

features <- read.table("./UCI_HAR_Dataset/features.txt")
dim(features)  # Dim 561*2

meanStdIndices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
# leng of the subset = 66
length(meanStdInd)
X_Total <- X_Total[, meanStdIndices]
names(X_Total) <- features[meanStdIndices, 2]
names(X_Total) <- gsub("\\(|\\)", "", names(X_Total))
names(X_Total) <- tolower(names(X_Total))

# Step3. 
# Uses descriptive activity names to name the activities
# in the data set

activities <- read.table("./UCI_HAR_Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y_Total[,1] = activities[Y_Total[,1], 2]
names(Y_Total) <- "activity"

# Step4. 
# Appropriately labels the data set with descriptive
# activity names.

names(S_Total) <- "subject"
cleanedData <- cbind(S_Total, Y_Total, X_Total)
dim(cleanedData) # 10299*68
# writing the 1st dataset in HD
write.table(cleanedData, "merged_data.txt")

# Step5. 
# Creates a second, independent tidy data set with the  
# average of each variable for each activity and each subject. 

uniqueSubjects = unique(S_Total)[,1]
numSubjects = length(unique(S_Total)[,1])
numActivities = length(activities[,1])
numCols = dim(cleanedData)[2]
result = cleanedData[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleanedData[cleanedData$subject==s & cleanedData$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
# writing the 2nd dataset in HD
write.table(result, "data_with_means.txt")

# data <- read.table("./data_with_means.txt")