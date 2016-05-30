rm(list=ls()) # Clear workspace

# Use R as a calculator

2+3

2*3

2/3

# Assignment operator
a = 2   

b = 3

c = a+b

print(c)

mean(x = 1:10) # Assignment operator = and <-
x

mean(x <- 1:10)
x

f <- function(n){
  z <- n*n
  return(z)
}

f(n = 20)

n

f(n <- 23)

n

rm("a") # Removes object "a" from R session

ls() 	# list all objects in R Session

rm(list=ls()) # Remove all objects in R session

getwd()  # Look for your default working directory

dir()  # see what is there in you working director

setwd("C:/Users/Administrator/Desktop/21 March tutorial")  # change Working directory ; observe the difference in / and \ 

getwd()

