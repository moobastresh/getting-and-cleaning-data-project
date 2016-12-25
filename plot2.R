# generate figure 2
png(filename = "/Users/yz/Desktop/data science John Hopkins/exploratory data analysis/week1/plot_2.png",
    width = 480, height = 480, units = "px")
dates<-as.character(data1$Date)
times<-as.character(data1$Time)
x<-paste(dates, times)
y<-strptime(x, "%d/%m/%Y %H:%M:%S")
plot(y,d1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()