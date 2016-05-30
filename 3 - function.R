f1 = function(n  # inputs to the func
              ) { # func starts here
  x = 1:n
  y = x*x
  return(y)
}

f1(n = 25)
n

f1(n <- 26)
n

maxmin = function(x  # input is vector x
                  ){
  
  a1 = max(x)
  a2 = min(x)
  a3 = (a1 - a2)/(a1 + a2)
  
  list(a1, a2, a3)}

x = rnorm(10); x
maxmin(x)

f2 = function(n) {
  x = 1:n
  y = x*x
  plot(x,y)
}

matmultiply = function(a,  # matrix a
                       b){   # matrix b
  a %*% b
  
}

a = matrix(rnorm(10),5,2);a
b=matrix(rnorm(8), 2, 4);b

matmultiply(b, a)


a = matrix(rnorm(10),5,2);a
b=matrix(rnorm(10), 2, 5);b
matmultiply(b, a)