### Compares the mass of male and female star wars characters? 
### Null Hypothesis : average mass of male and female star wars character is the sma
### alternative hypothesis : average mass of female star wars charactesr is different 

swHuman <-starwars |> filter(species == "Human", mass > 0)
males <- swHuman |> filter(sex =="male")
females <- swHuman |> filter(sex == "females")

filter(starwars, sex=="female")

males

# incorrect sytax aka gives an error
t.test(males$mass, females$mass, paired = F, alternative = "two.sided")
