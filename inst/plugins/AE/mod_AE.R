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
      aeTimelinesOutput(ns("timeline"))
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
        render_SC_widget(
          lData = list(dm = dfSubj, aes = dfAE),
          lSettings = list(
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
          ),
          fnInit = safetyCharts::init_aeExplorer,
          strWidgetName = "aeExplorer"
        )
      }
    })
    output$timeline <- render_aeTimelines({
      SiteID <- rctv_InputSite()
      ParticipantID <- rctv_InputParticipant()
      dfAE <- fnFetchData(
        "AdverseEvents",
        strSiteID = SiteID,
        strSubjectID = ParticipantID
      )
      if (NROW(dfAE)) {
        dfSubj <- fnFetchData(
          "Subject",
          strSiteID = SiteID,
          strSubjectID = ParticipantID
        ) %>%
          dplyr::select("SubjectID", "study_start_date")

        dfAE <- dfAE %>%
          dplyr::inner_join(dfSubj, by = "SubjectID") %>%
            dplyr::mutate(
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

        render_SC_widget(
          lData = dfAE,
          lSettings = list(
            id_col = "SubjectID",
            seq_col = "seq",
            stdy_col = "aest_dy",
            endy_col = "aeen_dy",
            term_col = "preferred_term",
            bodsys_col = "system_organ_class",
            severity_col = "toxicity_grade",
            serious_col = "serious"
          ),
          fnInit = safetyCharts::init_aeTimelines,
          strWidgetName = "aeTimelines"
        )
      }
    })
  })
}
