# Analysis of the Golf ball Data (was originally Hot Dogs, but that would be 1-tailed)
# Source: page 412 of Gould & Ryan

# Maple Leaf
n = 30
tcrit = abs(qt(0.025, n-1))
xbar = 372;
sd = 15.8;
se = sd/sqrt(n);


tobs = (xbar - 100)/se
ci1 = xbar - tcrit * se
ci2 = xbar + tcrit * se

# Oscar Meyer
n = 30
tcrit = abs(qt(0.025, n-1))
xbar = 374;
sd = 73.1
se = sd/sqrt(n);


tobs = (xbar - 100)/se
ci1 = xbar - tcrit * se
ci2 = xbar + tcrit * se

# Nathan's
n = 30
tcrit = abs(qt(0.025, n-1))
xbar = 369;
sd = 8.4;
se = sd/sqrt(n);


tobs = (xbar - 100)/se
ci1 = xbar - tcrit * se
ci2 = xbar + tcrit * se
