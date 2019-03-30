########## ASSIGNMENT 1 - EXPLORATORY DATA ANALYSIS

# PLOT THREE

#loading necessary packages
library(lubridate)
library(dplyr)

# read the data into R
raw <- read.table("household_power_consumption.txt",head = TRUE, sep = ";", na.strings = "?")

# transforming the column Date to type date using the dmy function from the lubridate package
raw$Date <- dmy(raw$Date)

# transform the column Iime to type date using the hms function from the lubridate package
raw$Time <- hms(raw$Time)

# filtering the data that will be used in the analysis:
# data from the days 2007-02-01 and 2007-02-02
filtered <- filter(raw, Date == dmy("01/02/2007") | Date == dmy("02/02/2007"))

# creating the line graph of the three sub metering measures versus time
with(filtered, {plot(Sub_metering_1, type = "l", xaxt = "n", xlab = "",
                     ylab = "Energy sub metering" )
    lines(Sub_metering_2, col = "red")
    lines(Sub_metering_3, col = "blue")
    axis(1, at = c(0, 1460, 2880), labels=c("Thu","Fri","Sat"))
    legend("topright", lty = 1,col = c("black", "red","blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.width = 900, x.intersp = 1)
    })

# copy the plot we just created to a png file named plot3.png
dev.copy(png, file = "plot3.png")
dev.off() #close the png device 
