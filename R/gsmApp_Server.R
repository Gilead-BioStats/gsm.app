#' Define Server
#'
#' @inheritParams shared-params
#'
#' @export

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
  #
  # Eventually this will be resolved by validating and otherwise manipulating
  # everything before we pass it into the server function.
  force(dfResults)
  force(dfGroups)
  force(dfMetrics)
  force(dfBounds)
  force(dfAnalyticsInput)
  force(fnFetchParticipantData)
  function(input, output, session) {
    # Side Panel ----
    add_metadata_to_sidebar(
      output = output,
      dfStudy = dplyr::filter(dfGroups, .data$GroupLevel == "Study"),
      vSnapshotDate = unique(dfResults$SnapshotDate)
    )

    # Inputs ----
    ## Initialize ----
    initialize_metric_select(dfMetrics, session)
    initialize_site_select(dfGroups, session)
    initialize_participant_select(dfAnalyticsInput, session)

    ## Cross-communication ----
    sync_site_input(reactive(input$site))
    sync_participant_input(reactive(input$participant))

    ## Hide/show ----
    observeEvent(input$primary_nav_bar, {
      switch(input$primary_nav_bar,
             "Study Overview" = {
               shinyjs::hide("metric")
               shinyjs::hide("site")
               shinyjs::hide("participant")
             },
             "Metric Details" = {
               shinyjs::show("metric")
               shinyjs::show("site")
               shinyjs::hide("participant")
             },
             "Participant Details" = {
               shinyjs::show("metric")
               shinyjs::show("site")
               shinyjs::show("participant")
             }
      )
    })

    ## Reset ----
    observeEvent(input$reset, {
      initialize_metric_select(dfMetrics, session)
      updateSelectInput(session, "site", selected = "None")
      updateSelectizeInput(session, "participant", selected = "None")
    })

    # Tab Contents ----

    ## Study Overview ----
    mod_study_overview_server(
      "study_overview",
      dfResults = dfResults,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics
    )
    mod_scatter_server(
      "scatter",
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      dfBounds = dfBounds
    )

    ## Metric Details ----
    ##
    ## Don't render until it loads. We should be able to fix this later once
    ## nested-modules are implemented cleanly.
    observeEvent(
      input$primary_nav_bar == "Metric Details",
      {

        mod_metric_details_server(
          "metric_details",
          dfResults = dfResults,
          dfMetrics = dfMetrics,
          dfGroups = dfGroups,
          dfBounds = dfBounds,
          rctv_strSiteID = reactive(input$site),
          rctv_strMetricID = reactive(input$metric)
        )

        mod_site_details_server(
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
    shiny::bindEvent(
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
