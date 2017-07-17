##plot3.r

## load dplyr package for filter() function
library(dplyr)

## read in table and subset for Feb 1, 2007, and Feb 2, 2007
df <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, stringsAsFactors=FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
## combine Date and Time columns and format as a POSIXlt class
df$Date <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")
## remove the redundant Time column
df$Tiime <- NULL

## change graphic device to PNG, default settings are 480 x 480
png(filename = "plot3.png")

## plot Global Active Power v Date with lines of size 2 in top left spot
plot(df$Date, df$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = NA)

## layer lines for Sub_metering_1 through 3 and change successive line colors
lines(df$Date, df$Sub_metering_1)
lines(df$Date, df$Sub_metering_2, col = "red")
lines(df$Date, df$Sub_metering_3, col = "blue")

## add legend to top right
legend("topright", legend = names(df[6:8]), lwd = 1, col = c("black", "red", "blue"))

## close graphical device
dev.off()
