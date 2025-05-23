% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-wrangle.R
\name{FilterBy}
\alias{FilterBy}
\title{Filter by a detected field}
\usage{
FilterBy(df, Value, strField = ExtractFieldName(rlang::caller_arg(Value)))
}
\arguments{
\item{df}{A data.frame to filter.}

\item{Value}{The value to filter on.}

\item{strField}{The name of the field. Auto-detected by default from the
variable used to provide \code{Value}.}
}
\value{
The filtered data.frame.
}
\description{
Filter by a detected field
}
\keyword{internal}
