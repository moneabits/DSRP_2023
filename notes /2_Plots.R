# install required packages 
#install.packages("ggplot2")
install.packages(c("usethis", "credentials"))

# load in required plots 
library(ggplot2)

# mpg data set 
str(mpg)

# Plot ####
ggplot(data = mpg, aes(x = hwy, y = cty)) +
  geom_point() + 
  labs( x = "Highway mpg", y = " City mpg", title = "car city vs Highway milage")

#Histograms #### 
# we can set the number of bars with `bins`
ggplot(data = iris, aes(x = iris$Sepal.Length)) + 
  geom_histogram(bins = 35) +
  labs(
    x = "Sepal Lenght", 
    y = "# of Flowers",
    title = " Frequency of iris Sepal Lenghts"
  )

# we can set the number of bars with `binswidth`
ggplot(data = iris, aes(x = iris$Sepal.Length)) +  
  geom_histogram(binwidth = .25) +
  labs(
    x = "Sepal Lenght", 
    y = "# of Flowers",
    title = "Frequency of iris Sepal Lenghts"
  )

head(iris)
# Bin is holding a data that it between it's borders 
# aka a count of how many is between a set count 

# Density Plots ####
# Gives an idea of the spread of the data 

#`after_stat` makes the y coloumn a count rather than precentage 
ggplot(data = iris, aes(x = iris$Sepal.Length, 
                        y= after_stat(count))) +
  geom_density() + 
  labs(
    x = "Sepal Lenght", 
    y = "# of Flowers",
    title = "Frequency of iris Sepal Lenghts"
    
  )


# Box plots #### 
# Provides infromation about the middle most data
ggplot(data = iris, aes(x= iris$Sepal.Length)) + 
  geom_boxplot()

# change axis of the data 
ggplot(data = iris, aes(y= iris$Sepal.Length)) + 
  geom_boxplot()

# plotting agianst other variables 
ggplot(data = iris, aes(x= iris$Sepal.Length, y= iris$Species)) + 
  geom_boxplot()


# Violin Plot ####
# Tells us about the distribtuion of the data 

ggplot(data = iris, aes(x= iris$Species, y=iris$Sepal.Length))+
  geom_violin() +
  labs(
    titile = "Distribution of Iris Sepal lenghts",
    x = "Species",
    y = "Sepal Lenght"
  )


# we can layer a box plot over it 
ggplot(data = iris, aes(x= iris$Species, y=iris$Sepal.Length))+
  geom_violin(color = "white", fill = "pink") + geom_boxplot(width = .2, fill = "lightyellow") +
  labs(
     titile = "Distribution of Iris Sepal lenghts",
     x = "Species",
     y = "Sepal Lenght"
  )


# Bar Plots  
ggplot(data = iris, aes(x = iris$Species, y= iris$Sepal.Length, fill = iris$Species))+
  geom_bar(stat = "summary", fun = "mean", color = "black") +
  labs(
    titile = "Distribution of Iris Sepal lenghts",
    x = "Species",
    y = "Sepal Lenght"
  )

# Scatter Plots ####
# best to compare 2 different numeric vairables against eachother
ggplot(data =  iris, aes(x=iris$Sepal.Length, y = iris$Sepal.Width)) +
  geom_point(color = "pink")

# Numeric v Catorgical 
ggplot(data =  iris, aes(x=iris$Species, y = iris$Sepal.Width)) +
  geom_point(color = "pink")

# Jitter spread out along the x-axis 
ggplot(data =  iris, aes(x=iris$Species, y = iris$Sepal.Width, color = iris$Species)) +
  geom_jitter() + 
  labs (
    titile = "Distribution of Iris Sepal lenghts",
    x = "Species",
    y = "Sepal Lenght",
  )

# Line Plot ####
# 2 Numeric variables against eachother 
#messy data 
ggplot( data = iris, aes(x=iris$Sepal.Length, y = iris$Sepal.Width))+
  geom_line(color = "lightblue") + geom_point()

# clean data 
ggplot( data = iris, aes(x=iris$Sepal.Length, y = iris$Sepal.Width))+
  geom_line(color = "lightblue", stat = "summary", fun = "mean")

#line of best fit 
ggplot( data = iris, aes(x=iris$Sepal.Length, y = iris$Sepal.Width))+
  geom_smooth(color = "lightblue", fill = "pink") + geom_point() +
  theme_classic()

# misc ####
# color values
ggplot(data =  iris, aes(x=iris$Sepal.Length, y = iris$Sepal.Width)) +
  geom_point(aes(color = iris$Species)) +
  scale_color_manual(values = c("pink", "lightblue", "yellow")) +
  theme_minimal()

##factors!!
mpg$year <- as.factor(mpg$year)

# how to reorder catogorical data! 
iris$Species <- factor(iris$Species, level = c("virginica", "setosa", "versicolor"))


