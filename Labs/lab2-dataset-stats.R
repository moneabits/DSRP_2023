# importing data file :3
getwd()
Pokemon = read.csv("/Users/tamiaabbott/Desktop/programing/camps/DSRP/DSRP_2023/Data/Pokemon.csv")

# Viewing the data!! 
View(Pokemon)
# mini operating test
summary(Pokemon)
str(Pokemon)

# working with columns 
mtcars[,1:3]
Pokemon[,6:9]


# Starting lab ####
first_five = Pokemon[1:5, 6]
HP = Pokemon$HP

#mean 
mean(Pokemon$HP)

#median 
median(HP)

# Range 
max(HP) - min(HP)

# variance 
round(var(HP), 1)

# standard deviation 
round(sd(HP), 1) 

#IQR 
iqr = IQR(HP)

# outlier calculation 
upperq = quantile(HP, .75) + (1.5 *iqr)
lowerq =  quantile(HP, .25) - (1.5 *iqr)

upperq
lowerq


# finding outleirs 
HP[HP<5]

HP[HP>125]

# removing outliers 
New_HP = HP[HP >= lowerq & HP <= upperq]

# new mean 
mean(New_HP)

# new median 
median(New_HP)

# plotting random stuff 
plot(Pokemon$Attack, HP, col = "Pink", lwd = .9)


