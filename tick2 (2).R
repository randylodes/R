require("quantmod")
require("PerformanceAnalytics")

datafile <- "c:\\dev\\data\\tick\\tick.csv"
#datafile <- "c:\\dev\\data\\spx_daily\\spx.csv"

df <- read.csv(datafile, sep=',', header=TRUE)
TICK <- xts(df[,-c(1,2)], as.POSIXct(strptime(paste(df$Date,sprintf('%04d',(df$Time))),"%m/%d/%Y %H%M")))
#spx_daily <- xts(df[,-c(1,2)], as.POSIXct(strptime(paste(df$Date,sprintf('%04d',(df$Time))),"%m/%d/%Y %H%M")))
#spx_daily <- as.xts(read.zoo("c:\\dev\\data\\spx_daily\\spx.csv", sep = ',', format="%m/%d/%Y", header = TRUE))
#TICK["2012-2-02"]
rm(datafile, df)