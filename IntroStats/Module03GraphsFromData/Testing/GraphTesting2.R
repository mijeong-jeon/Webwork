library(xlsx)
MyData = read.xlsx("../../Module03_Datasets/StressReliefA.xlsx", 1)
png("../StressReliefA_Boxplot.png", width=300, height=300)
boxplot(MyData$StressReduction ~ MyData$Gender , xlab='Gender', ylab = "Stress Reduc.")
dev.off();
print(table(MyData$Treatment, MyData$Gender))

MyData = read.xlsx("../../Module03_Datasets/StressReliefB.xlsx", 1)
png("../StressReliefB_Boxplot.png", width=300, height=300)
boxplot(MyData$StressReduction ~ MyData$Gender , xlab='Gender', ylab = "Stress Reduc.")
dev.off();
print(table(MyData$Treatment, MyData$Gender))

MyData = read.xlsx("../../Module03_Datasets/StressReliefC.xlsx", 1)
png("../StressReliefC_Boxplot.png", width=300, height=300)
boxplot(MyData$StressReduction ~ MyData$Gender , xlab='Gender', ylab = "Stress Reduc.")
dev.off();
print(table(MyData$Treatment, MyData$Gender))

MyData = read.xlsx("../../Module03_Datasets/StressReliefD.xlsx", 1)
png("../StressReliefD_Boxplot.png", width=300, height=300)
boxplot(MyData$StressReduction ~ MyData$Gender , xlab='Gender', ylab = "Stress Reduc.")
dev.off();
print(table(MyData$Treatment, MyData$Gender))