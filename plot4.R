hpc<-read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,na.string = '?');
hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")
hpc_feb<-hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

hpc_feb$Global_active_power<-as.numeric(hpc_feb$Global_active_power)
hpc_feb$Voltage<-as.numeric(hpc_feb$Voltage)
hpc_feb$Sub_metering_1<-as.numeric(hpc_feb$Sub_metering_1)
hpc_feb$Sub_metering_2<-as.numeric(hpc_feb$Sub_metering_2)
hpc_feb$Sub_metering_3<-as.numeric(hpc_feb$Sub_metering_3)
hpc_feb$Global_reactive_power<-as.numeric(hpc_feb$Global_reactive_power)
Datetime<-paste(hpc_feb$Date,hpc_feb$Time)
hpc_feb$Datetime <- strptime(Datetime,format = "%Y-%m-%d %H:%M:%S",tz = "")

png(filename = "plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))

plot(hpc_feb$Datetime, hpc_feb$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")

plot(hpc_feb$Datetime, hpc_feb$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

plot(hpc_feb$Datetime, hpc_feb$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(hpc_feb$Datetime, hpc_feb$Sub_metering_2,col = "red")
lines(hpc_feb$Datetime, hpc_feb$Sub_metering_3,col = "blue")
legend("topright", lwd = "1",lty = "solid", col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

plot(hpc_feb$Datetime,hpc_feb$Global_reactive_power,type = "l",xlab = "datetime", ylab = "Global_reactive_power")
dev.off()