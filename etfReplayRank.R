etfReplayRank <- function(x, periods=c(6, 3, 3), w=c(0.4, 0.3, 0.3)) {
  # x       : xts object of close prices
  # periods : vector of periods used for ret1, ret2, vol
  # w       : vector of weights
  
  # xts objects of returns and volatility
  # for this example, volatility is the standard deviation of 1-month returns
  ret1 <- ROC(x, n=periods[1], type="discrete")
  ret2 <- ROC(x, n=periods[2], type="discrete")
  tmp.ret <- ROC(x, n=1, type="discrete")
  vol <- as.xts(apply(tmp.ret, 2, runSD, n=periods[3]), order.by=index(x))
  
  # apply the rank function row-wise
  ret1.rank <- as.xts(t(apply(-ret1, 1, rank, na.last="keep")))
  ret2.rank <- as.xts(t(apply(-ret2, 1, rank, na.last="keep")))
  vol.rank <- as.xts(t(apply(vol, 1, rank, na.last="keep")))
  
  # multiply the factor weights into the rank objects
  tmp1 <- ret1.rank * w[1]
  tmp2 <- ret2.rank * w[2]
  tmp3 <- vol.rank * w[3]
  
  # add the tmp objects to get the weighted factor rank
  wf.rank <- tmp1 + tmp2 + tmp3
  
  # overall rank
  out.rank <- as.xts(t(apply(wf.rank, 1, rank, na.last="keep")))
  out.rank
}
#####
 
# test out the etfReplayRank function on real assets
 
library(FinancialInstrument)
 
currency("USD")
d <- c("XLY", "XLP", "XLE")
#d <- scan("etf-list.txt", what="", sep="\n")
symbols <- c(d)

stock(symbols, currency="USD")
 
# new environment for symbols
 symEnv <- new.env()
 
getSymbols(symbols, from="2012-01-01", to="2012-12-31", env=symEnv)
 
# function to get monthly adjusted closing prices
MonthlyAd <- function(x) {
  sym <- sub("\\..*$", "", names(x)[1])
  Ad(to.monthly(x, indexAt = 'lastof', drop.time = TRUE, name = sym))
}
 
# create an xts object of monthly adjusted close prices
symbols.close <- do.call(merge, eapply(symEnv, MonthlyAd))

 
# call the ranking function
output <- etfReplayRank(x=symbols.close, periods=c(6, 3, 3), w=c(0.4, 0.3, 0.3))
print(output)


