% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_StudyOverview_Server.R
\name{mod_StudyOverview_Server}
\alias{mod_StudyOverview_Server}
\title{Study Overview Server}
\usage{
mod_StudyOverview_Server(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  dfBounds,
  rctv_strSiteID
)
}
\arguments{
\item{id}{\code{character} The id for this module, widget, or other element.}

\item{dfResults}{\code{data.frame} A stacked summary of analysis pipeline output.
This will be filtered to cases where \code{GroupLevel == "Site"}.}

\item{dfMetrics}{\code{data.frame} Metric-specific metadata for use in charts and
reporting.}

\item{dfGroups}{\code{data.frame} Group-level metadata dictionary.}

\item{dfBounds}{\code{data.frame} Set of predicted percentages/rates and upper-
and lower-bounds across the full range of sample sizes/total exposure
values for reporting.}

\item{rctv_strSiteID}{\verb{reactive character} A \code{\link[shiny:reactive]{shiny::reactive()}} object that
returns the \code{GroupID} of a site.}
}
\value{
A named list of \code{\link[shiny:reactive]{shiny::reactive()}} objects, each of which is a
string. \code{rctv_strSelectedGroupID} identifies the selected group, and
\code{rctv_strSelectedMetricID} identifies the selected metric (the plot most
recently clicked by the user).
}
\description{
Study Overview Server
}
\keyword{internal}
