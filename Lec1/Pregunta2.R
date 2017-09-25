#Including library
library(ggplot2)
library(scales)

#Import csv into frame
games_original<-read.csv("Lec1/games.csv", stringsAsFactors=FALSE)

#Pregunta 2

games <- games_original

Region <- c("EU", "NA", "JP", "Otro")
Sales <- c(sum(games$EU_Sales),sum(games$NA_Sales),sum(games$JP_Sales),sum(games$Other_Sales))
piepercent <- round(100*Sales/sum(Sales), 1)
piepercent <- paste(Region, piepercent)
piepercent <- paste(piepercent, "%", sep="")
pie(Sales,labels =piepercent, main = "Ventas por Region")

regionSales <- data.frame(
  Region = Region,
  Sales = Sales
)