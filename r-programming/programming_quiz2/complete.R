library( stringr )

loadMonitorfile <- function( directory, id ) {
    id <- str_pad(id, 3, pad = "0")                                          # Pad leading zeros 
    monitorData <- read.csv( paste( directory, "/", id, ".csv", sep = '' ) ) # Load monitor data
    return( monitorData )
}

complete <- function( directory, idVec ) {
    completeObs <- data.frame( id = character(), nobs = numeric(), stringsAsFactors = FALSE )
    
    for( id in idVec ) {
        monitorData <- loadMonitorfile( directory, id )
        sulfate     <- monitorData[,'sulfate']
        nitrate     <- monitorData[,'nitrate']
        both        <- !is.na( sulfate ) & !is.na( nitrate )
        
        nobs <- length( sulfate[ both ] )
        completeObs[ nrow(completeObs) + 1, ] <- list( id = id, nobs = nobs )
    }
    
    return ( completeObs )
}