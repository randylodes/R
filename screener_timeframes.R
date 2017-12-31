
# This first part builds a table (dataframe) similar to ETFReplay screener

# Initialize
setwd("d:/trading/trading_dev/r_code/")
# rm(list=ls())
timeA = 3
timeFrameA = "monthly"
timeB = 4
timeFrameB = "monthly"
timeV = 5
timeFrameV = "monthly"

SymbolFile = "etf-top-100.txt"
symbols <- scan(SymbolFile, what="", sep="\n")
df <- data.frame(Symbol= character(0), ReturnA= numeric(0), ReturnB = numeric(0), Volatility = numeric(0))

# Use a loop to build table
for(symbol_name in symbols)
   {
   # Get the data if not already present
   if (!exists(symbol_name))
      {
	  print(paste0("Getting data for ", symbol_name))
      getSymbols(symbol_name, from="2012-01-01", to="2015-1-16")
	  assign(paste(symbol_name,"monthly",sep="."), to.monthly(get(symbol_name))) # creates a monthly xts object
      }
   data1 <- get(symbol_name) # daily data
   data2 <- get(paste(symbol_name, "monthly", sep=".")) # monthly data
   if (timeFrameA == "monthly"){
      RetA <- as.numeric(tail(round(ROC(Cl(data2), n=timeA, type="discrete"), 3)*100, 1))
	  }
	  else {
	  RetA <- as.numeric(tail(round(ROC(Cl(data1), n=timeA, type="discrete"), 3)*100, 1))
	  }
	  
   if (timeFrameB == "monthly"){
      RetB <- as.numeric(tail(round(ROC(Cl(data2), n=timeB, type="discrete"), 3)*100, 1))
	  }
	  else {
	  RetB <- as.numeric(tail(round(ROC(Cl(data1), n=timeB, type="discrete"), 3)*100, 1))
	  }
   if (timeFrameV == "monthly") {
      Vol <- round(sd(tail(ROC(Cl(data2), type="discrete"), timeV))*sqrt(12), 3)*100
	  }
	  else {
	  Vol <- round(sd(tail(ROC(Cl(data1), type="discrete"), timeV))*sqrt(252), 3)*100
	  }
   
   # Write the information to a new row in the data frame  
   df <- rbind(df,data.frame(Symbol=symbol_name,ReturnA=RetA,ReturnB=RetB,Volatility=Vol))
   }

# print(df)
# index <- order(df$Volatility)
 index <- order(df$ReturnA, decreasing=TRUE)
# index <- order(df$ReturnB, decreasing=TRUE)
print(df[index, ])

