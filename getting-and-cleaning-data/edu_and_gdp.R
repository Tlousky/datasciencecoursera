gdp = tbl_df( read.csv( "gdp.csv" ) )
edu = tbl_df( read.csv( "edu.csv" ) )

merged = merge( edu, gdp, by.x = "CountryCode", by.y = "X", all = TRUE )

sp = merged$Special.Notes

grep( "Fiscal year end: June ", sp )
# [1]  11  18  31  60  76 105 112 166 173 188 199 216 234
length( grep( "Fiscal year end: June ", sp ) )
# [1] 13