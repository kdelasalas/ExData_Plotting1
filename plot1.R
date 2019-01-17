## reading the data to R
file <- 'household_power_consumption.txt'
data <- read.table(file, sep = ';', header = TRUE, na.strings = '?')
## filtering data based on required dates
data <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')
## setting the plot
png('plot1.png', width = 480, height = 480)
## generating the plot
hist(data$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()