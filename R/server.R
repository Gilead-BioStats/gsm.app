#' Define Server
#'
#' @inheritParams shared-params
#'
#' @export
server <- function(input, output, session, snapshot) {
  # Reactive values
  reactives <- list(
    metric = reactive(input$metric),
    site = reactive(input$site),
    participant = reactive(input$participant),
    reset = reactive(input$reset)
  )

  # Side Panel
  add_metadata_to_sidebar(input, output, session, snapshot)

  # ----
  # Study
  # add_metric_observer(snapshot, reactives$metric)
  study_overview_server("study_overview", snapshot)
  modScatterServer("scatter", snapshot, reactives$site)

  # ----
  # Metric
  initialize_metric_select(input, output, session, snapshot)
  observe_metric_select(snapshot, reactives$metric)
  metric_details_server(
    "metric_details",
    snapshot,
    reactives$metric,
    reactives$site
  )

  # ----
  # Site
  initialize_site_select(input, output, session, snapshot)
  observe_site_select(reactives$site, snapshot)
  site_details_server(
    "site_details",
    snapshot,
    reactives$site,
    reactives$metric
  )

  # ----
  # Participant
  initialize_participant_select(input, output, session, snapshot)
  observe_participant_select(reactives$participant)
  participant_details_server(
    "participant_details",
    snapshot,
    reactives$participant
  )

  # ----
  # Reset
  observeEvent(input$reset, {
    initialize_metric_select(input, output, session, snapshot)
    updateSelectInput(session, "site", selected = "None")
    updateSelectizeInput(session, "participant", selected = "None")
  })
}
