hpc<-read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,na.string = '?');
hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")
hpc_feb<-hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc_feb$Global_active_power<-as.numeric(hpc_feb$Global_active_power)
Datetime<-paste(hpc_feb$Date,hpc_feb$Time)
hpc_feb$Datetime <- strptime(Datetime,format = "%Y-%m-%d %H:%M:%S",tz = "")
png(filename = "plot2.png",width = 480,height = 480)
plot(hpc_feb$Datetime, hpc_feb$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power(Kilowatts)")
dev.off()