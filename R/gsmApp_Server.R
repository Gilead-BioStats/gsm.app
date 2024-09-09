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

    # This one is selectize and thus should remain server-side.
    initialize_participant_select(dfAnalyticsInput, session)

    ## Cross-communication ----
    # sync_metric_input(reactive(input$metric), reactive(input$primary_nav_bar))
    sync_site_input(reactive(input$site))
    sync_participant_input(reactive(input$participant))

    ## Reset ----
    observeEvent(input$reset, {
      updateSelectInput(session, "metric", selected = dfMetrics$MetricID[[1]])
      updateSelectInput(session, "site", selected = "None")
      updateSelectizeInput(session, "participant", selected = "None")
      bslib::nav_select("primary_nav_bar", "Study Overview")
    })

    # Shared Reactives ----

    ## The listified dfMetrics are used by both metric sub-mods, so calculate
    ## them once. This can/should probably move inside a single metric-tab
    ## module.
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

    ## Don't render until it loads. We should be able to fix this later once
    ## nested-modules are implemented cleanly.
    observeEvent(
      input$primary_nav_bar == "Metric Details",
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
        mod_SiteDetails_Server(
          "site_details",
          dfMetrics = dfMetrics,
          dfGroups = dfGroups,
          dfAnalyticsInput = dfAnalyticsInput,
          rctv_strSiteID = reactive(input$site),
          rctv_strMetricID = reactive(input$metric)
        )
      },
      ignoreInit = TRUE,
      once = TRUE
    )

    ## Participant Details ----
    ##
    ## Don't render until it loads. We should be able to fix this later once
    ## nested-modules are implemented cleanly.
    bindEvent(
      mod_ParticipantDetails_Server(
        "participant_details",
        fnFetchParticipantData = fnFetchParticipantData,
        rctv_strSubjectID = reactive(input$participant)
      ),
      input$primary_nav_bar == "Participant Details",
      ignoreInit = TRUE,
      once = TRUE
    )
  }
}
