## read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings='?')

## select subdata with dates 2007-02-01 and 2007-02-02
subdata<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]

## convert to numeric data
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

##convert the Date and Time variables to Date/Time classes 
subdata$Date<-strptime(subdata$Date,"%d/%m/%Y")
subdata$Date<-as.Date(subdata$Date)
datetime<-paste(subdata$Date,subdata$Time)
subdata$Datetime<-as.POSIXct(datatime)

##plot 2
plot(subdata$Datetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## copy figure to a file device
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()