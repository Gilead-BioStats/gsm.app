% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_BarChart.R
\name{mod_BarChart_Server}
\alias{mod_BarChart_Server}
\title{BarChart Module Server}
\usage{
mod_BarChart_Server(
  id,
  rctv_dfResults,
  rctv_lMetric,
  dfGroups,
  rctv_strGroupID,
  strOutcome = "Score",
  rctv_dfBounds = shiny::reactive(NULL)
)
}
\arguments{
\item{id}{\code{character} The id for this element.}

\item{rctv_dfResults}{\verb{reactive dataframe} A \code{\link[shiny:reactive]{shiny::reactive()}} object that
returns a stacked summary of analysis pipeline output.}

\item{rctv_lMetric}{\verb{reactive list} A \code{\link[shiny:reactive]{shiny::reactive()}} object that returns
a named list of data describing a single metric, as well as things like
which group is selected.}

\item{dfGroups}{\code{data.frame} Group-level metadata dictionary.}

\item{rctv_strGroupID}{\verb{reactive character} A \code{\link[shiny:reactiveVal]{shiny::reactiveVal()}} object
that returns the \code{GroupID} of the selected group (usually site), and can be
used to update which group is selected.}

\item{strOutcome}{\code{character} Outcome variable. Default: \code{"Score"}.}

\item{rctv_dfBounds}{\verb{reactive dataframe} A \code{\link[shiny:reactive]{shiny::reactive()}} object that
returns a set of predicted percentages/rates and upper- and lower-bounds
across the full range of sample sizes/total exposure values for reporting.}
}
\description{
BarChart Module Server
}
\keyword{internal}
