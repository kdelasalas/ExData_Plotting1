## reading the data to R
file <- 'household_power_consumption.txt'
data <- read.table(file, sep = ';', header = TRUE, na.strings = '?')
## filtering data based on required dates
data <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')
## setting up the datetime column
data$DateTime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
## setting up the plot
png('plot2.png', width = 480, height = 480)
## generating the plot
plot(data$DateTime, data$Global_active_power, type = 'l', xlab = '', 
     ylab = 'Global Active Power (kilowatts)')
dev.off()