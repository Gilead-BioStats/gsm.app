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

run_gsm_app(
  dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
  dfBounds = gsm.app::sample_dfBounds,
  dfGroups = gsm.app::sample_dfGroups,
  dfMetrics = gsm.app::sample_dfMetrics,
  dfResults = gsm.app::sample_dfResults,
  fnFetchData = sample_fnFetchData,
  lPlugins = list(aePlugin, ParticipantProfilePlugin),
  strFavicon = Sys.getenv("GSMAPP_FAVICON", "angles-up"),
  strFaviconColor = Sys.getenv("GSMAPP_FAVICONCOLOR", ColorScheme("red"))
)
