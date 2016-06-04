source("rankhospital.R")

rankall <- function(outcomeName, num = "best") {
    ## Check that state and outcome are valid    
    validOutcomes = c("heart attack", "heart failure", "pneumonia" )
    if ( !( outcomeName %in% validOutcomes) ) {
        stop("invalid outcome")
    }

    nameStart = "Hospital.30.Day.Death..Mortality..Rates.from."
    fieldName = paste( c( nameStart, capitalize( outcomeName ) ), collapse = "" )
    
    outcome[,fieldName] <- as.numeric( outcome[,fieldName] )

    ## For each state, find the hospital of the given rank
    states = levels(factor(outcome$State))
    df <- data.frame( 
        hospital = sapply( 
            states,
            function (x) { rankhospital(x, outcomeName, num ) },
            USE.NAMES = FALSE 
        ),
        state = states
    )

    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name        
    return( df )
}