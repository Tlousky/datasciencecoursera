## Install  and load rhdf5 library
source( "http://bioconductor.org/biocLite.R" )
biocLite("rhdf5")

library(rhdf5)

## Create h5 file
created = h5createFile("example.h5")
print( created ) # Bool show operation result


## Add groups and subgroups
created = h5createGroup( "example.h5", "g1" )
created = h5createGroup( "example.h5", "g2" )
created = h5createGroup( "example.h5", "g1/sg1" )

h5ls( "example.h5" )

## Add matrices and nd-arrays to h5 file
A = matrix( 1:10, nr = 5, nc = 2 )
h5write( A, "example.h5", "g1/A" ) # Write matrix content to new subgroup A

B = array( seq( 0.1, 2.0, by = 0.1 ), dim = c(5,2,2) )
attr(B, "scale" ) = "liter"

h5write( B, "example.h5", "g1/sg1/B" ) # Write array to new sub-subgroup

h5ls( "example.h5" )

## Add data frame as full dataset to h5 file
df = data.frame( 
    1L:5L, 
    seq(0,1, length.out = 5 ),
    c( "ab", "cde", "fghi", "a", "s" ),
    stringsAsFactors = FALSE
)

h5write( df, "example.h5", "df" )
h5ls( "example.h5" )

## Read h5 data
readA = h5read(  "example.h5", "g1/A"     )
readB = h5read(  "example.h5", "g1/sg1/B" )
readdf = h5read( "example.h5", "df"       )

print( readA )

## Write and read chunk / subsets
h5write( 
    c(12,13,14),  # Write this data
    "example.h5", # In this file
    "g1/A",       # In this subgroup
    index = list(
        1:3,      # In these rows (1-3)
        1         # In this column (1)
    ) 
)

h5read( "example.h5", "g1/A" )

