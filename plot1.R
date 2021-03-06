sampdata <- read.table("household_power_consumption.txt",header=TRUE,sep=';',nrows=5)
classes <- sapply(sampdata, class)
alldata <- read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings='?',colClasses=classes)
febdata <- subset(alldata, alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007")
rm(alldata)
i <- sapply(febdata, is.factor)
febdata[i] <- lapply(febdata[i], as.character)
str(febdata)
febdattim <- paste(febdata$Date,febdata$Time)
febdate <- strptime(febdattim,format="%d/%m/%Y %H:%M:%S")

par(cex=0.8,mar=c(5,5,4,3))
hist(febdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kW)",cex=0.8) 
dev.copy(png,file="plot1.png")
dev.off()
