% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generics.R
\name{all.torch.Tensor}
\alias{all.torch.Tensor}
\title{all}
\usage{
\method{all}{torch.Tensor}(x, dim, ...)
}
\arguments{
\item{x}{tensor}

\item{dim}{dimension to reduce}

\item{...}{other parameters (yet to be developed)}
}
\value{
A tensor of type torch.uint8 representing the boolean result:
1 for TRUE and 0 for FALSE.
}
\description{
Returns True if all elements in the tensor are non-zero, False otherwise.
}
\examples{
\dontrun{
a <- torch$BoolTensor(list(TRUE, TRUE, TRUE, TRUE))
b <- torch$BoolTensor(list(FALSE, TRUE, TRUE, TRUE))
c <- torch$BoolTensor(list(TRUE, TRUE, TRUE, FALSE))
all(a)
all(b)
all(c)
d <- torch$tensor(list(list(0, 0),
                       list(0, 0),
                       list(0, 1),
                       list(1, 1)), dtype=torch$uint8)
all(d)
all(d, dim=0L)
all(d, dim=1L)
}
}
