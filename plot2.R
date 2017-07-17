##plot2.R

## load dplyr package for filter() function
library(dplyr)

## read in table and subset for Feb 1, 2007, and Feb 2, 2007
df <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, stringsAsFactors=FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
## combine Date and Time columns and format as a POSIXlt class
df$Date <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")
## remove the redundant Time column
df$Tiime <- NULL

## change graphic device to PNG, default settings are 480 x 480
png(filename = "plot2.png")

## plot Global_active_power v Date as lines and label y and x
plot(df$Date, df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)

## close graphical device
dev.off()
