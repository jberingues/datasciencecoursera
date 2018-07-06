setwd("/Users/jordiberingues/Documents/Git/datasciencecoursera/2_R programming/Air pollution")
library(stringr)
complete <- function (directory, id = 1:332){
    Output <- data.frame(id = 0, nobs = 0)
    for(i in id){
        Data <- read.csv(paste(directory,"/", str_pad(as.character(i),3, side="left", pad = "0"), ".csv", sep = ""), stringsAsFactors = FALSE)
        Data <- Data[!is.na(Data$sulfate),]
        Data <- Data[!is.na(Data$nitrate),]
        nobs <- length(Data$ID)
        NewOutput <- c(i, nobs) 
        Output <- rbind(Output, NewOutput)
    }
    Output <- Output[-c(1),]
    Output
}