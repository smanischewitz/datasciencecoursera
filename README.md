datasciencecoursera
===================
This repo contains 3 files for the final project of the Getting and Cleaning Data course.
1. a CodeBook
2. a data file called HARtidy.txt which is the output of the R script, below.
3. an R script called run_analysis.R that does the following. 
	1.Merges the training and the test sets to create one data set.
	2.Extracts only the measurements on the mean and standard deviation for each measurement. 
	3.Uses descriptive activity names to name the activities in the data set
	4.Appropriately labels the data set with descriptive variable names. 
	5.From the data set in step 4, creates a second, independent tidy data set with the average of 
		each variable for each activity and each subject.
 
How the script works:
1. Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and unzip it into a directory called HAR.
2.  Use read.table() to read labels (there are 6) and features (there are 561)
3.  Use read.table() to read 3 test files and 3 training files for measurements
	a. subject file = a vector of measurement numbers
    b. X file = a data.file of measurements by feature
	c. y file = a vector of subjects for each measurement
4.  Merge the test and traning files with rbind()
5.  Use grep() to obtain a vector of the mean and std features (excluding "meanFreq" )
6.  Use this vector to select() a subset of the 561 features   (number features = 66)
7.  Use this vector to appropriately label the columns -- features[meanStdCols,2]
8   Add a "subject" column with cbind()
9.  Aggregate() the data by subject, applying the "mean" function
10, Write the function to a file (HARtidy.txt) with write.table()
  
One of the most exciting areas in all of data science right now is wearable computing - 
see for example this article . 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms
 to attract new users. 
The data linked to from the course website represent data collected from the accelerometers 
from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 



