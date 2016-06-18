run_analysis <- function() {
  
  ##Download and unzip original data from the web, if it was not found in the working directory
  if (!file.exists("UCI HAR Dataset")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "dataset.zip")
    unzip(zipfile = "dataset.zip")
  }

  ##Get the activity labels
  lbl <- read.table("UCI HAR Dataset\\activity_labels.txt")

  ##Get feature names
  featurenames <- read.table("UCI HAR Dataset\\features.txt", colClasses = c("NULL", "character"))
  
  ##Format feature names, removing special characters and converting to lower case
  featurenames <- gsub("[[:punct:]]", "", tolower(as.vector(featurenames[,1])))

  #Create the main data frameset
  output <- data.frame()
  
  tt <- c("test", "train")
  for (i in seq_along(tt)) {  
    ##Get training and test subject sets
    path <- paste0("UCI HAR Dataset\\", tt[i], "\\subject_",tt[i],".txt")
    subject <- read.table(path)
    
    ##Get training test labels and merge with activity labels 
    path <- paste0("UCI HAR Dataset\\", tt[i], "\\y_",tt[i],".txt")
    activity <- read.table(path)
    labels <- as.numeric(1:length(unique(lbl[,2])))
    names(labels) <- unique(lbl[,2])
    activity <- data.frame(id = activity[,1], activity = names(labels[activity[,1]]))
    
    #Read and merges training and test sets to create one data set
    library(data.table)
    path <- paste0("UCI HAR Dataset\\", tt[i], "\\X_", tt[i], ".txt")
    sets <- cbind(subject, activity[, 2], rep(tt[i], length.out = nrow(fread(path))), fread(path))
    output <- rbind(output, sets)
  }
  
  #Filter the measurements on the mean and standard deviation for each measurement
  names(output) <- c("subject", "activity", "source", featurenames)
  filter <- unique (grep(paste(c("subject", "activity", "source", "mean", "std"),collapse="|"), names(output), value=TRUE))
  
  #Export 1st (intermediary) dataset
  dataset <- output[, filter]
  write.table(dataset, file = "mean_std_dataset.txt", row.names = FALSE, sep = " ")
  
  #Export 2nd (tidy) dataset
  dataset2 <- aggregate(dataset[, -(1:3)], list(dataset$activity, dataset$subject), mean)
  names(dataset2)[1:2] <- c("subject", "activity")
  write.table(dataset2, file = "tidy_dataset.txt", row.names = FALSE, sep = " ")
}

