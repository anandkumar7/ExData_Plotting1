##plot3

## read the data for only two dates by using sqldf library
power_consumption_data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007","2/2/2007")',sep=";")

## add a datetime column in the dataset
## the paste function paste the Date and Time columns together from power_consumption_data dataset
## then using the lubridate function dmy_hms to convert to datetime format
## finally added that as datetime column in the power_consumption_data dataset

power_consumption_data$datetime <- dmy_hms(paste(power_consumption_data[,1],power_consumption_data[,2],sep =" "))

##create the plot3
## This is a line plot where type = l

# get the range for the x and y axis
xrange <- range(power_consumption_data$datetime)
yrange <- range(power_consumption_data$Sub_metering_1)

# set up the plot
plot(xrange, yrange, type="n", xlab="",
   ylab="Energy sub metering" )


# add lines
for (i in 1:3) {
	if (i==1) {
  		lines(power_consumption_data$datetime, power_consumption_data$Sub_metering_1, type="l")		
	}
	else if (i==2) {
		lines(power_consumption_data$datetime, power_consumption_data$Sub_metering_2, type="l",
		col="red")		
	}
	else if (i ==3) {
		lines(power_consumption_data$datetime, power_consumption_data$Sub_metering_3, type="l",
		col = "blue")		
	}
}

# add a legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
lty = c(1,1,1), col = c("black","red","blue"))

## copy to PNG file device
dev.copy (png, file="plot3.png")
dev.off()