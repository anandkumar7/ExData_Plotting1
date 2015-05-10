##plot 4

## read the data for only two dates by using sqldf library
power_consumption_data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007","2/2/2007")',sep=";")

## add a datetime column in the dataset
## the paste function paste the Date and Time columns together from power_consumption_data dataset
## then using the lubridate function dmy_hms to convert to datetime format
## finally added that as datetime column in the power_consumption_data dataset

power_consumption_data$datetime <- dmy_hms(paste(power_consumption_data[,1],power_consumption_data[,2],sep =" "))

##create the plot2
## This is a line plot where type = l

##create 4 plots in a matrix of 2 rows by 2 cols
##set the plot positions
par(mfrow = c(2,2))

##draw the 4 plots
with (power_consumption_data, {

	## plot1
	plot(power_consumption_data$datetime,
	power_consumption_data$Global_active_power,
	type="l",
	ylab = "Global Active Power",
	xlab = "" )

	##plot2
	plot(power_consumption_data$datetime,
	power_consumption_data$Voltage,
	type="l",
	ylab = "Voltage",
	xlab = "datetime" )

	##plot3
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
	lty = c(1,1,1), col = c("black","red","blue"),bty="n")

	##plot4
	plot(power_consumption_data$datetime,
	power_consumption_data$Global_reactive_power,
	type="l",
	ylab = "Global_reactive_power",
	xlab = "datetime" )
	
})

## copy to PNG file device
dev.copy (png, file="plot4.png")
dev.off()
