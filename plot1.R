
## set working directory, download data and read in data
setwd("/users/jen/R_Programming")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "electricpower.zip", method = "curl")
unzip("electricpower.zip")
full_data <- read.delim("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

## we need to extract the data between Feb 1 2007 and Feb 2 2007 as directed in the instructions
sub_data <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]

## We can only create a histogram on numeric data
globalactivepower <- as.numeric(sub_data$Global_active_power)

## We need the png to be the size specified in the instructions
png("plot1.png", width=480, height=480)

## We need the bars to be red, the title and the x label
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## turn png device off
dev.off()