# 
MyData = read.csv("USArrestRates.csv", colClasses=c('factor', 'numeric', 'numeric', 'numeric', 'numeric'))

summary(MyData$Murder)

MyData = read.csv("DepartmentAttitudeSurvey.csv", colClasses=c('numeric','numeric', 'numeric', 'numeric', 'numeric'))

summary(MyData$Murder)
