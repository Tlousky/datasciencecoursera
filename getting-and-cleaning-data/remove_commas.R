remove_commas = function( s ) {
    s = str_trim( as.character( s ) )
    if ( grepl( ",", s ) ) {
        return( 
            gsub( ",", "", s )
        )
    } else if ( length( grep( "^[0-9]+$", s ) ) == 1 ) {
        return( s )
    } else {
        return( NA )
    }
    
}