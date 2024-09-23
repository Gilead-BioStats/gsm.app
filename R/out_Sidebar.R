out_Sidebar <- function(lStudy, chrMetrics, chrSites, intNParticipants) {
  bslib::sidebar(
    # width = 3,
    width = 400,
    id = "sidebar",
    shinyjs::useShinyjs(),
    htmlDependency_Default_Stylesheet(),
    htmlDependency_HighlightTableRow(),
    htmlDependency_TableClick(),
    out_StudyInformation(lStudy = lStudy),
    out_Inputs(
      chrMetrics = chrMetrics,
      chrSites = chrSites,
      intNParticipants = intNParticipants
    )
  )
}

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
