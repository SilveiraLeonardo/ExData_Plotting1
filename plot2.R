########## ASSIGNMENT 1 - EXPLORATORY DATA ANALYSIS

# PLOT TWO

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

# creating the line graph of the Global Active Power versus time
with(filtered, {plot(Global_active_power, type = "l", xaxt = "n", xlab = "",
                     ylab = "Global Active Power (kilowatts)" )
    axis(1, at = c(0, 1460, 2880), labels=c("Thu","Fri","Sat"))
    })

# copy the plot we just created to a png file named plot2.png
dev.copy(png, file = "plot2.png")
dev.off() #close the png device 
