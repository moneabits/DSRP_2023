## importing data :3
# importing data file :3
getwd()
Pokemon = read.csv("/Users/tamiaabbott/Desktop/programing/camps/DSRP/DSRP_2023/Data/Pokemon.csv")

#libaries 
library(ggplot2)
library(dplyr)

# Viewing the data!! 
View(Pokemon)


### test ####
Gen_4_6_HP = filter(Pokemon, between(Generation, 4, 6), HP > 100) # Pokemon from gen 1-4 that have a HP higher than 100

## lAB 5 ####
select(Pokemon, c(Name:HP, Generation:)

