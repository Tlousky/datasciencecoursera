## Accessing Twitter through R
app = oatu_app( 
    "twitter",
    key    = "myConsumerKey",
    secret = "myConsumerSecret"
)

sig = sign_oauth1.0(
    app,
    token        = "myToken",
    token_secret = "myTokenSecret"
)

## Data bout this URL and params in dev.twitter.com/docs/api/1.1/get/search/tweets
homeTL = GET( "https://api.twitter.com/1.1/statuses/home_timeline.json", sig )

# Convert the JSON object
library(jsonlite)
js1 = content( homeTL ) # Unreadable structured R object
js2 = fromJSON( toJSON( json1) ) # Convert to Data Frame
json2[1,1:4] # Tweet 1, 4 first columns - text and meta-data