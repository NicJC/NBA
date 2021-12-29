

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



data<-data.frame("Name" = data$NULL.Name,"Position" = data$NULL.POS, "Age" = data$NULL.Age, "Height" = data$NULL.HT , "Weight" = data$NULL.WT, "College" = data$NULL.College , "Salary" = data$NULL.Salary)

table<-kable(data)%>%



data<-data.frame(data)
write.csv(data,"nba.csv",row.names=FALSE)



ggplot(data,aes(x = Height, y = Position))+geom_point()

ggsave("points.png", width = 6, height = 6)


table





data$Age<-as.numeric(data$Age)

str(data)



library(vioplot)
x1 <- data$Age

vioplot(x1,
        col="gold")
grid()
title("Violin Plot of Player's ages")
ggsave("violin.png", width = 6, height = 6)




boxplot(data$Age, main = "boxplot of Player's Ages", horizontal = T, col = "violet")
grid()
ggsave("box.png", width = 6, height = 6)

ggplot(data,aes(x = Age))+geom_histogram()+stat_bin(bins = 30,col = "cyan")+labs(title = "Count of NBA Player's ages")
ggsave("hist.png", width = 6, height = 6)

