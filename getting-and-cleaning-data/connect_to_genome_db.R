library(RMySQL)

hg19 <- dbConnect( 
    MySQL(), 
    user = "genome",
    host = "genome-mysql.cse.ucsc.edu",
    db   = "hg19"
)

#tables <- dbListTables( hg19 )
#length( tables )
# print( tables[1:5] )

affyData = dbReadTable( hg19, "affyU133Plus2" )

dbDisconnect( hg19 )