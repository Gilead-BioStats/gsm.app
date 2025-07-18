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

# Filter sample data to a single group level for testing.
site_only_dfGroups <- gsm.app::sample_dfGroups[
  gsm.app::sample_dfGroups$GroupLevel == "Site" | gsm.app::sample_dfGroups$GroupLevel == "Study",
]
site_only_dfMetrics <- gsm.app::sample_dfMetrics[
  gsm.app::sample_dfMetrics$GroupLevel == "Site",
]
site_only_dfResults <- gsm.app::sample_dfResults[
  gsm.app::sample_dfResults$GroupLevel == "Site",
]
site_only_dfAnalyticsInput <- gsm.app::sample_dfAnalyticsInput[
  gsm.app::sample_dfAnalyticsInput$GroupLevel == "Site",
]


gsm.app::run_gsm_app(
  dfAnalyticsInput = site_only_dfAnalyticsInput,
  dfBounds = gsm.app::sample_dfBounds,
  dfGroups = site_only_dfGroups,
  dfMetrics = site_only_dfMetrics,
  dfResults = site_only_dfResults,
  fnFetchData = gsm.app::sample_fnFetchData
)
