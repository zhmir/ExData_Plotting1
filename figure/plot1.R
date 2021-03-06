plot1 <- function() {

eData <- read.csv("./household_power_consumption.txt", header=TRUE, sep = ';')

eData[, 1] <- as.Date(eData[, 1],format="%d/%m/%Y")

startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
endDate <- as.Date(" 2007-02-02", format="%Y-%m-%d")
filteredData <- eData[(eData$Date >= startDate & eData$Date <=endDate), ]

plotData <-  as.numeric(as.character(filteredData[,3]))

png(file = "plot1.png", width = 480, height = 480, bg = "white")

par(mfrow = c(1, 1))
par(cex=1.0) 
hist(plotData, col= "red", main = "Global Active Power", xlab ="Global Active Power (killowatts)")

dev.off()

}