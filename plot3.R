hpc<-read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,na.string = '?');
hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")
hpc_feb<-hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc_feb$Sub_metering_1<-as.numeric(hpc_feb$Sub_metering_1)
hpc_feb$Sub_metering_2<-as.numeric(hpc_feb$Sub_metering_2)
hpc_feb$Sub_metering_3<-as.numeric(hpc_feb$Sub_metering_3)
Datetime<-paste(hpc_feb$Date,hpc_feb$Time)
hpc_feb$Datetime <- strptime(Datetime,format = "%Y-%m-%d %H:%M:%S",tz = "")
png(filename = "plot3.png",width = 480,height = 480)
plot(hpc_feb$Datetime, hpc_feb$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(hpc_feb$Datetime, hpc_feb$Sub_metering_2,col = "red")
lines(hpc_feb$Datetime, hpc_feb$Sub_metering_3,col = "blue")
legend("topright", lty = "solid", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()