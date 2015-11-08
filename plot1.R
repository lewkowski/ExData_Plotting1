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
png(filename = "plot1.png")

# Draw the required histogram of Global Active Power
hist(target_dataset$Global_active_power, col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# Close the png file
dev.off()

