## importing data :3
# importing data file :3
getwd()
Pokemon = read.csv("/Users/tamiaabbott/Desktop/programing/camps/DSRP/DSRP_2023/Data/Pokemon.csv")

#libaries 
library(ggplot2)
library(dplyr)

# Viewing the data!! 
View(Pokemon)




## lAB 5 ####
# Filtering! 
Gen_4_6_HP = filter(Pokemon, between(Generation, 4, 6), HP > 100) # Pokemon from gen 1-4 that have a HP higher than 100

# Select 
select(Pokemon, Total:Generation) # Selecting the pokemon numeric stats! 


# mutate! time! 

New_Pk = mutate(Pokemon, 
       total.sp = Pokemon$Sp..Atk + Pokemon$Sp..Def, 
       total.norm = Pokemon$Attack + Pokemon$Defense)
View(New_Pk)

## lets arranges 

# order by Pokemon name
arrange(Pokemon, Name, Generation)

# order by Total stats 
arrange(Pokemon, desc(Total))


## New visualization
ggplot(data = New_Pk, aes(x = Generation, y = total.sp)) +
  geom_bar(stat = "summary", fun = "mean", fill = "lightpink")


## summarized 

# the mean total stat by the pokemon type 
summarize(Pokemon, 
          mean_total = mean(Total, na.rm = T), 
          .by = Type.1)

# mean total stats by Pokemon generation + how many Pokemon are in that generation 
summarize(Pokemon, 
          mean_total = mean(Total, na.rm = T), 
          .by = Generation, 
          count = n())

