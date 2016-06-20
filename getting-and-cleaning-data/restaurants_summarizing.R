if ( ! file.exists("./data") ) { dir.create( "./data" ) }
fileURL = "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file( fileURL, destfile = "./data/restaurants.csv" )
restData = read.csv("./data/restaurants.csv")

fakeData = rnorm(1e5)
object.size( fakeData )
print( object.size(fakeData), units = "Mb" )
