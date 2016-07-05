library(lubridate)
## read table from txt file
df=read.table(file="household_power_consumption.txt",sep=";",nrows=69516,
              stringsAsFactors =FALSE,header = TRUE,na.strings = '?')

##reshape data
df=df[66637:nrow(df),]

##create new time coloum 
df$DateTime<-dmy(df$Date)+hms(df$Time)
##df<-df[,c(10,3:9)]

##set graph num and pos 
par(mfrow=c(2,2))

plot(df$DateTime,df$Global_active_power,ylab='Global Active Power (kilowatts)',
     xlab='', type='l')


plot(df$DateTime,df$Voltage,xlab='datetime',ylab='Voltage',type='l')

plot(df$DateTime,df$Sub_metering_1,type='l',
     col="black",xlab='',ylab='Energy sub metering')
lines(df$DateTime,df$Sub_metering_2,col="red")
lines(df$DateTime,df$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = "solid",cex=0.5)

plot(df$DateTime,df$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')

dev.copy(png,file="plot4.png")
dev.off()

