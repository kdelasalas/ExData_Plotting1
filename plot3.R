## reading the data to R
file <- 'household_power_consumption.txt'
data <- read.table(file, sep = ';', header = TRUE, na.strings = '?')
## filtering data based on required dates
data <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')
## setting up the datetime column
data$DateTime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
## setting up the plot
png('plot3.png', width = 480, height = 480)
## generating the plot
plot(data$DateTime, data$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty = 1)
dev.off()