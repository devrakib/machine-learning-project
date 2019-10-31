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

# Viewing the train dataset in raw format

train

# Viewing the train dataset in table format

View(train)

###### Import the test dataset #######

# Import from web
#test <- read.csv('https://raw.githubusercontent.com/devrakib/machine-learning-project/master/Titanic-R/test.csv')

test <- read.csv("~/project-titanic-R/Titanic-R/test.csv")

# Need to create subsets of Fare

train$Fare2 <- '30+'
train$Fare2[train$Fare < 30 & train$Fare >= 20] <- '20-30'
train$Fare2[train$Fare < 20 & train$Fare >= 10] <- '10-20'
train$Fare2[train$Fare < 10] <- '<10'


table(train$Sex, train$Survived)
#           0   1
#   female  81 233
#   male   468 109

# Total Survived people

aggregate(Survived ~ Sex, data=train, FUN=sum)
#       Sex Survived
#   1 female      233
#   2   male      109

# Total people

aggregate(Survived ~ Sex, data=train, FUN=length)
#      Sex Survived
#   1 female      314
#   2   male      577

# Servived rate

aggregate(Survived ~ Sex, data=train, FUN=function(x) {sum(x)/length(x)})
#      Sex  Survived
#   1 female 0.7420382
#   2   male 0.1889081


# Comparing more than two subsets, we need to use command "aggregate"

# Total number of survived people using these subset

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=sum)

# Let's look at actually how many were they in each subset

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=length)

# Survived rate comparing subsets in terms of FUN=function(x) {sum(x)/length(x)}

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=function(x) {sum(x)/length(x)})

# Create new column in test set with our prediction that everyone dies

test$Survived <- 0

# Update the prediction to say that all females will survive

test$Survived[test$Sex == 'female'] <- 1

# Update once more to say that females who pay more for a third class fare also perish

test$Survived[test$Sex == 'female' & test$Pclass == 3 & test$Fare >= 20] <- 0

# Submit a csv file with the PassengerId and Survived predictions to Kaggle
# write.csv fuction writes the prediction dataframe out to a CSV file, excluding the row numbers

prediction3 <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv (prediction3, file = "prediction3.csv", row.names = FALSE)  