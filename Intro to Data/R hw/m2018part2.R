 M2018_sample_submission <- read.csv("~/Downloads/M2018_sample_submission.csv", stringsAsFactors=FALSE)
   View(M2018_sample_submission)
 M2018_test_students <- read.csv("~/Downloads/M2018_test_students.csv", stringsAsFactors=FALSE)
   View(M2018_test_students)
 M2018_train <- read.csv("~/Downloads/M2018_train.csv", stringsAsFactors=FALSE)
   View(M2018_train)
 train <- M2018_train
 test <- M2018_test_students

library(rpart)
library(rpart.plot)

tree <- rpart(GRADE ~ SCORE + ASKS_QUESTIONS + LEAVES_EARLY + PARTICIPATION, data = train, method = 'class')
predict(tree,train, type = 'class')
rpart.plot(tree)
 View(tree)
prp(tree, extra = 100, box.col = "green")
CrossValidation::cross_validate(train,tree,2,0.8)

tree <- rpart(GRADE ~ SCORE + ASKS_QUESTIONS + LEAVES_EARLY + PARTICIPATION, data = train, method = 'class', minsplit = 4, minbucket = 4)
predict(tree,train, type = 'class')
rpart.plot(tree)
 View(tree)
prp(tree, extra = 100, box.col = "green")
CrossValidation::cross_validate(train,tree,2,0.8)

tree <- rpart(GRADE ~ SCORE + ASKS_QUESTIONS + LEAVES_EARLY + PARTICIPATION, data = train, method = 'class', minsplit = 10, minbucket = 10)
predict(tree,train, type = 'class')
rpart.plot(tree)
View(tree)
prp(tree, extra = 100, box.col = "green")
CrossValidation::cross_validate(train,tree,3,0.8)

tree <- rpart(GRADE ~ SCORE + ASKS_QUESTIONS + LEAVES_EARLY + PARTICIPATION, data = train, method = 'class', minsplit = 30, minbucket = 30)
predict(tree,train, type = 'class')
rpart.plot(tree)
View(tree)
prp(tree, extra = 100, box.col = "green")
CrossValidation::cross_validate(train,tree,3,0.8)

tree <- rpart(GRADE ~ SCORE + ASKS_QUESTIONS + LEAVES_EARLY + PARTICIPATION, data = train, method = 'class', minsplit = 20, minbucket = 20)
predict(tree,train, type = 'class')
rpart.plot(tree)
View(tree)
prp(tree, extra = 100, box.col = "green")
CrossValidation::cross_validate(train,tree,3,0.8)

tree <- rpart(GRADE ~ SCORE + ASKS_QUESTIONS + LEAVES_EARLY + PARTICIPATION, data = train, method = 'class', minsplit = 25, minbucket = 25)
predict(tree,train, type = 'class')
rpart.plot(tree)
View(tree)
prp(tree, extra = 100, box.col = "green")
CrossValidation::cross_validate(train,tree,5,0.8)

tree <- rpart(GRADE ~ SCORE + ASKS_QUESTIONS + LEAVES_EARLY + PARTICIPATION, data = train, method = 'class', minsplit = 22, minbucket = 22)
predict(tree,train, type = 'class')
rpart.plot(tree)
View(tree)
prp(tree, extra = 100, box.col = "green")
CrossValidation::cross_validate(train,tree,5,0.8)

tree <- rpart(GRADE ~ SCORE + ASKS_QUESTIONS + LEAVES_EARLY + PARTICIPATION, data = train, method = 'class', minsplit = 27, minbucket = 27)
predict(tree,train, type = 'class')
rpart.plot(tree)
View(tree)
prp(tree, extra = 100, box.col = "green")
CrossValidation::cross_validate(train,tree,5,0.8)

tree <- rpart(GRADE ~ SCORE + ASKS_QUESTIONS + LEAVES_EARLY + PARTICIPATION, data = train, method = 'class', minsplit = 26, minbucket = 26)
predict(tree,train, type = 'class')
rpart.plot(tree)
View(tree)
prp(tree, extra = 100, box.col = "green")
CrossValidation::cross_validate(train,tree,5,0.8)

tree <- rpart(GRADE ~ SCORE + ASKS_QUESTIONS + LEAVES_EARLY + PARTICIPATION, data = train, method = 'class', minsplit = 25, minbucket = 20)
predict(tree,train, type = 'class')
rpart.plot(tree)
View(tree)
prp(tree, extra = 100, box.col = "green")
CrossValidation::cross_validate(train,tree,4,0.8)

pred.tree <- predict(tree,newdata = test, type = "class")
test$X <- pred.tree
M2018_sample_submission$GRADE <- pred.tree
write.csv(M2018_sample_submission, "submission.csv", row.names = FALSE)
