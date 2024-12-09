% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Widget_BarChart.R, R/Widget_ScatterPlot.R,
%   R/Widget_Shared.R, R/Widget_TimeSeries.R
\name{Widget_BarChartOutput}
\alias{Widget_BarChartOutput}
\alias{Widget_ScatterPlotOutput}
\alias{Widget_PlotOutput}
\alias{renderWidgetPlot}
\alias{Widget_TimeSeriesOutput}
\title{Shiny bindings for Widgets}
\usage{
Widget_BarChartOutput(outputId, width = "100\%", height = "400px")

Widget_ScatterPlotOutput(outputId, width = "100\%", height = "400px")

Widget_PlotOutput(strWidgetName, outputId, width = "100\%", height = "400px")

renderWidgetPlot(expr, fn_WidgetOutput, env = parent.frame(), quoted = FALSE)

Widget_TimeSeriesOutput(outputId, width = "100\%", height = "400px")
}
\arguments{
\item{outputId}{output variable to read from}

\item{width, height}{Must be a valid CSS unit (like \code{'100\%'}, \code{'400px'},
\code{'auto'}) or a number, which will be coerced to a string and have \code{'px'}
appended.}

\item{strWidgetName}{Widget to load.}

\item{expr}{An expression that generates a Widget_ScatterPlot}

\item{env}{The environment in which to evaluate \code{expr}.}

\item{quoted}{Is \code{expr} a quoted expression (with \code{\link[=quote]{quote()}})? This is useful
if you want to save an expression in a variable.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}

Output and render functions for using Widgets within Shiny applications and
interactive Rmd documents.
}
\keyword{internal}
