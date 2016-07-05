library(lubridate)
## read table from txt file
df=read.table(file="household_power_consumption.txt",sep=";",nrows=69516,
              stringsAsFactors =FALSE,header = TRUE,na.strings = '?')

##reshape data
df=df[66637:nrow(df),]

##create new time coloum 
df$DateTime<-dmy(df$Date)+hms(df$Time)
##df<-df[,c(10,3:9)]

hist(df$Global_active_power,main='Global Active Power',
     xlab='Global Active Power (kilowatts)',col="red")
dev.copy(png,file="plot1.png")
dev.off()

