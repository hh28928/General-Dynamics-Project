library(TSA)
#fourier transforms to find seasonality
tempvalues <- cleanedbmpTemp[2]
p <- periodogram(tempvalues)
dd = data.frame(freq=p$freq, spec=p$spec)
order = dd[order(-dd$spec),]

# display the 2 highest "power" frequencies
top2 = head(order, 2)
top2
# convert frequency to time periods
time = 1/top2$f
time #6144

#decomposition of additive time series temperature
TS <- ts(cleanedbmpTemp$value, frequency = 6144)
class(TS)
decomposeTemp <- decompose(TS, "additive")
plot(as.ts(decomposeTemp$seasonal))
plot(as.ts(decomposeTemp$random))
plot(as.ts(decomposeTemp$trend))
plot(decomposeTemp)

