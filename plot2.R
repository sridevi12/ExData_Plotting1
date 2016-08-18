alldata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE , dec = ".")

sdata <- subset(alldata, alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007")
sdata$Global_active_power <- as.numeric(sdata$Global_active_power)


datetime <- strptime(paste(sdata$Date, sdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png",width = 480, height = 480)
plot(datetime, sdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
