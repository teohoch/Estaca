gene <- c(0,0,0,1)
nsimulations <- 100
sick <- c()
expected <- 500
for(i in 1:nsimulations){
  test <- replicate(2000,sample(gene,1,replace = TRUE))
  sick <- c(sick,sum(test))
}

plot(1:nsimulations,sick,
     xlab = "Numero de Simulaciones",
     ylab = "Numero de Enfermos",
     main = "Niños enfermos")
abline(h=expected,col='red',lwd=2)
