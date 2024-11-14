#install.packages("rpart")
#install.packages("magrittr")
#install.packages("dplyr")
#install.packages("Metrics")
#install.packages("caret")
#instalar el dataset con data(cars)
library(rpart)
data(cars)
library(magrittr)
library(dplyr)
library(Metrics)
library(caret)

arbol <- cars %>% rpart(dist ~ speed, data = .)
rmse(predict(arbol, cars), cars$dist)

#install.packages("party")
library(party)

arbol_alt <- cars %>% ctree(dist ~ speed, data = .)
rmse(predict(arbol_alt, cars), cars$dist)

plot(cars %>% ctree(dist ~ speed, data = .))

#install.packages("randomForest")
library(randomForest)

random_forest <- cars %>% randomForest(dist ~ speed, data = .)
rmse(predict(random_forest, cars), cars$dist)

#install.packages("nnet") (esta paqueteria se debia instalar con alguna de
#las anteriores, si no es asi, se debe instalar manualmente)
library(nnet)

red_neuronal <- cars %>% nnet(dist ~ speed, data = ., size = 5)
rmse(predict(red_neuronal, cars), cars$dist)

#install.packages("kernlab")
library(kernlab)

maquinas_supp_vec <- cars %>% ksvm(dist ~ speed, data = .)
rmse(predict(maquinas_supp_vec, cars), cars$dist)