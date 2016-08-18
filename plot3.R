alldata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE , dec = ".")

sdata <- subset(alldata, alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007")
sdata$Global_active_power <- as.numeric(sdata$Global_active_power)


datetime <- strptime(paste(sdata$Date, sdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sdata$Sub_metering_1 = as.numeric(sdata$Sub_metering_1)
sdata$Sub_metering_2 = as.numeric(sdata$Sub_metering_2)
sdata$Sub_metering_3 = as.numeric(sdata$Sub_metering_3)

png("plot3.png",width = 480, height = 480)
plot(datetime, sdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,sdata$Sub_metering_2, type = "l", col = "red")
lines(datetime,sdata$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd =2,col = c("black","red","blue"))
dev.off()



