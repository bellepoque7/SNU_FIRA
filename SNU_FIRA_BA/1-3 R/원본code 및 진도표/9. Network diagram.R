rm(list = ls()); gc(reset = T)

# ---------------------------
if(!require(networkD3)){install.packages("networkD3"); library(networkD3)}
if(!require(igraph)){install.packages("igraph"); library(igraph)}
if(!require(reshape2)){install.packages("reshape2"); library(reshape2)}

# ---------------------------
src <- c("A", "A", "A", "A",
         "B", "B", "C", "C", "D")
target <- c("B", "C", "D", "J",
            "E", "F", "G", "H", "I")
networkData <- data.frame(src, target)
head(networkData)

# ---------------------------
networkD3::simpleNetwork(networkData, fontSize = 15, zoom = T)

# ---------------------------
data(MisLinks)
head(MisLinks)

data(MisNodes)
head(MisNodes)

# ---------------------------
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "name", arrows = T, 
             Group = "group", opacity = 0.8, zoom = TRUE)

# ---------------------------
sankeyNetwork(Links = MisLinks, Nodes = MisNodes,
              Source = "source", Target = "target",
              Value = "value", NodeID = "name",
              fontSize = 12, nodeWidth = 18)

# --------------------------- setwd 위치지정은 교육자료에서는 "???"로 표기 되어 있습니다.
if(!require(data.table)){install.packages("data.table"); 
  library(data.table)}
if(!require(dplyr)){install.packages("dplyr"); library(dplyr)}
if (!require(reshape2)) { install.pakages('reshape2') ; library(reshape2)}

setwd("C:/Users/renz/Documents/GitHub/SNU_BDI_-JJJ-R/data") # dataset이 존재하는 library지정
load("data_list.Rdata")
head(data_list$data)
barplot(table(data_list$date))

word.df = as.data.frame(data_list$data)
word.df = dcast(word.df, word~data,value.var = 'count') #
word.df = cbind(word.df,sum=rorwSums(word.df[-1]))
word_order=order(word.df[6],decreasing = T)
head(word.df[word_order,],10)


# --------------------------- 여기위에는 이해안감.
# 머신 러닝에서 평가 측도로 신뢰도 향상도 지지도를 평가하는데
# 여기서는 신뢰도만 평가하는 것이다.
# increasing rate 20 기준은 연구자가 자의적으로 평가한 듯하다.


View(data_list)
conf_result = data_list$conf_data
head(conf_result)
mean_conf = apply(conf_result[,2:4],1,mean)  # 2014 ~ 2016 까지의 평균 행마다 적용하기위해 apply함수
                                             # 1: margin(1면 행마다, 2면 열마다 적용)
head(mean_conf)
head(conf_result)
conf_result$increasing_rate = conf_result[,5] / mean_conf

head(conf_result$increasing_rate) # y축 에들어가는값 #mean_conf 가 x축에 들어가는 값.


attach(conf_result)    #  $ 제거하고 쓸수있도록...
text_conf = conf_result[c(which(is.finite(increasing_rate) & increasing_rate > 20), which(mean_conf > 0.3)),]
#increasing_reate 20이상 mean_conf 0.3 이상만 찾자.
loc_conf = mean_conf[c(which(is.finite(increasing_rate) & increasing_rate > 20), which(mean_conf > 0.3))]
#위치를 저장.

sum(conf_result$increasing_rate==Inf) # mean_conf가 0이여서 무한대값 꽤나오는데
#어짜피 그래프에서는 생략되서 나오니까 상관 ㄴ

head(text_conf)
head(loc_conf)

# ---------------------------p18
plot(mean_conf, conf_result$increasing_rate, ylim = c(-0.5, 27),
     xlim = c(-0.005, 0.5))
text(loc_conf + 0.03, text_conf$increasing_rate,
     labels = text_conf$word, cex = 1, pos = 3)
abline(h = 1, col = 'red') # 수평선 abline 이 선위에는 2017년 중요해진녀석들
# 오른쪽에 있을수록 전체적으로 중요한 것. 
# machinelaearing은 중요해보이지만 2017년에는 별로 안나온듯핟.
# complex network는 거의 25배가까이 나왔다.
# x축 y축 0으로 몰려있을때는 log 스케일로 그려주면 좋다.

#--------------- 로그 스케일로 그리기
plot(mean_conf+1e-4,
     conf_result$increasing_rate+1e-2,
     ylim = c(1e-2, 27), log = 'xy',
     xlim = c(1e-4, 2))
text(loc_conf *exp(0.03), text_conf$increasing_rate,
     labels =text_conf$word, cex =1, pos =3)
abline(h=1, col = 'red')

