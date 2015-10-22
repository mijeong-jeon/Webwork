# Minnesota testing
MyData = read.csv("MinnesotaHighSchool.csv")

# Version 1
t = table(MyData$HighSchoolRank, MyData$PostGrad)
print(t)
chisq.test(t)

# Version 2
t = table(MyData$HighSchoolRank, MyData$FatherOccupLevel)
dft = (nrow(t)-1) * (ncol(t) - 1)
print(t)
chisq.test(t)
print(qchisq(0.95, dft))


# Version 3
t = table(MyData$HighSchoolRank, MyData$Sex)
dft = (nrow(t)-1) * (ncol(t) - 1)
print(t)
chisq.test(t)
print(qchisq(0.95, dft))


# Version 4X - Don't use as the counts in each cell are too low.
t = table(MyData$PostGrad, MyData$FatherOccupLevel)
dft = (nrow(t)-1) * (ncol(t) - 1)
print(t)
chisq.test(t)
print(qchisq(0.95, dft))


# Version 4
t = table(MyData$PostGrad, MyData$Sex)
dft = (nrow(t)-1) * (ncol(t) - 1)
print(t)
chisq.test(t)
print(qchisq(0.95, dft))
