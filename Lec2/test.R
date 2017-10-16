n=500
genes <-c("aa","aA","Aa","AA")
resultado <-c()
for (i in 1:n) {
  contador <- 0
  for (j in 1:i){
    s <- sample(genes,2000,replace = TRUE)
    s1 = sum(s=="aa")
    contador <- contador + (s1 <= 500)
  }
  resultado = c(resultado, contador/i)
}


plot(1:n,resultado,
     xlab = "Numero de repeticiones",
     ylab = "Probabilidad de exito",
     main = "Probabilidad de exito con 500 camas y 2000 bebes")
