aeExplorerOutput <- function(id) {
  htmlwidgets::shinyWidgetOutput(
    id,
    name = "aeExplorer",
    width = "100%",
    height = "100%",
    package = "safetyCharts"
  )
}
render_aeExplorer <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(
    expr,
    aeExplorerOutput,
    env,
    quoted = TRUE,
    cacheHint = NULL
  )
}

mod_AE_UI <- function(id) {
  ns <- shiny::NS(id)
  bslib::navset_card_underline(
    id = ns("selected_tab"),
    title = "Adverse Events",
    bslib::nav_panel(
      "Dashboard",
      "(Dashboard coming soon)"
    ),
    bslib::nav_panel(
      "Explorer",
      aeExplorerOutput(ns("explorer"))
    ),
    bslib::nav_panel(
      "Timeline",
      "(Timeline coming soon)"
    ),
    full_screen = TRUE
  )
}

mod_AE_Server <- function(
  id,
  fnFetchData,
  rctv_InputSite,
  rctv_InputParticipant
) {
  moduleServer(id, function(input, output, session) {
    output$explorer <- render_aeExplorer({
      SiteID <- rctv_InputSite()
      ParticipantID <- rctv_InputParticipant()
      dfAE <- fnFetchData(
        "AdverseEvents",
        strSiteID = SiteID,
        strSubjectID = ParticipantID
      )
      if (NROW(dfAE)) {
        dfAE <- dfAE %>%
          dplyr::arrange(.data$start_date) %>%
          tibble::rowid_to_column(var = "seq")

        # We don't really use `dm`, but aeExplorer requires something.
        dfSubj <- dfAE %>%
          dplyr::distinct(.data$SubjectID)
        safetyCharts::aeExplorer(
          data = list(
            dm = dfSubj,
            aes = dfAE
          ),
          mapping = list(
            dm = list(
              id_col = "SubjectID"
            ),
            aes = list(
              id_col = "SubjectID",
              seq_col = "seq",
              stdy_col = "start_date",
              endy_col = "end_date",
              term_col = "preferred_term",
              bodsys_col = "system_organ_class",
              severity_col = "toxicity_grade",
              serious_col = "serious"
            )
          )
        )
      }
    })
  })
}
