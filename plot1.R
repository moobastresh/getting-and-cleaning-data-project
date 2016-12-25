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

## generate figure 1
png(filename = "/Users/yz/Desktop/data science John Hopkins/exploratory data analysis/week1/plot_1.png",
    width = 480, height = 480, units = "px")
hist(d1, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#dev.copy(png, file="/Users/yz/Desktop/data science John Hopkins/exploratory data analysis/week1/plot_1.png")
dev.off()