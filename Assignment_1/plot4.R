x <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) # reading in data

x$Date <- as.Date(x$Date, "%d/%m/%Y") # formatting dates which are in character class to date class


x <- x[x$Date <= as.Date("2007-02-02") & x$Date >= as.Date("2007-02-01"),] # subsetting data


x$Global_active_power = as.numeric(x$Global_active_power) # converting to numeric class

x$Time <- strptime(paste(x$Date, x$Time), format = "%Y-%m-%d %T") # converting to proper time format and class

x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)

x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)

x$Voltage <- as.numeric(x$Voltage)


png("plot4.png", width=480, height=480)


par(mfrow = c(2, 2)) # 2 rows and 2 columns

plot(x$Time, x$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

plot(x = x$Time , y = x$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(x = x$Time, y = x$Sub_metering_1, xlab = "",  ylab = "Energy sub metering", type = "l", ylim = c(0,40))

par(new = TRUE)

plot(x = x$Time, y = x$Sub_metering_2, xlab = "",  ylab = "", type = "l", ylim = c(0,40), axes = FALSE, col = "blue")

par(new = TRUE)

plot(x = x$Time, y = x$Sub_metering_3, xlab = "",  ylab = "", type = "l", ylim = c(0,40), axes = FALSE, col = "red")

legend(x = "topright", col = c("black" , "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lwd = 1, lty = 1)

plot(x = x$Time , y = x$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()