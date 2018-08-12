#-------------------Libraries------------------------
library(tidyverse)
library(lubridate)
#--------Read files and clean data-------------------
Data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
Data <- as_tibble(Data)
Data$Date <- as.POSIXct(paste(Data$Date, Data$Time), format = "%d/%m/%Y %H:%M:%S")
#-------------------Select data----------------------
DataFeb <- Data%>%
    filter(!is.na(Date))%>%
    select(-Time)%>%
    filter((year(Date) == 2007) & (month(Date) == 2) & ((day(Date) == 1) | (day(Date) == 2)))
#-------------------Plots creation-------------------
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(DataFeb$Date, DataFeb$Global_active_power, type = "l", ylab = "Global Active Power",xlab = "", main = "")
plot(DataFeb$Date, DataFeb$Voltage, type = "l", ylab = "Voltage",xlab = "datetime", main = "")
plot(DataFeb$Date, DataFeb$Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering",xlab = "", main = "")
lines(DataFeb$Date, DataFeb$Sub_metering_2, col = "red", type = "l")
lines(DataFeb$Date, DataFeb$Sub_metering_3, col = "blue", type = "l")
legend("topright", col=c("black", "red", "blue"), lty = 1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
plot(DataFeb$Date, DataFeb$Global_reactive_power, type = "l", ylab = "Global_reactive_power",xlab = "datetime", main = "")

dev.off()