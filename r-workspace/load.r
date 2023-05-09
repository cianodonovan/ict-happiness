#Based in part on walk-through @ https://github.com/aiorazabala/qmethod/wiki/Cookbook#6-import-your-data-into-r
#This file loads in the data files and creates the data objects needed for analysis

rm(list=ls()) # remove all the crap from the environment
#install.packages("qmethod") #First time only

### ONE TIME SET-UP
library("qmethod") ## load the qmethod package
setwd("/Users/cianodonovan/Dropbox/Academia/Research\ projects/ICT-Happiness/Analysis/ict-happiness/r-workspace")
getwd() #Double check workspace dir
## Set some directories for the sorts and the concourse
q.sorts.dir <- "/Users/cianodonovan/Dropbox/Academia/Research\ projects/ICT-Happiness/Analysis/ict-happiness/qsorts/"
q.concourse.dir <- "/Users/cianodonovan/Dropbox/Academia/Research\ projects/ICT-Happiness/Analysis/ict-happiness/ICT-happiness-sample/ICT-happiness-concourse/"

### START BRINGING IN DATA
# Import the concourse 
q.concourse <- import.q.concourse(q.concourse.dir, languages = NULL)
#create the q distribution as a vector
  #q.distribution = c(3,4,6,7,8,7,6,4,3) # Cairns and Stirling dist.
  q.distribution = c(1,2,4,5,6,5,4,2,1) # Demo dist for 30 items.
#Read in the q set sample as a factor vector
q.sample <- read.csv("/Users/cianodonovan/Dropbox/Academia/Research\ projects/ICT-Happiness/Analysis/ict-happiness/ICT-happiness-sample/ICT-happiness-concourse/sample.csv",header=T)$handle
#Build the q set as a matrix
q.set <- build.q.set(q.concourse, q.sample, q.distribution)

## IF USING IDS INSTEAD OF HASHES
#Create the manual lookup table for handles and ids
manual.ids = matrix(scan("/Users/cianodonovan/Dropbox/Academia/Research\ projects/ICT-Happiness/Analysis/ict-happiness/ICT-happiness-sample/ids.csv", what=character(), skip=0), nrow=31, byrow = TRUE)
colnames(manual.ids) <- manual.ids[1,] # set colnames
manual.ids <- manual.ids[-(1:1), , drop=FALSE]  # drop the first row
rownames(manual.ids) <- manual.ids[, 2] # set rownames
manual.ids <- manual.ids[,-(2:2),drop=FALSE]  # drop the first column
## END IF USING IDS INSTEAD OF HASHES

### IMPORT and BUILD THE SORTS DATA OBJECT
thesorts <- import.q.sorts(q.sorts.dir, q.set, q.distribution, conditions = NULL, manual.lookup = NULL) #Using auto hashes
thesorts <- import.q.sorts(q.sorts.dir, q.set, q.distribution, conditions = NULL, manual.ids) #Using manual IDs
