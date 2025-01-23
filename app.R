# Launch the ShinyApp (Do not remove this comment)
pkgload::load_all(".", helpers = FALSE, attach_testthat = FALSE)

aePlugin <- plugin_Read(
  system.file("plugins", "AE", package = "gsm.app")
)
ParticipantProfilePlugin <- plugin_Read(
  system.file("plugins", "ParticipantProfile", package = "gsm.app")
)
plugin_LoadDependencies(aePlugin)
plugin_LoadDependencies(ParticipantProfilePlugin)

# sample_dfResults2 <- dplyr::mutate(
#   gsm.app::sample_dfResults,
#   SnapshotDate = lubridate::ymd("2019-10-01")
# )

run_gsm_app(
  dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
  dfBounds = gsm.app::sample_dfBounds,
  dfGroups = gsm.app::sample_dfGroups,
  dfMetrics = gsm.app::sample_dfMetrics,
  dfResults = gsm.app::sample_dfResults,
  # dfResults = dplyr::bind_rows(gsm.app::sample_dfResults, sample_dfResults2),
  fnFetchData = sample_fnFetchData,
  lPlugins = list(aePlugin, ParticipantProfilePlugin),
  strFavicon = Sys.getenv("GSMAPP_FAVICON", "angles-up"),
  strFaviconColor = Sys.getenv("GSMAPP_FAVICONCOLOR", ColorScheme("red"))
)
