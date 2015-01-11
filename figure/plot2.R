data <- read.table("household_power_consumption.txt", header=T, sep=";", na.string="?", dec = ".", colClasses=c("character","character",rep("numeric",5)))
filtered_data<- subset(data,Date=="1/2/2007" | Date=="2/2/2007")
filtered_data$Date <- paste(filtered_data$Date, filtered_data$Time)
filtered_data$Date<-strptime(filtered_data$Date, "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "C") #because i am on Gentoo in non English country

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(filtered_data$Date,filtered_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()