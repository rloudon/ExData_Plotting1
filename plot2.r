
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

# Plot 2
png("plot2.png", height=480, width=480)
plot(data$Global_active_power ~ data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#finish PNG
dev.off()
