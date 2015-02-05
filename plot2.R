# Not very happy with reading the entire dataset, but it will do for now. Using the system command 'grep' is not system-independent, sadly
allData <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,na.string="?",header=TRUE)
# Subset data based on our two specific dates
febData <- subset(allData,Date == "1/2/2007" | Date == "2/2/2007")
# Tidy up
rm(allData)
# Convert "Date" and "Time" into a datetime object
febData$dateTime <- strptime(paste(febData[,"Date"],febData[,"Time"]),format="%d/%m/%Y %H:%M:%S")
# Initiate output file
png("plot2.png",width=480,height=480,units="px")
pl2 <- plot(febData$dateTime,febData$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power (kilowatts)") 
pl2
dev.off()

