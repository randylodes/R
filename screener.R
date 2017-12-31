
# This first part builds a table (dataframe) similar to ETFReplay screener

# Initialize

# Just a convenience while developing
setwd("d:/trading/trading_dev/r_code/")

# Manually setting time values here
timeA = 3
timeFrameA = "monthly"
timeB = 4
timeFrameB = "monthly"
timeV = 5
timeFrameV = "monthly"

# This allows for daily or monthly values in the above variables
# ETFReplay uses 21 trading days per month, so convert accordingly 
if (timeFrameA == "monthly"){ timeA = timeA*21 }
if (timeFrameB == "monthly"){ timeB = timeB*21 }	
if (timeFrameV == "monthly"){ timeV = timeV*21 }

print(timeA)
print(timeB)
print(timeV)

SymbolFile = "etf-top-100.txt"
symbols <- scan(SymbolFile, what="", sep="\n")

# Create an empty data frame with column names and no values
df <- data.frame(Symbol= character(0), ReturnA= numeric(0), ReturnB = numeric(0), Volatility = numeric(0))

# Loop through all the symbols, calculate values, and write to data frame
for(symbol_name in symbols)
{
   # Get the data if not already present
   if (!exists(symbol_name))
      {
	  print(paste0("Getting data for ", symbol_name))
      getSymbols(symbol_name, from="2012-01-01", to="2015-1-16")
	  }

   data1 <- get(symbol_name)
   
   # Calcultae the 3 values for this symbol
   RetA <- as.numeric(tail(round(ROC(Cl(data1), n=timeA, type="discrete"), 3)*100, 1))
   RetB <- as.numeric(tail(round(ROC(Cl(data2), n=timeB, type="discrete"), 3)*100, 1))
   Vol <- round(sd(tail(ROC(Cl(data1), type="discrete"), timeV))*sqrt(252), 3)*100
 
   # Write the values to a new row in the data frame  
   df <- rbind(df,data.frame(Symbol=symbol_name,ReturnA=RetA,ReturnB=RetB,Volatility=Vol))
}

# print(df)
# index <- order(df$Volatility)
 index <- order(df$ReturnA, decreasing=TRUE)
# index <- order(df$ReturnB, decreasing=TRUE)
print(df[index, ])

print(timeA)
print(timeB)
print(timeV)
