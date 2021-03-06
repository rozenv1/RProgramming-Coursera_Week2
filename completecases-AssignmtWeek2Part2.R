## Air Pollution Monitoring dataset. Week 2 Coursera RProgramming Assignment
## setwd("C:/Users/Office/Documents/RCourse/Week2/rprog_data_specdata/")
setwd("M:/Documents/RCourse/Week2/rprog_data_specdata/")

###############################################################################
## FUNCTION DESCRIPTION: complete function reads a directory full of files and 
## reports the number of completely observed cases in each data file of the 332 Air Pollution data files.
## The function should return a data frame where the first column is the name of the file (id) and the second 
## column is the number of complete cases (numbercompltobs).
#------------------------------------------------------------------------------
## SAMPLE OUTPUT:
## >source("completecases-AssignmtWeek2Part2.R")
## >complete("specdata", 1)
#   id numbercompltobs
# 1  1  117
## >complete("specdata", c(2, 4, 8, 10, 12))
#   id numbercompltobs
# 1  2 1041
# 2  4  474
# 3  8  192
# 4 10  148
# 5 12   96
## >complete("specdata", 30:25)
#   id numbercompltobs
# 1 30  932
# 2 29  711
# 3 28  475
# 4 27  338
# 5 26  586
# 6 25  463
## >complete("specdata", 3)
#   id numbercompltobs
# 1  3  243

##############################################################################
complete<-function(directory, id = 1:332){
        filelist<-list.files(path=directory, pattern=".csv",full.names=TRUE)
        ## set empty numeric vector to store numeric vector or counts of completed cases
        numbercompltobs <- numeric()
        ##next create your loop to iterate through the ids
        for (i in id){
                ## first you read the data
                data<-read.csv(filelist[i])
                ## next you use the below to add the values to your numeric vector by concanating them
                numbercompltobs <-c(numbercompltobs, sum(complete.cases(read.csv(filelist[i]))))
        }
        data.frame(id, numbercompltobs)
        
}
