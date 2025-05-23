% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/srvr_PluginHelpers.R
\name{FinalWorkflowOutputNames}
\alias{FinalWorkflowOutputNames}
\title{Find the Names of the Final Steps}
\usage{
FinalWorkflowOutputNames(lWorkflows)
}
\arguments{
\item{lWorkflows}{\code{list} An optional named list of workflows to run in order
to translate app domain data into the format required by the plugin (as
defined in the plugin \code{spec}). These workflows are ran before the plugin's
\code{spec} is applied, and are meant to serve as a bridge between your domain
data and the plugin's expected domains.}
}
\value{
A character vector of \code{\link[=FinalWorkflowOutputName]{FinalWorkflowOutputName()}} output.
}
\description{
Find the Names of the Final Steps
}
\keyword{internal}
