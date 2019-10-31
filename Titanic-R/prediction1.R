############################
#                          #
#   Project Titanic - R    #
#   Rakibul Islam          #
#   irakibul568@gmail.com  #
#                          #
############################

# Set the working directory

setwd("~/machine-learning/Titanic-R")

######## Import the training dataset #########

# Import from web
#train <- read.csv('https://raw.githubusercontent.com/devrakib/machine-learning-project/master/Titanic-R/datasets/train.csv')

train <- read.csv("~/machine-learning/Titanic-R/datasets/train.csv")

# Viewing the train dataset in raw format

train

# Viewing the train dataset in table format

View(train)

###### Import the test dataset #######

# Import from web
#test <- read.csv('https://raw.githubusercontent.com/devrakib/machine-learning-project/master/Titanic-R/datasets/test.csv')

test <- read.csv("~/machine-learning/Titanic-R/datasets/test.csv")

# Viewing the test dataset in raw format

test

# Viewing the test dataset in table format

View(test)

# How many people survived in training dataset

table(train$Survived)
# 0   1           Here,
# 549 342              0 = Died
#                      1 = Survived

# Proportions of people survived and died

prop.table(table(train$Survived))
# 0         1 
# 0.6161616 0.3838384 

# In percentage

prop.table(table(train$Survived)) * 100
#0        1 
#61.61616 38.38384 

# Visual representation of survived in train dataset

barplot(table(train$Survived), xlab="Survived", ylab="People", main="Survival data in Train dataset")

# Considering everyone died in test dataset
# "<-" it's an assignment operator, it will create the Survived column 
# rep command fill the Survived column with the value 0 and repeat it  418 times

test$Survived <- rep(0, 418) 

# We need to submit a csv file with the PassengerId and Survived predictions to Kaggle
# write.csv fuction writes the prediction dataframe out to a CSV file, excluding the row numbers

prediction1 <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv (prediction1, file = "prediction1.csv", row.names = FALSE)








