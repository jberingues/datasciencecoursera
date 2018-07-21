rankall <- function(outcome, num ="best") {
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
    #Sort hospitals
    Output = data.frame("hospital" = character(), "state" = character())
    States <- levels(as.factor(Data$State))
    for(i in States){
        DataState <- subset(Data, State == i)
        DataStateOrdered <- DataState[order(DataState[,col], DataState$Hospital.Name, na.last = NA),]
        if (num == "best"){
            Selection = data.frame("hospital" = DataStateOrdered$Hospital.Name[1], "state" = i)
        }else{
            if (num == "worst"){
                Selection = data.frame("hospital" = DataStateOrdered$Hospital.Name[nrow(DataStateOrdered)], "state" = i)
            }else{
                if (num > nrow(DataStateOrdered)){
                    Selection = data.frame("hospital" = NA, "state" = i) 
                }else{
                    Selection = data.frame("hospital" = DataStateOrdered$Hospital.Name[num], "state" = i)
                }
            }    
        }
        
        Output <- rbind(Output, Selection)    
    }
    Output
}

