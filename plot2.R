## read the data for only two dates by using sqldf library
power_consumption_data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007","2/2/2007")',sep=";")

## add a datetime column in the dataset
## the paste function paste the Date and Time columns together from power_consumption_data dataset
## then using the lubridate function dmy_hms to convert to datetime format
## finally added that as datetime column in the power_consumption_data dataset

power_consumption_data$datetime <- dmy_hms(paste(power_consumption_data[,1],power_consumption_data[,2],sep =" "))

##create the plot2
## This is a line plot where type = l

##with(power_consumption_data, 
plot(power_consumption_data$datetime,
power_consumption_data$Global_active_power,
type="l",
ylab = "Global Active Power (kilowatts)",
xlab = "" )

## copy to PNG file device
dev.copy (png, file="plot2.png")
dev.off()