setwd("D:/dir1/data scientist/exploratory data analysis/project1/new")
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)



#create a histogram and Saving to file
png("plot3.png", width=480, height=480)

with(sub_data,{plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~Datetime, col="red")
lines(Sub_metering_3~Datetime, col="blue")

})
legend("topright", lty=1, lwd=2, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

