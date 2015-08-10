## read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings='?')

## select subdata with dates 2007-02-01 and 2007-02-02
subdata<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]

## convert to numeric data
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

##plot 1 histogram
hist(subdata$Global_active_power, xlab = "Global Active Power (kilowatts)", col ="red", main = "Global Active Power")

## copy figure to a file device
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()