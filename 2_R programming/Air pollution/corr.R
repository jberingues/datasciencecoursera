setwd("/Users/jordiberingues/Documents/Git/datasciencecoursera/2_R programming/Air pollution")
library(stringr)

corr <- function (directory, threshold = 0){
    NObs <- complete(directory)
    ValidMonitors <- NObs[which(NObs$nobs > threshold),]
    cr <- 0
    for(i in ValidMonitors$id){
        Data <- read.csv(paste(directory,"/", str_pad(as.character(i),3, side="left", pad = "0"), ".csv", sep = ""), stringsAsFactors = FALSE)
        cr <- append(cr, cor(Data$nitrate, Data$sulfate, use = "complete.obs" ))
    }
    cr <- cr[-c(1)]
    cr
}