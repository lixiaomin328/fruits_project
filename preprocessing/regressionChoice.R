data <- read.csv('/Users/xiaominli/Documents/fruits_project/preprocessing/processedDataPilot1.csv')
data = data[data$nClicks>0,]
data$y <- as.integer(str_detect(data$response,"Left"))
data$choiceSaliency <- ifelse(data$y==data$saliencyLocation,1,0)
Model1 <- glm(y ~ sign(valueDiff)+saliencyLocation, data = data,family = "binomial")
Model4 <- glm(y ~ sign(valueDiff)+saliencyLocation+sign(valueDiff)*saliencyLocation, data = data,family = "binomial")
Model5 <- glm(y ~ sign(valueDiff), data = data,family = "binomial")
Model6 <- glm(y ~ saliencyLocation, data = data,family = "binomial")

Model2 <- glm(correctness ~ congruency+abs(valueDiff)+congruency*abs(valueDiff), data = data,family = "binomial")
Model9 <- glm(correctness ~ congruency+abs(valueDiff), data = data,family = "binomial")
Model10 <- glm(correctness ~ rt+abs(valueDiff), data = data,family = "binomial")

Model3 <- lm(rt ~ abs(valueDiff)+congruency, data = data)
Model13 <- lm(rt ~ abs(valueDiff)*congruency, data = data)
Model12 <- lm(rt ~ correctness, data = data)
Model11 <- lm(rt ~ abs(valueDiff), data = data)