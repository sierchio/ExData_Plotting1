
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

## We can only create the plot on numeric data
globalactivepower <- as.numeric(sub_data$Global_active_power)

## We need the png to be the size specified in the instructions
png("plot2.png", width=480, height=480)

plot(exacttime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## turn device off
dev.off()