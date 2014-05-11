#Load the data
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#Subset
dt$Date <- as.Date(dt$Date, format='%d/%m/%Y')
sub_dt <- subset(dt, (dt$Date == '2007-02-01')|(dt$Date == '2007-02-02'))
#Transfrom the data format
sub_dt$Global_active_power <- as.numeric(as.character(sub_dt$Global_active_power))
#Draw the plot
Sys.setlocale(category = "LC_ALL", locale = "C")
hist(sub_dt$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col='red')
