plot3 <- function() {
  
  eData <- read.csv("./household_power_consumption.txt", header=TRUE, sep = ';')
  eData[, 1] <- as.Date(eData[, 1],format="%d/%m/%Y")
  startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
  endDate <- as.Date(" 2007-02-02", format="%Y-%m-%d")
    
  filteredData <- eData[(eData$Date >= startDate & eData$Date <=endDate), ]
  
  plotDataX <-  as.POSIXlt(paste(filteredData[,1],filteredData[,2]))
  
  plotDataY1 <-  as.numeric(as.character(filteredData[,7]))
  plotDataY2 <-  as.numeric(as.character(filteredData[,8]))
  plotDataY3 <-  as.numeric(as.character(filteredData[,9]))
    
  png(file = "plot3.png", width = 480, height = 480, bg = "white")
  
  par(mfrow = c(1, 1))
  par(cex=1.0)
  plot(plotDataX, plotDataY1, type="l",col="black", xlab="", ylab ="Energy sub metering")
  lines(plotDataX,plotDataY2, type="l",col="red")
  lines(plotDataX,plotDataY3, type="l",col="blue")
  legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex=1.0)
  
  dev.off()
  
}