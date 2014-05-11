#Load the data
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#Subset
dt$Date <- as.Date(dt$Date, format='%d/%m/%Y')
sub_dt <- subset(dt, (dt$Date == '2007-02-01')|(dt$Date == '2007-02-02'))
#Transfrom the data format
time <- paste(sub_dt$Date, sub_dt$Time)
time <- strptime(time, format="%Y-%m-%d %H:%M:%S")
names <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
Sub_metering_1 <- as.numeric(as.character(sub_dt$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(sub_dt$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(sub_dt$Sub_metering_3))
#Draw the plot
Sys.setlocale(category = "LC_ALL", locale = "C")
plot(time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(time,Sub_metering_2, col = "red")
lines(time,Sub_metering_3, col = "blue")
legend("topright",legend = names, lty =1, col = c("black", "red", "blue"))
