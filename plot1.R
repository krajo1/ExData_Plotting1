data <- read.table("household_power_consumption.txt", header=T, sep=";", na.string="?", dec = ".", colClasses=c("character","character",rep("numeric",5)))
filtered_data<- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(filtered_data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()