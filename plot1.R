datafile = file("household_power_consumption.txt")
datatbl <- read.table(text = grep("^[1,2]/2/2007", readLines(datafile), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# Converting to date and time
datatbl$DateTime <- strptime(paste(datatbl$Date,datatbl$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
datatbl$Date <- as.Date(datatbl$Date,format="%d/%m/%Y")

# Generating Plot1
png(filename = "plot1.png", height=480, width=480)

hist(datatbl$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()
