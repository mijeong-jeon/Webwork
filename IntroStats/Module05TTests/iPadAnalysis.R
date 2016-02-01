# Analysis of the epilepsy data
# Source: page 412 of Gould & Ryan

# valproate
ci = c(88, 97)
n = 18
tcrit = abs(qt(0.025, n-1))
xbar = mean(ci)
se = (max(ci) - xbar)/tcrit
sd = se * sqrt(n)

tobs = (xbar - 100)/se
ci1 = xbar - tcrit * se

# Carbamazapine
ci = c(95, 101)
n = 18
tcrit = abs(qt(0.025, n-1))
xbar = mean(ci)
se = (max(ci) - xbar)/tcrit
sd = se * sqrt(n)

tobs = (xbar - 100)/se
ci1 = xbar - tcrit * se

# Lamotrigine
ci = c(98, 104)
n = 18
tcrit = abs(qt(0.025, n-1))
xbar = mean(ci)
se = (max(ci) - xbar)/tcrit
sd = se * sqrt(n)

tobs = (xbar - 100)/se
ci1 = xbar - tcrit * se
