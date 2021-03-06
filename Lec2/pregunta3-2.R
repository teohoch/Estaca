

gene <- c(0,0,0,1)
nsimulations <- 500
sick <- c()
babys <-2000
expected_babys <- babys/4
beds <- 500

success_beds <- c()
times_success <- c()
prob_success <- c()

for(i in 1:nsimulations){
  test <- replicate(babys,sample(gene,1,replace = TRUE))
  sick <- c(sick,sum(test))
  if(sum(test)<=beds){
    success_beds <- c(success_beds,1)
  }
  times_success<- c(times_success,sum(success_beds))
  prob_success<- c(prob_success,sum(success_beds)/i)
}

plot(1:nsimulations,prob_success,
     xlab = "Numero de Simulaciones",
     ylab = "Probabilidad de exito",
     main = "Probabilidad de exito con 500 camas y 2000 niños")
abline(h=0.5,col='red',lwd=2)

