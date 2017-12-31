
##################################################################################################
# Experimenting with PerformanceAnalytics library for backtesting
# The example is a Quarterly Tactical Strategy described here:
# https://quantstrattrader.wordpress.com/2015/02/13/the-quarterly-tactical-strategy-aka-qts/
##################################################################################################

# look at this code for: 
#  - examples indexing XTS objects 
#  - manually computing ROC
#  - using an (apply) funtion action on an XTS data set 
#  - max drawdown
#  - performance

# more on (apply) https://nsaunders.wordpress.com/2010/08/20/a-brief-introduction-to-apply-in-r/
# also  type "??apply" and scroll down to the functions in the base package


require(quantmod)
require(PerformanceAnalytics)
require(TTR)

# Initialize the workspace
rm(list=ls())
 
#get our data from yahoo, use adjusted prices
symbols <- c("NAESX", #small cap
             "PREMX", #emerging bond
             "VEIEX", #emerging markets
             "VFICX", #intermediate investment grade
             "VFIIX", #GNMA mortgage
             "VFINX", #S&P 500 index
             "VGSIX", #MSCI REIT
             "VGTSX", #total intl stock idx
             "VUSTX") #long term treasury (cash)
 
getSymbols(symbols, from="1990-01-01")
prices <- list() # creates an empty list

# a list of XTS objects (adjusted close for each symbol)
# why do it this way? similar to what I was doing with dataframe? 
for(i in 1:length(symbols)) {
  prices[[i]] <- Ad(get(symbols[i]))  
}

# now it's an XTS object with a column for each security: "NAESX.Adjusted" "PREMX.Adjusted", etc..
prices <- do.call(cbind, prices)

# cleans up the column names: "NAESX" "PREMX", etc..
colnames(prices) <- gsub("\\.[A-z]*", "", colnames(prices))
 
#define our cash asset and keep track of which column it is
cashAsset <- "VUSTX"
cashCol <- grep(cashAsset, colnames(prices)) # the value is an integer (9)
 
#start our data off on the security with the least data (VGSIX in this case)
# chops all the data that contains NA
# kind cheating by hard-coding column 7 (?)
prices <- prices[!is.na(prices[,7]),] 
 
#cash is not a formal asset in our ranking
# splits the cash asset back to it's own column
cashPrices <- prices[, cashCol]
prices <- prices[, -cashCol]

#define our parameters
nShort <- 20 # 20 day momentum
nLong <- 105 # 105 day momentum
nMonthSMA <- 3 # 3 month SMA
 
#compute momentums
# looks like this does it manually instead of using ROC (?)
# the result is two XTS objects with momentum data; colnames same as 'prices' object
rocShort <- prices/lag(prices, nShort) - 1 # a ratio of prices now vs 20 days ago
rocLong <- prices/lag(prices, nLong) - 1

#take the endpoints of quarter start/end
# what is 'endpoints' ? it creates integers
quarterlyEps <- endpoints(prices, on="quarters")
monthlyEps <- endpoints(prices, on = "months")
 
#take the prices at quarterly endpoints
# an XTS with qurterly data. (isn't there a simpler way to do this conversion ?)
quarterlyPrices <- prices[quarterlyEps,]
 
#short momentum at quarterly endpoints (20 day)
rocShortQtrs <- rocShort[quarterlyEps,]
 
#long momentum at quarterly endpoints (105 day)
rocLongQtrs <- rocLong[quarterlyEps,]

#rank short momentum, best highest rank
rocSrank <- t(apply(rocShortQtrs, 1, rank))
# creates a matrix (like a dataframe, but the columns are of same type)
#               NAESX PREMX VEIEX VFICX VFIIX VFINX VGSIX VGTSX
# 1996-06-28     1     8     2     6     5     3     7     4
# 1996-09-30     6     8     4     2     1     7     3     5

#rank long momentum, best highest rank
rocLrank <- t(apply(rocLongQtrs, 1, rank))

#total rank, long slightly higher than short, sum them 
# it's now a scale of 1 to 20
totalRank <- 1.01*rocLrank + rocSrank 
 
#function that takes 100% position in highest ranked security
maxRank <- function(rankRow) {
  return(rankRow==max(rankRow))
}
 
#apply above function to our quarterly ranks every quarter
# returns a matrix of TRUE/FALSE values
rankPos <- t(apply(totalRank, 1, maxRank))

#SMA of securities, only use monthly endpoints
#subset to quarters
#then filter
monthlyPrices <- prices[monthlyEps,]
monthlySMAs <- xts(apply(monthlyPrices, 2, SMA, n=nMonthSMA), order.by=index(monthlyPrices))
# this returns a matrix unless you use xts() and havbe to specify an index
quarterlySMAs <- monthlySMAs[index(quarterlyPrices),]
smaFilter <- quarterlyPrices > quarterlySMAs
# returns a TRUE/FALSE matrix "is price grester than movin average?"

finalPos <- rankPos*smaFilter # multiplies TRUE/FALSE values; creates a matrix of 0/1 signals
finalPos <- finalPos[!is.na(rocLongQtrs[,1]),] # removes NA values, and what else?
cash <- xts(1-rowSums(finalPos), order.by=index(finalPos)) # xts of 0/1 cash postion
finalPos <- merge(finalPos, cash, join='inner') # re-adds the cash signal column

prices <- merge(prices, cashPrices, join='inner') # re-adds the cash instrument price column


# The Portfolio Analytics stuff
returns <- Return.calculate(prices) # just an XTS of daily returns

# daily performance of portfolio (?)
stratRets <- Return.portfolio(returns, finalPos)

table.AnnualizedReturns(stratRets)
maxDrawdown(stratRets)
charts.PerformanceSummary(stratRets)
plot(log(cumprod(1+stratRets)))



