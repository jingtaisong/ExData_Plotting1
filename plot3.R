data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";")
## read the data
consumption<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
## take the subset which consists of data on the selected dates
attach(consumption)



num_GlobalActivePower<-as.numeric(as.character(Global_active_power))

num_EnergySubmetering1<-as.numeric(as.character(Sub_metering_1))

num_EnergySubmetering2<-as.numeric(as.character(Sub_metering_2))

num_EnergySubmetering3<-as.numeric(as.character(Sub_metering_3))

num_voltage<-as.numeric(as.character(Voltage))                                   #
# convert the data into numeric classes
num_GlobalReactivePower<-as.numeric(as.character(Global_reactive_power))



date_join_time<-paste(Date,Time)
## convert the information on date and time into POSIXlt class
clean_time<-strptime(date_join_time,format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png")

plot(clean_time,num_EnergySubmetering1,type="l",xlab="",ylab="Energy sub metering")

lines(clean_time,num_EnergySubmetering2,col="red")

lines(clean_time,num_EnergySubmetering3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
## the third plot
dev.off()

detach(consumption)

