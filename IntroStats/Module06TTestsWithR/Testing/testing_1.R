# Testing 1-variable t tests

MyData = read.csv("DepartmentAttitudeSurvey.csv")
names(MyData)

# OverallRating with 65, 70
mf1 = lm(OverallRating-65~1, data = MyData)
print(summary(mf1))
mf2 = lm(OverallRating-70~1, data = MyData)
print(summary(mf2))

# Complaints with 65, 70, 75
print("*** Complaints ***")
mf1 = lm(Complaints-65~1, data = MyData)
print(summary(mf1))
mf2 = lm(Complaints-70~1, data = MyData)
print(summary(mf2))
mf3 = lm(Complaints-75~1, data = MyData)
print(summary(mf3))

# Privileges at 50, 60
print("*** Privileges ***")
mf1 = lm(Privileges-50~1, data = MyData)
print(summary(mf1))
mf2 = lm(Privileges-60~1, data = MyData)
print(summary(mf2))

# Raises at 70, 75
print("*** Raises ***")
mf1 = lm(Raises-70~1, data = MyData)
print(summary(mf1))
mf2 = lm(Raises-75~1, data = MyData)
print(summary(mf2))

# Advancement with 40, 50, 60
print("*** Advancement ***")
mf1 = lm(Advancement-40~1, data = MyData)
print(summary(mf1))
mf3 = lm(Advancement-50~1, data = MyData)
print(summary(mf3))
mf3 = lm(Advancement-60~1, data = MyData)
print(summary(mf3))




