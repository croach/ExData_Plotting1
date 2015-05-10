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

png('plot1.png', width = 480, height = 480)

hist(data$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = 'red')

dev.off()