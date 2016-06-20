webAddress = "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"

## Read lines from URL connection
con = url( webAddress )
htmlCode = readline(con)
close(con)

## Parse HTML Tree with the XML library
library(XML)
html = htmlTreeParse( webAddress, useInternalNodes = TRUE )

xpathSApply( html, "//title", xmlValue )

## Use GET from the httr package
library(httr)
html2      = GET( webAddress )
content2   = content( html2, as = "text" )
parsedHtml = htmlParse( content2, asText = TRUE )
xpathSApply( parsedHtml, "//title", xmlValue )

## Try to access user and pass protected page with GET
pg1 = GET( "http://httpbin.org/basic-auth/user/passwd" )

## GET authentication example
pg2 = GET( 
    "http://httpbin.org/basic-auth/user/passwd",
    authenticate( "user", "passwd" )
)

## Using handles
ggl = handle( "http://google.com" )
pg1 = GET( handle = ggl, path = "/"     )
pg2 = GET( handle = ggl, path = "search")