##Getting and Cleaning Data  -- Course Project
This repository holds the R code and documentation for the JHU Data Science specialization course "Getting and Cleaning Data".

##What it does
This R file pulls data relating to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
It downloads the files, unzips it, merges the two different data sets (training and test), extracts all measurements regarding mean or standard deviation, and cleans up the data.
It also outputs a tidy data set with the average of each variable for each activity and each subject.

##Files
'Cookbook.md' - Cookbook for the R script. Describes variables and transformations taken.
'run_analysis.R' - The R script that does the logic of cleaning data.
