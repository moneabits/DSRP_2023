# importing data file :3
getwd()
Pokemon = read.csv("/Users/tamiaabbott/Desktop/programing/camps/DSRP/DSRP_2023/Data/Pokemon.csv")

#gg plot 
library(ggplot2)

# Viewing the data!! 
View(Pokemon)


# Variables ####

gen = Pokemon$Generation
hp = Pokemon$HP
tp = Pokemon$Type.1
tot = Pokemon$Total

# Plot 1 #### 
ggplot(data = Pokemon, aes(x=gen)) +
  geom_histogram(fill = "pink", binwidth =.5) +
  theme_minimal() + 
  labs(
    x = "generation",
    y = "# of Pokemon",
    title = "Number of Pokemon per generation"
  )


# Plot 2 ####
ggplot(data = Pokemon, aes(fill = tp, x = tp, y = tot) +
  geom_violin() +
  theme_minimal() + 
  labs(
    x = "Type",
    y = "Health Points",
    title = "Pokemon Health Points v. Type"
  ) 

# Plot 3  ####
ggplot(data = Pokemon, aes(x = gen, y = hp)) +
  geom_jitter(aes(color = Pokemon$Generation)) +
  scale_color_manual(values = c("red", "orange", "yellow", "green", "blue", 'purple')) +
  theme_minimal() + 
  labs(
    x = "Generation",
    y = "Health Points",
    title = "Pokemon Health Points v. Generation",
    color = "Generations"
  ) 

# random one 
ggplot(data = Pokemon, aes(x = hp, y = gen)) +
  geom_count()
