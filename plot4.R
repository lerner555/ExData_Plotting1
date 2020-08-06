Data <- read.table('household_power_consumption.txt', header = T, stringsAsFactors = F, na.strings = "?", sep = ';', quote = "", skip = 66636, nrows = 2880)

colnames(Data) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage',
                       'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')

Data$DateTime <- strptime(paste(Data$Date, Data$Time), format = '%d/%m/%Y %H:%M:%S')

par(mfrow = c(2, 2)) 

plot(x = Data$DateTime, y = Data$GlobalActivePower, type = 'l', xlab = NA, ylab = 'Global Active Power')

plot(x = Data$DateTime, y = Data$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

plot(x = Data$DateTime, y = Data$SubMetering1, type = 'l',xlab = NA, ylab = 'Energy sub metering')
lines(x = Data$DateTime, y = Data$SubMetering2, col = 'red')
lines(x = Data$DateTime, y = Data$SubMetering3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col = c('black', 'red', 'blue'),lwd = 1, bty = 'n')

plot(x = Data$DateTime, y = Data$GlobalReactivePower, type = 'l',xlab = 'datetime', ylab = 'Global_reactive_power')

dev.copy(png,file="plot4.png")

dev.off()