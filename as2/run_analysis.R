run_analysis <- function(directory = "C:\\Users\\roberto.martin\\Downloads\\rprog_data_ProgAssignment3-data\\cleaning\\UCI_HAR_Dataset") {
  
setwd(directory)

#Create a features vector
feat <- read.table(".\\features.txt")
feat1 <- as.vector(feat[,2])

#Merge training set and data label
dat1 <- read.table(".\\train\\X_train.txt")
subj1 <- read.table(".\\train\\subject_train.txt")
colnames(subj1) <- "Subject"
colnames(dat1) <- feat1
dtrain <- cbind(subj1,dat1)

#Merge test set and data label
dat2 <- read.table(".\\test\\X_test.txt")
subj2 <- read.table(".\\test\\subject_test.txt")
colnames(subj2) <- "Subject"
colnames(dat2) <- feat1
dtest <- cbind(subj2, dat2)

#Merge the training and the test sets
dat2 <- rbind(dtrain, dtest)

#Extracting the mean and standard deviation for each measurement
meandat <- grep("mean", feat1)
stddat  <- grep("std", feat1)
tardat <- sort(c(meandat,stddat))
dat3_tidy <- dat2[,tardat]
head(dat3_tidy)
}
