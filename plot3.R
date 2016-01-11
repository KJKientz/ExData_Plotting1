powerConsumption_ALL <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
powerConsumption_ALL$Date <- as.Date(powerConsumption_ALL$Date, format="%d/%m/%Y")

powerConsumptionSubset <- powerConsumption_ALL[(powerConsumption_ALL$Date=="2007-02-01") | (powerConsumption_ALL$Date=="2007-02-02"), ]


dateandtime <- paste(as.Date(powerConsumptionSubset$Date), powerConsumptionSubset$Time)
powerConsumptionSubset$dateTime <- as.POSIXct(dateandtime)


powerConsumptionSubset$Sub_metering_1 <- as.numeric(as.character(powerConsumptionSubset$Sub_metering_1))
powerConsumptionSubset$Sub_metering_2 <- as.numeric(as.character(powerConsumptionSubset$Sub_metering_2))
powerConsumptionSubset$Sub_metering_3 <- as.numeric(as.character(powerConsumptionSubset$Sub_metering_3))

with(powerConsumptionSubset, {
	plot(Sub_metering_1~dateTime, type="l", xlab="", ylab="Energy sub metering")
	lines(Sub_metering_2~dateTime, col="Red")
	lines(Sub_metering_3~dateTime, col="Blue")

} )
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


