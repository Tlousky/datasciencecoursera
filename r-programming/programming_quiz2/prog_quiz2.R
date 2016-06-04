library( stringr )

loadMonitorfile <- function( directory, id ) {
    id <- str_pad(id, 3, pad = "0")                                          # Pad leading zeros 
    monitorData <- read.csv( paste( directory, "/", id, ".csv", sep = '' ) ) # Load monitor data
    return( monitorData )
}

pollutantmean <- function( directory, pollutant, idVec = 1:332 ) {
    allVals <- c()
    for( id in idVec ) {
        monitorData   <- loadMonitorfile( directory, id )
        polludantData <- monitorData[,pollutant]                                 # Get all pollutant data
        polludantData <- polludantData[ !is.na( polludantData ) ]                # Clean pollutant data
        allVals <- append( allVals, polludantData )
    }
    
    return ( mean( allVals ) )
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