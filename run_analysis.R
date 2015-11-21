##Analysis for getting and cleaning data coursera project

setwd("~/DATASCIENCE/GettingandCleaningData")

#Load librarys
library(reshape2)

#Read Test Data
Subject.test <- read.table("subject_test.txt")
test.x <- read.table("X_test.txt")
test.y <- read.table("y_test.txt")

#Read Train Data
Subject.train <- read.table("subject_train.txt")
train.x <- read.table("X_train.txt")
train.y <- read.table("y_train.txt")

#Read Activity and Feature Fabels
features <- read.table("features.txt")
activity.labels <- read.table("activity_labels.txt")

#Merge test and training data
subject <- rbind(Subject.test, Subject.train)
colnames(subject) <- "subject"
data <- rbind(test.x, train.x)
names(data) <- features$V2

#Extract Mean and standard deviation for each measurement
colnames(data) <- c(as.character(features[,2]))
Mean<-grep("mean()|std()",colnames(data))
MeanD<-data[,c(Mean)]

#Descriptive activity to name the activities in the data set
label <- rbind(test.y, train.y)
label <- cbind(label,MeanD)
colnames(label)[1]<-"Activity"
data <- cbind(subject, label, data)

#Label descriptive data variables names
activity.labels[,2]<-as.character(activity.labels[,2])
for(i in 1:length(label[,1])){
    label[i,1]<-activity.labels[label[i,1],2]
}
#Create second tidy data set
Subject.all<-rbind(Subject.train,Subject.test)
all<-cbind(Subject.all,label)
colnames(all)[1] <- "Subject"
Tidy <- aggregate( all[,3] ~ Subject+Activity, data = all, FUN= "mean" )
for(i in 4:ncol(all)){
    Tidy[,i] <- aggregate( all[,i] ~ Subject+Activity, data = all, FUN= "mean" )[,3]
}
colnames(Tidy)[3:ncol(Tidy)] <- colnames(MeanD)
write.table(Tidy, file = "TidyData.txt")

#DISPLAY DATA
View(Tidy)
