rm(list = ls()); gc(reset = T)

setwd("/mnt/elice/data_set/Example")
if (!require(RColorBrewer)) { install.packages("RColorBrewer") ; library(RColorBrewer) }
if (!require(Hmisc)) { install.packages("Hmisc") ; library(Hmisc) }
if (!require(dplyr)) { install.packages("dplyr") ; library(dplyr) }
if (!require(reshape2)) { install.packages("reshape2"); library(reshape2) }

options("scipen"=100)

load("bank.Rdata")
# ---------------------------------------------
counts = xtabs( ~ y + job, data = bank_dat)
prob = prop.table(xtabs( ~ y + job, data = bank_dat), 2)

b_plot = barplot(counts, main="직업별 구매여부", ylab = "count",
                 xlab = "직업", col = c(brewer.pal(5, 'BrBG')[c(2, 4)]),
                 legend = rownames(counts), 
                 args.legend = list(x ='topright', bty='n'), las=2)
text(b_plot, counts[1, ], labels = round(prob[2, ], 2), cex = 1.5)

# ---------------------------------------------
prob = prop.table(xtabs( ~ y + job, data = bank_dat), 2)

b_plot = barplot(prob, main="직업별 구매여부", ylab = "비율",
                 xlab = "직업", col = c(brewer.pal(5, 'BrBG')[c(2, 4)]), 
                 legend = rownames(counts),  ylim = c(0, 1.15), 
                 args.legend = list(x = "top", bty="n", ncol = 2), las=2)
text(b_plot, prob[1, ], labels = round(prob[2, ], 2), cex = 1.5)

# ---------------------------------------------
prob = prop.table(xtabs( ~ y + contact, data = bank_dat), 2)

b_plot = barplot(prob, main="컨택별 구매여부", ylab = "비율",
                 xlab = "컨택", col = c(brewer.pal(5, 'BrBG')[c(2, 4)]), 
                 ylim = c(0, 1.15), legend.text = rownames(prob), 
                 args.legend = list(x = "top", bty="n", ncol = 2))
text(b_plot, prob[1, ], labels = round(prob[2, ], 2), cex = 1.5)

# ---------------------------------------------
sub_dat = bank_dat %>% select(month, contact)
sub_dat$ratio = ifelse(bank_dat$y == "yes", 1, 0)
sub_ratio = dcast(data = sub_dat, contact ~ month, fun = mean)

barplot(as.matrix(sub_ratio[,-1]), beside = T, 
        main = "월 & 컨택 여부에 따른 구매 비율", xlab = "Month", ylab = "구매 비율", 
        col = c(brewer.pal(5, 'BrBG')[c(2, 4)]), legend.text = sub_ratio[, 1], 
        args.legend = list(x = "top", bty="n", ncol = 2), ylim = c(0, 0.57))
text(x = seq(2, 29 , 3) - 0.5, y = sub_ratio[1, -1] + 0.005, label = round(sub_ratio[1, -1], 2), cex = 1.2)
text(x = seq(2, 29 , 3) + 0.5, y = sub_ratio[2, -1] + 0.005, label = round(sub_ratio[2, -1], 2), cex = 1.2)

# ---------------------------------------------
boxplot(duration ~ y, data = bank_dat, main = "구매여부별 duration 분포", 
        xlab = "구매여부", ylab = "duration", col = c(brewer.pal(5, 'BrBG')[c(2, 4)]))

# ---------------------------------------------
sub_dat = bank_dat %>% filter(duration <= 1500)

boxplot(duration ~ y, data = sub_dat, 
        main = "구매여부별 duration 분포", xlab = "구매여부", ylab = "duration", 
        col = c(brewer.pal(5, 'BrBG')[c(2, 4)]))

# ---------------------------------------------
prob = prop.table(xtabs( ~ y + poutcome, data = bank_dat), 2)

b_plot = barplot(prob, main = "이전 마케팅 결과와의 비교", ylab = "비율", 
                 xlab = "이전 마케팅 결과", col = c(brewer.pal(5, 'BrBG')[c(2, 4)]), 
                 ylim = c(0, 1.15), legend.text = rownames(prob), 
                 args.legend = list(x = "top", bty="n", ncol = 2))
text(b_plot, prob[1, ], labels = round(prob[2, ], 2), cex = 1.5)

# ---------------------------------------------
prob = prop.table(xtabs( ~ y + month, data = bank_dat), 2)

b_plot = barplot(prob, main = "월별 구매여부", 
                 xlab = "Month", ylab = "비율", col = c(brewer.pal(5, 'BrBG')[c(2, 4)]), ylim = c(0, 1.15),
                 legend.text = rownames(prob), args.legend = list(x = "top", bty="n", ncol = 2))
text(b_plot, prob[1, ], labels = round(prob[2, ], 2), cex = 1.5)

# ---------------------------------------------
counts = xtabs( ~ y + month, data = bank_dat)

