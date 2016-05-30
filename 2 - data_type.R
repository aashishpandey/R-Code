# Vectors
a <- c(1,2,5.3,6,-2,4) # numeric vector
a
b <- c("one","two","three"); b # character vector
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #logical vector

# Matrices
# generates 5 x 4 numeric matrix
y = matrix(1:20, # generates a sequence from 1 to 20
           nrow=5, # num of rows in the matrix
           ncol=4) # num of cols

y
t(y) # transpose of y

# define a matrix 6x7 in size, with values drawn from a random normal
randnorm = matrix(rnorm(42), # draws 42 N(0,1) values
                  nrow = 6,
                  ncol = 7)
randnorm

randnorm=matrix(rnorm(42), 6, 7) #  byrow = FALSE
randnorm

# data frames
d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
mydata <- data.frame(d,e,f)
names(mydata) <- c("ID","Color","Passed") # variable names 

# Lists
# example of a list with 4 components -
# a string, a numeric vector, a matrix, and a scaler
w <- list(name="Fred", mynumbers=a, mymatrix=y, age=5.3)
w

# factors
# variable gender with 20 "male" entries and
# 30 "female" entries
gender <- c(rep("male",20), rep("female", 30)); gender
gender <- factor(gender); gender
# stores gender as 20 1s and 30 2s and associates
# 1=female, 2=male internally (alphabetically)
# R now treats gender as a nominal variable
summary(gender) 

sum(gender) # error
sum(as.numeric(gender))
# 70 why ??

# Some useful functions
length(a) # number of elements or components
str(w)    # structure of an object
class(w)  # class or type of an object
names(mydata)  # variables in data set