

require(quantstrat)

#Load ETFs from yahoo
currency("USD")
symbols = c("XLY", "XLP", "XLE", "XLF")
stock(symbols, currency="USD",multiplier=1)
getSymbols(symbols, src='yahoo', index.class=c("POSIXt","POSIXct"), from='2000-01-01')

#Convert to monthly and drop all columns except Adjusted Close
for(symbol in symbols) {
  x <- get(symbol)
  x <- to.monthly(x,indexAt='lastof',drop.time=TRUE)
  indexFormat(x) <- '%Y-%m-%d'
  colnames(x) <- gsub("x",symbol,colnames(x))
  x <- x[,6] #drops all columns except Adjusted Close which is 6th column
  assign(symbol,x)
}

#merge the symbols into a single object with just the close prices
symbols_close <- do.call(merge, lapply(symbols, get))

#xts object of the 3 period ROC of each column in the close object
#The 3 period ROC will be used as the ranking factor
roc <- ROC(symbols_close, n = 3, type = "discrete")

#xts object with ranks
#symbol with a rank of 1 has the highest ROC
r <- as.xts(t(apply(-roc, 1, rank)))

