#Setting the working dir.
setwd("C:/Users/Ocs/Documents/Coursera/EDA_CP1")
#Getting all data
databig <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#Subsetting for the two days
data<-databig[(databig$Date=="1/2/2007" | databig$Date=="2/2/2007"),]
remove(databig)
#Altering setting, because R used the day stamps of my country
Sys.setlocale("LC_TIME", "English")
#Constructing date-time variable
data$DT<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
#Opening .png device
png(file="plot4.png", width=480, height=480,  bg = "transparent")
#Making the plot
#Setting 2*2 plot spaces
par(mfrow=c(2,2))
#plot1 (1,1)
plot(data$DT,data$Global_active_power, type="n", xlab = "", ylab ="Global Active Power (kilowatts)")
lines(data$DT,data$Global_active_power)
#plot2 (1,2)
plot(data$DT,data$Voltage, type="n", xlab = "datetime", ylab ="Voltage")
lines(data$DT,data$Voltage)
#plot3 (2,1)
plot(data$DT,data$Sub_metering_1, type="n", xlab = "", ylab ="Energy sub metering")
lines(data$DT,data$Sub_metering_1, col="black")
lines(data$DT,data$Sub_metering_2, col="red")
lines(data$DT,data$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"))
#plot4 (2,2)
plot(data$DT,data$Global_reactive_power, type="n", xlab = "datetime", ylab ="Global_reactive_power")
lines(data$DT,data$Global_reactive_power)
#Shutting down device
dev.off()