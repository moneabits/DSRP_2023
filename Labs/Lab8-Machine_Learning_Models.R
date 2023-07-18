# Load in Libraries 
library(ranger)
library(reshape2)
library(yardstick)
library(Metrics)
library(ggplot2)

#load in pokemon data set 
Pokemon = read.csv("/Users/tamiaabbott/Desktop/programing/camps/DSRP/DSRP_2023/Data/Pokemon.csv")

View(Pokemon)

# PCA ####
# remove non-numeric values 
pokemon_num = select(Pokemon, -c(Name, Type.1, Type.2, Legendary, X.))
View(pokemon_num)

# pca time 
pcas = prcomp(pokemon_num, scale. = T)
pcas
summary(pcas)
pcas$x

pk_pcas_values = as.data.frame(pcas$x)
pk_pcas_values$Type = Pokemon$Type.1
View(pk_pcas_values)

# plotting the values <3 
ggplot( pk_pcas_values, aes(PC1, PC2, color = Type)) + 
  geom_point() + 
  theme_minimal() 

ggplot( pk_pcas_values, aes(PC1, PC2, color = Type)) + 
  geom_count() + 
  theme_minimal() 

View(pokemonAllNumeric)

## Feature selection #### 

#giving the Pokemon their types back 
pokemon_num$Type = Pokemon$Type.1
#turning the Pokemon types into numbers 
pokemonAllNumeric = mutate(pokemon_num, Type = as.integer(as.factor(Type)))
View(pokemonAllNumeric)

# Visualizing Data!! 
pokemon_cors = cor(pokemonAllNumeric) |>
  melt() |>
  as.data.frame() 

# viewing the correlation 
pokemon_cors

# Ploting the data created by the correlations 
ggplot(pokemon_cors, aes(x = Var1, y= Var2, fill = value)) + 
  geom_tile() +
  scale_fill_gradient2(low = "lightpink", high = "lightblue", mid = "white", 
                       
                       midpoint = 0)
# finding variable with lowest corr 
slice_min(pokemon_cors, value, n=2)

slice_max(filter(pokemon_cors, value < 1), value, n =3)

## Regression Model ####

# Data split 
pk_reg_split = initial_split(pokemonAllNumeric, prop = .75)

# make testing and training split 
pk_reg_test = testing(pk_reg_split)
pk_reg_train = training(pk_reg_split)


# Linear Regression 
pk_lm_fit = linear_reg()|>
  set_engine("lm") |>
  set_mode("regression") |> 
  fit( Sp..Atk ~ ., data = pk_reg_train)

# with total = .1956 , everything = 
pk_lm_fit
summary(pk_lm_fit)

# Boosted Tree 
pk_boost_reg_fit = boost_tree() |>
  set_engine("xgboost") |> 
  set_mode("regression") |> 
  fit(Sp..Atk ~ ., data = pk_reg_train)

pk_boost_reg_fit$fit$evaluation_log
