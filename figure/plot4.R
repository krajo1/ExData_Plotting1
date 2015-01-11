data <- read.table("household_power_consumption.txt", header=T, sep=";", na.string="?", dec = ".", colClasses=c("character","character",rep("numeric",5)))
filtered_data<- subset(data,Date=="1/2/2007" | Date=="2/2/2007")
filtered_data$Date <- paste(filtered_data$Date, filtered_data$Time)
filtered_data$Date<-strptime(filtered_data$Date, "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "C") #because i am on Gentoo in non English country

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))

plot(filtered_data$Date,filtered_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(filtered_data$Date,filtered_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines (filtered_data$Date,filtered_data$Sub_metering_2, col="red")
lines (filtered_data$Date,filtered_data$Sub_metering_3, col="blue")
legend("topright", legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1)

plot(filtered_data$Date,filtered_data$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(filtered_data$Date,filtered_data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()