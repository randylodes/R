require("quantmod")
require("PerformanceAnalytics")


#datafile <- "d:\\dev\\data\\tick\\tick.csv"
#datafile <- "d:\\dev\\data\\spx_daily\\spx.csv"
#datafile <- "d:\\dev\\data\\es\\es.csv"
datafile <- "d:\\dev\\data\\spy\\spy.csv"

# Read .csv data
df <- read.csv(datafile, sep=',', header=TRUE)

#This must be the good one (seems to work)
SPY <- xts(df[,-c(1,2)], as.POSIXct(strptime(paste(df$Date,sprintf('%04d',(df$Time))),"%m/%d/%Y %H%M")))

#TICK["2012-2-02"]
rm(datafile, df)

# Result is an xts/zoo object like so:
# ...
# 1997-10-01 11:16:00   119.00   119.00    28.00    28.00      0
# 1997-10-01 11:17:00    26.00    28.00   -11.00   -11.00      0
# 1997-10-01 11:18:00   -31.00   -31.00   -49.00   -39.00      0
# [ reached getOption("max.print") -- omitted 1479337 rows ]
 
# date range is 7/21/97 - 9/7/2012
# at 1-min intervals
# this is a big data set; need to work in chunks
# may want to use Perl to chunk it out

# next step - line this up with SPX or SPY data to start testing ideas
# also try some charting while we're at it


# This one must have been incorrect/or left over? (Keeping it just in case...)
#spx_daily <- as.xts(read.zoo("c:\\dev\\data\\spx_daily\\spx.csv", sep = ',', format="%m/%d/%Y", header = TRUE))