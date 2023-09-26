## CodeBook: Getting and Cleaning Assignment

....a code book that describes the variables, the data, and any transformations or work that you 
performed to clean up the data

============================================================================================
### Variables
For this course project a subset of 66 variables were selected. These are the mean and standard
deviation related variables:

	tBodyAcc-mean()-X           tBodyAcc-mean()-Y           tBodyAcc-mean()-Z           tBodyAcc-std()-X           
	tBodyAcc-std()-Y            tBodyAcc-std()-Z            tGravityAcc-mean()-X        tGravityAcc-mean()-Y       
	tGravityAcc-mean()-Z        tGravityAcc-std()-X         tGravityAcc-std()-Y         tGravityAcc-std()-Z        
	tBodyAccJerk-mean()-X       tBodyAccJerk-mean()-Y       tBodyAccJerk-mean()-Z       tBodyAccJerk-std()-X       
	tBodyAccJerk-std()-Y        tBodyAccJerk-std()-Z        tBodyGyro-mean()-X          tBodyGyro-mean()-Y         
	tBodyGyro-mean()-Z          tBodyGyro-std()-X           tBodyGyro-std()-Y           tBodyGyro-std()-Z          
	tBodyGyroJerk-mean()-X      tBodyGyroJerk-mean()-Y      tBodyGyroJerk-mean()-Z      tBodyGyroJerk-std()-X      
	tBodyGyroJerk-std()-Y       tBodyGyroJerk-std()-Z       tBodyAccMag-mean()          tBodyAccMag-std()          
	tGravityAccMag-mean()       tGravityAccMag-std()        tBodyAccJerkMag-mean()      tBodyAccJerkMag-std()      
	tBodyGyroMag-mean()         tBodyGyroMag-std()          tBodyGyroJerkMag-mean()     tBodyGyroJerkMag-std()     
	fBodyAcc-mean()-X           fBodyAcc-mean()-Y           fBodyAcc-mean()-Z           fBodyAcc-std()-X           
	fBodyAcc-std()-Y            fBodyAcc-std()-Z            fBodyAccJerk-mean()-X       fBodyAccJerk-mean()-Y      
	fBodyAccJerk-mean()-Z       fBodyAccJerk-std()-X        fBodyAccJerk-std()-Y        fBodyAccJerk-std()-Z       
	fBodyGyro-mean()-X          fBodyGyro-mean()-Y          fBodyGyro-mean()-Z          fBodyGyro-std()-X          
	fBodyGyro-std()-Y           fBodyGyro-std()-Z           fBodyAccMag-mean()          fBodyAccMag-std()          
	fBodyBodyAccJerkMag-mean()  fBodyBodyAccJerkMag-std()   fBodyBodyGyroMag-mean()     fBodyBodyGyroMag-std()     
	fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std() 


>The variables in this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ 
>and tGyro-XYZ.

------------------------------------------------------------------------------------------------
### Subjects and Activities

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist.


---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
### Cleaning data
The information from Subjects and Activities where loaded from "Training" and "Test" directories

	>"UCI HAR Dataset/train/subject_train.txt"
	>
	>"UCI HAR Dataset/test/subject_test.txt"
	>
	>"UCI HAR Dataset/train/y_train.txt"
	>
	>"UCI HAR Dataset/test/y_test.txt"

and combined to the dataset. To avoid errors the variable names where modified by removing unnecesary characters

     	-- removed "()" and "-" characters.

The activity information were also modified replacing number codes by their corresponding activity names:

     	-- LAYING, SITTING , STANDING , WALKING , WALKING_DOWNSTAIRS  and WALKING_UPSTAIRS .
  
-------------------------------------------------------------------------------------------------------------
 
#### To run the script for tidy dataset for submission.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once the extracted folder "UCI HAR Dataset" is inthe main directory, run the already included script with:

  > source("run_analysis.R")
  > getresult() 

The script does the following:

	- Step 1: Merges the training and the test sets to create one data set.

	- Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

	- Step 3: Uses descriptive activity names to name the activities in the data set.

	- Step 4: Appropriately labels the data set with descriptive variable names.

	- Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

=============================================================================================================
