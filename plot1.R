powerConsumption_ALL <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".")
powerConsumption_ALL$Date <- as.Date(powerConsumption_ALL$Date, format="%d/%m/%Y")



powerConsumptionSubset <- powerConsumption_ALL[(powerConsumption_ALL$Date=="2007-02-01") | (powerConsumption_ALL$Date=="2007-02-02"), ]

globalActivePower <- as.numeric(as.character(powerConsumptionSubset$Global_active_power))


hist(globalActivePower, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power", breaks=12, ylim=c(0,1200))

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()