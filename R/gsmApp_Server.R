#' Define Server
#'
#' @inheritParams shared-params
#'
#' @keywords internal

gsmApp_Server <- function(
  dfResults,
  dfGroups,
  dfMetrics,
  dfBounds,
  dfAnalyticsInput,
  fnFetchParticipantData
) {
  # Force evaluation of everything before factory is constructed to avoid
  # strange effects from lazy evaluation. See
  # https://adv-r.hadley.nz/function-factories.html#forcing-evaluation
  force(dfResults)
  force(dfGroups)
  force(dfMetrics)
  force(dfBounds)
  force(dfAnalyticsInput)
  force(fnFetchParticipantData)
  function(input, output, session) {
    # Inputs ----
    ## Initialize ----
    chrParticipantIDs <- sort(unique(dfAnalyticsInput$SubjectID))
    # This one is selectize and thus should remain server-side.
    srvr_PopulateParticipantSelect(chrParticipantIDs, session)

    ## Cross-communication ----
    srvr_SyncInput("site", reactive(input$site), session = session)

    ## Reset ----
    observe({
      updateSelectInput(session, "metric", selected = dfMetrics$MetricID[[1]])
      updateSelectInput(session, "site", selected = "None")
      srvr_PopulateParticipantSelect(chrParticipantIDs, session)
      bslib::nav_select("primary_nav_bar", "Study Overview")
    }) %>%
      bindEvent(input$reset)

    # Shared Reactives ----

    ## The listified dfMetrics are used by both metric sub-mods, so calculate
    ## them once. This can/should move inside a single metric-tab module.
    rctv_lMetric_base <- reactive({
      lMetric <- as.list(
        filter_byMetricID(dfMetrics, input$metric)
      )
    }) %>%
      bindCache(input$metric)
    rctv_lMetric <- reactive({
      lMetric <- rctv_lMetric_base()
      if (input$site != "None") {
        lMetric$selectedGroupIDs <- input$site
      }
      lMetric
    }) %>%
      shiny::bindCache(input$metric, input$site)

    # Tab Contents ----

    ## Study Overview ----
    mod_StudyOverview_Server(
      "study_overview",
      dfResults = dfResults,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics
    )
    mod_Scatter_Server(
      "scatter",
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      dfBounds = dfBounds
    )

    ## Metric Details ----

    srvr_TabOnChange(
      "Metric Details",
      reactive(input$metric),
      session
    )
    ## Don't render until it loads. We should be able to fix this later once
    ## nested-modules are implemented cleanly.
    bindEvent(
      {
        mod_MetricDetails_Server(
          "metric_details",
          dfResults = dfResults,
          dfGroups = dfGroups,
          dfBounds = dfBounds,
          rctv_lMetric = rctv_lMetric,
          rctv_strSiteID = reactive(input$site),
          rctv_strMetricID = reactive(input$metric)
        )
        rctv_strSiteDetailsParticipant <- mod_SiteDetails_Server(
          "site_details",
          dfGroups = dfGroups,
          dfAnalyticsInput = dfAnalyticsInput,
          rctv_strSiteID = reactive(input$site),
          rctv_strMetricID = reactive(input$metric),
          rctv_lMetric = rctv_lMetric
        )
      },
      input$primary_nav_bar == "Metric Details",
      ignoreInit = TRUE,
      once = TRUE
    )
    srvr_SyncSelectizeInput(
      strID = "participant",
      rctv_strValue = rctv_strSiteDetailsParticipant,
      chrChoices = chrParticipantIDs,
      server = TRUE,
      session = session
    )

    ## Participant Details ----
    srvr_TabOnChange(
      "Participant Details",
      reactive(input$participant),
      session
    )
    testing <- mod_ParticipantDetails_Server(
      "participant_details",
      fnFetchParticipantData = fnFetchParticipantData,
      rctv_strSubjectID = reactive(input$participant)
    )
    shiny::observe({testing()})
  }
}
