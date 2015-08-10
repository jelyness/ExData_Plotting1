## read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings='?')

## select subdata with dates 2007-02-01 and 2007-02-02
subdata<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]

## convert to numeric data
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)
subdata$Voltage <- as.numeric(subdata$Voltage)
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

##convert the Date and Time variables to Date/Time classes 
subdata$Date<-strptime(subdata$Date,"%d/%m/%Y")
subdata$Date<-as.Date(subdata$Date)
datetime<-paste(subdata$Date,subdata$Time)
subdata$Datetime<-as.POSIXct(datatime)

##Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subdata, {
    
    plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    
    plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="Datetime")
    
    plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Global_reactive_power~Datetime, type="l", ylab="Global Reactive Power (kilowatts)",xlab="Datetime")
    
})

## copy figure to a file device
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()