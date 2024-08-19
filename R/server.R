#' Define Server
#'
#' @inheritParams shared-params
#'
#' @export

server <- function(
  input,
  output,
  session,
  dfResults,
  dfGroups,
  dfMetrics,
  dfBounds,
  dfAnalyticsInput
) {
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
        rctv_strSite = reactive(input$site),
        rctv_strMetricID = reactive(input$metric)
      )

      mod_site_details_server(
        "site_details",
        dfMetrics = dfMetrics,
        dfGroups = dfGroups,
        dfAnalyticsInput = dfAnalyticsInput,
        rctv_strSite = reactive(input$site),
        rctv_strMetricID = reactive(input$metric)
      )

    },
    ignoreInit = TRUE,
    once = TRUE
  )


}
