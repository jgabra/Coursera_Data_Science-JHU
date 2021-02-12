## This file contains functions used for Programming Assignment 1 on the 
##      R programming course by JHU in Coursera


## Part 1
pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating the 
        ## location of the CSV files
        
        ## ' pollutant' is a character vector of length 1 indication the name
        ## of the pllutant for which we will calculate the mean; either
        ## "sulfate" or "nitrate"
        
        ## 'id' is an integer vector indicating the monitor ID numbers to be used
        
        ## Return the mean of the pollutant across all monitors list in the 'id'
        ## vector (ignoring NA values)
        ## NOTE: Do not round the result!
        
        pol_data<- vector()
        
        for(i in seq_along(id)){
                ## for loop to run through all the CSV files
                if(id[i]<10){ ## Appends approprieate 0's before reading
                        new_id<- paste("00",id[i],sep="") 
                } else if(id[i]<100){ 
                        new_id<- paste("0",id[i],sep="")
                } else {new_id<- id[i]
                }
                con<-paste(directory,"/",new_id,".csv",sep="")
                data<-read.csv(con[1])
                ## reads the CSV file for the respecitive index of the for loop
                
                # temp_data <- data$pollutant[!is.na(data[,pollutant])]
                # ## This gets the data for specified poolutatnt within repsective
                # ## csv file while excluding NAs
                
                pol_data <- c(pol_data,data[,pollutant])
                ## This builds a master pollution data set for specified pollutant
                ## that just appends all the data into a single vector
        }
        
        mean(pol_data,na.rm = TRUE)
        
}