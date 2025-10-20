install.packages(c("remotes","deSolve","FME","rootSolve"))
# The mutualism model is implemented in the `grindr` package, which is hosted on GitHub.
# Installing it from source ensures the functions used in the Santa Fe Institute
# course materials are available locally.
remotes::install_github("hansschepers/grindr")

# Load the Grind package, which provides the `run()` helper used to solve and
# visualise ordinary differential equation (ODE) systems.
library(Grind)

# Define the mutualism ODE system that captures the Dynamical Model of General
# Intelligence. The function returns the rate of change for each latent ability
# (test score) given the current state and parameter values.
mutualism <- function(t, state, parms){
  with(as.list(c(state, parms)),{
    # Extract the current latent ability values from the state vector. The first
    # `nr_var` positions hold the ability scores X1 ... Xnr_var.
    X <- state[1:nr_var]
    # Compute the derivative dX/dt by combining logistic growth with the
    # positive mutualistic interactions encoded in matrix M. The matrix product
    # `M %*% X` accumulates the influence of the other abilities on each focal
    # ability.
    dX <- a * X * (1 - X/k) + a * (X * M %*% X)/k
    return(list(dX))
  })
}

# Arrange the plotting window to show the time series of the first simulated
# person next to the correlation histogram.
layout(matrix(1:2, 1, 2))

# Specify the number of observed variables (tests) and the number of simulated
# participants.
nr_var <- 12 # number of tests / latent abilities (W)
nr_of_pp <- 500

# Pre-allocate the matrix that stores the simulated end-point data (final
# ability levels) for each participant.
data <- matrix(0, nr_of_pp, nr_var)

# Create the mutualism interaction matrix. The diagonal is set to zero so that
# self-effects are excluded; only cross-variable mutualistic influences remain.
M <- matrix(.05, nr_var, nr_var)
M[diag(nr_var) == 1] <- 0

for(i in 1:nr_of_pp){
  # Sample person-specific growth rates (a), carrying capacities (k), and
  # starting states (x0) from normal distributions, reflecting individual
  # differences. The interaction matrix M is held constant across persons.
  a <- rnorm(nr_var, .2, .05)
  k <- rnorm(nr_var, 10, 2)
  x0 <- rnorm(nr_var, 2, 0.1) # initial state of X

  # Grind requires initial states in `s` and an (optional) parameter vector `p`.
  # Here we reuse x0 and leave the parameter vector empty because the sampled
  # parameters are stored in the global environment for the solver.
  s  <- x0; p <- c()

  # Simulate the ODEs up to t = 60. For the first participant only, plot the
  # time trajectories; for the remaining participants, skip plotting to save
  # time. The final state values are stored in the data matrix.
  data[i,] <- run(odes = mutualism , tmax = 60,
                  timeplot = (i==1), legend = FALSE)
}

# Display the positive manifold by showing the distribution of the off-diagonal
# elements of the correlation matrix. Values near 1 are removed to avoid the
# trivial diagonal entries.
hist(cor(data)[cor(data) < 1], main = 'positive manifold',
     xlab = 'between test correlations',
     col = 'grey50')
