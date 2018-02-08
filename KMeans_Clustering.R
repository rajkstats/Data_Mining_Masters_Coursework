if(!require(ggplot2))
  install.packages("ggplot2")

htwt <- read.csv(file.choose())     # locate the data file here.
apply(htwt,2,function(x) sum(is.na(x)))
class(htwt)
str(htwt)

set.seed(123)
library(ggplot2)
model1 <- kmeans(htwt[,1:2], 4)
model1
size <- as.factor(unlist(model1[1]))
size <- factor(size, levels=c(4,3,2,1), labels=c("XL","Medium","Large","Small"))
p <- ggplot(htwt, aes(Male_height, Male_weight, color = size)) 
p <- p +  geom_point(alpha = 0.8, size = 1.5) + ggtitle("Male Size")
p

set.seed(123)
library(ggplot2)
model2 <- kmeans(htwt[, 3:4], 4)
model2
size <- as.factor(unlist(model2[1]))
size <- factor(size, levels=c(4,3,2,1), labels=c("XL","Medium","Large","Small"))
q <- ggplot(htwt, aes(Female_height, Female_weight, color = size)) 
q <- q +  geom_point(alpha = 0.8, size = 1.5) + ggtitle("Female Size")
q

set.seed(123)
library(ggplot2)
model3 <- kmeans(htwt[, 3:4], 5)
model3
size <- as.factor(unlist(model3[1]))
size <- factor(size, levels = c(5,2,4,3,1), labels=c("XL","Medium","Large","Small","XS"))
r <- ggplot(htwt, aes(Female_height, Female_weight, color = size)) 
r <- r +  geom_point(alpha = 0.8, size = 1.5) + ggtitle("Female Size")
r
