#####################################################################################
#                 Data-driven model selection by cross validation                   #
#                                   2018.08.22                                      #
#                   Instructor : Sungkyu Jung, TA : Boyoung Kim                     #
#                                                                                   #
#####################################################################################


# mtcars data set
head(mtcars)
#help(mtcars)

# multiple linear regression model
mod <- lm(mpg ~ ., data = mtcars)

# To predict, use broom::augment() function
library(broom)
library(dplyr)
library(tidyr)
a <- augment(mod, mtcars) %>% select(.rownames, mpg, .fitted) %>% head()

# SSE계산해볼거..22나ㅇ


#--- List-columns
library(tibble)

# an example of a list-column data set
temp_tbl <- tribble(
  ~x, ~y,
  1:3, "1, 2",
  3:5, "3, 4, 5"
)# tribble will create a list column if the value in any cell is not a scalar
temp_tbl

#why would you need to list-column? multivalues summariries
quantile(mtcars$mpg)

# summarize() expects a single value
mtcars %>% 
  group_by(cyl) %>% 
  summarize(q = quantile(mpg))

# wrap the result in a list.
mtcars %>% 
  group_by(cyl) %>% 
  summarise(q = list(quantile(mpg)))

# tidyr::unnest() : a list-column data set to data frame.
tibble(x = 1:2, y = list(1:4, 1)) %>% unnest(y)

#percentiles of mpg group by cyl
probs <- c(0.01, 0.25, 0.5, 0.75, 0.99)
mtcars %>% 
  group_by(cyl) %>% 
  summarize(p = list(probs), q = list(quantile(mpg, probs))) %>% 
  unnest()



#--- What is cross-validation?



#--- Creating folds
library(modelr)

#generate 5 folds using modelr::crossv_kfold()
set.seed(1) 
folds <- crossv_kfold(mtcars, k = 5)
folds

# row number of test set in first partition 
folds$test[[1]]



#--- Fitting models to training data 위에 과정과 동일한것.

# purrr::map() applies each train to lm function
library(dplyr)
library(purrr)
folds <- folds %>% mutate(model = map(train, ~ lm(mpg ~ ., data = .)))
#  동일 map(rain, function(x), lm(mpg ~., data =x))
folds  #각 train 열마다 model을 생성한다.CV니까 어려


#which is roughly the same as
model_tmp <- list()
attach(folds) # used to call $train directly
for( i in 1:nrow(folds)) {
  model_tmp[[i]] <- lm(mpg ~ ., data = train[[i]])
}
detach(folds)

#the model fitted to our first set of training data is:
folds$model[[1]] %>% summary()



#--- Predicting the test data

#prediction for each test set
folds %>% mutate(predicted = map2(model, test, ~ augment(.x, newdata = .y)))

#unnest the data frames in the list predicted   #augment 예측값 구하는 함수이다.
library(tidyr)
cv.pred <- folds %>% mutate(predicted = map2(model, test, ~ augment(.x, newdata = .y))) %>% unnest(predicted)
head(cv.pred)

#cross-validated SSE
cv.pred %>% summarize(SSE =  sum(mpg - .fitted)^2)  # 아까보다 SSE가 커졌다. 아까는 trainig이였으니까 



#--- Repeat for many models

# No need to understand what is going on in this R chunk
vars <- colnames(select(mtcars,-mpg))
allsubmodels <- combn(vars,3)  # 3개씩 뽑은뒤 조합하여 저장 총 120개의 조합이 나온다. 
Formulas <- apply(allsubmodels,2, function(x) paste("mpg ~",paste(x,collapse="+")))
head(Formulas)

set.seed(1)
folds <- crossv_kfold(mtcars, k = 5) # start over

Model_validation <- list()


# 120개 모델에 대해서 돌려보자.
for(i in seq_along(Formulas)){  
  SSE <- folds %>% 
    mutate(model = map(train, ~ lm(as.formula(Formulas[i]), data = .))) %>%
    unnest(predicted = map2(model, test, ~ augment(.x, newdata = .y))) %>%
    summarize(SSE =  sum(mpg - .fitted)^2)
  Model_validation[[i]] <- tibble(formula = Formulas[i], SSE = as_vector(SSE))
}

bind_rows(Model_validation) %>% arrange(SSE) %>% head()
