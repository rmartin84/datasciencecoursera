run_analysis <- function(directory = "C:\\Users\\Downloads\\rprog_data_ProgAssignment3-data\\cleaning\\UCI_HAR_Dataset") {
  
  setwd(directory)

##Read Data 
#Create a features vector
feat <- read.table(".\\features.txt")
features <- as.vector(feat[,2])

#Read activity labels
ActivityLabels = read.table("./activity_labels.txt", stringsAsFactors = F)
head(ActivityLabels)
colnames(ActivityLabels) = c("Label","ActivityName")

#Read training data and create a dataset including subjects and activities information
datTrain <- read.table(".\\train\\X_train.txt")
activitiesTrain <- read.table(".\\train\\Y_train.txt")
subjTrain <- read.table(".\\train\\subject_train.txt")
datasetTrain <- cbind(subjTrain, activitiesTrain, datTrain)

#Read test data and create a dataset including subjects and activities information
datTest <- read.table(".\\test\\X_test.txt")
activitiesTest <- read.table(".\\test\\Y_test.txt")
subjTest <- read.table(".\\test\\subject_test.txt")
datasetTest <- cbind(subjTest, activitiesTest, datTest)

##Point 1: Merges the training and the test sets to create one data set.
Dataset<- rbind(datasetTrain, datasetTest)
  
  #Appropriately labels the data set with descriptive variable names (Point 4)
  colnames(Dataset) <- c("Subject", "Activity", as.character(features))

##Point 2: Extracts only the measurements on the mean and standard deviation for each measurement
  
  #Get the corresponding columns index
  mean_std_columns = grep("(mean|std)[^meanFreq]", colnames(Dataset))

  #Build dataset with corresponding columns, and keeping the subject column.
  Dataset_mean_and_std <- Dataset[,c(1,2,mean_std_columns)]

##Point 3: Uses descriptive activity names to name the activities in the data set
  
for (i in 1:length(Dataset_mean_and_std$Activity)){
  if ((Dataset_mean_and_std[i,2] == 1)==TRUE){
    Dataset_mean_and_std[i,2] <- "WALKING"
  } 
  else if ((Dataset_mean_and_std[i,2] == 2)==TRUE){
    Dataset_mean_and_std[i,2] <- "WALKING_UPSTAIRS"
  }
  else if ((Dataset_mean_and_std[i,2] == 3)==TRUE){
    Dataset_mean_and_std[i,2] <- "WALKING_DOWNSTAIRS"
  }
  else if ((Dataset_mean_and_std[i,2] == 4)==TRUE){
    Dataset_mean_and_std[i,2] <- "SITTING"
  }
  else if ((Dataset_mean_and_std[i,2] == 5)==TRUE){
    Dataset_mean_and_std[i,2] <- "STANDING"
  }
  else if ((Dataset_mean_and_std[i,2] == 6)==TRUE){
    Dataset_mean_and_std[i,2] <- "LAYING"
  }
}

##Point 5: creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(data.table)
Dataset_mean_and_std_dt = data.table(Dataset_mean_and_std)
setkey(Dataset_mean_and_std_dt,Activity, Subject)
Tidy_data_set = Dataset_mean_and_std_dt[,lapply(.SD,mean), by = .(Activity,Subject)]
write.table(Tidy_data_set, "Tidy_data_set.txt", row.name = F)
}
