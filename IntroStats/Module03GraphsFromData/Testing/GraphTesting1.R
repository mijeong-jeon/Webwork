MyData = read.csv("../../Module03_Datasets/LoblollyPines.csv")
plot(MyData$TreeAge, MyData$TreeHeight, xlab="Tree Age (yrs)", ylab = "Tree Height (m)")
