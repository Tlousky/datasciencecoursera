source("general.R")

rankhospital <- function(state, outcomeName, rank) {
    ## Check that state and outcome are valid
    states = levels(factor(outcome$State))
    if ( !( state %in% states) ) {
        stop("invalid state")
    }

    ## Check that state and outcome are valid    
    validOutcomes = c("heart attack", "heart failure", "pneumonia" )
    if ( !( outcomeName %in% validOutcomes) ) {
        stop("invalid outcome")
    }
    
    nameStart = "Hospital.30.Day.Death..Mortality..Rates.from."
    fieldName = paste( c( nameStart, capitalize( outcomeName ) ), collapse = "" )
    
    outcome[,fieldName] <- as.numeric( outcome[,fieldName] )

    ## Return hospital name in that state with the given rank    
    filtered <- outcome[ outcome$State == state & !is.na( outcome[[fieldName]] ), c("Hospital.Name", fieldName, "State" )]
    filtered <- filtered[ order( filtered[[fieldName]], filtered[["Hospital.Name"]] ), ]

    ## Convert "best" or "worst" to numbers
    if ( rank == "best" ) rank <- 1
    if ( rank == "worst") rank <- nrow( filtered )
        
    return( 
        filtered[ rank, "Hospital.Name" ]
    )
}