b_plot = barplot(counts, main = "월별 구매여부", 
                 xlab = "Month", ylab = "구매여부", 
                 col = c(brewer.pal(5, 'BrBG')[c(2, 4)]), ylim = c(0, 16000), 
                 legend.text = rownames(counts), args.legend = list(x = "top", bty="n", ncol = 2))
text(b_plot, counts[1, ] + 300, labels = counts[2, ], cex = 1.3)

# ---------------------------------------------
counts = xtabs( ~ y + month, data = bank_dat)
non_cam = c(1, 7, 8, 10)
do_cam = c(1:10)[-non_cam]

new_ratio = counts[2, do_cam] / (counts[2, do_cam] - mean(counts[2, non_cam]))

b_plot = barplot(new_ratio, main = "성공률", 
                 xlab = "Month", ylab = "비율", col = c(brewer.pal(5, 'BrBG')[c(4)]), ylim = c(0, 2.4), 
                 legend.text = rownames(new_ratio), args.legend = list(x = "top", bty="n", ncol = 2))
text(b_plot, new_ratio + 0.03, labels = round(new_ratio, 2), cex = 1.5)

# ---------------------------------------------
sub_dat = bank_dat %>% filter(pdays!= 999)

boxplot(pdays ~ y, data = sub_dat, col = c(brewer.pal(5, 'BrBG')[c(2, 4)]),
        main = "마지막 컨택이후 일수 와 구매여부", xlab = "구매여부", ylab = "일수")

# ---------------------------------------------
prob = prop.table(xtabs(~ y + factor(nr.employed), data = bank_dat), 2)

b_plot = barplot(prob, main = "종업원수 별 구매 여부", 
                 xlab = "종업원수", ylab = "비율", col = c(brewer.pal(5, 'BrBG')[c(2, 4)]),
                 legend = rownames(prob), ylim = c(0, 1.15), 
                 args.legend = list(x ='top', bty='n',ncol = 2), las=2)
text(b_plot, prob[1, ] + 0.02, labels = round(prob[2, ], 2), cex = 1.5)

# ---------------------------------------------
means = aggregate(nr.employed ~ month, data = bank_dat, mean)

l_plot = plot(means[, 2] , main = "month별 종업원수", type = "l",
              xlab = "month", ylab = "Count", xaxt="n", ylim = c(4950, 5250))
axis(1, at=1:10, labels=means[, 1]) 
text(x = means[, 1],y =  means[, 2] + 5, labels = round(means[, 2], 1), cex = 1.2)

# ---------------------------------------------
means = aggregate(nr.employed ~ month, data = bank_dat, mean)

l_plot = plot(means[, 2] , main = "month별 종업원수", type = "l",
              xlab = "month", ylab = "Count", xaxt="n", ylim = c(4950, 5250))
axis(1, at=1:10, labels=means[, 1]) 
text(x = means[, 1],y =  means[, 2] + 5, labels = round(means[, 2], 1), cex = 1.2)

# ---------------------------------------------
counts = xtabs( ~ y + month, data = bank_dat)
non_cam = c(1, 7, 8, 10)
do_cam = c(1:10)[-non_cam]
new_ratio = counts[2, do_cam] / (counts[2, do_cam] - mean(counts[2, non_cam]))
new_ratio = data.frame(month = names(new_ratio), ratio = new_ratio)

means = aggregate(nr.employed ~ month, data = bank_dat, mean)
sub_dat = merge(means, new_ratio, by = "month", all  = T)
sub_dat$ratio[is.na(sub_dat$ratio)] = 1

p_point = plot(sub_dat[, 2:3], main =  "성공률과 종업원수", ylim = c(0.9, 2.5), 
               xlab = "종업원수", ylab = "비율", type = "p", lwd = 2, pch = 19)
text(x = sub_dat[, 2] + 1, y = sub_dat[, 3] + 0.07, labels = sub_dat[, 1])

# ---------------------------------------------
load("census.Rdata")
attach(census_dat)

str(census_dat)

# ---------------------------------------------
boxplot(age ~ target, data = census_dat, main = "수입별 나이분포", xlab = "수입", ylab = "나이"
        , col = c(brewer.pal(5, 'BrBG')[c(2, 5)]))

# ---------------------------------------------
prob = prop.table(xtabs( ~ target + as.character(education)), 2)

b_plot = barplot(prob, main = "교육과 수입 관계", ylim = c(0, 1.15), 
                 xlab = "교육", ylab = "비율", col = c(brewer.pal(5, 'BrBG')[c(2, 4)]),
                 legend = rownames(prob),
                 args.legend = list(x ='top', bty='n',ncol = 2), las=2)
text(b_plot, prob[1, ] + 0.02, labels = round(prob[2, ], 2), cex = 1)

# ---------------------------------------------
prob = prop.table(xtabs( ~ target + education), 2)

