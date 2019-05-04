library(Hmisc)
library(ggpubr)
library(TTR)
library(tseries)
library(forecast)
options(max.print=10);

#To find correlations between data fields
cor(cleanedbmpAlt,cleanedbmpPre, method="spearman") # spearman better for ordinal scales

#rcorr didn't prove as much meaningful insight as we thought
#rcorr(as.matrix(data_set))
data <- as.matrix(cleanedbmpPre)  
plot.ts(cleanedbmpTemp)

#plot individual graphs of decomposition
#plot(test$seasonal)
#plot(test$trend)
#plot(test$random)


#testingg
timestamps <- cleanedbmpTemp[,1]
tempvalues <- cleanedbmpTemp[2]
#ts.plot(timestamps)
#ts.plot(tempvalues)

#time series forecasting temperature
plot.ts(cleanedbmpTemp)

tempTS <- ts(tempvalues, start=1553977083, frequency = 1)
tempforecast <- HoltWinters(tempTS, beta=FALSE, gamma=FALSE)
tempforecast #high alpha means that most of the weight is based off recent observations
tempforecast$fitted
#plot(tempforecast)
tempforecast$SSE

#attempt to do a different data prediction method
logTS <- log(TS)
logseries <- HoltWinters(logTS)
plot(logseries)
HoltWinters(TS, beta=FALSE, gamma=FALSE)
tempforecast2 <- forecast(tempforecast, h = 8)
plot(tempforecast2)


#smoothing function, unsuccessful
smoothData <- SMA(TS, n = 1000)
plot.ts(smoothData)

#scatter plot to visualize data
ggscatter(data_set, x = "value.x", y = "value.y", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method="spearman", xlab = "Humidity", ylab = "Temperature")

