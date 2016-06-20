download.file( "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "acs.csv" )

df = read.csv( "acs.csv" )

library( "sqldf" )

sqldf("select pwgtp1 from df where AGEP < 50")

sqldf("select distinct AGEP from df")

dataWidths = c("17JAN1990", "24.2","0.3", "25.3", "0.3", "26.5","0.1", "28.6","0.3" )
widths = sapply( dataWidths, nchar )

w = c(9,4,3,4,3,4,3,4,3)
x <- read.fwf( 
    file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"), 
    skip = 4,
    widths = w
)
    
x <- read.fwf(
    file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
    skip=4,
    widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4)
)