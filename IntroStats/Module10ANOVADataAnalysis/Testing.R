# Growth Hormones
MyData = read.csv("../Module10_Datasets/GrowthHormonesA.csv")
png("../Module10_Datasets/GrowthHormonesA.png", width=300,height=300)
boxplot(MyData$Growth ~ MyData$Treatment)
dev.off()

MyFit = lm(Growth ~ Treatment, data = MyData)
summary(MyFit)
TukeyHSD(aov(MyFit))
