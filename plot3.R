setwd("D:/Program Files/RStudio/datasets")
if(!file.exists('data')) dir.create('data')
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = './data/assignment1.zip')
unzip('./data/assignment1.zip', exdir = './data')

assignment1<- read.table(text = grep("^[1,2]/2/2007",readLines(file('./data/household_power_consumption.txt')),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

assignment1$Date <- as.Date(assignment1$Date, format = '%d/%m/%Y')
assignment1$DT <- as.POSIXct(paste(assignment1$Date, assignment1$Time))

png(filename="plot3.png",width=480,height=480,units="px")
plot(assignment1$DT,assignment1$Sub_metering_1,ylab="Energy sub metering",type="l",col="black",xlab="")
lines(assignment1$DT,assignment1$Sub_metering_2,col="red")
lines(assignment1$DT,assignment1$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_1"),col=c("black","red","blue"),lwd=1)
dev.off()