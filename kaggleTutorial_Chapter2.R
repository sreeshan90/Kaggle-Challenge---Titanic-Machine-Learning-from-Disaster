# Import the training set: train
train_url <- "http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/train.csv"
train <- read.csv(train_url)

# Import the testing set: test
test_url <- "http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/test.csv"
test <- read.csv(test_url)

# Your train and test set are still loaded in
str(train)
str(test)

library(rpart)
# Build the decision tree
my_tree_two <- rpart(Survived ~ Pclass+Sex+Age+SibSp+Parch+Fare+Embarked, data = train,method ="class")

# Visualize the decision tree using plot() and text()
plot(my_tree_two)
text(my_tree_two)

# Load in the packages to create a fancified version of your tree
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Time to plot your fancy tree
fancyRpartPlot(my_tree_two)

my_prediction <- predict(my_tree_two, test,type = "class")

# Create a data frame with two columns: PassengerId & Survived. Survived contains your predictions
my_solution <- data.frame(PassengerId = test$PassengerId, Survived = my_prediction)

# Check that your data frame has 418 entries
nrow(my_solution) == 418

# Write your solution to a csv file with the name my_solution.csv
write.csv(my_solution, file="my_solution.csv" , row.names = FALSE)

# Create a new decision tree my_tree_three
my_tree_three <- rpart(Survived ~ Pclass+Sex+Age+SibSp+Parch+Fare+Embarked, data = train,method ="class", control = rpart.control(cp = 0, minsplit = 50))

# Visualize your new decision tree
fancyRpartPlot(my_tree_three)

# Make your prediction using `my_tree_five` and `test_new`
my_prediction <- predict(my_tree_five, test_new, type = "class")

# Create a data frame with two columns: PassengerId & Survived. Survived contains your predictions
my_solution <- data.frame(PassengerId = test$PassengerId, Survived = my_prediction)

# Write your solution away to a csv file with the name my_solution.csv
write.csv(my_solution, file="my_solution.csv" , row.names = FALSE)



# create a new train set with the new variable
train_two <- train
train_two$family_size <- train_two$SibSp+train_two$Parch+1

# Create a new decision tree my_tree_four including new feature engineered var
my_tree_four <- rpart(Survived ~ Pclass+Sex+Age+SibSp+Parch+Fare+Embarked+family_size, data = train_two,method ="class", control = rpart.control(cp = 0, minsplit = 50))

# Visualize your new decision tree
fancyRpartPlot(my_tree_four)

