#' Define Server
#'
#' @inheritParams shared-params
#'
#' @export

server <- function(input, output, session, dfResults, dfGroups, dfMetrics, dfBounds, snapshot) {
  # Filtering data inputs

  dfStudy <- reactive({
    dfGroups %>%
      dplyr::filter(GroupLevel == "Study")
  })

  dfResultsFilter <- reactive({
    dfResults %>%
      dplyr::filter(
        GroupLevel == "Site",
        MetricID == reactives$metric()
      )
  })

  dfBoundsFilter <- reactive({
    dfBounds %>%
      dplyr::filter(
        MetricID == reactives$metric()
      )
  })

  dfMetricsFilter <- reactive({
    dfMetrics %>%
      dplyr::filter(
        MetricID == reactives$metric()
      )
  })

  # Side Panel
  add_metadata_to_sidebar(input, output, session, dfStudy(), unique(dfResults$SnapshotDate))

  # ---
  # Initialize inputs
  initialize_metric_select(input, output, session, dfMetrics)
  initialize_site_select(input, output, session, dfGroups)
  # initialize_participant_select(input, output, session, dfMetrics)

  # observe_site_select(reactives$site)



  # ---
  # Reactive values
  reactives <- list(
    metric = reactive(input$metric),
    site = reactive(input$site),
    participant = reactive(input$participant),
    reset = reactive(input$reset)
  )

  # ---
  # Reveal filters based on tab
  observeEvent(input$primary_nav_bar, {
    if (input$primary_nav_bar == "Study Overview") {
      shinyjs::hide("metric")
      shinyjs::hide("site")
      shinyjs::hide("participant")
      updateSelectInput(session, "site", selected = "None")
    } else if (input$primary_nav_bar == "Metric Details") {
      shinyjs::show("metric")
      shinyjs::show("site")
      shinyjs::hide("participant")
      updateSelectizeInput(session, "participant", selected = "None")
    } else if (input$primary_nav_bar == "Participant Details") {
      shinyjs::show("metric")
      shinyjs::show("site")
      shinyjs::show("participant")
    }
  })



  # ----
  # Study
  # add_metric_observer(snapshot, reactives$metric)
  study_overview_server("study_overview",
    dfResults = dfResults,
    dfGroups = dfGroups,
    dfMetrics = dfMetrics
  )


  modScatterServer("scatter",
    dfResults = dfResults,
    dfMetrics = dfMetrics,
    dfGroups = dfGroups,
    dfBounds = dfBounds,
    snapshot
  )

  # # ----
  # # Metric
  # initialize_metric_select(input, output, session, snapshot)
  # observe_metric_select(snapshot, reactives$metric)
  # metric_details_server(
  #     'metric_details',
  #     snapshot,
  #     reactives$metric,
  #     reactives$site
  # )
  #
  # # ----
  # # Site
  #
  # observe_site_select(reactives$site, snapshot)
  # site_details_server(
  #     'site_details',
  #     snapshot,
  #     reactives$site,
  #     reactives$metric
  # )
  #
  # # ----
  # # Participant
  # initialize_participant_select(input, output, session, snapshot)
  # observe_participant_select(reactives$participant)
  # participant_details_server(
  #     'participant_details',
  #     snapshot,
  #     reactives$participant
  # )

  # ----
  # Reset
  observeEvent(input$reset, {
    initialize_metric_select(input, output, session, dfMetrics)
    updateSelectInput(session, "site", selected = "None")
    updateSelectizeInput(session, "participant", selected = "None")
  })
}
