## generate figure 4
png(filename = "/Users/yz/Desktop/data science John Hopkins/exploratory data analysis/week1/plot_4.png",
    width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
d2<-as.numeric(paste0(data1$Global_reactive_power))
d3<-as.numeric(paste0(data1$Voltage))
plot(y,d1, type="l", xlab="", ylab="Global Active Power")

plot(y,d3, type="l", xlab="datetime", ylab="Voltage")

plot(y,z1,type="l",col="black", ylim=range(0:40), xlab="datetime", ylab="Energy sub metering")
par(new=TRUE)
plot(y,z2,type="l",col="red", axes=FALSE, xlab="", ylab="", ylim=range(0:40))
par(new=TRUE)
plot(y,z3,type="l",col="blue", axes=FALSE, xlab="", ylab="", ylim=range(0:40))
legend("topright","sub_metering_1",lty=c(1,1,1), lwd=c(2,2,2), bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
par(new=FALSE)

plot(y,d2, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()