#' Study Information Sidebar
#'
#' @inheritParams shared-params
#' @returns A [bslib::sidebar()] with study information, inputs, and the
#'   stylesheets and dependencies required to display the app.
#' @keywords internal
out_Sidebar <- function(
  dfGroups,
  dfResults,
  chrDomains,
  chrMetrics,
  tagListSidebar = NULL
) {
  bslib::sidebar(
    width = 400,
    id = "sidebar",
    tagListSidebar,
    out_StudyInformation(dfGroups, dfResults),
    out_Inputs(
      chrDomains = chrDomains,
      chrMetrics = chrMetrics
    ),
    open = FALSE
  )
}

#' Card with inputs
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with app inputs.
#' @keywords internal
out_Inputs <- function(chrDomains, chrMetrics) {
  bslib::card(
    class = "overflow-on",
    bslib::card_body(
      class = "overflow-on",
      selectInput(
        "metric",
        strong("Metric"),
        choices = chrMetrics,
        width = "100%"
      ),
      selectInput(
        "domain",
        strong("Domain"),
        choices = c(
          None = "None",
          rlang::set_names(names(chrDomains), chrDomains)
        ),
        width = "100%"
      ),
      actionButton("reset", "Reset All", class = "btn btn-primary btn-sm")
    )
  )
}
