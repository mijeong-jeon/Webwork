# Some additional graphs
x = seq(0, 4, length.out=1000)
y = df(x, 2, 19)
png("../Graphics/M09_F_2_19.png", width=300, height=225)
plot(x, y, type="l", main="F distributions, df1 = 2, df2 = 19", xlab="F value", ylab="Prob. Dens.")
lines(c(0,4), c(0, 0))
lines(c(0,0), c(0,6))
dev.off()


png("../Graphics/M09_F_3_up_19.png", width=300, height=225)
y = df(x, 3, 19)
plot(x, y, type="l", main="F distributions, df1 = 3,4,5; df2 = 19", xlab="F value", ylab="Prob. Dens.")
y = df(x, 4, 19)
lines(x, y, col='red');
y = df(x, 5, 19)
lines(x, y, col='blue');
lines(c(0,4), c(0, 0))
lines(c(0,0), c(0,6))
legend(2, 0.6, c("df1=3", "df1=4", "df1=5"), col=c('black', 'red', 'blue'), lty=1)
dev.off()
