datafile = file("household_power_consumption.txt")
datatbl <- read.table(text = grep("^[1,2]/2/2007", readLines(datafile), value = TRUE), 
                    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                      "Voltage", "Global_intensity", 
                      "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                    sep = ";", header = TRUE)

# Converting to date and time
datatbl$DateTime <- strptime(paste(datatbl$Date,datatbl$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
datatbl$Date <- as.Date(datatbl$Date,format="%d/%m/%Y")

# Generating plot4
png(filename = "plot4.png", height=480, width=480)

par(mfcol=c(2,2))

#subplot 1,1
with(datatbl,plot(y=Global_active_power,x=DateTime, type = "n",xlab ="", ylab="Global Active Power (kilowatts)"))
with(datatbl,lines(y=Global_active_power,x=DateTime))

#subplot 2,1

with(datatbl,plot(y=Sub_metering_1,x=DateTime, type = "n",xlab ="", ylab="Energy sub metering"))
with(datatbl,lines(y=Sub_metering_1,x=DateTime,col="black"))
with(datatbl,lines(y=Sub_metering_2,x=DateTime,col="red"))
with(datatbl,lines(y=Sub_metering_3,x=DateTime,col="blue"))
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#subplot 1,2

with(datatbl,plot(y=Voltage,x=DateTime,type = "n" ))
with(datatbl,lines(y=Voltage,x=DateTime,col="black"))

#subplot 2,2

with(datatbl,plot(y=Global_reactive_power,x=DateTime, type = "n" ,ylab = "Globle_reactive_power"))
with(datatbl,lines(y=Global_reactive_power,x=DateTime,col="black"))
dev.off()
