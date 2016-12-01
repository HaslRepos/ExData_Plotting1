library(dplyr)

# Load data file into data frame
df <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert Date/Time string to POSIXct - create new DateTime column in data frame
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# Filter data frame for period from 1/2/2007 to 2/2/2007
df.f <- filter(df, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Open channel to PNG file
png(filename="./plot3.png", width = 480, height = 480, units = "px")

# Create diagram
plot(df.f$DateTime, df.f$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
points(df.f$DateTime, df.f$Sub_metering_2, col = "red", type = "l")
points(df.f$DateTime, df.f$Sub_metering_3, col = "blue", type = "l")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex=1)

# Close channel to PNG file
dev.off()
