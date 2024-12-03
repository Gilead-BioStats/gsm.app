mod_AE_UI <- function(id) {
  ns <- shiny::NS(id)
  bslib::navset_card_underline(
    id = ns("selected_tab"),
    title = "Adverse Events",
    bslib::nav_panel(
      "Dashboard",
      mod_AEDashboard_UI(ns("dashboard"))
    ),
    bslib::nav_panel(
      "Explorer",
      aeExplorerOutput(ns("explorer"))
    ),
    bslib::nav_panel(
      "Timeline",
      aeTimelinesOutput(ns("timeline"))
    ),
    full_screen = TRUE
  )
}

mod_AE_Server <- function(
  id,
  fnFetchData,
  rctv_strSiteID,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    rctv_dfSubject <- shiny::reactive({
      fnFetchData(
        "Subject",
        strSiteID = rctv_strSiteID(),
        strSubjectID = rctv_strSubjectID()
      ) %>%
        dplyr::select("SubjectID", "study_start_date")
    })
    rctv_dfAE <- shiny::reactive({
      dfAE <- fnFetchData(
        "AdverseEvents",
        strSiteID = rctv_strSiteID(),
        strSubjectID = rctv_strSubjectID()
      )
      if (NROW(dfAE)) {
        dfAE <- dfAE %>%
          dplyr::inner_join(rctv_dfSubject(), by = "SubjectID") %>%
          dplyr::mutate(
            toxicity_grade = toupper(
              sub("^out of bound:", "", .data$toxicity_grade)
            ),
            aest_dy = .data$start_date - .data$study_start_date + 1L,
            aeen_dy = .data$end_date - .data$study_start_date + 1L
          ) %>%
          dplyr::arrange(
            .data$SubjectID,
            .data$aest_dy,
            .data$aeen_dy,
            .data$preferred_term,
            .data$toxicity_grade
          ) %>%
          dplyr::mutate(
            seq = dplyr::row_number(),
            .by = "SubjectID"
          )
      }
    })
    aes_settings <- list(
      id_col = "SubjectID",
      seq_col = "seq",
      stdy_col = "aest_dy",
      endy_col = "aeen_dy",
      term_col = "preferred_term",
      bodsys_col = "system_organ_class",
      severity_col = "toxicity_grade",
      serious_col = "serious"
    )
    mod_AEDashboard_server("dashboard", rctv_dfAE)
    output$explorer <- render_aeExplorer({
      dfAE <- rctv_dfAE()
      if (NROW(dfAE)) {
        render_SC_widget(
          lData = list(dm = rctv_dfSubject(), aes = dfAE),
          lSettings = list(
            dm = list(
              id_col = "SubjectID"
            ),
            aes = aes_settings
          ),
          fnInit = safetyCharts::init_aeExplorer,
          strWidgetName = "aeExplorer"
        )
      }
    })
    output$timeline <- render_aeTimelines({
      dfAE <- rctv_dfAE()
      if (NROW(dfAE)) {
        render_SC_widget(
          lData = dfAE,
          lSettings = aes_settings,
          fnInit = safetyCharts::init_aeTimelines,
          strWidgetName = "aeTimelines"
        )
      }
    })
  })
}
