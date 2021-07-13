library(lubridate)
library(data.table)
#download zip file and unzip
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path = getwd()
download.file(url, file.path(path, "Electric power consumption.zip"))
unzip(zipfile = "Electric power consumption.zip")
#read file
household_power_200702 <- fread(file.path(path, "household_power_consumption.txt"))
#convert into POSIXct
household_power_200702$dateTime <- as.POSIXct(paste(household_power_200702$Date, 
                                                    household_power_200702$Time), format = "%d/%m/%Y %H:%M:%S")
#filter data only in 2007-02-01 ~ 2007-02-02
household_power_200702 <- household_power_200702[dateTime >= "2007-02-01" 
                                                 & dateTime < "2007-02-03"]
#plot data
plot(x = household_power_200702$dateTime, y = household_power_200702$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
#copy the graphic contents of current device to png file
dev.copy(png, file = "plot2.png")
#close the graphic device 
dev.off()
