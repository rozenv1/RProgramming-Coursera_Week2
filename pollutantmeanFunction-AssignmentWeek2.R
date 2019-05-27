## Air Pollution Monitoring dataset. Week 2 Coursera RProgramming Assignment
setwd("C:/Users/Office/Documents/RCourse/Week2/rprog_data_specdata/")

## The data is provided in a zip file, which contains 332 comma-separated-value (CSV) files containing pollution 
## monitoring data for fine particulate matter (PM) air pollution at 332 locations in the US. 
## Each file, a data frame, contains data from a single monitor and the ID number for each monitor is contained in the file name. 
## For example, data for monitor 200 is contained in the file "200.csv". 
## Each file contains three variables:
# Date: the date of the observation in YYYY-MM-DD format (year-month-day)
# sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
# nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

###############################################################################
## FUNCTION DESCRIPTION:
## pollutantmean function calculates the mean of a pollutant (sulfate or nitrate) 
## across a specified list of monitors. The function 'pollutantmean' takes three arguments: 
## 'directory', 'pollutant', and 'id'. 
## Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the 
## directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, 
## ignoring any missing values coded as NA.
##-----------------------------------------------------------------------------
## SAMPLE OUTPUT:
# source("pollutantmeanFunction-AssignmentWeek2.R")
# pollutantmean("specdata", "sulfate", 1:10)
# [1] 4.064128
# pollutantmean("specdata", "nitrate", 70:72)
# [1] 1.706047
# pollutantmean("specdata", "nitrate", 23)
# [1] 1.280833

#############################################################

pollutantmean<-function(directory, pollutant, id = 1:332){
        ## 'directory' is a character vector lenght 1 indicating the location of the CSV files
        fileList<-list.files(path=directory, pattern=".csv", full.names=TRUE)
        ## You'll need to create a list or an empty vector and add values to it
        ## to store the means of each id or file.
        values <-numeric()
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## the mean; either "sulfate" or "nitrate".
        ## 'id' is an integer vector indicating the monitor ID numbers to be used
        ## Return the mean of the pollutant accross all monitors list
        ## in te 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
        for (i in id) {
                data<-read.csv(fileList[i])
                values<-c(values, data[[pollutant]])
        }
        mean(values, na.rm=TRUE)
}
## Another Sample Output
pollutantmean("/Users/Office/Documents/RCourse/Week2/rprog_data_specdata/specdata/", "sulfate")