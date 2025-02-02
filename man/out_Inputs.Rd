% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/out_Sidebar.R
\name{out_Inputs}
\alias{out_Inputs}
\title{Card with inputs}
\usage{
out_Inputs(chrDomains, chrMetrics, chrSites, intNParticipants)
}
\arguments{
\item{chrDomains}{\code{character} A vector of names of domain data.frames to show
in the app. Supported domains are shown in the default value.}

\item{chrMetrics}{\code{character} A named vector of MetricIDs, where the names
are the full Metric.}

\item{chrSites}{\code{character} A vector of sites available in the study.}

\item{intNParticipants}{\code{integer} The number of unique participants
(subjects) in the study.}
}
\value{
A \code{\link[bslib:card]{bslib::card()}} with app inputs.
}
\description{
Card with inputs
}
\keyword{internal}
