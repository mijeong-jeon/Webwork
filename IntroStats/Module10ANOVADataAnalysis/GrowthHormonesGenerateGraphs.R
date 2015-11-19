# Growth Hormones
MyData = read.csv("../Module10_Datasets/GrowthHormonesA.csv")
png("GrowthHormonesA.png", width=300,height=300)
boxplot(MyData$Growth ~ MyData$Treatment)
dev.off()

MyData = read.csv("../Module10_Datasets/GrowthHormonesB.csv")
png("GrowthHormonesB.png", width=300,height=300)
boxplot(MyData$Growth ~ MyData$Treatment)
dev.off()


MyData = read.csv("../Module10_Datasets/GrowthHormonesC.csv")
png("GrowthHormonesB.png", width=300,height=300)
boxplot(MyData$Growth ~ MyData$Treatment)
dev.off()


MyData = read.csv("../Module10_Datasets/GrowthHormonesD.csv")
png("GrowthHormonesD.png", width=300,height=300)
boxplot(MyData$Growth ~ MyData$Treatment)
dev.off()


