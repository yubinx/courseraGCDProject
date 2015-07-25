## coursera/getting and cleaning data/course project

# load libraries
library(dplyr)
library(reshape2)

# read the files and store them
subjectTest <- read.table('C:/Users/Administrator/Documents/Coursera/JHUGCD/project/UCI HAR Dataset/test/subject_test.txt')
xTest <- read.table('C:/Users/Administrator/Documents/Coursera/JHUGCD/project/UCI HAR Dataset/test/X_test.txt')
yTest <- read.table('C:/Users/Administrator/Documents/Coursera/JHUGCD/project/UCI HAR Dataset/test/y_test.txt')

subjectTrain <- read.table('C:/Users/Administrator/Documents/Coursera/JHUGCD/project/UCI HAR Dataset/train/subject_train.txt')
xTrain <- read.table('C:/Users/Administrator/Documents/Coursera/JHUGCD/project/UCI HAR Dataset/train/X_train.txt')
yTrain <- read.table('C:/Users/Administrator/Documents/Coursera/JHUGCD/project/UCI HAR Dataset/train/y_train.txt')

# get the index for the variables containing "mean()" or "std()"
pattern <- "mean\\(\\)|std\\(\\)"
varind <- grep(pattern, var$V2)

# create data frames to store test data and train data
# column 1 for subject number; column 2 for type of test (e.g. WALKING);
# rest of the columns for measurements
testdata <- data.frame(subjectTest, yTest, select(xTest, varind))
traindata <- data.frame(subjectTrain, yTrain, select(xTrain, varind))

# merge test data and train data
mgddata <- merge(testdata, traindata, all=T)

## rename the variables
    # read the variable name dictionary
var <- read.table('C:/Users/Administrator/Documents/Coursera/JHUGCD/project/UCI HAR Dataset/features.txt')

    # rename the variables
names(mgddata) <- c("subject", "activity", as.character(var$V2[varind]))

# convert data types of 'subject' and 'activity' to factors
mgddata$subject <- as.factor(mgddata$subject) # convert subject data from integer to factor
mgddata$activity <- as.factor(mgddata$activity) # convert activity type data from integer to factor

## rename the activities
    # read the activity_labels file
actlabel <- read.table('C:/Users/Administrator/Documents/Coursera/JHUGCD/project/UCI HAR Dataset/activity_labels.txt')
    # rename the activities using decriptive names
levels(mgddata$activity) <- list(WALKING="1", WALKING_UPSTAIRS="2", WALKING_DOWNSTAIRS="3", SITTING="4", STANDING="5", LAYING="6")

## creates a second, independent tidy data set with the average of each variable for each activity and each subject.
avgdata <- aggregate(mgddata[, c(3:ncol(mgddata))], by=mgddata[c("subject", "activity")], FUN=mean)

# export the tidy data set
write.table(avgdata, file="C:/Users/Administrator/Documents/Coursera/JHUGCD/project/projectOutput.txt", row.name=F)
