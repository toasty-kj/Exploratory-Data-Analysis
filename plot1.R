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
hist(x = household_power_200702$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
#copy the graphic contents of current device to png file
dev.copy(png, file = "plot1.png")
#close the graphic device 
dev.off()