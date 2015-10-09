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
png(file="plot2.png", width=480, height=480,  bg = "transparent")
#Making the plot
plot(data$DT,data$Global_active_power, type="n", xlab = "", ylab ="Global Active Power (kilowatts)")
lines(data$DT,data$Global_active_power)
dev.off()


