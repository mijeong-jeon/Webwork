# 
MyData = read.csv("CarbonDioxideGrassUptake.csv", colClasses=c('factor', 'factor', 'numeric', 'numeric'))
#MyData = read.csv(file.choose(), colClasses=c('factor', 'factor', 'numeric', 'numeric'))
x = MyData$Plant
y = MyData$CO2Uptake
boxplot(y~x, xlab = "Treatment", ylab="CO2 Uptake")


MyData = read.csv("LoblollyPines.csv", colClasses=c('factor', 'numeric', 'numeric'))
#MyData = read.csv(file.choose(), colClasses=c('factor', 'factor', 'numeric', 'numeric'))
x = MyData$SeedSource
y = MyData$TreeHeight
boxplot(y~x, xlab = "Seed Source", ylab="Tree Height")
