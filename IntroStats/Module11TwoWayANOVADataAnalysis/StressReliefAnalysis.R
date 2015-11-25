# Stress relief boxplots
library(xlsx)
library(contrast)
MyData = read.xlsx("../Module11_Datasets/StressReliefA.xlsx", "Sheet")
MyFit = lm(StressReduction ~ Treatment * Gender, data=MyData)
summary(MyFit)
summary(aov(MyFit))

MyData = read.xlsx("../Module11_Datasets/StressReliefB.xlsx", "Sheet")
MyFit = lm(StressReduction ~ Treatment * Gender, data=MyData)
summary(MyFit)
summary(aov(MyFit))

MyData = read.xlsx("../Module11_Datasets/StressReliefC.xlsx", "Sheet")
MyFit = lm(StressReduction ~ Treatment * Gender, data=MyData)
summary(MyFit)
summary(aov(MyFit))

MyData = read.xlsx("../Module11_Datasets/StressReliefD.xlsx", "Sheet")
MyFit = lm(StressReduction ~ Treatment * Gender, data=MyData)
summary(MyFit)
summary(aov(MyFit))

