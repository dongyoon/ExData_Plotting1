#Load the data
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#Subset
dt$Date <- as.Date(dt$Date, format='%d/%m/%Y')
sub_dt <- subset(dt, (dt$Date == '2007-02-01')|(dt$Date == '2007-02-02'))
#Transform the data format
time <- paste(sub_dt$Date, sub_dt$Time)
time <- strptime(time, format="%Y-%m-%d %H:%M:%S")
sub_dt$Global_active_power <- as.numeric(as.character(sub_dt$Global_active_power))
#Draw the plot
Sys.setlocale(category = "LC_ALL", locale = "C")
plot(time,sub_dt$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")
