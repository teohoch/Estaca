

gene <- c(1,1,1,0,0,
          0,0,0,0,0,
          0,0,0,0,0,
          0,0,0,0,0)
nsimulations <- 500
sick <- c()
babys <-2000
expected_babys <- babys/4
beds <- 500

mean_sick <- c()

for(i in 1:nsimulations){
  test <- replicate(babys,sample(gene,1,replace = TRUE))
  sick <- c(sick,sum(test))

  mean_sick<- c(mean_sick, sum(sick)/(i))
}

plot(1:nsimulations,mean_sick,
     xlab = "Numero de Simulaciones",
     ylab = "Promedio Niños Enfermos",
     main = "Numero Promedio de Niños Enfermos")
abline(h=300,col='red',lwd=2)

