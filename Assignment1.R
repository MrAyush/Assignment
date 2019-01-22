library(ISLR) #<- inside auto.data
auto <- read.table("Auto.data", header = T, na.strings = "?")
auto <- na.omit(auto)
lm.fit <- lm(mpg ~ horsepower, data = auto)
#Call:
#lm(formula = auto$mpg ~ auto$horsepower)
#
#Coefficients:
# (Intercept)  auto$horsepower
#   39.9359          - 0.1578
#
summary(lm.fit)
# Call:
#   lm(formula = auto$mpg ~ auto$horsepower)
#
# Residuals:
#   Min       1Q   Median       3Q      Max
# -13.5710  -3.2592  -0.3435   2.7630  16.9240
#
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)
# (Intercept)     39.935861   0.717499   55.66   <2e-16 ***
#   auto$horsepower -0.157845   0.006446  -24.49   <2e-16 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#
# Residual standard error: 4.906 on 390 degrees of freedom
# Multiple R-squared:  0.6059,	Adjusted R-squared:  0.6049
# F-statistic: 599.7 on 1 and 390 DF,  p-value: < 2.2e-16


# 8.a.1.  Yes, their is a relationship b/w mpg and horsepower as the slope(Bo)
#       is non-zero, we can reject the NULL hypothesis.

# 8.a.2.  R^2 value is 0.6059, so 60.6% of variance of mpg is explaned by
#       horsepower.

# 8.a.3.  Their relation is negative (< zero) so we can say that increase in
#       horsepower will reduce the mpg.

predict(lm.fit, data.frame(horsepower = c(98)), interval = "confidence")

# fit      lwr      upr
# 1 24.46708 23.97308 24.96108

predict(lm.fit, data.frame(horsepower = c(98)), interval = "prediction")

# fit     lwr      upr
# 1 24.46708 14.8094 34.12476

# 8.a.4.  The 95% of confidence interval(CI) associated with housepower is
#       (23.97, 24.96) and 95% of prediction interval is (14.81, 34.12).

# 8.b

plot(auto$horsepower, auto$mpg)
abline(lm.fit)

# 8.c
par(mfrow = c(2, 2))
plot(lm.fit)


par(mfrow = c(1, 1))
