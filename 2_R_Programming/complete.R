## This file contains functions used for Programming Assignment 1 on the 
##      R programming course by JHU in Coursera
## Part 2

complete <- function(directory, id=1:332){
        ## 'directory' is a character vector of length 1 indicating the 
        ## location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers to be used
        
        ## Return a data fram of the form:
        ## id nobs
        ## 1 117
        ## 2 1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the number of complete cases
       
        IDs<-vector()
        NOBS<-vector()
        
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
                
                IDs<-c(IDs,id[i])
                NOBS<-c(NOBS,sum(complete.cases(data)))
        }
        
        data.frame("id"=IDs,"nobs"=NOBS)
}
