data <- read.csv('data/household_power_consumption.txt', sep=';', 
                 colClasses = c('character', 'character', 'numeric', 
                                'numeric', 'numeric', 'numeric', 'numeric', 
                                'numeric', 'numeric'), 
                 na.strings = "?")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                            format = '%d/%m/%Y %H:%M:%S', 
                            tz = 'GMT')

start <- as.POSIXct('2007-02-01 00:00:00', tz = 'GMT')
end <- as.POSIXct('2007-02-03 00:00:00', tz = 'GMT')

data <- data[data$DateTime >= start & data$DateTime <= end, ]

png('plot3.png', width = 480, height = 480)

with(data, plot(DateTime, Sub_metering_1, type = 'n', ylab = 'Energy sub metering', xlab = ''))
with(data, lines(DateTime, Sub_metering_1, col = 'black'))
with(data, lines(DateTime, Sub_metering_2, col = 'red'))
with(data, lines(DateTime, Sub_metering_3, col = 'blue'))
legend('topright', legend = c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'),
       col = c('black', 'red', 'blue'), 
       lwd = 1)

dev.off()