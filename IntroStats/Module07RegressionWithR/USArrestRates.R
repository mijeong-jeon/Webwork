# Department Attitude Survey info.

MyData = read.csv('../Module07_Datasets/USArrestRates.csv')
pairs(MyData[,2:5])

#png("arrests1.png", width=400,height=400)
plot(MyData$UrbanPop, MyData$Murder, ylab='[variable]', xlab="UrbanPop", xlim=c(30, 100))
#dev.off()

#png("arrests2.png", width=400,height=400)
plot(MyData$UrbanPop, MyData$Assault, ylab='[variable]', xlab="UrbanPop", xlim=c(30, 100))
#dev.off()

#png("arrests3.png", width=400,height=400)
plot(MyData$UrbanPop, MyData$Rape, ylab='[variable]', xlab="UrbanPop", xlim=c(30, 100))
#dev.off()

print("Murder vs UrbanPop")
myfit = lm(MyData$Murder ~ MyData$UrbanPop)
print(summary(myfit))

print("Assault vs UrbanPop")
myfit = lm(MyData$Assault ~ MyData$UrbanPop)
print(summary(myfit))

print("Rape vs UrbanPop")
myfit = lm(MyData$Rape ~ MyData$UrbanPop)
print(summary(myfit))
