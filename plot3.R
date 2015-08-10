## read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings='?')

## select subdata with dates 2007-02-01 and 2007-02-02
subdata<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]

## convert to numeric data
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

##convert the Date and Time variables to Date/Time classes 
subdata$Date<-strptime(subdata$Date,"%d/%m/%Y")
subdata$Date<-as.Date(subdata$Date)
datetime<-paste(subdata$Date,subdata$Time)
subdata$Datetime<-as.POSIXct(datatime)

##Plot 3
with(subdata, {
    plot(Sub_metering_1~Datetime,  type="l", xlab="", ylab="Energy sub metering")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 
})

## copy figure to a file device
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()