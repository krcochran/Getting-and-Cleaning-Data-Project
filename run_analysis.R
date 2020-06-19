#Read in the files

subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

features <- read.table("features.txt")

#give variables descriptive names

features <- select(features, V2)
features <- rename(features, Activity = V2)

colnames(subject_test) <- "Subject"
colnames(x_test) <- features$Activity
colnames(y_test) <- "Activity"
colnames(subject_train) <- "Subject"
colnames(x_train) <- features$Activity
colnames(y_train) <- "Activity"

#merge test and train data sets

all_test <- cbind(subject_test, y_test, x_test)
all_train <- cbind(subject_train, y_train, x_train)
all_data <- rbind(all_test, all_train)

#grab all columns that have mean and standard deviation

all_data <- subset(all_data, select=which(!duplicated(colnames(all_data)))) 
all_data <- select(all_data, c("Subject", "Activity", grep("mean\\(\\)|std", colnames(all_data), value = TRUE)))

#creating the tidy data set

all_subjects <- data.frame()

for (i in 1:30) {
  one_subject <- aggregate(filter(all_data, Subject == i), by = list(filter(all_data, Subject == i)$Activity), mean)
  all_subjects <- rbind(one_subject, all_subjects)
}

all_subjects <- all_subjects[, -1]
all_data <- arrange(all_subjects, all_subjects$Subject, all_subjects$Activity)

#give activities descriptive names

all_data$Activity <- as.character(all_data$Activity)
all_data$Activity <- gsub("1", "Walking", all_data$Activity)
all_data$Activity <- gsub("2", "Walking Up", all_data$Activity)
all_data$Activity <- gsub("3", "Walking Down", all_data$Activity)
all_data$Activity <- gsub("4", "Sitting", all_data$Activity)
all_data$Activity <- gsub("5", "Standing", all_data$Activity)
all_data$Activity <- gsub("6", "Laying", all_data$Activity)

#export the tidy data set

write.table(all_data, file = "tidy_data.txt", sep = "\t", quote = FALSE, row.names = FALSE, col.names = TRUE)
