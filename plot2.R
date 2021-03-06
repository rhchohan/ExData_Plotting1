datafile = file("household_power_consumption.txt")
datatbl <- read.table(text = grep("^[1,2]/2/2007", readLines(datafile), value = TRUE), 
                    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                      "Voltage", "Global_intensity", 
                      "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                    sep = ";", header = TRUE)

# Converting to date and time
datatbl$DateTime <- strptime(paste(datatbl$Date,datatbl$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
datatbl$Date <- as.Date(datatbl$Date,format="%d/%m/%Y")

# Generating Plot2
png(filename = "plot2.png", height=480, width=480)

with(datatbl, plot(y=Global_active_power,x=DateTime, type = "n",xlab ="", ylab="Global Active Power (kilowatts)"))
with(datatbl, lines(y=Global_active_power,x=DateTime))

dev.off()
