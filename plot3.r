
#Read data
household_power_consumption <- read.csv("C:/Users/rloudon86/Desktop/R/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",header=T,na.strings="?")
data<-household_power_consumption 

#subset data to 2/1/2007 and 2/2/2007
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#head(data)
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
#head(data)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plot 3
png("plot3.png", height=480, width=480)
plot(data$Sub_metering_1 ~ data$Datetime, type="l",ylab="Energy sub metering", xlab="",col="black")
lines(data$Sub_metering_2 ~ data$Datetime,col='Red')
lines(data$Sub_metering_3 ~ data$Datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#finish PNG
dev.off()
