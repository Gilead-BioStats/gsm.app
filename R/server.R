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
  dfBounds
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
  # initialize_participant_select(input, output, session, dfMetrics)

  ## Cross-communication ----
  sync_site_input(reactive(input$site))
  # observe_metric_select(snapshot, reactives$metric)

  ## Hide/show ----
  observe({
    switch(input$primary_nav_bar,
      "Study Overview" = {
        shinyjs::hide("metric")
        shinyjs::hide("site")
        shinyjs::hide("participant")
        # updateSelectInput(session, "site", selected = "None")
      },
      "Metric Details" = {
        shinyjs::show("metric")
        shinyjs::show("site")
        shinyjs::hide("participant")
        # updateSelectizeInput(session, "participant", selected = "None")
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


  # Study Overview ----
  # add_metric_observer(snapshot, reactives$metric)
  mod_study_overview_server("study_overview",
    dfResults = dfResults,
    dfGroups = dfGroups,
    dfMetrics = dfMetrics
  )

  mod_scatter_server("scatter",
    dfResults = dfResults,
    dfMetrics = dfMetrics,
    dfGroups = dfGroups,
    dfBounds = dfBounds
  )

  # Metric Details ----
  # observe_metric_select(snapshot, reactives$metric)

  mod_metric_details_server(
    "metric_details",
    dfResults = dfResults,
    dfMetrics = dfMetrics,
    dfGroups = dfGroups,
    dfBounds = dfBounds,
    rctv_strSite = reactive(input$site),
    rctv_strMetricID = reactive(input$metric)
  )

  # # Site ----
  #
  # site_details_server(
  #     'site_details',
  #     snapshot,
  #     reactives$site,
  #     reactives$metric
  # )
  #
  # # Participant Details ----
  # initialize_participant_select(input, output, session, snapshot)
  # observe_participant_select(reactives$participant)
  # participant_details_server(
  #     'participant_details',
  #     snapshot,
  #     reactives$participant
  # )
}
