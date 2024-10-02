# Launch the ShinyApp (Do not remove this comment)
# To deploy, run: rsconnect::deployApp()
# Or use the blue button on top of this file
pkgload::load_all(here::here())

run_gsm_app(
  dfResults = sample_dfResults_subset,
  dfGroups = sample_dfGroups_subset,
  dfMetrics = sample_dfMetrics,
  dfBounds = sample_dfBounds,
  dfAnalyticsInput = sample_dfAnalyticsInput_subset,
  fnFetchParticipantData = sample_FetchParticipantData
)
