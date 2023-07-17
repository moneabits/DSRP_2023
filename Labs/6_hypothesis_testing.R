### Compares the mass of male and female star wars characters? 
### Null Hypothesis : average mass of male and female star wars character is the sma
### alternative hypothesis : average mass of female star wars charactesr is different 

# load in library 
library(dplyr)
library(ggplot2)

# load in package 
install.packages("corrplot")
library(corrplot)

# star wars 
swHuman <-starwars |> filter(species == "Human", mass > 0)
males <- swHuman |> filter(sex =="male")
females <- swHuman |> filter(sex == "females")

filter(starwars, sex=="female")

males

# incorrect sytax aka gives an error
t.test(males$mass, females$mass, paired = F, alternative = "two.sided")


### ANOVA #####
iris
anova_results= aov(data = iris, iris$Sepal.Width ~ iris$Species)

# Are any groups different from each other?
summary(anova_results)

# WHich ones?
TukeyHSD(anova_results)


# Is there a significant difference in the mean petal lenghts or petal width by species? 
nova_results = aov(data = iris, iris$Petal.Length ~ iris$Species)

summary(nova_results)

TukeyHSD(nova_results)

### Starwars ####
head(starwars)
unique(starwars$species)

# which 3 species are the most common 
top5species = starwars |> 
  summarize(.by = species, count = sum(!is.na(species))) |>
              slice_max(count, n=3)
top5species  

starwars_3 = -8

## is there a signifcant difference in the mass of each of the top 3 species 
a = aov(height ~ species, )





### Chi-Squared ####

# clean-up data 
starwars_cleanup = starwars |> 
  filter(!is.na(species), 
         !is.na(homeworld))

con_table = table(starwars$species, starwars$homeworld)

View(con_table)

# make chisq 

chisq.test(con_table)


### NEw dataset 
# Make tables for year and drive 
mpg

t_tb = table(mpg$year, mpg$drv)

chisq_result = chisq.test(t_tb)
chisq_result
chisq_result$p.value
chisq_result$residuals

# visual plot! 
corrplot(chisq_result$residuals)


### Chi- squared full analysis ####

hereos = read.csv("/Users/tamiaabbott/Desktop/programing/camps/DSRP/DSRP_2023/Data/heroes_information.csv")
head(hereos)

# cleaning data :) 
hereos_clean = hereos |> 
  filter(Alignment != "-",
         Gender != "-")


## plot the counts of the alignment and gender 
ggplot(hereos_clean, aes(x = Gender, y = Alignment)) + 
  geom_count() + 
  theme_minimal()

# make contingency table 
t_hero = table(hereos_clean$Alignment, hereos_clean$Gender)

# chi - sqaured test 
chi = chisq.test(t_hero)
chi$p.value
chi$residuals

# plotting the chi - sqaure 
corrplot(chi$residuals, is.corr = F )
