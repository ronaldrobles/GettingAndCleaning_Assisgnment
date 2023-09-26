## You should also include a README.md in the repo with your scripts...



### Step 1: Merges the training and the test sets to create one data set.

    traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
    testdata  <- read.table("UCI HAR Dataset/test/X_test.txt")

Both datasets are merged with rowbind function

    mergedata <- rbind(traindata, testdata)

Verifying the initial and resulting data sets:

    dim(traindata)   #[1] 7352  561
    dim(testdata)    #[1] 2947  561
    dim(mergedata)   #[1] 10299 561
  
 
  
### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
Load the file with the variable names 

    features <- read.table("UCI HAR Dataset/features.txt")
  
    dim(features)
    [1] 561   2
  
Obtain column positions only for variables containing mean() and std() in its names.

    retained <- grep("mean\\(|std\\(", features$V2)
    length(retained)
    [1] 66
  
Producing a new data set with only selected columns:

    merge_mean_std  <- mergedata[,retained]
    dim(merge_mean_std)
    [1] 10299    66

### Step 3: Uses descriptive activity names to name the activities in the data set
  
    trainactivity  <- read.table("UCI HAR Dataset/train/y_train.txt")
    testactivity   <- read.table("UCI HAR Dataset/test/y_test.txt")
    
    merge_activity <- rbind(trainactivity, testactivity)
  
    dim(trainactivity)
    [1] 7352    1
    dim(testactivity)
    [1] 2947    1
    dim(merge_activity)
    [1] 10299   1
  
  
Load actitivy codes and names

    activities <- read.table("UCI HAR Dataset/activity_labels.txt")
Create a vector of descriptive actitivies for the 10299 rows

    descrpt_activ <- activities[merge_activity$V1, 2]

### Step 4: Appropriately labels the data set with descriptive variable names. 
  
    features$V2 <- gsub("-", "",features$V2 )
    features$V2 <- gsub("\\()", "",features$V2 )
    features$V2 <- gsub(",", "",features$V2 )
  
    names(merge_mean_std) <- features[retained,2]
  
  
### Load the subject_IDs and create the final data set

    trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
    testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
    
    mergesubject <- rbind(trainsubject, testsubject)
    names(mergesubject) <- "subjects"
  
    final_dataset <- cbind(mergesubject, descrpt_activ, merge_mean_std)
  
### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
    library(reshape2)
  
    meltdfrm <- reshape2::melt(final_dataset, id=c("subjects", "descrpt_activ"))
    tidy_dataset <- reshape2::dcast(meltdfrm, subjects + descrpt_activ ~ variable, fun.aggregate = mean)
  
    write.table(tidy_dataset, "tidy.txt", row.names = FALSE, quote = FALSE)
  



