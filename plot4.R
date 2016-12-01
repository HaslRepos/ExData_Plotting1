library(dplyr)

# Load data file into data frame
df <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert Date/Time string to POSIXct - create new DateTime column in data frame
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# Filter data frame for period from 1/2/2007 to 2/2/2007
df.f <- filter(df, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Open channel to PNG file
png(filename="./plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

# Create diagram 1
plot(df.f$DateTime, df.f$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

# Create diagram 2
plot(df.f$DateTime, df.f$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# Create diagram 3
plot(df.f$DateTime, df.f$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
points(df.f$DateTime, df.f$Sub_metering_2, col = "red", type = "l")
points(df.f$DateTime, df.f$Sub_metering_3, col = "blue", type = "l")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex=.95, bty = "n")

# Create diagram 4
plot(df.f$DateTime, df.f$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

# Close channel to PNG file
dev.off()
