##Script to generate the second plot by juanfgonzo8

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
png(filename = "plot2.png", width = 480, height = 480)
#The plot is created
plot(data$Time, data$Global_active_power, type = "n", xlab = "",
     ylab = "Global Active power (kilowatts)")
#The line is added
lines(data$Time, data$Global_active_power)
#The deviced is closed
dev.off()