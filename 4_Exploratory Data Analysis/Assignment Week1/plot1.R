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
png(filename = "Plot1.png", width = 480, height = 480)
hist(DataFeb$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()