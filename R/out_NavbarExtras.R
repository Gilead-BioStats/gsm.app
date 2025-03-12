out_NavbarExtras <- function(chrSites, intNParticipants) {
  tagList(
    htmlDependency_NavbarExtras(),
    bslib::layout_columns(
      id = "custom-navbar-right",
      class = "navbar-extras",
      selectInput(
        "site",
        strong("Site"),
        NULL,
        choices = c("All", chrSites),
        width = "100%"
      ),
      selectizeInput(
        "participant",
        strong("Participant"),
        NULL,
        choices = NULL,
        options = list(maxOptions = intNParticipants),
        width = "100%"
      )
    )
  )
}

htmlDependency_NavbarExtras <- function() {
  tagList(
    htmlDependency_Stylesheet("navbarExtras.css"),
    htmlDependency_NavbarExtrasPosition(),
  )
}

htmlDependency_NavbarExtrasPosition <- function() {
  tagList(
    htmltools::htmlDependency(
      name = "navbarExtrasPosition",
      version = "1.0.0",
      src = "js",
      package = "gsm.app",
      script = "navbarExtrasPosition.js"
    )
  )
}
