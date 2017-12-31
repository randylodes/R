# Notes on $TICK straegy testing so far

require(quantstrat)

# Beginning date of portfolio; this should cover enough for my $TICK testing
initDate = "1979-12-31"

############################# DEFINE VARIABLES ##############################

sym1	= 'Aug2012spy' # actual instrument; will change to SPY or ES/NQ/YM later...
sym2	= 'Aug2012tick' # this wil be used for a signal 
port    = 'Futures' # Portfolio name
acct	= 'IB' # Account name
initEq	= 100000


############################# INITIALIZE ####################################

# need to evalute this for my actual trading instrument
currency('USD')
stock(sym1 ,currency='USD', multiplier=1)
initPortf(port, sym1, initDate=initDate)
initAcct(acct, port, initEq=initEq, initDate=initDate)
initOrders(port, initDate=initDate )
tickstrat = strategy(port)

############################# MAX POSITION LOGIC ############################

# same here
addPosLimit(
            portfolio=port,
            symbol=sym1, 
            timestamp=initDate,  
            maxpos=500)
			
############################# INDICATORS ####################################

tickstrat <- add.indicator( 
							strategy  = tickstrat, 
							#name      = 'Cl(sym2)', 
							name      = 'sym2', 
							arguments = list(),
							label     = 'tickdata'
						  )

############################# SIGNALS #######################################

tickstrat <- add.signal(
						strategy  = tickstrat,
						name      = 'sigThreshold',
						arguments = list(
							column='tickdata', 
                            relationship='lt',
						    threshold = -1000,
							cross = TRUE),
						label = 'tick.lt.1000'
						)
						
tickstrat <- add.signal(
						strategy  = tickstrat,
						name      = 'sigThreshold',
						arguments = list(
							column='tickdata', 
                            relationship='gt',
						    threshold = 1000,
							cross = TRUE),
						label = 'tick.gt.1000'
						)

# can we inspect the 'mktdata' dataframe at some point?				  
# is created during applyStrategy?

############################# RULES #########################################

tickstrat <- add.rule(
                strategy  = tickstrat,
                name      = 'ruleSignal',
                arguments = list(sigcol    = 'tick.lt.1000',
                                 sigval    = TRUE,
                                 orderqty  = 500,
                                 ordertype = 'market',
                                 orderside = 'long',
                                 osFUN     = 'osMaxPos'),

                type      = 'enter',
                label     = 'EnterLONG')

tickstrat <- add.rule(
                strategy  = tickstrat,
                name      = 'ruleSignal',
                arguments = list(sigcol    = 'tick.gt.1000',
                                 sigval    = TRUE,
                                 orderqty  = 'all',
                                 ordertype = 'market',
                                 orderside = 'long'),
                type      = 'exit',
                label     = 'ExitLONG')
				  
				  
				  
				  
				  
				  
# Usage
# -----
# sigThreshold(label, data = mktdata, column,
# threshold = 0,
# relationship = c("gt", "lt", "eq", "gte", "lte"),
# cross = FALSE)

# Arguments
# ---------
# label - text label to apply to the output
# data 	- data to apply comparison to
# column - named column to apply comparison to
# threshold - numeric threshold to test for
# relationship - one of c("gt","lt","eq","gte","lte") or reasonable alternatives
# cross - if TRUE, will return TRUE only for the first observation to cross the threshold in a run
		