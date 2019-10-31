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


# The disaster was famous for saving "women and children first" 
# Take a look at the Sex

summary(train$Sex)
# female   male 
# 314    577

# Poportions of number of males and females that survived

prop.table(table(train$Sex, train$Survived))
#             0          1
# female 0.09090909 0.26150393
# male   0.52525253 0.12233446

prop.table(table(train$Sex, train$Survived),1)
#             0         1
# female 0.2579618 0.7420382
# male   0.8110919 0.1889081

prop.table(table(train$Sex, train$Survived),1) * 100
#           0        1
# female 25.79618 74.20382
# male   81.10919 18.89081

# Visual representation of passengers in train dataset

barplot(table(train$Sex), xlab="Passenger", ylab="People", main="Train Data Passenger")

# What we want to see is the row-wise proportion, as separate groups,
# We need to use command to give us proportions 
# in the 1st dimension which stands for the rows

prop.table(table(train$Sex, train$Survived),1)

#               0         1
# female 0.2579618 0.7420382
# male   0.8110919 0.1889081

# Considering all male died in test dataset, let's make second prediction
# We then alter that same column with 1's for the subset of passengers
# where the variable "Sex" is equal to "female"

test$Survived <- 0
test$Survived[test$Sex == 'female'] <- 1

# We need to submit a csv file with the PassengerId and Survived predictions to Kaggle
# write.csv fuction writes the prediction dataframe out to a CSV file, excluding the row numbers

prediction2 <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(prediction2, file = "prediction2.csv", row.names = FALSE)
