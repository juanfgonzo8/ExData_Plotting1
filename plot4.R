##Script to generate the third plot by juanfgonzo8

#The unzipped dataset must be in the working directory for the code to run

#The data from the two dates required is loaded using read.table and subset
data <- subset(read.table(file = "household_power_consumption.txt", sep = ";",
                          header = TRUE, na.strings = "?",
                          colClasses = c("character","character","numeric",
                                         "numeric","numeric","numeric",
                                         "numeric","numeric","numeric")),
               (Date == "1/2/2007" | Date == "2/2/2007"))
#The two date time columns are coverted to Date/Time formats
data$Time <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#The PNG file device is initialized
png(filename = "plot4.png", width = 480, height = 480)
#The graph layout is set
par(mfcol = c(2,2))
#The first plot is created
plot(data$Time, data$Global_active_power, type = "n", xlab = "",
     ylab = "Global Active power (kilowatts)")
#The line is added
lines(data$Time, data$Global_active_power)
#The second plot is created
plot(data$Time, data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy Sub Metering")
#The lines are added
lines(data$Time, data$Sub_metering_1)
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
#The legend is added
legend("topright", col = c("black","red","blue"),
       lty = c("solid","solid","solid"),
       legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"))
#The third plot is created
plot(data$Time, data$Voltage, type = "n", xlab = "datetime",
     ylab = "Voltage")
#The line is added
lines(data$Time, data$Voltage)
#The fourth plot is created
plot(data$Time, data$Global_reactive_power, type = "n", xlab = "datetime",
     ylab = "Global Reactive Power")
#The line is added
lines(data$Time, data$Global_reactive_power)
#The deviced is closed
dev.off()