# wowzer! 

dog <- 5
dog
dog + 2
# this is a snzzy comment + the variable is dog 
dog # wow no one notices me!

#how to make a header
# R objects  ####

#to check what is in my enviorment/ aka tell the name of all the objects in our enviorment  

#numerical + decimal
number <- 4
decimal<- 4.20

# word
word <- "hello world"
letter <- "b"

#logic 
logic<-TRUE 
logic_2 <-T # another way to say True 

ls()

# different classes 
#characters 
class(word)
class(letter)

#logical
class(logic)
class(logic_2)

# there are more variation in types  
typeof(number)

#we can change the type of an object
as.character(number)
as.integer(number)
# removes anything after the decimal
as.integer(decimal)


#how to run numbers 
round(decimal)
# round (x, N) N dictate how many deciaml points 
round(23/7, 3)
# "?" provides infromation on the function
?round


ceiling(23/7)#celling rounds upwards 
floor(23/7)# floor always roundown 

## NA values (aka unkown)
NA + 6

# naming variables 
name <- "Mone"
NAME <- "MEow"

# good naming conventions 
camelCase <- "Start with captial letter"
snake_case <- "underscores between words"

# Object Manipulation ####
number
number + 8

decimal
number + decimal

name
paste(name, "Abbott", "is", "17") #concatenates vectors (automatical puts a space between things )
paste0(name, "ABbott")

paste(name, number) # we can join togther characters and numbers 
paste(logic, name)


# mini test 
Zodiac = "Virgo"
Age = 16
paste("Hello I'm", name, "and I am a", Zodiac, "and also", Age)

#grep : gloval regex print 
?grep
food = "melon soda"
grepl("me", food)# looking for the letters in the vairable
sub("melon", "grape", food) # subsitute character in words 
sub("melon", "", food)# removing characters from the variable

# use "rm()" to remove a variable from the enviorment 


#Vectors ####
#make a vector of numerics 
num = c(1, 2, 3, 4, 5)# combine things into a vector
range_of_vals = 1:5 # integers from 1 to 5 
5:10 # all intergers from 5 to 10
seq(2, 10, 2)# from 2 to 10 by 2's
seq(from = 2, to = 10, by = 2)
seq(by= 2, from = 2, to = 10) # can put parameers out of order if they are named 

seq(from = 1, to = 5, by = .5) # mini-question 1 
rep(c(1,2), each = 3 )# get "1 1 1 2 2 2" mini question 

rep(5,6) # repeat a value n amound of times 
rep(c(1,2), 5)



# (non-related) setting mutli-vairables 
n <- ame <- "test"

# make a vector of characters 
letters = c("a", "b", "c", "d")
# paste() is different from c(), since paste combine into 1 character 

letters = c(letters, "d")

# make a vector of random numbers between 1 and 20
number <- 1:20
five_nums <- sample(number, 5) # choose 5 values from the vecotr numbers 
sort(five_nums) # sorts in order 
rev(five_nums)# reverse order 


fifteen_nums <- sample(number, 15, replace = T)
sort(fifteen_nums)
length(fifteen_nums) # lenghts of a vector 
unique(fifteen_nums) # uniqeu values in the vector 

# how do to get the number of unique values 
length(unique(fifteen_nums))
# or
table(fifteen_nums)

fifteen_nums + 5
fifteen_nums / 2


nums1 = c(1, 2, 3)
nums2 = c(2, 4, 5)
nums1 + nums2 # values are added togther element wise

nums3 = c(nums1, nums2)
nums3 + nums1 # vlaues are recycled to add togther
nums3 + nums1 + 1 + 1

# what is the difference between the 2 
sum(nums3 + 1)
sum(nums3)+1

#Vector indexing 
number
number[1]
number[8]

number[c(1:5)] # multiple indices 
number[c(1, 15, 17, 8, 9)]

i = 7 
number[i]

# adding new data 
new_number <- c(number, 22, 21)
new_number 

# Datasets ####
?mtcars
mtcars

View(mtcars) # View enitre data set in new tab

summary(mtcars) # gives us infromation about the spread of each vairable
str(mtcars) # preview the strucutre of the dataset 

names(mtcars) # name of the variables
head(mtcars) #preview the first number of row ( can use numbers to speficy how many)

# Pull out indivudal vairbales as vectors 
mpg <- mtcars[,1] # blank means "all", All rows first coloum
mtcars[2,2]
#first 3 colloumns 
mtcars[,1:3]

# use the names to pull out columns (makes data much more readable)
mtcars$gear # pull out the gear and mpg columns 
mtcars[,c("gear", "mpg")] # pull out the gear and mpg columns

sum(mtcars$gear)

# Statictis ####

# IRis datasets
iris
View(iris)

# getting first 5 values 
first_five = iris[1:5,1] 
mean(first_five)

# mean of the entire sepal lenght
round(mean(iris[,1]), 3)

#median 
median(first_five)

median(iris$Sepal.Length)# median of all sepal lenghts 

# Range 
range(first_five)
max(first_five) - min(first_five)

max(iris$Sepal.Length) - min(iris$Sepal.Length)


# vairance 
var(first_five)
var(iris$Sepal.Length)

# standard deviation 
sd(iris$Sepal.Length)

# quartiles + IQR 
IQR(iris$Sepal.Length)
quantile(first_five, .25) # first quartile 
quantile(first_five, .75) # 3rd quantile 

#outliers 
IQR = quantile(iris$Sepal.Length, .75) - quantile(iris$Sepal.Length, .25)
outliers = quantile(iris$Sepal.Length, .25) - (1.5 *IQR)
outliers

## subsetting vectors  
first_five
first_five < 4.75 | first_five > 5 
first_five[first_five < 4.75]

values <- c(first_five, 3,9)
upper
lower
values[values > lower ]

## conditionals 
 x = 5 
 
x<3
x >3
x == 4 
x ==5 
x != 3 

# we can test all value of a vector at once 
numbers <- 1:5

numbers < 3 
numbers == 3

numbers[numbers < 3] # numbers "where: number < 3

lower_out <- 2
uppper_out <- 4

# pull out only outliers 
numbers[numbers < lower_out]
numbers[numbers > uppper_out]

# combine with | (or)
numbers[numbers < lower_out | numbers > uppper_out]

# use & to get all the values in between outliers threshold 
numbers[numbers >= lower_out & numbers <= uppper_out]

# use & when things can happen at the same time (aka inner values)
# or is for things that exisit on it's own ( aka outter values)


# NA values 
NA # unknown 

sum(1, 2, 3, NA)
sum(1, 2, 3, NA, na.rm=T) # removes the NA from the dataset 
