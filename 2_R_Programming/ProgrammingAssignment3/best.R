


best <- function(state,outcome) {
        ## Read outcome data
        outcomeData <- read.csv("outcome-of-care-measures.csv",colClasses = "character")

        HospName <- outcomeData[,2]
        St <- outcomeData[,7]
        HA <- as.numeric(outcomeData[,11])
        HF <- as.numeric(outcomeData[,17])
        Pn<- as.numeric(outcomeData[,23])
        
        data <- data.frame("Hospital.Name"=HospName, "State"=St,"Heart Attack"=
                                   HA,"Heart Failure"=HF,"Pneumonia"=Pn)
         
        ## Check that state and outcome are valid
        stateNames <- unique(St)
        checkState<-match(state,stateNames)
        if(is.na(checkState)){stop("invalid state")}
        
        out<-NULL
        if(outcome=="heart attack") out<-3
        
        else if (outcome=="heart failure") out<-4
        
        else if (outcome=="pneumonia") out<-5
        
        else {stop("invalid outcome")}
        
        ## Return hospital name in that state with lowest 30-day death rate
        subData<-subset(data,State==state)
        # ind<-which.min(subData[,out]) 
        temp<-apply(subData,2,function(x) which(subData[,out]==min(subData[,out]
                        ,na.rm=TRUE)))
        if(is.null(dim(temp))){
                print(as.character(subData$Hospital.Name[temp[1]]))}
        else {print(as.character(subData$Hospital.Name[temp[,1]]))}
}



## Hospital Names: Col 2
## State: Col 7
## Hospital 30-day Mortality Rate from Heart Attack: Col 11
## Hospital 30-day Mortality Rate from Heart Failure: Col 17
## Hospital 30-day Mortality Rate from Pneumonia: Col 23