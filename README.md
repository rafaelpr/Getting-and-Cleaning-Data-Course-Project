## Getting-and-Cleaning-Data-Course-Project
This repo contains the results for the Getting and Cleaning Data Course Project from Coursera and Johns Hopkins University.

Simply execute "run_analysis.R". 
###The script does the following:
---
1. Download and unzip original data from the web, if it was not found in the working directory
2. Get the activity labels
3. Get feature names 
4. Format feature names, removing special characters and converting to lower case
5. Get training and test subject sets
6. Get training test labels and merge with activity labels 
7. Get and merges training and test sets to create one data set
8. Filter the measurements on the mean and standard deviation for each measurement
9. Export results in CSV format

### Outputs
* Intermediary result mean_std_dataset.txt, which contains the mean and standard deviation for each measurement.
* Final result tidy_dateset.txt, which contains the average of each measurement for each activity and each subject.
