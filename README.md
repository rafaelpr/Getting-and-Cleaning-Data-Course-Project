### Getting-and-Cleaning-Data-Course-Project
This repo contains the datasets, script and codebook for the Getting and Cleaning Data Course Final Project from Coursera and Johns Hopkins University. 
Using data collected from the accelerometers from the Samsung Galaxy S smartphone, the purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.

#### The script `run_analysis.R` do the following:
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

#### Outputs
---
* Intermediary result `mean_std_dataset.txt`, which contains the mean and standard deviation for each measurement.
* Final result `tidy_dateset.txt`, which contains the average of each measurement for each activity and each subject.
