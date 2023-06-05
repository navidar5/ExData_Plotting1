data1 <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
data2<- read.table("household_power_consumption.txt", skip = 2, header = FALSE, sep =';')
colnames( data2 ) <- unlist(data1)
data<-subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

png("plot1.png",width=480, height=480)
hist(as.numeric(data$Global_active_power),col="blue",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()