# ---------------------------p21
doc_list = data_list$n_gram
uniq_words = unique(do.call('c', doc_list)) # 중복 벡터 제거 마치 set처럼
occur_vec_list = lapply(doc_list, function(x) uniq_words %in% x)    #lapply는 들어가있으면T 없으면 F반환.
head(occur_vec_list)

dtm_mat = do.call('rbind', occur_vec_list) # 매트릭스로 만들어주고.
colnames(dtm_mat) = uniq_words # T면 1 F는 0.
dtm_mat[1:3,1:3] #열에는 각각의 단어... 포함되면 T 안되면 F

# ---------------------------p22
refined_dtm_mat = dtm_mat[, colSums(dtm_mat) != 0]             # 어떤열에도 해당하지 않으면 빼겠다.  
refined_dtm_mat = refined_dtm_mat[rowSums(refined_dtm_mat) != 0,]  # 어떤 단어도 나오지 않은 문서도 빼겠다.


# ---------------------------
cooccur_mat = t(refined_dtm_mat) %*% refined_dtm_mat       # 대각원소는 무시 나머지는 높을수록 W1,W2가 연관되어있다.
cooccur_mat[1:4, 1:4]                                      # %*%는 행렬 곱이다~ 이말이야


# ---------------------------p24 (100*1000 이라서 모두그리면 말도안됌) 
# 방법 1
inx = diag(cooccur_mat) >= 150
cooccur_plot_mat1 = cooccur_mat[inx, inx]

head(cooccur_plot_mat1)

# 방법 2
idx = which(conf_result$increasing_rate[
  which(is.finite(conf_result$increasing_rate))] >= 5)
cooccur_plot_mat2 = cooccur_mat[idx, idx]

head(cooccur_plot_mat2)

# ---------------------------

g = graph.adjacency(cooccur_plot_mat1, weighted = T, mode = 'undirected') # 패키지에 맞게 변환?
g = simplify(g)                                   # 자기자신과의 연결은 반영 안한다.

wc = cluster_walktrap(g)
members = membership(wc)
network_list = igraph_to_networkD3(g, group = as.character(members)) # 그룹은 캐릭터로 줘야한다.
network_list$links$group = 
  network_list$nodes$group[network_list$links$source+1]

# ---------------------------
sankeyNetwork(Links = network_list$links, Nodes = network_list$nodes,
              Source = "source", Target = "target", 
              Value = "value", NodeID = "name", NodeGroup = 'group', LinkGroup = 'group',
              units = "TWh", fontSize = 18, nodeWidth = 15)
# node: 막대기 link:줄기



# --------------------------- 다른 알고리즘으로 해보자.(완성안됨)
wc = cluster_fast_greedy(g)
members = membership(wc)
members
network_list = igraph_to_networkD3(g, group = as.character(members)) # 그룹은 캐릭터로 줘야한다.
network_list$links$group = 
  network_list$nodes$group[network_list$links$source+1]


# --------------------------- 원으로 만들어보자(데이터 아무렇게나)
if(!require(circlize)){install.packages("circlize"); library(circlize)}
name=c(3,10,10,3,6,7,8,3,6,1,2,2,6,10,2,3,3,10,4,5,9,10)
feature=paste("feature ", c(1,1,2,2,2,2,2,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5),
              sep="")
dat <- data.frame(name,feature)

dat <- table(name, feature)

head(dat,4)

chordDiagram(as.data.frame(dat), transparency = 0.5) # 짜잔 원으로 완성
# 하단이 문서이고 문서끼리는 연결이 없고 단어-문서만의 연결만 있다.

# --------------------------- 조금더 보기좋게
install.packages('devtools') # package가 없어서 깃허브에서 가져오
if(!require(chorddiag)){devtools::install_github("mattflor/chorddiag"); 
  library(chorddiag)}
if(!require(RColorBrewer)){install.packages("RColorBrewer"); 
  library(RColorBrewer)}

doc_list = data_list$n_gram
table_list = lapply(doc_list, table)[1:3]
table_name = unique(unlist(do.call("c", doc_list[1:3] )))
names(table_list) = paste0("doc_", 1:3)

table_list = lapply(table_list, function(x){
    word_table = rep(0, length = length(uniq_words))
    word_table = ifelse(uniq_words %in% names(x), x, 0)  
  }
)

table_list = do.call("rbind", table_list)

refined_table_list = t(table_list[, apply(table_list, 2, sum) != 0])
rownames(refined_table_list) = table_name
groupColors <- brewer.pal(3, "Set3")

chorddiag(refined_table_list
          , groupColors = groupColors,  type = "bipartite", tickInterval = 3
          ,groupnameFontsize = 15)





