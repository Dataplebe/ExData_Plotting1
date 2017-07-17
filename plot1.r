## plot1.R

## read in table and subset for Feb 1, 2007, and Feb 2, 2007
df <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, stringsAsFactors=FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

## change graphic device to PNG, default settings are 480 x 480
png(filename = "plot1.png")

## histogram of Global_active power, set color, x label, and title
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()