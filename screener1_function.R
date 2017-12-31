##########
## To do:
## 1. Do something with the date range; ie, values that are hard-coded for now 
##    can be automated based on length of study through "today"
## 2. Add a nicely formatted print of the weighting and time frame to the output
## 3. Test with other ETFs and other securities, indices, etc. So far have just used 
##    the Top 100 ETF list from ETFReplay during development.

## Note: 
## ETFReplay uses 'Total Return' data (which accounts for dividends, etc)
## instead of normal market data closing price quotes. For this reason, the values for 
## some of the symbols will differ on longer time frames from ETFReplay output. 
## See: http://www.etfreplay.com/chart_totalreturn.aspx
## Symbols like 'IBB' should still match; good for comparing functionality
##########



setwd("d:/trading/trading_dev/r_code/")
library(FinancialInstrument)

# Set the weighting values
w <- c(0.7, 0.1, 0.2) # (ReturnA, ReturnB, Volatility)

# Set the timing values.
timeA = 4
timeFrameA = "m"
timeB = 3
timeFrameB = "m"
timeV = 2
timeFrameV = "m"

# This allows for daily or monthly values in the above variables
# ETFReplay uses 21 trading days per month, so convert accordingly 
if (timeFrameA == "m"){ timeA = timeA*21 }
if (timeFrameB == "m"){ timeB = timeB*21 }	
if (timeFrameV == "m"){ timeV = timeV*21 }

# A text file containing a list of symbols
# SymbolFile = "etf-list-fidelity.txt"
 SymbolFile = "etf-list_td-92.txt"
# SymbolFile = "etf-top-100.txt"
# SymbolFile = "etf-list.txt"
symbols <- scan(SymbolFile, what="", sep="\n")

# Get S&P data for use in benchmark and correlation calculations
getSymbols("SPY", from="2012-01-01", to="2016-1-1")

# Create an empty data frame with column names and no values
df <- data.frame(Symbol= character(0), ReturnA= numeric(0), ReturnB = numeric(0), Volatility = numeric(0), Correlation = numeric(0))

# Loop through all the symbols, calculate values, and write to data frame
for(symbol_name in symbols)
{
   # Get the data if not already present
   if (!exists(symbol_name))
      {
	  print(paste0("Getting data for ", symbol_name))
      getSymbols(symbol_name, from="2012-01-01", to="2016-1-1")
	  }

   # Create an XTS object of daily data for the current symbol  
   data1 <- get(symbol_name)
   
   # Calcultate the 3 values for this symbol
   RetA <- as.numeric(tail(round(ROC(Cl(data1), n=timeA, type="discrete"), 3)*100, 1))
   RetB <- as.numeric(tail(round(ROC(Cl(data1), n=timeB, type="discrete"), 3)*100, 1))
   Vol <- round(sd(tail(ROC(Cl(data1), type="discrete"), timeV))*sqrt(252), 3)*100
   #Cor <- as.numeric(round(cor(Cl(data1), Cl(SPY)), 3)*100)
 
   # Write the values to a new row in the data frame  
   #df <- rbind(df,data.frame(Symbol=symbol_name,ReturnA=RetA,ReturnB=RetB,Volatility=Vol,Correlation=Cor))
   df <- rbind(df,data.frame(Symbol=symbol_name,ReturnA=RetA,ReturnB=RetB,Volatility=Vol))
}
#print(timeA)
#print(timeB)
#print(timeV)
#print(w)


# Ranking algorithm
RetA.rank <- rank(-df$ReturnA)* w[1]
RetB.rank <- rank(-df$ReturnB)* w[2]
Vol.rank <- rank(df$Volatility)* w[3]
wf.sum <- RetA.rank + RetB.rank + Vol.rank 
df["Rank"] <- as.integer(rank(wf.sum))

# Sort on the final rank column and print the results in a table 
output.dataframe <- df[order(df$Rank),]
print(output.dataframe, row.names=FALSE, right = TRUE)





