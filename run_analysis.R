# The code should have a file run_analysis.R in the main directory that can be run
# as long as the Samsung data is in your working directory.


#You should create one R script called run_analysis.R that does the following. 

#Step 1: Merges the training and the test sets to create one data set.
#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
#Step 3: Uses descriptive activity names to name the activities in the data set
#Step 4: Appropriately labels the data set with descriptive variable names. 
#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.





getresult <- function(){

#Step 1: Merges the training and the test sets to create one data set.

  traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
  testdata  <- read.table("UCI HAR Dataset/test/X_test.txt")
  mergedata <- rbind(traindata, testdata)
  
  #dim(traindata)   #[1] 7352  561
  #dim(testdata)    #[1] 2947  561
  #dim(mergedata)   #[1] 10299  561
  
 
  
  
#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
  
  features <- read.table("UCI HAR Dataset/features.txt")
  
  #dim(features)
  #[1] 561   2
  
  ### obtain column positions only for variables containing mean() and std() in its names.
  retained <- grep("mean\\(|std\\(", features$V2)
  
  #length(retained)
  #[1] 66
  
  merge_mean_std  <- mergedata[,retained]
  
  #dim(merge_mean_std)
  #[1] 10299    66
  
#Step 3: Uses descriptive activity names to name the activities in the data set
  
  trainactivity  <- read.table("UCI HAR Dataset/train/y_train.txt")
  testactivity   <- read.table("UCI HAR Dataset/test/y_test.txt")
  merge_activity <- rbind(trainactivity, testactivity)
  
  #dim(trainactivity)  #[1] 7352    1
  #dim(testactivity)   #[1] 2947    1
  #dim(merge_activity) #[1] 10299   1
  
  
  ## Load actitivy codes and names
  activities <- read.table("UCI HAR Dataset/activity_labels.txt")
  
  descrpt_activ <- activities[merge_activity$V1, 2]
  

#Step 4: Appropriately labels the data set with descriptive variable names. 
  
  
  features$V2 <- gsub("-", "",features$V2 )
  features$V2 <- gsub("\\()", "",features$V2 )
  features$V2 <- gsub(",", "",features$V2 )
  
  names(merge_mean_std) <- features[retained,2]
  
  
####
  trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
  testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
  mergesubject <- rbind(trainsubject, testsubject)
  
  names(mergesubject) <- "subjects"
  
  final_dataset <- cbind(mergesubject, descrpt_activ, merge_mean_std)
  

#Step 5: From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
  
  library(reshape2)
  
  meltdfrm <- reshape2::melt(final_dataset, id=c("subjects", "descrpt_activ"))
  meltdfrm[1:10,1:4]
  
  tidy_dataset <- reshape2::dcast(meltdfrm, subjects + descrpt_activ ~ variable, fun.aggregate = mean)
  tidy_dataset[1:10,1:6]
  
  write.table(tidy_dataset, "tidy.txt", row.names = FALSE, quote = FALSE)
  
  
}






