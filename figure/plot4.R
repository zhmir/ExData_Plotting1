plot4 <- function() {
  
  eData <- read.csv("./household_power_consumption.txt", header=TRUE, sep = ';')
  eData[, 1] <- as.Date(eData[, 1],format="%d/%m/%Y")
  startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
  endDate <- as.Date(" 2007-02-02", format="%Y-%m-%d")
  
  filteredData <- eData[(eData$Date >= startDate & eData$Date <=endDate), ]
  
  plotDataX <-  as.POSIXlt(paste(filteredData[,1],filteredData[,2]))
  
  ##Graph - 1
  g1plotDataY <-  as.numeric(as.character(filteredData[,3]))
  
  
  ##Graph - 2
  g2plotDataY <-  as.numeric(as.character(filteredData[,5]))
  
  ##Graph - 3
  g3plotDataY1 <-  as.numeric(as.character(filteredData[,7]))
  g3plotDataY2 <-  as.numeric(as.character(filteredData[,8]))
  g3plotDataY3 <-  as.numeric(as.character(filteredData[,9]))
  
  ##Graph - 4
  g4plotDataY <-  as.numeric(as.character(filteredData[,4]))
  
  png(file = "plot4.png", width = 480, height = 480, bg = "white")
  
  par(mfrow = c(2, 2))
  par(cex=.65) 

  plot(plotDataX, g1plotDataY, type="l", xlab="", ylab ="Global Active Power (killowatts)")
  
  plot(plotDataX, g2plotDataY, type="l", xlab="datetime", ylab ="Voltage")
  
  plot(plotDataX, g3plotDataY1, type="l",col="black", xlab="", ylab ="Energy sub metering")
  lines(plotDataX,g3plotDataY2, type="l",col="red")
  lines(plotDataX,g3plotDataY3, type="l",col="blue")
  legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty = "n")
  
  plot(plotDataX, g4plotDataY, type="l", xlab="datetime", ylab ="Global_reactive_power")

  dev.off()

}