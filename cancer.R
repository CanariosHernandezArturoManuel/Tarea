#para Breastcancer
#install.packages("mlbench")
library(mlbench)
data("BreastCancer")
library(dplyr)
library(rpart)
library(magrittr)
library(Metrics)
library(caret)

arbol <- BreastCancer %>% rpart(Class ~ Cl.thickness, data = .)
predict(arbol, BreastCancer) %>% head

predicted_class <- predict(arbol, BreastCancer) %>%
  as.data.frame %$%
  ifelse(benign > 0.5, "benign", "malignant")

table(BreastCancer$Class, predicted_class)

library(party)

arbol_alt <- BreastCancer %>% ctree(Class ~ Cl.thickness, data = .)
table(BreastCancer$Class, predict(arbol_alt, BreastCancer))

library(randomForest)

random_forest <- BreastCancer %>% randomForest(Class ~ Cl.thickness, data = .)
table(BreastCancer$Class, predict(random_forest, BreastCancer))

library(nnet)

red_neuronal <- BreastCancer %>% nnet(Class ~ Cl.thickness, data = ., size = 5)
predicted_class <- predict(red_neuronal, BreastCancer) %>%
  { ifelse(. < 0.5, "benign", "malignant") }

table(BreastCancer$Class, predicted_class)

library(kernlab)

maquinas_supp_vec <- BreastCancer %>% ksvm(Class ~ Cl.thickness, data = .)
table(BreastCancer$Class, predict(maquinas_supp_vec, BreastCancer))

library(e1071)

naive_bayes <- BreastCancer %>% naiveBayes(Class ~ Cl.thickness, data = .)
table(BreastCancer$Class, predict(naive_bayes, BreastCancer))