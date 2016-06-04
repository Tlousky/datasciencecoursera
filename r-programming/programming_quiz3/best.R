#outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
#outcome[, 11] <- as.numeric(outcome[, 11])
#hist(outcome[, 11], xlab = names(outcome)[[11]] )

source("general.R")

best <- function(state, outcomeName) {
    ## Check that state and outcome are valid
    states = levels(factor(outcome$State))
    if ( !( state %in% states) ) {
        stop("invalid state")
    }
    
    validOutcomes = c("heart attack", "heart failure", "pneumonia" )
    if ( !( outcomeName %in% validOutcomes) ) {
        stop("invalid outcome")
    }
    
    nameStart = "Hospital.30.Day.Death..Mortality..Rates.from."
    fieldName = paste( c( nameStart, capitalize( outcomeName ) ), collapse = "" )

    outcome[,fieldName] <- as.numeric( outcome[,fieldName] )
    
    ## Return hospital name in that state with lowest 30-day death
    filtered <- outcome[ outcome$State == state & !is.na( outcome[[fieldName]] ), c("Hospital.Name", fieldName, "State" )]
    filtered <- filtered[ order( filtered[[fieldName]], filtered[["Hospital.Name"]] ), ]

    ## rate
    return( filtered[ 1, "Hospital.Name" ] )
}