This tidy dataset corresponds to the average of each variable for each activity and each subject.

Variables in the dataset:
    Subject: an integer subject ID, from 1 to 30.
    Activity: an string activity name upon 6: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying.
    The rest of variables correspond to the mean of a measurement for each subject and activity.
    
The script run_analysis.R:
  - Reads the previously downloaded UCI_HAR_Dataset data from the working directory
  - Merges the training and the test sets to create one data set
  - Adds columns corresponding to activity and subject information for both datasets
  - Labels the dataset columns with the appropiate variable name
  - Extracts the columns corresponding to measurements on the mean and standard deviation
  - Creates a tidy data set with the average of each variable for each activity and each subject.