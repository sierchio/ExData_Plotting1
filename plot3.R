
## set working directory, download data and read in data
setwd("/users/jen/R_Programming")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "electricpower.zip", method = "curl")
unzip("electricpower.zip")
full_data <- read.delim("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

## we need to extract the data between Feb 1 2007 and Feb 2 2007 as directed in the instructions
sub_data <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]

## structure date and time properly
## have to concatenate the date and time strings with paste
exacttime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## populate submetering variables
Sub_metering_1 <- as.numeric(sub_data$Sub_metering_1)
Sub_metering_2 <- as.numeric(sub_data$Sub_metering_2)
Sub_metering_3 <- as.numeric(sub_data$Sub_metering_3)

## We need the png to be the size specified in the instructions
png("plot3.png", width=480, height=480)

plot(exacttime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(exacttime,Sub_metering_2,type="l",col="red")
lines(exacttime,Sub_metering_3,type="l",col="blue")
legendstring <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legendstring, lty=1, col=c("black", "red", "blue"))

## turn device off
dev.off()
