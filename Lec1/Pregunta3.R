#Including library
library(ggplot2)
library(reshape2)
games<-read.csv("Lec1/games.csv", stringsAsFactors=FALSE)
DT <- data.table(games)

NA_Sales <-DT[, sum(NA_Sales), by = Year]
EU_Sales <-DT[, sum(EU_Sales), by = Year]
JP_Sales <-DT[, sum(JP_Sales), by = Year]
Other_Sales <-DT[, sum(Other_Sales), by = Year]
Total_Sales <-DT[, sum(Global_Sales), by = Year]

names(NA_Sales)[names(NA_Sales) == "V1"] <- "NA_Sales"
names(EU_Sales)[names(EU_Sales) == "V1"] <- "EU_Sales"
names(JP_Sales)[names(JP_Sales) == "V1"] <- "JP_Sales"
names(Other_Sales)[names(Other_Sales) == "V1"] <- "Other_Sales"
names(Total_Sales)[names(Total_Sales) == "V1"] <- "Global_Sales"

Complete <- merge(NA_Sales, EU_Sales,by="Year")
Complete <- merge(Complete, JP_Sales,by="Year")
Complete <- merge(Complete, Other_Sales,by="Year")
Complete <- merge(Complete, Total_Sales,by="Year")

Complete_melted <- melt(Complete, id.vars = "Year")

ggplot(Complete_melted, aes(x=Year, y = value, color=variable))+ geom_line() +
  labs(x="Año",y="Millones de unidades Vendidas", title= "Unidades vendidas por Region") +
  scale_color_discrete(name = "Region", labels = c("NA","EU","JP","Otros","Globales"))
 