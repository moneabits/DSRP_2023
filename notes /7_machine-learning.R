## packages ####
install.packages("tidymodels")
install.packages("reshape2")
install.packages("xgboost")
install.packages("ranger")
install.packages("Metrics")
library(ranger)
library(reshape2)
library(yardstick)
library(Metrics)

## Unsupervised learning #### 
## Principal Components Analysis 
head(iris)


## remove any non-numeric variables 
iris_num = select(iris, -Species)
iris_num

## do PCA
pcas = prcomp(iris_num, scale. = T) # standardizing the data 
pcas
summary(pcas)

pcas$rotation
pcas$x
 pcas_values = as.data.frame(pcas$x)
 pcas_values$species = iris$Species

 # ploting the vlaues of each 
 ggplot( pcas_values, aes(PC1, PC2, color = species)) + 
   geom_point() + 
   theme_minimal()
 
 ### Supervised Learning ####
 ## Step 1 : Collect Data ####
 head(iris)

 ## Step 2: Clean and Process Data ####
 
 #Get Rid of NAs 
 noNas <- na.omit(starwars) # removes any column with a NA in it 
 
 # Replace with means 
 replaceWithMean <- mutate(starwars, 
                           mass = ifelse(is.na(mass), 
                                         mean(mass),
                                         mass))
## Encoding categories as factors or integers 
 # If categorical vairble is a character, make it a factor
 intSpecies <- mutate(starwars, 
                      species = as.integer(as.factor(species)))

 # if categorical variable is already a factor, make it an integer
 irisAllNumeric <- mutate(iris, 
                     Species = as.integer(Species))
View(intIrisSp)


## Step 3 : Visualize Data ####
# Make a PCA -> to see where to data clusters the most 
# Calculate correlations 
iriscCors = cor(irisAllNumeric) |>
  melt()|>
  as.data.frame()

iriscCors

ggplot(iriscCors, aes(x = Var1, y= Var2, fill = value)) + 
  geom_tile() +
  scale_fill_gradient2(low = "red", high = "blue", mid = "white", 
 
                                             midpoint = 0)
# correlated !! 
ggplot(irisAllNumeric, aes(x = Petal.Length, y = Sepal.Length)) +
  geom_count() +
  theme_minimal()

## Step 4: preform Feature Selection #### 
# Choose which varibales you want to classify or predcit 
# Choose which variables you want to use a features in your model 
# For Iris data..
# Classify on Species (classifcation) & Predict on Sepal.Lenght (Regression)

# set Seed 
set.seed(71723)

## Seperate Data into Testing a training sets 
library(rsample)

#Regression dataset split 
# put 75% of the data into the training set 
# create a split 
reg_split = initial_split(irisAllNumeric, prop = .75)

# Use the split to form testing and training data 
reg_train = training(reg_split)
reg_test = testing(reg_split)

# Classification dataset splits ( use iris instead of irisAllNumeric)
class_split = initial_split(iris, prop = .75)

class_train = training(class_split)
class_test = testing(class_split)

library(parsnip)

##. Step 6 & 7 ####
##Linear Regression 
lm_fit = linear_reg() |>
  set_engine("lm") |>
  set_mode("regression") |> 
  fit(Sepal.Length ~ Petal.Length + Petal.Width + Species + Sepal.Width, data = reg_train)

# Sepal.Lenght = 2.3 + Petal.Length = .797 + Petal.Width = -.4067 + Species = -.3312 + Sepal.Width = 0.5501
lm_fit
summary(lm_fit$fit) # close the r^2 value is to 0 the better the model is


## Logistic Reg
log_fit = logistic_reg() |>
  set_engine("glm") |>
  set_mode("classification") |>
  fit(Species ~ Petal.Width + Petal.Length + ., data ~ class_train)


## Boosted Tree 
boost_reg_fit = boost_tree() |>
  set_engine("xgboost") |> 
  set_mode("regression") |> 
  fit(Sepal.Length ~ ., data = reg_train)

boost_reg_fit$fit$evaluation_log


# Classifcation 
boost_class_fit = boost_tree() |>
  set_engine("xgboost") |> 
  set_mode("classification") |> 
  fit(Species ~ ., data = class_train)

boost_class_fit$fit$evaluation_log

# Random Forrest 
# reg
forest_reg_fit = rand_forest() |>
  set_engine("ranger") |> 
  set_mode("regression") |> 
  fit(Sepal.Length ~ ., data = reg_train)
  
forest_reg_fit$fit

# classification 
forest_class_fit = rand_forest() |>
  set_engine("ranger") |> 
  set_mode("classification") |> 
  fit(Species ~ ., data = class_train)

forest_class_fit$fit

## Step 8 : evaluate model preformance on Test Set #### 

reg_results = reg_test

# Calculate accuracy for regression  models 
reg_results$lm_pred = predict(lm_fit, reg_test)$.pred
reg_results$boost_pred = predict(boost_reg_fit, reg_test)$.pred
reg_results$forest_pred = predict(forest_reg_fit, reg_test)$.pred


yardstick::mae(reg_results, Sepal.Length, lm_pred)
yardstick::mae(reg_results, Sepal.Length, boost_pred)
yardstick::mae(reg_results, Sepal.Length, forest_pred)

yardstick::rmse(reg_results, Sepal.Length, lm_pred) 
yardstick::rmse(reg_results, Sepal.Length, boost_pred)
yardstick::rmse(reg_results, Sepal.Length, forest_pred)

# Calculate accuracy for classification models 

class_results = class_test

class_results$log_pred = predict(log_fit, class_test)$.pred.class
class_results$clboost_pred = predict(boost_class_fit, class_test)$.pred_class
class_results$clforest_pred = predict(forest_class_fit, class_test)$.pred_class


# Class results 
class_results$Species == "setosa"
class_results$clboost_pred == "setosa"

# f1 score time <3 
f1(class_results$Species == "virginica", class_results$clboost_pred == "virginica")
