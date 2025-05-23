% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_gtBidirectional.R
\name{mod_gtBidirectional_Server}
\alias{mod_gtBidirectional_Server}
\title{Bidirectional gt Table Selector Server}
\usage{
mod_gtBidirectional_Server(
  id,
  rctv_dfData,
  rctv_gtObject,
  rctv_strInput,
  strLabel,
  strEmpty = "All"
)
}
\arguments{
\item{id}{\code{character} The id for this element.}

\item{rctv_dfData}{\verb{reactive dataframe} A \code{\link[shiny:reactive]{shiny::reactive()}} object that
returns a generic dataframe.}

\item{rctv_gtObject}{\verb{reactive gt_table} A \code{\link[shiny:reactive]{shiny::reactive()}} object that
returns a \code{\link[gt:gt]{gt::gt()}} object.}

\item{rctv_strInput}{\verb{reactive character} A \code{\link[shiny:reactive]{shiny::reactive()}} object that
returns the value(s) of an input to share with an interactive gt table. If
this argument is a \code{\link[shiny:reactiveVal]{shiny::reactiveVal()}}, it will be used to push updates
back to the calling function.}

\item{strLabel}{\code{character} The label of a field.}

\item{strEmpty}{\code{character} The value to return when everything is
deselected.}
}
\value{
A \code{\link[shiny:reactiveVal]{shiny::reactiveVal()}} with the id(s) of the field(s) selected in
the table.
}
\description{
Bidirectional gt Table Selector Server
}
\keyword{internal}
