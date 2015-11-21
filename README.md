## Read me: Data Cleaning of Samsung Intertial Sensor Data

This repo contains an R script (run_analysis.R) that oragnizes data gathered from Human Activity Recognition Using Smartphones Dataset Version 1.0 [1] into a manner that analysis can be performed on it. The raw data can be found at the follow web site:

          https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data comes from 30 subjects performing activities while carrying a waist-mounted smartphone with embedded inertial sensors. The codebook contains a description of the 

Presently, the script does the following:

        > Reads Data from the working directory
        
        > Merges the test and training data into one file
        
        > Extracts the mean and standard deviations for each measurement 
        
        > Names the activities in the data set
      
        > Labels the descriptive data variables
        
        > Creates a writes a second Tidy data set following the tidy data principles
        
## Refrences
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
