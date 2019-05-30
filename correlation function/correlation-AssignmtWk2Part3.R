## Air Pollution Monitoring dataset. Week 2 Coursera RProgramming Assignment
## setwd("C:/Users/Office/Documents/RCourse/Week2/rprog_data_specdata/")
setwd("M:/Documents/RCourse/Week2/rprog_data_specdata/")

###############################################################################
## FUNCTION DESCRIPTION:correlation1 is a a function that takes a directory of data files 
## and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations 
## where the number of completely observed cases, numbercompltobs, (on all variables) is greater than the threshold. 
## The function returns a vector of correlations for the monitors that meet the threshold requirement. 
## If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0.
#------------------------------------------------------------------------------
## SAMPLE OUTPUT:
# source("correlation-AssignmtWk2Part3.R")
# source("completecases-AssignmtWeek2Part2.R")
# > cr <- correlation1("specdata", 150)
# > head(cr)
# [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
# > summary(cr)
# Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313
# > cr <- correlation1("specdata", 400)
# > head(cr)
# [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
# > summary(cr)
# Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313
# > cr <- correlation1("specdata", 5000)
# > summary(cr)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 
# > length(cr)
# [1] 0
# > cr <- correlation1("specdata")
# > summary(cr)
# Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000
# > length(cr)
# [1] 323

######################################################################

correlation1<-function(directory, threshold=0){
        filelist<-list.files(path=directory,pattern=".csv", full.names=TRUE)
        ## set empty numeric vector to store numeric vector of correlations in completed cases for each monitor
        numbercompltobs<-numeric()
        
        ##next create your loop to iterate through the ids
        for (i in 1:length(filelist)){
                ## read your data
                data<-read.csv(filelist[i], header=TRUE)
                ## next delete the NAs
                data<-data[complete.cases(data),]
                ## count the number of completed observations in each monitor or file
                csum<-nrow(data)
                ## if the number of rows in each monitor or file is greater than the threshold entered as the argument
                if(csum>threshold){
                        ## for that file you find the correlation using the cor function btwn the nitrate and sulfate
                        ## and you add it your empty numeric vector
                        ## combine each correlation for each file in vector format using the concanate
                        ## since this is not a data frame we cannot use rbind or cbind
                        numbercompltobs<-c(numbercompltobs,cor(data$nitrate,data$sulfate))
                }
        }
        return(numbercompltobs)
}