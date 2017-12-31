##########
## Experimenting with adapting screener code for backtesting
## 
## Have successfully returned a historical list of top 3 securities based on screener output
## Next step, use this output to generate signals for feeding quantstrat/blotter/PerformanceAnalytics
## 
## update 7/8/17 - I may want to re-factor this code with (preferred) 'apply' functions rather than looping
## look at QTS Strategy code for reference
##
##########

setwd("d:/trading/trading_dev/r_code/")
#setwd("y:/trading/trading_dev/r_code/")
library(FinancialInstrument)
library(PerformanceAnalytics)

# Initialize the workspace
rm(list=ls())

# Specify dates here
today = Sys.Date() # returns today's date
to_date = as.character(today)
#to_date = "2015-03-23"
from_date = "2003-01-01"

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

# Need know how many days of back data we need minimally to run screener 
min_days <- max(timeA, timeB, timeV)

# A text file containing a list of symbols
SymbolFile = "etf-list-fidelity.txt"

# read the file
symbols <- scan(SymbolFile, what="", sep="\n")

# Get data for all symbols
for(symbol_name in symbols)
{
   message("Getting data for ", symbol_name)
   getSymbols(symbol_name, from=from_date, to=to_date)
 }

# Get S&P data for use in benchmark and correlation calculations
message("Getting data for SPY")
getSymbols("SPY", from=from_date, to=to_date)

# Code from another rotational strategy
prices <- list()
for(i in 1:length(symbols)) {
  prices[[i]] <- Ad(get(symbols[i]))  
}
prices <- do.call(cbind, prices)
colnames(prices) <- gsub("\\.[A-z]*", "", colnames(prices))
returns <- Return.calculate(prices)

# Where was this going..? 
# positions <- prices
# for(symbol_name in symbols)
# {
#   positions$symbol_name <- 0
# }




# This creates a list of dates for testing ranges
dates <- index(do.call(cbind, lapply(split(SPY), last)))
date_list <- lapply(dates, as.character) # converts to character list
# date_list <- date_list[-c(1:4)] # removes the first 4 months

# Create an empty data frame with column names and no values (used to hold backtest output)
df.backtest <- data.frame(Date=as.Date(character(0)), Top1= character(0), Top2 = character(0), Top3 = character(0))

for (tmp_to in date_list)
{
   test_range=paste(from_date,tmp_to,sep="::")
   benchmark <- get("SPY")[test_range]
   
   #Initialize these variables 
   range_symbols <- NULL
   exclusion_list <- NULL
   range_symbols <- NULL
   
   # Create an empty data frame with column names and no values (for the screener)
   df <- data.frame(Symbol= character(0), ReturnA= numeric(0), ReturnB = numeric(0), Volatility = numeric(0), Correlation = numeric(0))

   # Loop through all the symbols, calculate values, and write to data frame
   for(symbol_name in symbols)
   {
      data1 <- get(symbol_name)[test_range]
	  if (length(Ad(data1)) < min_days )
	  {
	     # message("Not enough data to include this symbol for testing in this range")
		 # print(symbol_name)
		 
		 # Append to a list, keeping track of excluded symbols
		 exclusion_list <- c(exclusion_list, symbol_name)
	     next
	  }
      
	  #Keep a list of symbols actually used in this round, may want this later
	  range_symbols <- c(range_symbols, symbol_name)


	  # Calculating the 3 screener values
	  RetA <- as.numeric(tail(round(ROC(Ad(data1), n=timeA, type="discrete"), 3)*100, 1))
      RetB <- as.numeric(tail(round(ROC(Ad(data1), n=timeB, type="discrete"), 3)*100, 1))
      Vol <- round(sd(tail(ROC(Ad(data1), type="discrete"), timeV))*sqrt(252), 3)*100

      # Write the values to a new row in the data frame  
      df <- rbind(df,data.frame(Symbol=symbol_name,ReturnA=RetA,ReturnB=RetB,Volatility=Vol))
   }
   
   # For reference, visually tracking omitted symbols during test run
   if (length(exclusion_list) > 0) 
   {
      
	  print(paste0(tmp_to, " -- Exclusions"))  
	  print(exclusion_list)
   } 
   else 
   {
      print(paste0(tmp_to, " -- OK"))  
   }
   
   # Run the ranker
   RetA.rank <- rank(-df$ReturnA)* w[1]
   RetB.rank <- rank(-df$ReturnB)* w[2]
   Vol.rank <- rank(df$Volatility)* w[3]
   wf.sum <- RetA.rank + RetB.rank + Vol.rank 
   df["Rank"] <- as.integer(rank(wf.sum))
   
   # Sort on the final rank column and store the results in a data frame
   output.dataframe <- df[order(df$Rank),]
   
   # Pull the top 3 symbols for this range
   top_1 <- output.dataframe[1,1] 
   top_2 <- output.dataframe[2,1]
   top_3 <- output.dataframe[3,1]
   
   # Write the values to a new row in the data frame  
   df.backtest <- rbind(df.backtest, data.frame(Date=tmp_to, Top1= top_1, Top2 = top_2, Top3 = top_3))
}

# Display the results
writeLines("\n")
print(df.backtest, row.names=FALSE, right = FALSE )
writeLines("\n")
message("Test range from ", from_date, " to ", to_date)




