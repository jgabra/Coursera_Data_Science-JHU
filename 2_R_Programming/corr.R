## This file contains functions used for Programming Assignment 1 on the 
##      R programming course by JHU in Coursera

## Part 3

corr<- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indication the
        ## location of teh CSV files
        
        ## 'treshold' is a numeric vetor of length 1 indicating the number of
        ## completely observed observations (on all variables) required to
        ## compute the correlation between nitrate and sulfate; default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        
        data<-complete(directory)
        
        id<-data[data[,2]>threshold,1]
       
        correlation_data<-vector()
         
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
                completeData<-data[complete.cases(data),]
                
                
                correlation_data <- c(correlation_data,cor(completeData$nitrate,completeData$sulfate))
                
        }
        correlation_data
}