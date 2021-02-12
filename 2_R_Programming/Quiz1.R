## 12/6/2019
## Quiz 1 Stuff

x <- 4
class(x)

x <- c(4, TRUE)
class(x)

x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)

x <- list(2, "a", "b", TRUE)
x[[1]]

x <- 1:4
y <- 2:3
x+y

## Want to set anything >10 to be equal to 4
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>10]<-4
print(x)

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>=11]<-4
print(x)

##Use Week 1 Quiz data
x<-read.csv("hw1_data.csv")
names(x) ## Shows column names for data

x[1:2,] ## Shows 1st two rows of x

obsv<-dim(x) # gets dimensions of x
print(obsv)
length(x$Ozone) ## This also works

x[(obsv[1]-1):obsv[1],] ## Show last two rows of x

x[47,1] ## ozone in 47th column
x$Ozone[47] ## This also works

goodOzone<-complete.cases(x$Ozone)
missingOzone<-length(x$Ozone)-length(x$Ozone[goodOzone]) ## Counts number of missing cases (NA) in Ozone
print(missingOzone)

mean(x$Ozone[goodOzone]) ##Mean of good Ozone cases

##Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
newx<-x[goodOzone,] ## Gets good data for only good cases
y<-newx[,1]>31 ## Finds rows where Ozone is > 31
newx<-newx[y,] ## Only keep Ozone > 31
y<-newx[,4]>90 ## Finds rows where Temp is >90
newx<-newx[y,] ## Only keep updated data with temp and ozone
mean(newx$Solar.R) #Gets mean of said columns

##Find mean Temp when month = 6
tempx<-x[,5]==6
tempx<-x$Temp[tempx]
mean(tempx) ## Finds mean of vector

##Find max Ozone when month = 5
ozonex<-x[,5]==5
ozonex<-x$Ozone[ozonex]
good<-complete.cases(ozonex)
ozonex<-ozonex[good]
max(ozonex)

## DONE
## END FILE

