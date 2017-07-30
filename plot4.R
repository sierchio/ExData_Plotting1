
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

## load in all relevant data
globalactivepower <- as.numeric(sub_data$Global_active_power)
Sub_metering_1 <- as.numeric(sub_data$Sub_metering_1)
Sub_metering_2 <- as.numeric(sub_data$Sub_metering_2)
Sub_metering_3 <- as.numeric(sub_data$Sub_metering_3)
Voltage <- as.numeric(sub_data$Voltage)
Global_reactive_power <- as.numeric(sub_data$Global_reactive_power)

## We need the png to be the size specified in the instructions
png("plot4.png", width=480, height=480)

## Use par to layout a 2x2 grid of plots
par(mfrow=c(2,2))

# make the plots
plot(exacttime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(exacctime, Voltage, type="l", xlab = "datetime", ylab = "Voltage")

plot(exacttime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(exacttime,Sub_metering_2,type="l",col="red")
lines(exacttime,Sub_metering_3,type="l",col="blue")
legendstring <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legendstring, lty=1, col=c("black", "red", "blue"))

plot(exacttime,Global_reactive_power, type ="l", xlab = "datetime", ylab = "Global_reactive_power")

## turn device off
dev.off()