#NOTE: before running script:
#setwd() to the dir where the directories containing train and test data, and files for subject and features are present
# This script does not download the files or extract it. It assumes the files are there in the current working directory
#Look for Step 1, Step 2, Step 3, Step 4, Step 5 to see code that handles each step of the project 
# Required for melt and dcast functions
library(reshape2)

#File name constants
activity.file<-"activity_labels.txt"
features.file<-"features.txt"
tidy.data1.file<-"tidy1.csv"
tidy.data2.file<-"tidy2.csv"



#Function creates the first stage of cleaned data.
#Handles combining the test and train data and 
#Extracting relevant column values, renaming and cleaning the data set
mergeCleanTestTrainData<-function(){

		#Read the activity labels from file
		activity.labels<-read.table(activity.file, header=FALSE)
		activity.labels<-activity.labels[,2]
		#features for train and test data
		features<-read.table(features.file, as.is=TRUE, header=FALSE)
		#find index of those columns dealing with some mean value
		mean.group<-features[grepl(".*mean.*",features[,2],perl=TRUE, ignore.case=TRUE),]
		
		#Step 4 of project. Appropriately name the columns. Based on lectures
		mean.group[,2]<-gsub("()", "", mean.group[,2], fixed=TRUE)
		mean.group[,2]<-gsub("[(,-]", ".", mean.group[,2])
		mean.group[,2]<-gsub(")", "", mean.group[,2], fixed=TRUE)
		mean.group[,2]<-tolower(mean.group[,2])
		#find index of those columns dealing with some std deviation value
		std.group<-features[grepl(".*std.*",features[,2],perl=TRUE, ignore.case=TRUE),]
		std.group[,2]<-gsub("()", "", std.group[,2], fixed=TRUE)
		std.group[,2]<-gsub("[(,-]", ".", std.group[,2])
		std.group[,2]<-gsub(")", "", std.group[,2], fixed=TRUE)
		std.group[,2]<-tolower(std.group[,2])
		#Construct the column index vector containing columns for mean and std values to extract from 
		#data set
		extracted.features<-merge(mean.group, std.group, all=TRUE)
		
		#Prepare y data for both train and test sets and merge
		#Step 1 of the project
		y.train<-read.table("./train/y_train.txt", header=FALSE)
		y.test<-read.table("./test/y_test.txt", header=FALSE)
		#Merge train and test y values
		y.data<-rbind(y.train, y.test)
		
		#Step 3 of project. Use descriptive names for activity ids.
		y.data.clean<-factor(y.data[,1], labels=activity.labels)	
		
		# read in subject vector
		subject.train<-read.table("./train/subject_train.txt", header=FALSE, as.is=TRUE)
		subject.test<-read.table("./test/subject_test.txt", header=FALSE, as.is=TRUE)
		subject.data<-rbind(subject.train, subject.test)
		subject.data<-as.integer(subject.data[,1])
		
		x.train<-read.table("./train/X_train.txt", header=FALSE)
		x.test<-read.table("./test/X_test.txt", header=FALSE)
		x.data<-rbind(x.train, x.test)
		
		#Step 2 of project. Eliminate all those columns that are not relevant
		x.data<-x.data[, extracted.features[,1]]
		#give meaningful names to columns
		colnames(x.data)<-extracted.features[,2]
		x.data<-cbind(y.data.clean, x.data)
		colnames(x.data)[1]<-"Activity"
		x.data<-cbind(subject.data, x.data)
		colnames(x.data)[1]<-"Subject_ID"
		
		#save results of first stage of data set in file
		write.table(x.data, tidy.data1.file,row.names=FALSE, quote=FALSE)
		x.data
	}
	
	# Runs the analysis on raw data set to create a clean and tidy dataset 
	#with results.csv containing the clean dataset with mean measurements
	#for all features for each subject, activity.
	#Assumption : setwd() to base directory containing files for test and train data analysis
	run.analysis<-function(){
		x.full.ds<-mergeCleanTestTrainData()
		#Step 5 of project - Create final analysis of data by generating means measurements for 
		# subject and activity
		melted.ds<-melt(x.full.ds, id=c("Subject_ID", "Activity"))
		tidy.ds<-dcast(melted.ds, Subject_ID + Activity ~ variable, fun.aggregate=mean)
		
		#Save the final cleaned data in file for upload
		write.table(tidy.ds, tidy.data2.file, row.names=FALSE, quote=FALSE)
	}

	run.analysis()