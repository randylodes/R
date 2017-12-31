
# Simple backtesting introduction, from FOSS Trading website:
# http://blog.fosstrading.com/2011/03/how-to-backtest-strategy-in-r.html

# Step 1: Get the data
#-----------------------
# The getSymbols function in quantmod makes this step easy 
# if you can use daily data from Yahoo Finance.  
# There are also "methods" (not in the strict sense) to pull data 
# from other sources (FRED, Google, Oanda, R save files, databases, etc.).  
# You could also use them as a template to write a custom function for a particular vendor you use.

# Use the quantmod package (loads TTR, xts, and zoo)
require(quantmod)

# pull SPX data from Yahoo (getSymbols returns an xts object)
getSymbols("^GSPC")


# Step 2: Create your indicator
# ------------------------------
# The TTR package contains a multitude of indicators.  
# The indicators are written to make it easy to combine them in creative and unconventional ways.  
# Starting with revision 106 on R-forge, TTR has a DVI indicator.

# Calculate DVI indicator
dvi <- DVI(Cl(GSPC))  # Cl() extracts the close price column

# Step 3: Construct your trading rule
#--------------------------------------
# Since this trading rule is simple--we're long 100% if the DVI is below 0.5 
# and short 100% otherwise--it can be written in a single line.  
# More elaborate rules and/or position sizings can be done as well, 
# but require more code (RSI(2) with Position Sizing is an example 
# of more complex position sizing rules).  
# Also notice that the signal vector is lagged, which avoids look-ahead bias.

# Create signal: (long (short) if DVI is above (below) 0.5)
# Lag so yesterday's signal is applied to today's returns
sig <- Lag(ifelse(dvi$dvi < 0.5, 1, -1))


# Step 4: The trading rules/equity curve
# ----------------------------------------
# The code below is a simplified approach that is frictionless 
# and does not account for slippage.  The code takes today's percentage return 
# and multiplies it by yesterday's signal / position size (always +/- 100% in this example).  
# I also subset the system returns to match the results in the Excel file.

# Calculate signal-based returns
ret <- ROC(Cl(GSPC))*sig

# Subset returns to match data in Excel file
ret <- ret['2009-06-02/2010-09-07']

# Step 5: Evaluate strategy performance
# -----------------------------------------
# Damian mentioned the importance of evaluating your strategy.  
# Fortunately for R users, the PerformanceAnalytics package makes this easy.  
# With a few lines of code we can view the drawdowns, downside risks, and a performance summary.

# Use the PerformanceAnalytics package
require(PerformanceAnalytics)

# Create table showing drawdown statistics
table.Drawdowns(ret, top=10)

# Create table of downside risk estimates
table.DownsideRisk(ret)

# chart equity curve, daily performance, and drawdowns
charts.PerformanceSummary(ret)






