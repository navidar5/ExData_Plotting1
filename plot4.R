data1 <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
data2<- read.table('household_power_consumption.txt', skip = 2, header = FALSE, sep =';')
colnames( data2 ) <- unlist(data1)
data<-subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))


plot(1:nrow(data),as.numeric(data$Global_active_power),type='l', xlab="",ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1,at = c(1,1440,2880), labels=c('Thu','Fri','Sat'))


plot(1:nrow(data),data$Voltage,type='l', xlab="datetime",ylab="Voltage",xaxt="n")
axis(1,at = c(1,1440,2880), labels=c('Thu','Fri','Sat'))


plot(1:nrow(data),data$Sub_metering_1,type='l',xlab='',ylab='Energy Submetering',xaxt="n")
axis(1,at = c(1,1440,2880), labels=c('Thu','Fri','Sat'))
lines(1:nrow(data),as.numeric(data$Sub_metering_2),col='red')
lines(1:nrow(data),as.numeric(data$Sub_metering_3),col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1,lwd=2.3,bty='n',cex=0.6)


plot(1:nrow(data),data$Global_reactive_power,type='l', xlab="datetime",ylab="Global_reactive_power",xaxt="n")
axis(1,at = c(1,1440,2880), labels=c('Thu','Fri','Sat'))

dev.off()
