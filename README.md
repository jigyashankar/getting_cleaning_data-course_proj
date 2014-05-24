# run_analysis.R

The script uses UCIHAR data available from the current working directory to generate clean and tidy intermediate dataset - tidy1.csv and final clean dataset - tidy2.csv

### Assumptions
* The data for test and train is contained in the current working directory. The script does not set directory.
* This script does not download the files or extract it. It assumes the files are there in the current working directory
* Requires Reshape package for certain functions used for transforming data

### Steps

* Step 1. Merges the training and the test sets to create one data set.

* Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

* Step 3. Uses descriptive activity names to name the activities in the data set

* Step 4. Appropriately labels the data set with descriptive activity names.

* Step 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Comments in the code point to the individual step being handled in that part of the code. 

### To run the script 
1. Download the dataset provided at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Unzip the files

3. setwd() in R to the directory that contains unzipped files from above step

4. source("run_analysis.R")

### Upon running the script

You should see 2 result files saved in current directory - tidy1.csv and tidy2.csv containing intermediate and final dataset respectively.

### Explanation of the code steps

* Creating tidy1.csv

  * Read the activity labels from file (activity.labels)
  
  * Read features from features file(features)
  
  * Find index of those columns dealing with mean or std value(extracted.features)
  
  * Modify the names of the columns for Step 4 in project based on guidelines in video lectures
  
  * Read y_train and y_test data, merge to y.data
  
  * Apply factor labels from activity.labels to y.data
  
  * Read subject data from both train and test folder, merge (subject.data)
  
  * Read X_train and X_test using read.table and merge using rbing(x.data)
  
  * Merge y.data and subject.data to x.data
  
  * Provide column names to the resulting x.data
  
  * Save results till this step in tidy1.csv
  
* Creating tidy2.csv

  * Use melt function from reshape2 package to generate a long data set with Subject_ID and Activity as IDs
  
  * Use dcast to then aggregate and apply mean to each group based on Subject_ID and Activity
  
  * Save resulting dataset in tidy2.csv