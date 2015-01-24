#Here are the data for the project: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#download this file and unzip it into a directory called HAR
labels <- read.table("./HAR/activity_labels.txt")	#1KB  (6 x 2)features
features <- read.table("./HAR/features.txt")   #561 features  (561 x 2)#featureNames by number
subject_test<- read.table("./HAR/test/subject_test.txt")  #8 KB  (2947 X 1) #measureNumb by subject -table(subject)
X_test <- read.table("./HAR/test/X_test.txt")   #25,839KB   (2947 x 561)-> 2947x66
y_test<- read.table("./HAR/test/y_test.txt")	#6KB      (2947 x  1)
#Training:
subject_train<- read.table("./HAR/train/subject_train.txt")  #8 KB  (7352 X 1)
X_train <- read.table("./HAR/train/X_train.txt")   #64,460KB   (7352 x 561)-> 2947x66
y_train<- read.table("./HAR/train/y_train.txt")  #6KB      (7352 x  1)
subject <- rbind(subject_test, subject_train)  #(10299)  unbind for testing
X <- rbind(X_test,X_train)  #unbind for testing
y <- rbind(y_test,y_train)
#subject <- subject_test  #temporary for testing
#X <- X_test  #temporary - for testing
#y <- y_test  #temporary for testing
meanStdCols = grep("(mean[(]|std)",features[,2] ) #I am excluding "meanFreq()" features
X2= select(X, meanStdCols)  #extracts only meas. on mean and std
colnames(X2) <- features[meanStdCols,2]  #replace column names with meaningful ones
X3 = cbind(subject, X2)
X4<-aggregate(X3, by=list(X3[,1]),  FUN=mean, na.rm=TRUE)
write.table(X4, "./data/HARtidy.txt", row.names = FALSE) 
