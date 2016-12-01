library(dplyr)

# Load data file into data frame
df <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert Date/Time string to POSIXct - create new DateTime column in data frame
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# Filter data frame for period from 1/2/2007 to 2/2/2007
df.f <- filter(df, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Open channel to PNG file
png(filename="./plot2.png", width = 480, height = 480, units = "px")

# Create diagram
plot(df.f$DateTime, df.f$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# Close channel to PNG file
dev.off()
