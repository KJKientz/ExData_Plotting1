powerConsumption_ALL <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
powerConsumption_ALL$Date <- as.Date(powerConsumption_ALL$Date, format="%d/%m/%Y")

powerConsumptionSubset <- powerConsumption_ALL[(powerConsumption_ALL$Date=="2007-02-01") | (powerConsumption_ALL$Date=="2007-02-02"), ]

globalActivePower <- as.numeric(as.character(powerConsumptionSubset$Global_active_power))

dateandtime <- paste(as.Date(powerConsumptionSubset$Date), powerConsumptionSubset$Time)
powerConsumptionSubset$dateTime <- as.POSIXct(dateandtime)

powerConsumptionSubset$Sub_metering_1 <- as.numeric(as.character(powerConsumptionSubset$Sub_metering_1))
powerConsumptionSubset$Sub_metering_2 <- as.numeric(as.character(powerConsumptionSubset$Sub_metering_2))
powerConsumptionSubset$Sub_metering_3 <- as.numeric(as.character(powerConsumptionSubset$Sub_metering_3))

par(mfrow=c(2,2))

#plot1
plot(powerConsumptionSubset$Global_active_power~powerConsumptionSubset$dateTime, type="l", ylab = "Global Active Power", xlab="")

#plot2
plot(powerConsumptionSubset$Voltage~powerConsumptionSubset$dateTime, type="l", ylab = "Voltage", xlab= "")

#plot3
with(powerConsumptionSubset, {
	plot(Sub_metering_1~dateTime, type="l", xlab="", ylab="Energy sub metering")
	lines(Sub_metering_2~dateTime, col="Red")
	lines(Sub_metering_3~dateTime, col="Blue")

} )

##plot4
plot(powerConsumptionSubset$Global_reactive_power~powerConsumptionSubset$dateTime, type="l", ylab = "Global_reactive_power", xlab= "")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

