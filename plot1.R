data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data$Time <- strptime(paste(data$Date, data$Time), format="%F %T") #same as %H:%M:%S

par(mfrow=c(1,1))

png("plot1.png")
hist(as.numeric(as.character(data$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

