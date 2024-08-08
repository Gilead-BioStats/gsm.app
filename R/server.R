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

  # Filtering data inputs

  dfStudy <- reactive({
    dfGroups %>%
      dplyr::filter(.data$GroupLevel == "Study")
  })

  rctv_dfResults_Site_byMetric <- reactive({
    dfResults %>%
      dplyr::filter(
        .data$GroupLevel == "Site",
        .data$MetricID == input$metric
      )
  })

  rctv_dfBounds_byMetric <- reactive({
    dfBounds %>%
      dplyr::filter(
        .data$MetricID == input$metric
      )
  })

  rctv_dfMetricsFiltered <- reactive({
    dfMetrics %>%
      dplyr::filter(
        .data$MetricID == input$metric
      )
  })

  rctv_lMetric_byMetric <- reactive({
    dfMetrics %>%
      dplyr::filter(.data$MetricID == input$metric) %>%
      as.list()
  })


  # Side Panel
  add_metadata_to_sidebar(input, output, session, dfStudy(), unique(dfResults$SnapshotDate))

  # ---
  # Initialize inputs
  initialize_metric_select(input, output, session, dfMetrics)
  initialize_site_select(input, output, session, dfGroups)
  # initialize_participant_select(input, output, session, dfMetrics)

  # observe_site_select(reactives$site)
  # observe_metric_select(snapshot, reactives$metric)


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

  # ----
  # Metric
  # initialize_metric_select(input, output, session, snapshot)
  # observe_metric_select(snapshot, reactives$metric)

  mod_metric_details_server(
      'metric_details',
      rctv_dfResults = rctv_dfResults_Site_byMetric,
      rctv_lMetric = rctv_lMetric_byMetric,
      dfGroups = dfGroups,
      rctv_dfBounds = rctv_dfBounds_byMetric
    )

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
