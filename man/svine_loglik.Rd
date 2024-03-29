% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/svine_methods.R
\name{svine_loglik}
\alias{svine_loglik}
\title{Log-likelihood for S-vine models}
\usage{
svine_loglik(x, model, cores = 1)
}
\arguments{
\item{x}{the data.}

\item{model}{model inheriting from class \link{svine_dist}.}

\item{cores}{number of cores to use; if larger than one, computations are
done in parallel on \code{cores} batches .}
}
\value{
Returns the log-likelihood of the data for the model.
}
\description{
Log-likelihood for S-vine models
}
\examples{
# load data set
data(returns)  

# fit parametric S-vine model with Markov order 1
fit <- svine(returns[1:100, 1:3], p = 1, family_set = "parametric")

svine_loglik(returns[1:100, 1:3], fit)
}
