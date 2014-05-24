# CODEBOOK
## Data Set Information
The original dataset obtained from UCI contains experiments carried out on 30 volunteers while performing activities - Walking, Running, Walking_Upstairs and others described in Activity attributes below. Using the accelerometer and gyroscope, values for 3-axial linear acceleration, 3-axial angular velocity has been recorded. 

From this original dataset, we have extracted only relevant measurements that provide mean and standard deviations. In total, we have **88 columns**
for combination of activity and subject parameters.


### Column Names in the order in which they appear in the tidy1.csv rows
* Subject_ID: The ID of the volunteer 
* Activity: Descriptive name of the activity. Factor labels = ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING") values = (1, 2, 3, 4, 5, 6)
* tbodyacc.mean.x
* tbodyacc.mean.y
* tbodyacc.mean.z
* tbodyacc.std.x
* tbodyacc.std.y
* tbodyacc.std.z
* tgravityacc.mean.x
* tgravityacc.mean.y
* tgravityacc.mean.z
* tgravityacc.std.x
* tgravityacc.std.y
* tgravityacc.std.z
* tbodyaccjerk.mean.x
* tbodyaccjerk.mean.y
* tbodyaccjerk.mean.z
* tbodyaccjerk.std.x
* tbodyaccjerk.std.y
* tbodyaccjerk.std.z
* tbodygyro.mean.x
* tbodygyro.mean.y
* tbodygyro.mean.z
* tbodygyro.std.x
* tbodygyro.std.y
* tbodygyro.std.z
* tbodygyrojerk.mean.x
* tbodygyrojerk.mean.y
* tbodygyrojerk.mean.z
* tbodygyrojerk.std.x
* tbodygyrojerk.std.y
* tbodygyrojerk.std.z
* tbodyaccmag.mean
* tbodyaccmag.std
* tgravityaccmag.mean
* tgravityaccmag.std
* tbodyaccjerkmag.mean
* tbodyaccjerkmag.std
* tbodygyromag.mean
* tbodygyromag.std
* tbodygyrojerkmag.mean
* tbodygyrojerkmag.std
* fbodyacc.mean.x
* fbodyacc.mean.y
* fbodyacc.mean.z
* fbodyacc.std.x
* fbodyacc.std.y
* fbodyacc.std.z
* fbodyacc.meanfreq.x
* fbodyacc.meanfreq.y
* fbodyacc.meanfreq.z
* fbodyaccjerk.mean.x
* fbodyaccjerk.mean.y
* fbodyaccjerk.mean.z
* fbodyaccjerk.std.x
* fbodyaccjerk.std.y
* fbodyaccjerk.std.z
* fbodyaccjerk.meanfreq.x
* fbodyaccjerk.meanfreq.y
* fbodyaccjerk.meanfreq.z
* fbodygyro.mean.x
* fbodygyro.mean.y
* fbodygyro.mean.z
* fbodygyro.std.x
* fbodygyro.std.y
* fbodygyro.std.z
* fbodygyro.meanfreq.x
* fbodygyro.meanfreq.y
* fbodygyro.meanfreq.z
* fbodyaccmag.mean
* fbodyaccmag.std
* fbodyaccmag.meanfreq
* fbodybodyaccjerkmag.mean
* fbodybodyaccjerkmag.std
* fbodybodyaccjerkmag.meanfreq
* fbodybodygyromag.mean
* fbodybodygyromag.std
* fbodybodygyromag.meanfreq
* fbodybodygyrojerkmag.mean
* fbodybodygyrojerkmag.std
* fbodybodygyrojerkmag.meanfreq
* angle.tbodyaccmean.gravity
* angle.tbodyaccjerkmean.gravitymean
* angle.tbodygyromean.gravitymean
* angle.tbodygyrojerkmean.gravitymean
* angle.x.gravitymean
* angle.y.gravitymean
* angle.z.gravitymean

The above columns contain values obtained from the gyroscope and accelerometer. The *feature_info.txt* gives a description of how each column is computed.

## Steps performed in transforming raw data to clean dataset (tidy1.csv,tidy2.csv)
* The raw data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* The folder was unzipped. It contained the following files and directories:
  * Activity_labels.txt: Labels and corresponding activity code. 6 values in total.
  * Features.txt: List of features in the raw dataset. Total of 561 features
  * Feature_info.txt: Describes how the above feature values have been computed
  * test, train: directories containing data partitioned as test and train data.     
    It includes the   following files:
    * Inertial Signals: not used in this project
    * subject_test.txt & subject_train.txt: List of subjects for which the corresponding feature values were recorded (for each row in X_test.txt & X_train.txt respectively)
    * Y_test.txt & Y_train.txt: IDs of activity for which the corresponding feature values were recorded (for each row in X_test.txt & X_train.txt respectively)
    * X_test.txt & X_train.txt: Actual observations recording double format values for each of the 561 features
    
### tidy1.csv
Contains the merged and filtered datasets from train and test directories.

*1.Merged X_test, X_train, y_test, y_train, subject_test, subject_Train into one dataset*

*2.Eliminate those columns that don't contain values for mean or standard deviations*

*3.Provided meaningful column names to the individual columns*

*4.Save to tidy1.csv*

### tidy2.csv
Contains the final dataset that has been cleaned and filtered in run_analysis.R

*1.Use tidy1.csv obtained from above and find means for each activity and subject using functions from the Reshape2 package*

*2.Save to tidy2.csv*
