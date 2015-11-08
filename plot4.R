# Load libraries used
library(data.table)
library(dplyr)
library(lubridate)

# Raw data file is expected to be in a directory called ./data and a file named ./data/household_power_consumption.txt

# Read in raw data
raw_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"), colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric","numeric" ))
# Subuset the data to date = 2007/02/01 & 2007/02/02, then create a new column with Date_Time
target_dataset <- raw_data %>% 
                    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
                    mutate(Date_Time = parse_date_time(paste(Date, Time, sep = " "), "%d%m%Y %H%M%S"))


# Set the ouput to png
png(filename = "plot4.png")

# Set number of plots to be 2 x 2 matrix
par(mfrow = c(2, 2))

# Plot 1: Draw the required plot of Global Active Power
plot(target_dataset$Date_Time, target_dataset$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

# Plot 2: Draw the required plot of Voltage
plot(target_dataset$Date_Time, target_dataset$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

# Plot 3: Draw the required plot of 3x Sub_metering data
plot(target_dataset$Date_Time, target_dataset$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
points(target_dataset$Date_Time, target_dataset$Sub_metering_2, type = "l", col = "Red")
points(target_dataset$Date_Time, target_dataset$Sub_metering_3, type = "l", col = "Blue")
legend("topright", col = c("Black", "Red", "Blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4: Draw the required plot of Global_reactive_power
plot(target_dataset$Date_Time, target_dataset$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

# Close the png file
dev.off()

