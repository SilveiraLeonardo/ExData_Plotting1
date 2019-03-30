########## ASSIGNMENT 1 - EXPLORATORY DATA ANALYSIS

# PLOT ONE

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

# creating the histogram of the Global Active Power
with(filtered, hist(Global_active_power, col = "red", main = "Global Active Power", 
                    xlab = "Global Active Power (kilowatts)"))
     
# copy the plot we just created to a png file named plot1.png
dev.copy(png, file = "plot1.png")
dev.off() #close the png device