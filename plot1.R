setwd("D:/Program Files/RStudio/datasets")
if(!file.exists('data')) dir.create('data')
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = './data/assignment1.zip')
unzip('./data/assignment1.zip', exdir = './data')

assignment1<- read.table(text = grep("^[1,2]/2/2007",readLines(file('./data/household_power_consumption.txt')),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

png(filename="plot1.png",width=480,height=480,units="px")
with(assignment1,hist((Global_active_power),xlab="Global Active Power(kilowatts)",main="Global Active Power",col="red"))
dev.off()

