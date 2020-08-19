library(plm)
library(lmtest)
library(multiwayvcov)
library(stargazer)
library('stringr')

data <- read.csv('/Users/xiaominli/Documents/fruits_project/processedData/controls.csv')
data = data[data$nClicks>0,]
data$y <- as.integer(str_detect(data$response,"Left"))
data$choiceSaliency <- ifelse(data$y==data$saliencyLocation,1,0)
ModelChoice <- glm(y ~ sign(valueDiff)+saliencyLocation+sign(valueDiff)*saliencyLocation+ gender+education+income, data = data,family = "binomial")
ModelCorrectness <- glm(correctness ~ congruency+abs(valueDiff)+congruency*abs(valueDiff)+gender+income+education, data = data,family = "binomial")
ModelRt <- lm(rt ~ abs(valueDiff)*congruency+gender+income+education, data = data)
ModelNormRt <- lm(normalizedRt ~ abs(valueDiff)*congruency+gender+income+education, data = data)
ModelCorrectRt <- lm(rt ~ correctness, data = data)


m1 <- glm(correctness ~ congruency+abs(valueDiff), data = data,family = "binomial")
vcov_subId <- cluster.vcov(m1, data$subId)
coeftest(m1, vcov_subId)
vcov_imgId <-cluster.vcov(m1,data$imgName)
coeftest(m1,vcov_imgId)


#for (val in seq(1,7)) {
#valueCount[val]=mean(heatSource[which(heatSource$abs.data.valueDiff == values[val]),3])} 
