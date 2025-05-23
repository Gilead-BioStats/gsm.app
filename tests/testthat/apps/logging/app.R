# Launch the ShinyApp (Do not remove this comment)
# To deploy, run: rsconnect::deployApp()
# Or use the blue button on top of this file

if (
  isTRUE(as.logical(Sys.getenv("TESTTHAT_IS_CHECKING", "false"))) ||
    isTRUE(as.logical(Sys.getenv("R_COVR", "false")))
) {
  library("gsm.app")
} else {
  pkgload::load_all(here::here())
}

library(shiny.telemetry)

log_path <- here::here("tests", "testthat", "apps", "logging", "logfile.txt")

telemetry <- shiny.telemetry::Telemetry$new(
  data_storage = shiny.telemetry::DataStorageLogFile$new(log_path)
)

gsm.app::run_gsm_app(
  dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
  dfBounds = gsm.app::sample_dfBounds,
  dfGroups = gsm.app::sample_dfGroups,
  dfMetrics = gsm.app::sample_dfMetrics,
  dfResults = gsm.app::sample_dfResults,
  fnFetchData = gsm.app::sample_fnFetchData,
  tagListExtra = shiny.telemetry::use_telemetry(),
  fnServer = function(input, output, session) {
    telemetry$start_session()
  }
)
