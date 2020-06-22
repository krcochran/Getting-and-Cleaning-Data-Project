# Getting-and-Cleaning-Data-Project
Final assignment for the course Getting and Cleaning Data

The supplied data set was from the accelerometers from the Samsung Galaxy S smartphone. They had 30 different subjects test out the phones motion sensitivity by completing actions and tasks such as walking upstairs, walking downstairs, walking, laying down, sitting, and standing. Each subject completed many trials of each activity so in the data provided, each row has the mean value of the trials for each activity (i.e. subject 1 walked upstairs with the phone about 100 times, so the row with subject 1 and "Walking Up" would contain the mean value for those 100 trials over each different measured variable).

The data was given in an untidy manner, containing two separate data sets that were used to train the accelerometers. First I stitched those two data sets together creating one data set. Then, after having one complete data set, I selected only the variables pertaining to mean or standard deviation (mean() or std()). Next I organized the observations by subject and activity. Then I took aggregate means across all different observed variables for each activity. Lastly, I renamed all the activites more descriptively so the recipient of this data set knew which row corresponded to which activity. The result is the tidy data set.

Note: the input for the script requires the Samsung data be in the working directory as downloaded. Additionally, in order to read in the tidy data set, make sure to have sep = "\t".

Also attached in this repository is a codebook which describes each variable used and the functions used on the observations. The accelerometers picked up acceleration, jerk, and magnitutde from the X, Y, and Z directions as denoted in the columns.
