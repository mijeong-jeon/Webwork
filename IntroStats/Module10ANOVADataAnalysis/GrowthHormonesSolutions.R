# Growth Hormones Solutions

MyData = read.csv("../Module10_Datasets/GrowthHormonesA.csv")
boxplot(MyData$Growth ~ MyData$Treatment)
MyFit = lm(Growth ~ Treatment, data = MyData)
summary(MyFit)
TukeyHSD(aov(MyFit))

MyData = read.csv("../Module10_Datasets/GrowthHormonesB.csv")
boxplot(MyData$Growth ~ MyData$Treatment)
MyFit = lm(Growth ~ Treatment, data = MyData)
summary(MyFit)
TukeyHSD(aov(MyFit))


MyData = read.csv("../Module10_Datasets/GrowthHormonesC.csv")
boxplot(MyData$Growth ~ MyData$Treatment)
MyFit = lm(Growth ~ Treatment, data = MyData)
summary(MyFit)
TukeyHSD(aov(MyFit))


MyData = read.csv("../Module10_Datasets/GrowthHormonesD.csv")
boxplot(MyData$Growth ~ MyData$Treatment)
MyFit = lm(Growth ~ Treatment, data = MyData)
summary(MyFit)
TukeyHSD(aov(MyFit))