b_plot = barplot(prob, main = "교육과 수입 관계", ylim = c(0, 1.15), 
                 xlab = "교육", ylab = "비율", col = c(brewer.pal(5, 'BrBG')[c(2, 4)]),
                 legend = rownames(prob),
                 args.legend = list(x ='top', bty='n',ncol = 2), las=2)
text(b_plot, prob[1, ] + 0.02, labels = round(prob[2, ], 2), cex = 1)

# ---------------------------------------------
hist(`capital-gain`, main = "capital-gain")

# ---------------------------------------------
prob = prop.table(xtabs(~ (`capital-gain` > 0)))
names(prob) = c("=0", ">0")
ratio_name = paste0("'",names(prob),"'", "(", round(prob, 2), "%)")

par(mfrow = c(1, 2))
pie(prob, labels = ratio_name, col = c(brewer.pal(5, 'BrBG')[c(2, 4)]), main = "0의 비율")
boxplot(`capital-gain`, main = "capital-gain")
par(mfrow = c(1, 1))

# ---------------------------------------------
par(mfrow = c(1, 2))
pie(prob, labels = ratio_name, col = c(brewer.pal(5, 'BrBG')[c(2, 4)]), main = "0의 비율")
boxplot(`capital-gain`, main = "capital-gain")
par(mfrow = c(1, 1))

# ---------------------------------------------
sub_dat = census_dat %>% filter(`capital-gain` > 0 & `capital-gain` < 99999)

hist(sub_dat$`capital-gain`, breaks = 20, main = "subset of capital-gain")

# ---------------------------------------------
hist(`capital-loss`, main = "capital-loss")

# ---------------------------------------------
prob = prop.table(xtabs(~ (`capital-loss` > 0)))
names(prob) = c("=0", ">0")
ratio_name = paste0("'",names(prob),"'", "(", round(prob, 2), "%)")

par(mfrow = c(1, 2))
pie(prob, labels = ratio_name, col = c(brewer.pal(5, 'BrBG')[c(2, 4)]), main = "0의 비율")
boxplot(`capital-loss`, main = "capital-loss")
par(mfrow = c(1, 1))

# ---------------------------------------------
sub_dat = census_dat %>% filter(`capital-loss` != 0)

hist(sub_dat$`capital-loss`, breaks = 20, main = "subset of capital-loss")

# ---------------------------------------------
sub_dat = census_dat %>% filter(`capital-gain` > 0 & `capital-gain` < 99999)

plot(sub_dat$`hours-per-week`, sub_dat$`capital-gain`, main = "gain과 hours-per-week관계"
     , ylab = "capital-gain", xlab = "hours-per-week",  pch = 19)

# ---------------------------------------------
sub_dat = census_dat %>% filter(`capital-gain` > 0 & `capital-gain` < 99999)
n = nrow(sub_dat)

plot(sub_dat$`hours-per-week` + rnorm(n), sub_dat$`capital-gain` + rnorm(n)*100, main = "gain과 hours-per-week관계" , ylab = "capital-gain", xlab = "hours-per-week",  pch = 19, col = "#11111110")

# ---------------------------------------------
plot(sub_dat$`hours-per-week` + rnorm(n), sub_dat$`capital-gain` + rnorm(n)*100, main = "gain과 hours-per-week관계" , ylab = "capital-gain", xlab = "hours-per-week",  pch = 19, col = "#11111110")

# ---------------------------------------------
sub_dat = census_dat %>% filter(`capital-gain` > 0 & `capital-gain` < 99999)
means = aggregate(`capital-gain` ~ education, data = sub_dat, median)

b_plot = barplot(means[, 2], main = "education에 따른 capital-gain 평균", ylab = "capital-gain 평균", 
                 xlab = "교육수준",  names.arg = means[, 1], ylim = c(0, 24000), las = 2, col = c(brewer.pal(5, 'BrBG')[4]) )
text(b_plot, means[, 2] + 500, labels = round(means[, 2], 0), cex = 1)

# ---------------------------------------------
sub_dat = census_dat %>% filter(`capital-gain` < 99999)
prob = xtabs( ~ (sub_dat$`capital-gain` == 0) + sub_dat$education)

b_plot = barplot(prob[1, ], main = "eduction에서의 capital-gain이 0이 아닌 수", 
                 xlab = "교육수준", ylab = "Count", ylim = c(0, 700) ,
                 col = c(brewer.pal(5, 'BrBG')[c(4)]))
text(b_plot, prob[1, ] + 20, labels = prob[1, ], cex = 1.5)

# ---------------------------------------------
sub_dat = census_dat %>% filter(`capital-gain` < 99999)
means = aggregate(`capital-gain` ~ education, data = sub_dat, mean)

b_plot = barplot(means[, 2], main = "education에 따른 capital-gain 평균", ylab = "capital-gain 평균", 
                 xlab = "교육수준",  names.arg = means[, 1] , ylim = c(0, 2800), las = 2, col = c(brewer.pal(5, 'BrBG')[4]) )
text(b_plot, means[, 2] + 50, labels = round(means[, 2], 0), cex = 1)

