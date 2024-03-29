% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/standard_errors.R
\name{svine_bootstrap_models}
\alias{svine_bootstrap_models}
\title{Bootstrap S-vine models}
\usage{
svine_bootstrap_models(n_models, model)
}
\arguments{
\item{n_models}{number of bootstrap replicates.}

\item{model}{the initial fitted model}
}
\value{
A list of length \code{n_models}, with each entry representing one
bootstrapped model as object of class \link{svine}.
}
\description{
Computes bootstrap replicates of a given model using the one-step block
multiplier bootstrap of Nagler et. al (2022).
}
\examples{
data(returns)
dat <- returns[1:100, 1:2]

# fit parametric S-vine model with Markov order 1
model <- svine(dat, p = 1, family_set = "parametric")

# compute 10 bootstrap replicates of the model
boot_models <- svine_bootstrap_models(10, model)

# compute bootstrap replicates of 90\%-quantile of X_1 + X_2.
mu_boot <- sapply(
  boot_models,
  function(m) {
    xx <- rowSums(t(svine_sim(1, 10^2, m, past = dat)[1, ,]))
    quantile(xx, 0.9)
  }
) 
}
