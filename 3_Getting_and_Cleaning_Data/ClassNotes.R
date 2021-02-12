
setwd("C:/Users/jgabr/Desktop/R Programming/Get_n_Clean_Data")

#### Week 1 ####

if (!file.exists("data")){
      dir.create("data")
}

fileUrl <- "https://data.baltimorecity.gov/api/views/aqgr-xx9h/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv")
list.files("./data")

dateDownloaded<-date()
dateDownloaded


### Quiz 1 ###

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./data/quiz1.csv")
quiz1_data<-read.csv("./data/quiz1.csv")

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl,destfile="quiz1.xlsx")
quiz1_xlsx<-read.xlsx("quiz1_2.xlsx")
dat<-quiz1_xlsx[(18:23),(7:15)]

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#download.file(fileUrl,destfile="./data/quiz1.xml")
doc<-xmlParse(getURL(fileUrl),useInternal=TRUE)


fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,destfile="quiz1_5.csv")
DT<-fread("quiz1_5.csv")

#### Week 2 ####
 

## Quiz 2 ##

library(httr)
oauth_endpoints("github")

myapp <- oauth_app("github",key="e285c1810a6815cf4cb0",secret="11be4619dde0f5db746fdf9a00808a71d954dc73")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req<-GET("https://api.github.com/users/jtleek/repos",gtoken)
 a<-content(req)
a[19]


fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,destfile="./data/quiz2_2.csv")
acs<-read.csv("./data/quiz2_2.csv")

sqldf("select pwgtp1 from acs where AGEP < 50")


unique(acs$AGEP)
sqldf("select distinct AGEP from acs")


url<-"http://biostat.jhsph.edu/~jleek/contact.html"
html<-htmlTreeParse(url,useInternalNodes = T)
htmlLines<-readLines(url)
Num_Char<-nchar(htmlLines,type="chars")
Num_Char[c(10,20,30)]

 

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl,destfile="./data/quiz2_5.for")
Q2_5<-read.fwf("./data/quiz2_5.for",widths=c(15,4,4,9,4,9,4,9,4),skip=4,dec=".",strip.white=T,sep="\t")
sum(Q2_5$V4)


#### Week 3 ####


#### Quiz 3 ####
library(dplyr)
library(tidyr)

# Q 1 #
if (!file.exists("data")){
      dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./data/Q3_1.csv")

q3_1<-read.csv("./data/Q3_1.csv")
agricultureLogical<-with(q3_1,ACR==3 & AGS==6)
which(agricultureLogical)

# Q2 #
library(jpeg)

if (!file.exists("data")){
      dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, destfile="./data/Q3_2.jpg",mode="wb")
q3_2<-readJPEG("./data/Q3_2.jpg",native = TRUE)
quantile(q3_2,probs=c(.3,.8))

#Q3#

if (!file.exists("data")){
      dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="./data/Q3_3_gdp.csv")
GDP<-read.csv("./data/Q3_3_gdp.csv",skip=4)
GDP<-rename(GDP,country=X,GDP_rank=X.1,economy=X.3,Mil_US_Dol=X.4)
GDP<-select(GDP,c("country","GDP_rank","economy","Mil_US_Dol"))
GDP<-filter(GDP,country!="")
GDP$GDP_rank<-as.numeric(GDP$GDP_rank)
GDP$Mil_US_Dol<-as.numeric(gsub(",", "", GDP$Mil_US_Dol))

# GDP<-filter(GDP,GDP_rank>0 & GDP_rank<=190)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl, destfile="./data/Q3_3_edu.csv")
educ<-read.csv("./data/Q3_3_edu.csv")

q3_3<-merge(GDP,educ,by.x="country",by.y="CountryCode",all=TRUE)
q3_3_2<-arrange(q3_3,desc(GDP_rank))

q3_3_2<-filter(q3_3_2,GDP_rank>0)# Match count is off if using this


# Q4 #
# q3_3_2 %>% select(GDP_rank,Income.Group) %>% group_by(Income.Group) %>% summarize(mean(GDP_rank))
q4<-q3_3_2 %>% select(GDP_rank,Income.Group) %>% group_by(Income.Group)
q4 %>% summarise(mean(GDP_rank))

# Q5 #
q5<-q4
q5$GDP_quantile<-cut(q5$GDP_rank,breaks=5)
table(q5$Income.Group,q5$GDP_quantile)           
           
          
#### Quiz 4 ####

# Q 1 #
if (!file.exists("data")){
      dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./data/Q4_1.csv")

q4_1<-read.csv("./data/Q4_1.csv") 
splitNames<-strsplit(names(q4_1),"wgtp")
splitNames[123]

# Q2 #
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="./data/Q4_2_gdp.csv")
GDP<-read.csv("./data/Q4_2_gdp.csv",skip=4)
GDP<-rename(GDP,country=X,GDP_rank=X.1,countryNames=X.3,Mil_US_Dol=X.4)
GDP<-select(GDP,c("country","GDP_rank","countryNames","Mil_US_Dol"))
GDP<-filter(GDP,country!="")
GDP$GDP_rank<-as.numeric(GDP$GDP_rank)
GDP$Mil_US_Dol<-as.numeric(gsub(",", "", GDP$Mil_US_Dol))
GDP<-filter(GDP,GDP_rank>0 & GDP_rank<=190)
mean(GDP$Mil_US_Dol,na.rm=T)

# Q3 #
grep("^United",GDP$countryNames)

# Q4 #
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="./data/Q4_4_gdp.csv")
GDP<-read.csv("./data/Q4_4_gdp.csv",skip=4)
GDP<-rename(GDP,country=X,GDP_rank=X.1,economy=X.3,Mil_US_Dol=X.4)
GDP<-select(GDP,c("country","GDP_rank","economy","Mil_US_Dol"))
GDP<-filter(GDP,country!="")
GDP$GDP_rank<-as.numeric(GDP$GDP_rank)
GDP$Mil_US_Dol<-as.numeric(gsub(",", "", GDP$Mil_US_Dol))

GDP<-filter(GDP,GDP_rank>0 & GDP_rank<=190)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl, destfile="./data/Q4_4_edu.csv")
educ<-read.csv("./data/Q4_4_edu.csv")

q4_4<-merge(GDP,educ,by.x="country",by.y="CountryCode",all=TRUE)
q4_4<-filter(q4_4,GDP_rank>0)
q4_4_2<-grep("Fiscal year end: [Jj]une",q4_4$Special.Notes)#fixed?
length(q4_4_2)

# Q5 #

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

library(lubridate)

length(grep("^2012",sampleTimes))
sampleTimes_days<-sampleTimes[grep("^2012",sampleTimes)]
length(sampleTimes_days)
sampleTimes_days<-wday(sampleTimes_days)
sampTime_day_Mon<-sum(sampleTimes_days==2)
