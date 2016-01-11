powerConsumption_ALL <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
powerConsumption_ALL$Date <- as.Date(powerConsumption_ALL$Date, format="%d/%m/%Y")

powerConsumptionSubset <- powerConsumption_ALL[(powerConsumption_ALL$Date=="2007-02-01") | (powerConsumption_ALL$Date=="2007-02-02"), ]


dateandtime <- paste(as.Date(powerConsumptionSubset$Date), powerConsumptionSubset$Time)
powerConsumptionSubset$dateTime <- as.POSIXct(dateandtime)


plot(powerConsumptionSubset$Global_active_power~powerConsumptionSubset$dateTime, type="l", ylab = "Global Active Power (kilowatts)", xlab= "")


dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


