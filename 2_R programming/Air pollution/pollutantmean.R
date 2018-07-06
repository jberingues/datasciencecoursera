setwd("/Users/jordiberingues/Documents/Git/datasciencecoursera/2_R programming/Air pollution")
library(stringr)
pollutantmean <- function (directory, pollutant, id = 1:332){
    GlobalData <- data.frame(Date=as.Date(character()),
                          sulfate=character(), 
                          nitrate=character(),
                          ID = as.logical())
    for(i in id){
        Data <- read.csv(paste(directory,"/", str_pad(as.character(i),3, side="left", pad = "0"), ".csv", sep = ""), stringsAsFactors = FALSE)
        GlobalData <- rbind(GlobalData, Data)
    }
    GlobalData <- GlobalData[-c(1)]
    mean(GlobalData[[pollutant]][!is.na(GlobalData[[pollutant]])])
}