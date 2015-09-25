# Generating data for Module 1
library(xlsx)

# To see some other datasets
# library(MASS)
# data()
# also, 
# library(help = "datasets")

# Speed/stopping distance
data(cars)
write.xlsx(cars, "CarStoppingDistances.xlsx")

# Attitude in departments on various scales - good observational unit question
data(attitude)
write.xlsx(attitude, "DepartmentAttitudeSurvey.xlsx")


# Loblolly pines
data(Loblolly)
write.xlsx(Loblolly, "LoblollyPines.xlsx")

# CO2 data 
data(CO2)
write.xlsx(CO2, "CarbonDioxideGrassUptake.xlsx")

# Arrest counts in various states
data("USArrests")
write.xlsx(USArrests, "USArrestRates.xlsx")