rm(list = ls()); gc(reset = T)

# ----------------------교육 자료에는 setwd위치를 ???으로 했습니다.
setwd("C:/Users/hgkang/Desktop/")

idx = 1
a = 0
for (i in 1:30){
  Sys.sleep(1)
  a = a + 1
}
a = a*idx
print(idx)
save.image(paste0("test_",idx,".rdata"))

# ----------------------------------
system(command = "r --no-restore --no-save <test.r> test_out.txt")

# ----------------------------------
for (i in 1:8){
  system(command = paste0("r --no-restore --no-save --args ",
                          i, " <test.r> test_out_",
                          i, ".txt"), wait = FALSE)
}

# ----------------------------------
system("tasklist")

# ----------------------------------
a = system("tasklist", intern = T)
head(a)

# ----------------------------------
b <- gregexpr(" ", a[[3]])[[1]]
i = 5
substring(a[[i]],1,b[1])
substring(a[[i]],b[1]+1,b[2])

# ----------------------------------
gsub("(^ +)|( +$)", "", substring(a[[i]],1,b[1]))
gsub("(^ +)|( +$)", "", substring(a[[i]],b[1]+1,b[2]))

# ----------------------------------
taskResult <- matrix("", length(a)-3, 5)  
nn <- c("image" ,"PID" , "session_name" ,"session_num" , "memory")
colnames(taskResult) <- nn
for(i in 4L:length(a))
{
  for (j in 1:5)
  {
    if (j == 1) tmp <- substring(a[[i]],1,b[1])
    if (j == 5) tmp <- substring(a[[i]],b[4]+1)
    if (j!=1 & j!=5) tmp <- substring(a[[i]],b[j-1]+1,b[j])
    taskResult[i-3,j] <- gsub("(^ +)|( +$)", "", tmp)
  }
}
head(taskResult, 6)

# ----------------------------------
taskRead <- function()
{
  a <- system("tasklist", intern = T)
  b <-gregexpr(" ", a[[3]])[[1]]
  taskResult <- matrix("", length(a)-3, 5)  
  nn <- c("image" ,"PID" , "session_name" ,"session_num" , "memory")
  colnames(taskResult) <- nn
  for(i in 4L:length(a))
  {
    for (j in 1:5)
    {
      if (j == 1) tmp <- substring(a[[i]],1,b[1])
      if (j == 5) tmp <- substring(a[[i]],b[4]+1)
      if (j!=1 & j!=5) tmp <- substring(a[[i]],b[j-1]+1,b[j])
      taskResult[i-3,j] <- gsub("(^ +)|( +$)", "", tmp)
    }
  }
  return(taskResult)
}

nMaxTask <-5
tr <- taskRead()
nCurrentTask  <- sum(tr[,1]=="R.exe")
nAvailableTask <- nMaxTask - nCurrentTask

