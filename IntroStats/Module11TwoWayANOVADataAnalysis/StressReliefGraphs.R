# Stress relief boxplots
library(xlsx)
MyData = read.xlsx("../Module11_Datasets/StressReliefA.xlsx", "Sheet")
png("StressReliefA.png", width=600,height=400)
boxplot(StressReduction ~ Treatment+Gender, data=MyData)
dev.off()

MyData = read.xlsx("../Module11_Datasets/StressReliefA.xlsx", "Sheet")
png("StressReliefB.png", width=600,height=400)
boxplot(StressReduction ~ Treatment+Gender, data=MyData)
dev.off()

MyData = read.xlsx("../Module11_Datasets/StressReliefA.xlsx", "Sheet")
png("StressReliefC.png", width=600,height=400)
boxplot(StressReduction ~ Treatment+Gender, data=MyData)
dev.off()

MyData = read.xlsx("../Module11_Datasets/StressReliefA.xlsx", "Sheet")
png("StressReliefD.png", width=600,height=400)
boxplot(StressReduction ~ Treatment+Gender, data=MyData)
dev.off()

# Interaction plots
MyData = read.xlsx("../Module11_Datasets/StressReliefA.xlsx", "Sheet")
png("StressReliefA_InteractionPlot.png", width=600,height=400)
interaction.plot(MyData$Treatment, MyData$Gender,MyData$StressReduction, xlab="Treatment", ylab = "Stress Relief", trace.label = "Gender")
dev.off()

MyData = read.xlsx("../Module11_Datasets/StressReliefA.xlsx", "Sheet")
png("StressReliefB_InteractionPlot.png", width=600,height=400)
interaction.plot(MyData$Treatment, MyData$Gender,MyData$StressReduction, xlab="Treatment", ylab = "Stress Relief", trace.label = "Gender")
dev.off()

MyData = read.xlsx("../Module11_Datasets/StressReliefA.xlsx", "Sheet")
png("StressReliefC_InteractionPlot.png", width=600,height=400)
interaction.plot(MyData$Treatment, MyData$Gender,MyData$StressReduction, xlab="Treatment", ylab = "Stress Relief", trace.label = "Gender")
dev.off()

MyData = read.xlsx("../Module11_Datasets/StressReliefA.xlsx", "Sheet")
png("StressReliefD_InteractionPlot.png", width=600,height=400)
interaction.plot(MyData$Treatment, MyData$Gender,MyData$StressReduction, xlab="Treatment", ylab = "Stress Relief", trace.label = "Gender")
dev.off()



