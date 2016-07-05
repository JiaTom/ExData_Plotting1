library(lubridate)
## read table from txt file
df=read.table(file="household_power_consumption.txt",sep=";",nrows=69516,
              stringsAsFactors =FALSE,header = TRUE,na.strings = '?')

##reshape data
df=df[66637:nrow(df),]

##create new time coloum 
df$DateTime<-dmy(df$Date)+hms(df$Time)
##df<-df[,c(10,3:9)]


plot(df$DateTime,df$Global_active_power,ylab='Global Active Power (kilowatts)',
     xlab='', type='l')
dev.copy(png,file="plot2.png")
dev.off()