% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_gsm_app.R
\name{run_gsm_app}
\alias{run_gsm_app}
\alias{run_sample_gsm_app}
\title{Run the app}
\usage{
run_gsm_app(
  dfAnalyticsInput,
  dfBounds,
  dfGroups,
  dfMetrics,
  dfResults,
  fnFetchParticipantData,
  strTitle = "GSM Deep Dive",
  tagListSidebar = NULL,
  fnServer = NULL
)

run_sample_gsm_app()
}
\arguments{
\item{dfAnalyticsInput}{\code{data.frame} Participant-level metric data.}

\item{dfBounds}{\code{data.frame} Set of predicted percentages/rates and upper-
and lower-bounds across the full range of sample sizes/total exposure
values for reporting.}

\item{dfGroups}{\code{data.frame} Group-level metadata dictionary.}

\item{dfMetrics}{\code{data.frame} Metric-specific metadata for use in charts and
reporting.}

\item{dfResults}{\code{data.frame} A stacked summary of analysis pipeline output.
This will be filtered to cases where \code{GroupLevel == "Site"}.}

\item{fnFetchParticipantData}{\code{function} A function that takes a single
\code{strSubjectID} argument such as "0001", and returns a list with components
\code{metadata} and \code{metric_data}. \code{metadata} should be a named character vector
(or something that can be coerced to a character vector) of information
about the participant, and \code{metric_data} should be a named list of
data.frames, each of which contains information related to the named
metric.}

\item{strTitle}{\code{character} A title to display for the overall app.}

\item{tagListSidebar}{\code{taglist} An optional \code{\link[htmltools:tagList]{htmltools::tagList()}} of
additional elements to add to the top of the app sidebar.}

\item{fnServer}{\code{function} A Shiny server function that takes arguments
\code{input}, \code{output}, and \code{session}. This function will be called at the start
of the main app server function.}
}
\value{
An object that represents the app. Printing the object or passing it
to \code{\link[shiny:runApp]{shiny::runApp()}} runs the app.
}
\description{
\code{run_gsm_app()} creates a Shiny app to explore a set of clinical
trial data. The app facilitates exploration of the data by allowing the user
to click to diver deeper into aspects of the data.

\code{run_sample_gsm_app()} is a thin wrapper around \code{run_gsm_app()}, using the
sample data provided in this package.
}
\examples{
\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# Sample app will launch in a new browser window.
run_sample_gsm_app()
\dontshow{\}) # examplesIf}
}
\seealso{
\link{sample_dfAnalyticsInput}, \link{sample_dfBounds}, \link{sample_dfGroups},
\link{sample_dfMetrics}, \code{\link[=sample_FetchParticipantData]{sample_FetchParticipantData()}}, \link{sample_dfResults}
}
