x <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) # reading in data

x$Date <- as.Date(x$Date, "%d/%m/%Y") # formatting dates which are in character class to date class


x <- x[x$Date <= as.Date("2007-02-02") & x$Date >= as.Date("2007-02-01"),] # subsetting data


x$Global_active_power = as.numeric(x$Global_active_power) # converting to numeric class

x$Time <- strptime(paste(x$Date, x$Time), format = "%Y-%m-%d %T") # converting to proper time format and class

x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)

x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)

x$Voltage <- as.numeric(x$Voltage)

png("plot2.png", width=480, height=480)

plot(x$Time, x$Global_active_power, xlab = "",  ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()

