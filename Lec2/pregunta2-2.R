repeats <- 10000

DardosDistancia <-runif(repeats,1,11)
hitmiss <- c(0,1,1,1,1,1,1,1,1,1)
Miss <- replicate(repeats,sample(hitmiss,1,replace = TRUE))
probs <- c(0,0,0,0,0,0,0,0,0,0)
probs2 <- c(0,0,0,0,0,0,0,0,0,0)
p10 <- c()
p9 <- c()
p8 <- c()
p7 <- c()
p6 <- c()

for(i in 1:repeats){
  anillo <- floor(DardosDistancia[i])
  probs[anillo] <- probs[anillo]+1 
  
    p10 <- c(p10,probs[10]/i)
    p9 <- c(p9,probs[9]/i)
    p8 <- c(p8,probs[8]/i)
    p7 <- c(p7,probs[7]/i)
    p6 <- c(p6,probs[6]/i)
}

for(i in 1:10){
  probs2[i] <- probs[i]/repeats
  print( sprintf("Anillo %s - Probabilidad %s Diff %s", i, probs2[i], abs(probs2[i]-(1/10)) ))
}

plot(1:repeats,p10,
     xlab = "Numero de repeticiones",
     ylab = "Probabilidad",
     main = "Ganar un almuerzo gratis")
abline(h=1/10,col='red',lwd=2)

plot(1:repeats,p9,
     xlab = "Numero de repeticiones",
     ylab = "Probabilidad",
     main = "Ganar bebida extra")
abline(h=1/10,col='red',lwd=2)

plot(1:repeats,p8,
     xlab = "Numero de repeticiones",
     ylab = "Probabilidad",
     main = "Ganar un postre")
abline(h=1/10,col='red',lwd=2)

plot(1:repeats,p7,
     xlab = "Numero de repeticiones",
     ylab = "Probabilidad",
     main = "Ganar descuento de $500")
abline(h=1/10,col='red',lwd=2)

plot(1:repeats,p6,
     xlab = "Numero de repeticiones",
     ylab = "Probabilidad",
     main = "Ganar otro tiro")
abline(h=1/10,col='red',lwd=2)


