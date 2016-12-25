## reading the data
URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,destfile = "power_consumption.zip", method = "curl")
zipF<-"power_consumption.zip"
outDir<-"./unzipfolder"
unzip(zipF,exdir=outDir)
filenm<-list.files("./unzipfolder")
setwd("./unzipfolder")
data<-read.table(filenm, sep=";", header=TRUE)
data1<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
d1<-as.numeric(paste0(data1$Global_active_power))

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
