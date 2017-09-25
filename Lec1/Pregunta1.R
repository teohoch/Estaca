#Including library
library(ggplot2)

#Import csv into frame
games_original<-read.csv("Lec1/games.csv", stringsAsFactors=FALSE)

#Pregunta 1 
#Suponiendo que cada juego en una consola diferente es un objeto distinto.
games <- games_original

games$Full_Name <- do.call(paste, c(games[c("Name","Platform")], sep = " / "))

top10NA <- head(games[order(games$NA_Sales, decreasing = TRUE),],5)
#ggplot(top10NA, aes(Full_Name, NA_Sales))+geom_col()+labs(y="Millones vendidos",x="", title="Top 10 Ventas NA")+theme(axis.text.x = element_text(angle=90,vjust=0.5))

top10EU <- head(games[order(games$EU_Sales, decreasing = TRUE),],5)
#ggplot(top10EU, aes(Full_Name, EU_Sales))+geom_col()+labs(y="Millones vendidos",x="", title="Top 10 Ventas EU")+theme(axis.text.x = element_text(angle=90,vjust=0.5))

top10JP <- head(games[order(games$JP_Sales, decreasing = TRUE),],5)
ggplot(top10JP, aes(Full_Name, JP_Sales))+geom_col()+labs(y="Millones vendidos",x="", title="Top 10 Ventas JP")+theme(axis.text.x = element_text(angle=90,vjust=0.5))

top10Other <- head(games[order(games$Other_Sales, decreasing = TRUE),],5)
#ggplot(top10Other, aes(Full_Name, Other_Sales))+geom_col()+labs(y="Millones vendidos",x="", title="Top 10 Ventas Otros")+theme(axis.text.x = element_text(angle=90,vjust=0.5))

#Suponiendo que en se suma las ventas de cada juego en todas sus plataformas

games <- games_original

library(data.table)
DT <- data.table(games)

NA_Sales <-DT[, sum(NA_Sales), by = Name]
EU_Sales <-DT[, sum(EU_Sales), by = Name]
JP_Sales <-DT[, sum(JP_Sales), by = Name]
Other_Sales <-DT[, sum(Other_Sales), by = Name]

Top10_NA <- head(NA_Sales[order(NA_Sales$V1, decreasing = TRUE),],5)
Top10_NA$Name <- factor(Top10_NA$Name, levels = Top10_NA$Name[order(Top10_NA$V1, decreasing = TRUE)])

Top10_EU <- head(EU_Sales[order(EU_Sales$V1, decreasing = TRUE),],5)
Top10_EU$Name <- factor(Top10_EU$Name, levels = Top10_EU$Name[order(Top10_EU$V1, decreasing = TRUE)])

Top10_JP <- head(JP_Sales[order(JP_Sales$V1, decreasing = TRUE),],5)
Top10_JP$Name <- factor(Top10_JP$Name, levels = Top10_JP$Name[order(Top10_JP$V1, decreasing = TRUE)])

Top10_Other <- head(Other_Sales[order(Other_Sales$V1, decreasing = TRUE),],5)
Top10_Other$Name <- factor(Top10_Other$Name, levels = Top10_Other$Name[order(Top10_Other$V1, decreasing = TRUE)])

# ggplot(Top10_NA, aes(Name, V1))+geom_col()+labs(y="Millones vendidos",x="", title="Top 10 Ventas NA")+theme(axis.text.x = element_text(angle=90,vjust=0.5))
# ggplot(Top10_EU, aes(Name, V1))+geom_col()+labs(y="Millones vendidos",x="", title="Top 10 Ventas EU")+theme(axis.text.x = element_text(angle=90,vjust=0.5))
ggplot(Top10_JP, aes(Name, V1))+geom_col()+labs(y="Millones vendidos",x="", title="Top 10 Ventas JP")+theme(axis.text.x = element_text(angle=90,vjust=0.5))
# ggplot(Top10_Other, aes(Name, V1))+geom_col()+labs(y="Millones vendidos",x="", title="Top 10 Ventas Otros")+theme(axis.text.x = element_text(angle=90,vjust=0.5))

