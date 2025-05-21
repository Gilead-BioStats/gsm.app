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

slow_fnFetchData <- function(...) {
  Sys.sleep(5)
  return(gsm.app::sample_fnFetchData(...))
}

gsm.app::run_gsm_app(
  dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
  dfBounds = gsm.app::sample_dfBounds,
  dfGroups = gsm.app::sample_dfGroups,
  dfMetrics = gsm.app::sample_dfMetrics,
  dfResults = gsm.app::sample_dfResults,
  fnFetchData = slow_fnFetchData
)
