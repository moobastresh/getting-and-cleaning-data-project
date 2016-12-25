## generate figure 3
z1<-as.numeric(paste0(data1$Sub_metering_1))
z2<-as.numeric(paste0(data1$Sub_metering_2))
z3<-as.numeric(paste0(data1$Sub_metering_3))

png(filename = "/Users/yz/Desktop/data science John Hopkins/exploratory data analysis/week1/plot_3.png",
    width = 480, height = 480, units = "px")
plot(y,z1,type="l",col="black", ylim=range(0:40), xlab="", ylab="Energy sub metering")
par(new=TRUE)
plot(y,z2,type="l",col="red", axes=FALSE, xlab="", ylab="", ylim=range(0:40))
par(new=TRUE)
plot(y,z3,type="l",col="blue", axes=FALSE, xlab="", ylab="", ylim=range(0:40))
legend("topright","sub_metering_1",lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
par(new=FALSE)
dev.off()