% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_SampleData.R
\name{sample_fnFetchData}
\alias{sample_fnFetchData}
\title{Fetch Data for a Domain}
\usage{
sample_fnFetchData(
  strDomainID = c("AE", "ENROLL", "LB", "PD", "SDRGCOMP", "STUDCOMP", "SUBJ", "DATACHG",
    "DATAENT", "QUERY"),
  strSiteID = NULL,
  strSubjectID = NULL
)
}
\arguments{
\item{strDomainID}{\code{character} The domain data.frame to load.}

\item{strSiteID}{\code{character} A \code{GroupID} of an individual site within a
study.}

\item{strSubjectID}{\code{character} A \code{SubjectID} of an individual participant.}
}
\value{
A data.frame with information about the specified domain.
}
\description{
This is a sample function demonstrating the type of function the user will
supply to find additional data about a given domain.
}
\examples{
head(sample_fnFetchData("AE"))
head(sample_fnFetchData("AE", strSiteID = "0X103"))
head(sample_fnFetchData("AE", strSubjectID = "1350"))
}
\seealso{
Other sample data: 
\code{\link{sample_dfAnalyticsInput}},
\code{\link{sample_dfBounds}},
\code{\link{sample_dfGroups}},
\code{\link{sample_dfMetrics}},
\code{\link{sample_dfResults}}
}
\concept{sample data}
