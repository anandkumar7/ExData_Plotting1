## read the data for only two dates by using sqldf library
power_consumption_data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007","2/2/2007")',sep=";")

##create the plot1
## This is a histogram plot

hist(power_consumption_data$Global_active_power, 
col="red",main = "Global Active Power",
xlab = "Global Active Power (kilowatts)" )

## copy to PNG file device
dev.copy (png, file="plot1.png")
dev.off()