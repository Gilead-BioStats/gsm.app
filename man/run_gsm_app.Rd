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
  fnFetchData,
  fnCountData = ConstructDataCounter(fnFetchData),
  chrDomains = c(AE = "Adverse Events", DATACHG = "Data Changes", DATAENT = "Data Entry",
    ENROLL = "Enrollment", LB = "Lab", PD = "Protocol Deviations", QUERY = "Queries",
    STUDCOMP = "Study Completion", SUBJ = "Subject Metadata", SDRGCOMP =
    "Treatment Completion"),
  lPlugins = NULL,
  strTitle = ExtractAppTitle(dfGroups),
  strFavicon = "angles-up",
  strFaviconColor = "#FF5859",
  tagListExtra = NULL,
  fnServer = NULL
)

run_sample_gsm_app(strFavicon = "angles-up", strFaviconColor = "#FF5859")
}
\arguments{
\item{dfAnalyticsInput}{\code{data.frame} Participant-level metric data.}

\item{dfBounds}{\code{data.frame} Set of predicted percentages/rates and upper-
and lower-bounds across the full range of sample sizes/total exposure
values for reporting.}

\item{dfGroups}{\code{data.frame} Group-level metadata dictionary.}

\item{dfMetrics}{\code{data.frame} Metric-specific metadata for use in charts and
reporting.}

\item{dfResults}{\code{data.frame} A stacked summary of analysis pipeline output.}

\item{fnFetchData}{\code{function} A function that takes a \code{strDomainID} argument
and optional \code{strGroupID}, \code{strGroupLevel}, \code{strSubjectID}, and/or
\code{dSnapshotDate}, and returns a data.frame. See \code{\link[=sample_fnFetchData]{sample_fnFetchData()}} for
an example. The returned data.frame contains information about the named
domain. If the function throws an error, the error is elevated to the user,
so you can use errors to pass requirements through to the user.}

\item{fnCountData}{\code{function} A function that takes a \code{strDomainID} argument
and optional \code{strGroupID}, \code{strGroupLevel}, \code{strSubjectID}, and/or
\code{dSnapshotDate}, and returns an integer count of the number of rows in that
filtered domain. By default, this function is constructed using
\code{fnFetchData()} and \code{\link[=ConstructDataCounter]{ConstructDataCounter()}}.}

\item{chrDomains}{\code{character} A (named) vector of domains to include in the
app. The values of the vector will be used as labels, and the names will be
used as IDs. The IDs will be passed to \code{fnFetchData()} to fetch data about
that domain.}

\item{lPlugins}{\code{list} Optional list of plugins to include in the app.}

\item{strTitle}{\code{character} A title to display for the overall app.}

\item{strFavicon}{\code{character} The name of an icon to use in the browser tab
via \code{\link[favawesome:fav]{favawesome::fav()}}.}

\item{strFaviconColor}{\code{character} The hexcode or name of a color to use as
the icon fill for \code{\link[favawesome:fav]{favawesome::fav()}}.}

\item{tagListExtra}{\code{taglist} An optional \code{\link[htmltools:tagList]{htmltools::tagList()}} of
additional elements to add to the top of the app.}

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
\link{sample_dfMetrics}, \code{\link[=sample_fnFetchData]{sample_fnFetchData()}}, \link{sample_dfResults}
}
