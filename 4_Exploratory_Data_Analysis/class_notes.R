# General class notes scripts

example(points) #demonstrates plotting parameters

x<-rnorm(100)
y<-rnorm(100)
hist(x)
plot(x,y)
par(mar=c(4,4,2,2))
plot(x,y,pch=19)
title("Scatterplot")
legend("topleft",legend = "Data", pch=20)

fit<-lm(y~x)
abline(fit)
abline(fit, lwd=3,col="blue")

plot(x,y,xlab="Weight",ylab="heigh",main="Scatterplot",pch=20)
legend("topright",legend = "Data", pch=20)
fit<-(y~x)
abline(fit,lwd=3,col="red")

z<-rpois(100,2) #poisson data
par(mfrow=c(2,1)) #plots 2 rows and 1 column
plot(x,y,pch=20)
plot(x,z,pch=19)
par("mar")
par(mar=c(2,2,1,1))
plot(x,y,pch=20)
plot(x,z,pch=19)
par(mfrow=c(1,2)) #plots 2 columns and 1 row

par(mfrow=c(2,2))
plot(x,y)
plot(x,z)
plot(z,x)
plot(y,x)

par(mcol=c(2,2))
plot(x,y)
plot(x,z)
plot(z,x)
plot(y,x)

par(mfrow=c(1,1))
x<-rnorm(100)
y<-x+rnorm(100)
g<-gl(2,50,labels=c("Male","Female")) # creates grouings
plot(x,y)
plot(x,y,type="n") #creates empty plot
points(x[g=="Male"],y[g=="Male"],col="green") #plots just males
points(x[g=="Female"],y[g=="Female"],col="blue") #plots just females

