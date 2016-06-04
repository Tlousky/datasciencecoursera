capitalize <- function(x) {
    s <- strsplit(x, " ")[[1]]
    paste( 
        toupper( substring(s,1,1) ),
        substring(s, 2),
        sep      = "",
        collapse = "."
    )
}

## Read outcome data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")