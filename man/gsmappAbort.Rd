% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-conditions.R
\name{gsmappAbort}
\alias{gsmappAbort}
\title{Error messaging for this package.}
\usage{
gsmappAbort(
  chrMessage,
  strClass,
  ...,
  envCall = rlang::caller_env(),
  envEvaluate = rlang::caller_env()
)
}
\arguments{
\item{chrMessage}{\code{character} A vector of message elements to be formatted
via \code{\link[cli:cli_bullets]{cli::cli_bullets()}}.}

\item{strClass}{\code{character} A descriptive label for this type of error, in
lower_snake_case.}

\item{...}{Passed to \code{\link[rlang:abort]{rlang::abort()}}, \code{\link[rlang:abort]{rlang::warn()}} or
\code{\link[rlang:abort]{rlang::inform()}}.}

\item{envCall}{\code{environment} The environment from which this function was
called, for use in better error messages. This value should usually be left
as the default, or passed from the calling function if the calling function
also has an \code{envCall} argument.}

\item{envEvaluate}{\code{environment} The environment in which any variables used
in the message or widget are defined. You almost definitely want to leave
this as the default value.}
}
\value{
An error condition with classes \code{"gsm.app-condition"},
\code{"gsm.app-error"}, and \code{"gsm.app-error-{strClass}"}.
}
\description{
Error messaging for this package.
}
\keyword{internal}
