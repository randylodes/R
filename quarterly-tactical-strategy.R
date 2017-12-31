# https://quantstrattrader.wordpress.com/2015/02/13/the-quarterly-tactical-strategy-aka-qts/

# Potentially good code examples for our ETFReplay backtest code



#Clean the workspace first
rm(list=ls())

require(quantmod)
require(PerformanceAnalytics)
require(TTR)
 
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
prices <- list()
for(i in 1:length(symbols)) {
  prices[[i]] <- Ad(get(symbols[i]))  
}
prices <- do.call(cbind, prices)
colnames(prices) <- gsub("\\.[A-z]*", "", colnames(prices))
 
#define our cash asset and keep track of which column it is
cashAsset <- "VUSTX"
cashCol <- grep(cashAsset, colnames(prices))
 
#start our data off on the security with the least data (VGSIX in this case)
prices <- prices[!is.na(prices[,7]),] 
 
#cash is not a formal asset in our ranking
cashPrices <- prices[, cashCol]
prices <- prices[, -cashCol]

#define our parameters
nShort <- 20
nLong <- 105
nMonthSMA <- 3
 
#compute momentums
rocShort <- prices/lag(prices, nShort) - 1
rocLong <- prices/lag(prices, nLong) - 1

#take the endpoints of quarter start/end
quarterlyEps <- endpoints(prices, on="quarters")
monthlyEps <- endpoints(prices, on = "months")
 
#take the prices at quarterly endpoints
quarterlyPrices <- prices[quarterlyEps,]
 
#short momentum at quarterly endpoints (20 day)
rocShortQtrs <- rocShort[quarterlyEps,]
 
#long momentum at quarterly endpoints (105 day)
rocLongQtrs <- rocLong[quarterlyEps,]

#rank short momentum, best highest rank
rocSrank <- t(apply(rocShortQtrs, 1, rank))
 
#rank long momentum, best highest rank
rocLrank <- t(apply(rocLongQtrs, 1, rank))
 
#total rank, long slightly higher than short, sum them
totalRank <- 1.01*rocLrank + rocSrank 
 
#function that takes 100% position in highest ranked security
maxRank <- function(rankRow) {
  return(rankRow==max(rankRow))
}
 
#apply above function to our quarterly ranks every quarter
rankPos <- t(apply(totalRank, 1, maxRank))

#SMA of securities, only use monthly endpoints
#subset to quarters
#then filter
monthlyPrices <- prices[monthlyEps,]
monthlySMAs <- xts(apply(monthlyPrices, 2, SMA, n=nMonthSMA), order.by=index(monthlyPrices))
quarterlySMAs <- monthlySMAs[index(quarterlyPrices),]
smaFilter <- quarterlyPrices > quarterlySMAs

finalPos <- rankPos*smaFilter
finalPos <- finalPos[!is.na(rocLongQtrs[,1]),]
cash <- xts(1-rowSums(finalPos), order.by=index(finalPos))
finalPos <- merge(finalPos, cash, join='inner')

prices <- merge(prices, cashPrices, join='inner')
returns <- Return.calculate(prices)
stratRets <- Return.portfolio(returns, finalPos)
table.AnnualizedReturns(stratRets)




