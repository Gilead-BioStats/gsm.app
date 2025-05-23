% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/out_MainTabs.R
\name{out_MainTabs}
\alias{out_MainTabs}
\title{Main Tabbed Content}
\usage{
out_MainTabs(chrDomains, dfGroups, dfResults, chrMetrics, lPlugins = NULL)
}
\arguments{
\item{chrDomains}{\code{character} A (named) vector of domains to include in the
app. The values of the vector will be used as labels, and the names will be
used as IDs. The IDs will be passed to \code{fnFetchData()} to fetch data about
that domain.}

\item{dfGroups}{\code{data.frame} Group-level metadata dictionary.}

\item{dfResults}{\code{data.frame} A stacked summary of analysis pipeline output.}

\item{chrMetrics}{\code{character} A named vector of MetricIDs, where the names
are the full Metric.}

\item{lPlugins}{\code{list} Optional list of plugins to include in the app.}
}
\value{
A list of \code{\link[bslib:nav-items]{bslib::nav_panel()}} elements, containing the main tabbed
content.
}
\description{
Main Tabbed Content
}
\keyword{internal}
