##plot2.R

df <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, stringsAsFactors=FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
df$Date <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")
df$Tiime <- NULL

png(filename = "plot2.png")
plot(df$Date, df$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = NA)
lines(df$Date, df$Global_active_power)
dev.off()