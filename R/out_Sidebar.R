#' Study Information Sidebar
#'
#' @inheritParams shared-params
#' @returns A [bslib::sidebar()] with study information, inputs, and the
#'   stylesheets and dependencies required to display the app.
#' @keywords internal
out_Sidebar <- function(
  lStudy,
  chrMetrics,
  chrSites,
  intNParticipants,
  tagListSidebar = NULL
) {
  bslib::sidebar(
    width = 400,
    id = "sidebar",
    tagListSidebar,
    shinyjs::useShinyjs(),
    htmlDependency_Default_Stylesheet(),
    out_StudyInformation(lStudy = lStudy),
    out_Inputs(
      chrMetrics = chrMetrics,
      chrSites = chrSites,
      intNParticipants = intNParticipants
    )
  )
}

#' Card with inputs
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with app inputs.
#' @keywords internal
out_Inputs <- function(chrMetrics, chrSites, intNParticipants) {
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
        "site",
        strong("Site"),
        choices = c("None", chrSites),
        width = "100%"
      ),
      selectizeInput(
        "participant",
        strong("Participant"),
        choices = NULL,
        options = list(maxOptions = intNParticipants),
        width = "100%"
      ),
      actionButton("reset", "Reset All", class = "btn btn-primary btn-sm")
    )
  )
}
