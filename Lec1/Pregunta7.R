#Including library
library(ggplot2)
library(plyr)
library(data.table)

games_original<-read.csv("Lec1/games.csv", stringsAsFactors=FALSE)

#Suponiendo que cada juego en una consola diferente es un objeto distinto.
games <- games_original
DT <- data.table(games)
publisher_count <- count(games, "Publisher")
top10publisher <- head(publisher_count[order(publisher_count$freq, decreasing = TRUE),],10)

top10publisher$Publisher <- factor(top10publisher$Publisher, levels = top10publisher$Publisher[order(top10publisher,decreasing = TRUE)])


ggplot(top10publisher, aes(Publisher, freq))+geom_col()+
  labs(y="Juegos", x="Publicista", title="Top 10 juegos publicados por Compañia")+
  theme(axis.text.x = element_text(angle=90,vjust=0.5))

publisher_volume <- NA_Sales <-DT[, sum(Global_Sales), by = Publisher]
top10volume <- head(publisher_volume[order(publisher_volume$V1, decreasing = TRUE),],10)

analicis <- merge(publisher_volume,publisher_count,by="Publisher")
analicis$meanSell <- analicis$V1/analicis$freq

top10mean <- head(analicis[order(analicis$meanSell, decreasing = TRUE),],10)
