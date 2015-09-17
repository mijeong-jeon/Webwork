# 
MyData = read.csv("CarbonDioxideGrassUptake.csv", colClasses=c('factor', 'factor', 'numeric', 'numeric'))
#MyData = read.csv(file.choose(), colClasses=c('factor', 'factor', 'numeric', 'numeric'))
x = MyData$CO2Concentration
y = MyData$CO2Uptake
plot(x, y)
