

rankhospital <- function(state,outcome,num="best") {
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
        
        
        subData<-subset(data,State==state)
        subData<-subData[order(subData[,out],subData[,1]),]
        
        
        ## NA if desired rank is larger than number of hosp in state
        if (num=="best") num<-1
                
                else if (num=="worst") {
                        subData<-subData[complete.cases(subData[,out]),]
                        num<-nrow(subData)}
                else if(is.numeric(num)){
                
                        if(num>nrow(subData)) {return(NA) 
                        stop()}
                }
 
        
        ## Return hospital name in that state with the given rank 30 day 
        ## death rate
        output<-as.character(subData$Hospital.Name[num])
        # print(output)
        if(is.na(output)) return(NA)
        return(output)
        
}