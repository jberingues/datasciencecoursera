best <- function(state, outcome) {
    Data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    Data[,11] = as.numeric(Data[,11])
    Data[,17] = as.numeric(Data[,17])
    Data[,23] = as.numeric(Data[,23])
    ##Selection of parameter to measure
    if (outcome == "heart attack"){
        col <- 11
    }else{
        if (outcome == "heart failure"){
            col <- 17
        }else{
            if (outcome == "pneumonia"){
                col <- 23
            }else{
                stop("invalid outcome")
            }    
        }
    }
    #Check state
    if (!any(Data$State == state)) stop ("invalid state")
    #Find minimum on state
    DataState <- subset(Data, State == state)
    Minim <- min(DataState[,col], na.rm = TRUE)
    #Select hospitals with minimum
    Hospitals <- DataState$Hospital.Name[which(DataState[,col] == Minim)]
    Hospitals <- sort(Hospitals)
    Hospitals[1]
}

