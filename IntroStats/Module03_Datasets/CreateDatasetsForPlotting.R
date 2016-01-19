# Create datasets for plotting

library(data.table)
library(xlsx)

# We want 2 categorical and 1 numeric
# for a contingency table and a boxplot
M = read.xlsx("StressReliefD.xlsx", 1)
names(M)
table(M$Treatment, M$Gender)

