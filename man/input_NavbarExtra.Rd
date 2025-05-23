% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/out_NavbarExtras.R
\name{input_NavbarExtra}
\alias{input_NavbarExtra}
\title{Individual input within the right navbar}
\usage{
input_NavbarExtra(
  strInputID,
  chrChoices = NULL,
  label = MakeParamLabelsChr(strInputID)
)
}
\arguments{
\item{strInputID}{\code{character} An ID to use for the Shiny input created by
this module or used by this JavaScript.}

\item{chrChoices}{\code{character} A (named, optionally) vector of choices for a
\code{\link[shiny:selectInput]{shiny::selectInput()}} or similar input function.}
}
\value{
A \code{\link[bslib:nav-items]{bslib::nav_item()}} with a \code{\link[shinyWidgets:virtualSelectInput]{shinyWidgets::virtualSelectInput()}}.
}
\description{
Individual input within the right navbar
}
\keyword{internal}
