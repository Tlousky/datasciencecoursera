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