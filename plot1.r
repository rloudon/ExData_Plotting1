#Read data
household_power_consumption <- read.csv("C:/Users/rloudon86/Desktop/R/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",header=T,na.strings="?")
data<-household_power_consumption 

#subset data to 2/1/2007 and 2/2/2007
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#head(data)
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
#head(data)

#Plot 1
png("plot1.png", height=480, width=480)
hist(data$Global_active_power, col = "red",main = "Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")

#finish PNG
dev.off()
