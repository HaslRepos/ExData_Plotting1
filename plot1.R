library(dplyr)

# Load data file into data frame
df <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert Date/Time string to POSIXct - create new DateTime column in data frame
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# Filter data frame for period from 1/2/2007 to 2/2/2007
df.f <- filter(df, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Open channel to PNG file
png(filename="./plot1.png", width = 480, height = 480, units = "px")

# Create Histogram
hist(df.f$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# Close channel to PNG file
dev.off()
