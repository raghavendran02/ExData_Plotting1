hpc<-read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,na.string = '?');
hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")
hpc_feb<-hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc_feb$Global_active_power<-as.numeric(hpc_feb$Global_active_power)
png(filename = "plot1.png",width = 480,height = 480)
hist(hpc_feb$Global_active_power,col = "Red", xlab = "Global Active Power(Kilowatts)",ylab = "Frequency", main = NULL)
title(main = "Global Active Power")
dev.off()