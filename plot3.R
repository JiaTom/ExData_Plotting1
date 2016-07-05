library(lubridate)
## read table from txt file
df=read.table(file="household_power_consumption.txt",sep=";",nrows=69516,
              stringsAsFactors =FALSE,header = TRUE,na.strings = '?')

##reshape data
df=df[66637:nrow(df),]

##create new time coloum 
df$DateTime<-dmy(df$Date)+hms(df$Time)
##df<-df[,c(10,3:9)]

plot(df$DateTime,df$Sub_metering_1,type='l',
     col="black",xlab='',ylab='Energy sub metering')
lines(df$DateTime,df$Sub_metering_2,col="red")
lines(df$DateTime,df$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = "solid")
dev.copy(png,file="plot3.png")
dev.off()