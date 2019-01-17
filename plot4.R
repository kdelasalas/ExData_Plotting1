## reading the data to R
file <- 'household_power_consumption.txt'
data <- read.table(file, sep = ';', header = TRUE, na.strings = '?')
## filtering the data based on required dates
data <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')
## setting up the datetime column
data$DateTime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
## setting up the plot structure
png('plot4.png', width = 480, height = 480)
par(mfcol = c(2,2))
## generating the plots
## plot1
plot(data$DateTime, data$Global_active_power, type = 's', xlab = '', 
     ylab = 'Global Active Power (kilowatts)')
## plot2
plot(data$DateTime, data$Sub_metering_1, type = 's', xlab = '', ylab = 'Energy sub metering')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty = 1, bty = 'n')
## plot3
plot(data$DateTime, data$Voltage, type = 's', xlab = 'datetime', 
     ylab = 'Voltage')
## plot4
plot(data$DateTime, data$Global_reactive_power, type = 'l', xlab = 'datetime', 
     ylab = 'Global_reactive_power')
dev.off()