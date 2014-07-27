#Merge the training and the test sets to create one data set.
xtest <- read.table("X_test.txt")
xtrain <- read.table("X_train.txt")
ytest <- read.table("y_test.txt")
ytrain <- read.table("y_train.txt")
stest <- read.table("subject_test.txt")
strain <- read.table("subject_train.txt")

merged <- rbind(xtest,xtrain)

var_names <- read.table("features.txt")
names(merged) <- var_names[,2]

y_merged <- rbind(ytest,ytrain)

activity_labels <- read.table("activity_labels.txt")
y_merged_w_act_labels <- merge(y_merged, activity_labels, by.x="V1", by.y="V1", all=TRUE)

merged1 <- cbind(merged, y_merged_w_act_labels[ , 2])

colnames(merged1)[562] <- "activity"

subjects <- rbind(stest,strain)
merged2 <- cbind(merged1, subjects)
colnames(merged2)[563] <- "subject"

#Extract only the measurements on the mean and standard deviation for each measurement. 

#Columns to keep...
keep <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 
          253:254, 266:271, 345:350, 424:429, 504:504, 516:517, 529:530, 542:543, 562, 563)

reduced <- merged2[ , keep]

#Creates a second, independent tidy data set with the average of each variable
#for each activity and each subject. 

write.table(reduced, file="tidyDataSet.txt", sep=",")
