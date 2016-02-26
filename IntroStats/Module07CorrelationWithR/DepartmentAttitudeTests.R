# Department Attitude Survey info.

MyData = read.csv('../Module07_Datasets/DepartmentAttitudeSurvey.csv')
pairs(MyData)

#png("attitude1.png", width=400,height=400)
#plot(MyData$Complaints, MyData$OverallRating, ylab='Overall Rating', xlab="[variable]", xlim=c(30, 100), ylim=c(30, 100))
#dev.off()

#png("attitude2.png", width=400,height=400)
#plot(MyData$Privileges, MyData$OverallRating, ylab='Overall Rating', xlab="[variable]", xlim=c(30, 100), ylim=c(30, 100))
#dev.off()

#png("attitude3.png", width=400,height=400)
#plot(MyData$Raises, MyData$OverallRating, ylab='Overall Rating', xlab="[variable]", xlim=c(30, 100), ylim=c(30, 100))
#dev.off()

#png("attitude4.png", width=400,height=400)
#plot(MyData$Advancement, MyData$OverallRating, ylab='Overall Rating', xlab="[variable]", xlim=c(30, 100), ylim=c(30, 100))
#dev.off()

cor.test(MyData$Complaints, MyData$OverallRating)
cor.test(MyData$Privileges, MyData$OverallRating)
cor.test(MyData$Raises, MyData$OverallRating)
cor.test(MyData$Advancement, MyData$OverallRating)
