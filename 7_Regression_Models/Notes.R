#Regression Models
#

library(MASS)
shuttle$auto <- 1 * (shuttle$use == "auto")
shuttle$headwind <- 1 * (shuttle$wind == "head")

fit1<-glm(auto~headwind,shuttle,family="binomial")
exp(coef(fit1))

fit2 <- glm(auto ~ headwind + magn, data = shuttle, family = binomial)
exp(coef(fit2))

data(shuttle)
shuttle$auto <- 1 * (shuttle$use == "noauto")
shuttle$headwind <- 1 * (shuttle$wind == "head")
fit3<-glm(auto~headwind,shuttle,family="binomial")
exp(coef(fit3))

data("InsectSprays")
#InsectSprays$spray[InsectSprays$spray=="B"]<-0
spray4<-relevel(InsectSprays$spray,"B")
fit4<-glm(InsectSprays$count ~ spray4,family="poisson")
exp(coef(fit4))

x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)

z <- (x > 0) * x
fit <- lm(y ~ x + z)
sum(coef(fit)[2:3])