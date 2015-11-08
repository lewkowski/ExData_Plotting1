# Create directory for the raw data download
if (!file.exists("data"))
{
  dir.create("data")
}

# Download the file from the internet
fileURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filerawlocal <- "./data/data.zip"

# Check if we have file before downloading
if(!file.exists(filerawlocal))
{
  # Download the zip file
  download.file(fileURL, filerawlocal)
  # Unzip the file
  unzip (filerawlocal, exdir = "./data")
}