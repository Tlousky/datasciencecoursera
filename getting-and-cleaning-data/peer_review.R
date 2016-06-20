'fp = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
download.file( fp, "reviews.csv" )
fp = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file( fp, "solutions.csv" )
'

reviews   = read.csv( "reviews.csv"   )
solutions = read.csv( "solutions.csv" )

# Link between tables is: reviews.solution_id → solutions.id

merged = merge( reviews, solutions, by.x = "solution_id", by.y = "id", all = TRUE )

library(plyr)
df1 = data.frame( id = sample(1:5), x = rnorm(5) )
df2 = data.frame( id = sample(1:5), y = rnorm(5) )
arrange( join( df1, df2 ), id )