% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_DomainDetails.R
\name{mod_DomainDetails_Server}
\alias{mod_DomainDetails_Server}
\title{Domain Details server}
\usage{
mod_DomainDetails_Server(
  id,
  l_rctvDomains_Selection,
  l_rctvDomainHashes_Selection,
  rctv_strDomainID,
  rctv_intDomainCounts,
  rctv_strGroupLevel,
  chrDomains
)
}
\arguments{
\item{id}{\code{character} The id for this element.}

\item{l_rctvDomains_Selection}{\code{list} A named list of \code{\link[shiny:reactive]{shiny::reactive()}}
objects, each of which returns a domain dataframe for the current filter.}

\item{l_rctvDomainHashes_Selection}{\code{list} A named list of
\code{\link[shiny:reactive]{shiny::reactive()}} objects, each of which returns the \code{\link[rlang:hash]{rlang::hash()}} of a
domain dataframe for the current filter.}

\item{rctv_strDomainID}{\verb{reactive character} A \code{\link[shiny:reactive]{shiny::reactive()}} object
that returns the selected \code{DomainID} (such as "AE" or "SUBJ").}

\item{rctv_intDomainCounts}{\verb{reactive integer} A \code{\link[shiny:reactive]{shiny::reactive()}} object
that returns the count of rows for the current selection for all domains.}

\item{rctv_strGroupLevel}{\verb{reactive character} A \code{\link[shiny:reactiveVal]{shiny::reactiveVal()}}
object that returns the selected \code{GroupLevel}.}

\item{chrDomains}{\code{character} A (named) vector of domains to include in the
app. The values of the vector will be used as labels, and the names will be
used as IDs. The IDs will be passed to \code{fnFetchData()} to fetch data about
that domain.}
}
\description{
Update Domain Details when the selected participant changes.
}
\keyword{internal}
