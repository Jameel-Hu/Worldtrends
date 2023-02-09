data <- read.csv(file.choose())
data
summary(data)
temp <- factor(data$Year)
temp
#data from excel 
data1960 <- data[data$Year==1960,]
data2013 <- data[data$Year==2013,]

#data from R
add1960 <- data.frame(Country=Country_Code, Life.exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Country=Country_Code, Life.exp=Life_Expectancy_At_Birth_2013)
 #merge 
merged1960 <- merge(data1960, add1960, by.x = "Country.Code", by.y = "Country")
merged2013 <- merge(data2013 , add2013, by.x = "Country.Code", by.y = "Country") 


#check the merged 
str(merged1960)

merged2013$Year <- NULL

#charts
library(ggplot2)
qplot(data=merged2013, x=Fertility.Rate,y=Life.exp, colour=Region, size=I(5), alpha=I(0.6), main= "life exp vs fertility2013" )

qplot(data=merged1960, x=Fertility.Rate,y=Life.exp, colour=Region, size=I(5), alpha=I(0.6), main= "life exp vs fertility1960" )
