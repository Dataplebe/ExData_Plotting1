##plot4.r

## load dplyr package for filter() function
library(dplyr)

## read in table and subset for Feb 1, 2007, and Feb 2, 2007
df <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, stringsAsFactors=FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

## combine Date and Time columns and format as a POSIXlt class
df$Date <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

## remove the redundant Time column
df$Tiime <- NULL

## change graphic device to PNG, default settings are 480 x 480
png(filename = "plot4.png")

## set parameters to print plots in a 2 x 2 square, shorten the margins slightly
par(mfrow = c(2,2), mar=c(4, 4, 2, 1))

## plot Global Active Power v Date with lines of size 2 in top left spot
plot(df$Date, df$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power", lwd = 2)

## plot Voltage v Date with lines of size 2 in top right slow
plot(df$Date, df$Voltage, type="l", xlab="datetime", ylab="Voltage", lwd=2)

## create the plot for Sub_metering v Date and set labels in bottom left slot
plot(df$Date, df$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = NA)

## create first line of Sub_metering_1
lines(df$Date, df$Sub_metering_1)

## create second line of Sub_metering_2, change color to red
lines(df$Date, df$Sub_metering_2, col = "red")

## create third line of Sub_metering_3, change color to blue
lines(df$Date, df$Sub_metering_3, col = "blue")

## create legend for the plot, remove the border line for the legend
legend("topright", legend = names(df[6:8]), lwd = 1, col = c("black", "red", "blue"), bty="n")

## plot Global_reactive_power v Date with lines of size 2 in bottom right
plot(df$Date, df$Global_reactive_power, lwd=2, type = "l", xlab="datetime", ylab="Global_reactive_power")

## close graphical device
dev.off()
