# Launch the ShinyApp (Do not remove this comment)
# To deploy, run: rsconnect::deployApp()
# Or use the blue button on top of this file
pkgload::load_all(".")

gsmApp::run_app(
  dfResults = gsm::reportingResults %>%
    dplyr::filter(.data$SnapshotDate == max(.data$SnapshotDate)),
  dfGroups = gsm::reportingGroups,
  dfMetrics = gsm::reportingMetrics,
  dfBounds = gsm::reportingBounds %>%
    dplyr::filter(.data$SnapshotDate == max(.data$SnapshotDate))
)
