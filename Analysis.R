library(jsonlite)
library(Hmisc)
library(ggpubr)
options(max.print=10);
setwd("/Users/rebeccayim/Desktop/Cleaned Txt/")
cor(cleaneddhtHum,cleaneddhtTemp, method="spearman") # spearman better for ordinal scales
data_set <- merge(cleaneddhtTemp,cleaneddhtHum, by="Timestamp")
rcorr(as.matrix(data_set))

#print(data_set, 6)
ggscatter(data_set, x = "value.x", y = "value.y", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method="spearman", xlab = "Humidity", ylab = "Temperature")