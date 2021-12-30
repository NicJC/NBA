

knitr::opts_chunk$set(echo = FALSE)
library(bitops)
library(XML)
library(RCurl)
library(dplyr)
library(ggfortify)
library(ggplot2)
library(kableExtra)



url = 'https://www.espn.com/nba/team/roster/_/name/lal/los-angeles-lakers'



urldata<-getURL(url)
data<-readHTMLTable(urldata,stringAsFactors = FALSE)




data<-data.frame(data)




data<-data[complete.cases(data), ]



data<-data.frame("Name" = data$NULL.Name,"Position" = data$NULL.POS, "Age" = data$NULL.Age, "Height" = data$NULL.HT , "Weight" = data$NULL.WT, "College" = data$NULL.College , "Salary" = data$NULL.Salary) + 

table<-kable(data)%>%



data<-data.frame(data)
write.csv(data,"nba.csv",row.names=FALSE)



ggplot(data,aes(x = Height, y = Position))+geom_point(na.rm = TRUE,col = "red", size = 4)+labs(title = "Player's Height and position")

ggsave("points.png", width = 6, height = 6)


data$Age<-as.numeric(data$Age)


ggplot(data,aes(x = Age,y=Position))+geom_violin(draw_quantiles = T,col = ("violet"), bg=("steelblue"))+labs(title = "Player's ages and position")

ggsave("violin.png", width = 6, height = 6)


ggplot(data,aes(x = Age))+geom_boxplot(col = "steelblue",bg="cyan")+labs(title = "Player's ages")
ggsave("boxplot.png", width = 6, height = 6)


ggplot(data,aes(x = Age))+geom_histogram(binwidth = 0.1)+stat_bin(bins = 30,col = "green")+labs(title = "Count of NBA Player's ages")
ggsave("hist.png", width = 6, height = 6)