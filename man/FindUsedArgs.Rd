% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_Plugin.R
\name{FindUsedArgs}
\alias{FindUsedArgs}
\title{Subset Available Args to Server Function Needs}
\usage{
FindUsedArgs(lAvailableArgs, chrServerArgs)
}
\arguments{
\item{lAvailableArgs}{\code{list} The args available to send to the plugin.}

\item{chrServerArgs}{\code{character} The vector of arguments accepted by the
plugin function.}
}
\value{
A \code{list} that is a subset of \code{lAvailableArgs} (only those used by
the function), renamed to match the function.
}
\description{
Subset Available Args to Server Function Needs
}
\keyword{internal}
