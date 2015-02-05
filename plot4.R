# Not very happy with reading the entire dataset, but it will do for now. Using the system command 'grep' is not system-independent, sadly
allData <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,na.string="?",header=TRUE)
# Subset data based on our two specific dates
febData <- subset(allData,Date == "1/2/2007" | Date == "2/2/2007")
# Tidy up
rm(allData)
# Convert "Date" and "Time" into a datetime object
febData$dateTime <- strptime(paste(febData[,"Date"],febData[,"Time"]),format="%d/%m/%Y %H:%M:%S")
# Initiate output file
png("plot4.png",width=480,height=480,units="px")

par(mfcol=c(2,2))
# Top left
pl1 <- plot(febData$dateTime,febData$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power") 
pl1
# Bottom left
pl2 <- plot(febData$dateTime,febData$Sub_metering_1,type="l",main="",xlab="",ylab="Energy sub metering")
pl2 <- lines(febData$dateTime,febData$Sub_metering_2,col="red")
pl2 <- lines(febData$dateTime,febData$Sub_metering_3,col="blue")
pl2 <- legend("topright",names(febData)[7:9],col=c("black","red","blue"),lty=1,bty="n")
pl2
# Top right
pl3 <- plot(febData$dateTime,febData$Voltage,type="l",main="",xlab="datetime",ylab="Voltage")
pl3
# Bottom right
pl4 <- plot(febData$dateTime,febData$Global_reactive_power,type="l",main="",xlab="datetime",ylab="Global_reactive_power") 
pl4
dev.off()

