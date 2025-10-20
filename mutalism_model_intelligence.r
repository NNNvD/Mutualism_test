install.packages(c("remotes","deSolve","FME","rootSolve"))                 
remotes::install_github("hansschepers/grindr") 

library(Grind)

mutualism <- function(t, state, parms){
  with(as.list(c(state, parms)),{
    X <- state[1:nr_var]
    # using matrix multiplication:
    dX <- a * X * (1 - X/k) + a * (X * M %*% X)/k 
    return(list(dX))
  })
}


layout(matrix(1:2, 1, 2))
nr_var <- 12 # number of tests, abilities (W)
nr_of_pp <- 500
data <- matrix(0, nr_of_pp, nr_var) # to collect the data in the simulation
M <- matrix(.05, nr_var, nr_var)
M[diag(nr_var) == 1] <- 0 # set diagonal of M to 0

for(i in 1:nr_of_pp){
  # sample a,K, starting values X from normal 
  # distributions for each person separately
  # note M is constant over persons.
  a <- rnorm(nr_var, .2, .05) 
  k <- rnorm(nr_var, 10, 2)
  x0 <- rnorm(nr_var, 2, 0.1) # initial state of X
  s  <- x0; p <- c() # required for grind
  # collect data (end points) and plot person 1 only:
  data[i,] <- run(odes = mutualism , tmax = 60, 
                  timeplot = (i==1), legend = FALSE) 
}
hist(cor(data)[cor(data) < 1], main = 'positive manifold',
     xlab = 'between test correlations',
     col = 'grey50') # positive manifold
