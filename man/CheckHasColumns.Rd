% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-validate.R
\name{CheckHasColumns}
\alias{CheckHasColumns}
\title{Confirm that a data.frame has required columns}
\usage{
CheckHasColumns(
  df,
  chrRequiredColumns = character(),
  strArg = rlang::caller_arg(df),
  envCall = rlang::caller_env()
)
}
\arguments{
\item{df}{The data.frame to validate.}

\item{chrRequiredColumns}{\code{character} A vector of expected columns in a
data.frame.}

\item{strArg}{\code{character} The name of the argument in the calling function.
In general, this value should either be left as the default, or passed from
the calling function if the calling function also has a \code{strArg} argument.}

\item{envCall}{\code{environment} The environment from which this function was
called, for use in better error messages. This value should usually be left
as the default, or passed from the calling function if the calling function
also has an \code{envCall} argument.}
}
\value{
\code{df}, if it is has columns with the required names.
}
\description{
Confirm that a data.frame has required columns
}
\keyword{internal}
