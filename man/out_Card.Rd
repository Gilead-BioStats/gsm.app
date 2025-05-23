% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/out_Card.R
\name{out_Card}
\alias{out_Card}
\title{Standardized card}
\usage{
out_Card(
  tagTitle,
  ...,
  id = NULL,
  strFullScreenPosition = c("top", "bottom", "none")
)
}
\arguments{
\item{tagTitle}{\verb{html tag} A string or other html to use as the title of the
card. Will be wrapped inside \code{\link[bslib:card_body]{bslib::card_title()}}.}

\item{...}{\verb{html tags} Objects to place in the card.}

\item{id}{\code{character} The id for this element.}

\item{strFullScreenPosition}{\verb{length-1 character} Used to set the
\code{full_screen} argument of \code{\link[bslib:card]{bslib::card()}}, and, if necessary, update
styling to position the "expand" button. The default value \code{"top"} sets
\code{full_screen} to \code{TRUE} and positions the button at the top-right corner of
the card. The value \code{"bottom"} positions the button at the bottom-right of
the card, and the value \code{"none"} sets \code{full_screen} to \code{FALSE}.}
}
\value{
A \code{\link[bslib:card]{bslib::card()}}.
}
\description{
A standardized \code{\link[bslib:card]{bslib::card()}} for gsm.app modules and modules in plugins for
gsm.app. The \code{tagTitle} is applied as a \code{\link[bslib:card_body]{bslib::card_title()}}, and
\code{full_screen} is set to \code{TRUE} by default.
}
\examples{
ns <- shiny::NS("MyModule")
out_Card(
  "Domain Summary",
  shiny::textOutput(ns("text")),
  id = ns("card")
)
}
