data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data$Time <- strptime(paste(data$Date, data$Time), format="%F %T") #same as %H:%M:%S


png("plot4.png")
par( mfrow=c(2,2) )
plot(data$Time, as.numeric(as.character(data$Global_active_power)), type="l", ylab="Global Active Power", xlab="")
plot(data$Time, as.numeric(as.character(data$Voltage)), ylab="Voltage", xlab="datetime", type="l")
plot(data$Time, as.numeric(as.character(data$Sub_metering_1)), ylab="Energy sub metering", xlab="", type="l")
lines(data$Time, as.numeric(as.character(data$Sub_metering_2)), col="blue")
lines(data$Time, as.numeric(as.character(data$Sub_metering_3)), col="red")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","blue","red"), bty="n")
plot(data$Time, as.numeric(as.character(data$Global_reactive_power)), ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()
