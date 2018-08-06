if(!require(networkD3)){install.packages("networkD3"); library(networkD3)}
if(!require(igraph)){install.packages("igraph"); library(igraph)}
if(!require(reshape2)){install.packages("reshape2"); library(reshape2)}


src <- c("A", "A", "A", "A",
        "B", "B", "C", "C", "D")
target <- c("B", "C", "D", "J",
            "E", "F", "G", "H", "I")
networkData <- data.frame(src, target)
head(networkData)

networkD3::simpleNetwork(networkData, fontSize = 15, zoom = T)

data(MisLinks)
head(MisLinks)

data(MisNodes)
head(MisNodes)


forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = 'Value', arrow = T,
             Group = 'group', opacity = 0.8, zoom = T)

sankeyNetwork(Links = MisLinks, Nodes = MisNodes,
              Source = "source", Target = "target",
              Value = "value", NodeID = "name",
              fontSize = 12, nodeWidth = 18)



if(!require(data.table)){install.packages("data.table"); 
  library(data.table)}
if(!require(dplyr)){install.packages("dplyr"); library(dplyr)}

setwd("C:\Users\renz\Documents\GitHub\SNU_BDI_-JJJ-R\(조교) Network Diagram.R") # dataset이 존재하는 library지정
load("data_list.Rdata")
