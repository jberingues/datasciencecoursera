rankhospital <- function(state, outcome, rank) {
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
    #Sort hospitals
    DataState <- subset(Data, State == state)
    DataStateOrdered <- DataState[order(DataState[,col], DataState$Hospital.Name, na.last = NA),]
    if(rank =="best") rank <- 1
    if(rank =="worst") rank <- nrow(DataStateOrdered)
    if(rank > nrow(DataStateOrdered)){
        return(NA)
    } else{
        
        DataStateOrdered$Hospital.Name[rank]
    }
}

