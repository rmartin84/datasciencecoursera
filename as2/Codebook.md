This tidy dataset corresponds to the average of each variable for each activity and each subject.
The dimensions of this dataset are 180 rows and 68 columns. 
Variables in the dataset:
  - First column corresponds to Activity. Such activities are: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying.
  - Second column corresponds to Subject: an integer subject ID, from 1 to 30.
  - The rest of columns are variables that correspond to the mean of a measurement for each subject and activity.
    
The script run_analysis.R:
  - Takes a directory path as argument
  - Reads the previously downloaded UCI_HAR_Dataset data from such directory
  - Merges the training and the test sets to create one data set
  - Adds columns corresponding to activity and subject information for both datasets
  - Labels the dataset columns with the appropiates variables names
  - Extracts the columns corresponding to measurements on the mean and standard deviation
  - Creates a tidy data set with the average of each variable for each activity and each subject.
