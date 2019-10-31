############################
#                          #
#   Project Titanic - R    #
#   Rakibul Islam          #
#   irakibul568@gmail.com  #
#                          #
############################

# Set the working directory

setwd("~/project-titanic-R/Titanic-R")

######## Import the training dataset #########

# Import from web
#train <- read.csv('https://raw.githubusercontent.com/devrakib/machine-learning-project/master/Titanic-R/train.csv')

train <- read.csv("~/project-titanic-R/Titanic-R/train.csv")


###### Import the test dataset #######

# Import from web
#test <- read.csv('https://raw.githubusercontent.com/devrakib/machine-learning-project/master/Titanic-R/test.csv')

test <- read.csv("~/project-titanic-R/Titanic-R/test.csv")

# a small test, we do not try bigger things for now

library(rpart)
# model <- rpart(Survived ~ Sex, data=train, method="class")
model <- rpart(Survived ~ Pclass + Age, data=train, method="class")
par(xpd = NA) # otherwise on some devices the text is clipped
plot(model)
text(model, digits = 3)

# Install and load required packages for fancy decision tree plotting

# install.packages('rattle')
# install.packages('rpart.plot')
# install.packages('RColorBrewer')
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Recreate the gender model

mytree1 <- rpart(Survived ~ Sex, data=train, method="class")
fancyRpartPlot(mytree1)

mytree2 <- rpart(Survived ~ Pclass + Age, data=train, method="class")
fancyRpartPlot(mytree2)

# Build a deeper tree
mytree3 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + 
                   Fare + Embarked, data=train, method="class")

# what if, we take all the variable? Not a good idea
mytree4 <- rpart(Survived ~ ., data=train, method="class")

# Plot it with base-R
plot(mytree3)
text(mytree3)
# And then make it look better with fancyRpartPlot!
fancyRpartPlot(mytree3)

# Now let's make a prediction and write a submission file
prediction4th <- predict(mytree3, test, type = "class")
prediction4 <- data.frame(PassengerId = test$PassengerId, Survived = prediction4th)
write.csv(prediction4, file = "prediction4.csv", row.names = FALSE)
