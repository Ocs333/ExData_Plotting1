#Setting the working dir.
setwd("C:/Users/Ocs/Documents/Coursera/EDA_CP1")
#Getting all data
databig <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#Subsetting for the two days
data<-databig[(databig$Date=="1/2/2007" | databig$Date=="2/2/2007"),]
remove(databig)
#Opening .png device
png(file="plot1.png", width=480, height=480,  bg = "transparent")
#Making the plot
hist(data$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)", main="Global Active Power")
#Shutting down device
dev.off()

