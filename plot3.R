data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data$Time <- strptime(paste(data$Date, data$Time), format="%F %T") #same as %H:%M:%S

par(mfrow=c(1,1))

png("plot3.png")
plot(data$Time, as.numeric(as.character(data$Sub_metering_1)), ylab="Energy sub metering", xlab="", type="l")
lines(data$Time, as.numeric(as.character(data$Sub_metering_2)), col="blue")
lines(data$Time, as.numeric(as.character(data$Sub_metering_3)), col="red")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","blue","red"))
dev.off()

