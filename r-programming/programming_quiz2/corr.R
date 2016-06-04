library( stringr )
source( 'complete.R' )

loadMonitorfile <- function( directory, id ) {
    id <- str_pad(id, 3, pad = "0")                                          # Pad leading zeros 
    monitorData <- read.csv( paste( directory, "/", id, ".csv", sep = '' ) ) # Load monitor data
    return( monitorData )
}

corr <- function( directory, threshold = 0 ) {
    completeObs <- complete( directory, 1:332 )
    filteredIDs <- completeObs[ completeObs['nobs'] > threshold, 'id' ]
    
    correlations = c()
    for( id in filteredIDs ) {
        monitorData <- loadMonitorfile( directory, id )
        sulfate     <- monitorData[,'sulfate']
        nitrate     <- monitorData[,'nitrate']
        corVal      <- cor( sulfate, nitrate, use = "pairwise.complete.obs" )
        
        correlations <- c( correlations, corVal )
    }
    
    return ( correlations )
}