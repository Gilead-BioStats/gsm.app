# Launch the ShinyApp (Do not remove this comment)
if (grepl("gsm\\.app", getwd()) ||
    !("gsm.app" %in% list.files(.libPaths()))) {
  pkgload::load_all(".", export_all = FALSE, attach_testthat = FALSE)
} else {
  library(gsm.app)
}

ParticipantProfilePlugin <- plugin_Read(
  system.file("plugins", "ParticipantProfile", package = "gsm.app"),
  lWorkflows = yaml::read_yaml(
    system.file("plugins", "ParticipantProfile", "workflow", "PROFILE.yml", package = "gsm.app")
  )
)
plugin_LoadDependencies(ParticipantProfilePlugin)

sample_dfBounds2 <- dplyr::mutate(
  gsm.app::sample_dfBounds,
  SnapshotDate = as.Date("2019-10-01")
)
sample_dfResults2 <- dplyr::mutate(
  gsm.app::sample_dfResults,
  SnapshotDate = as.Date("2019-10-01")
)

run_gsm_app(
  dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
  # dfBounds = gsm.app::sample_dfBounds,
  dfBounds = dplyr::bind_rows(gsm.app::sample_dfBounds, sample_dfBounds2),
  dfGroups = gsm.app::sample_dfGroups,
  dfMetrics = gsm.app::sample_dfMetrics,
  # dfResults = gsm.app::sample_dfResults,
  dfResults = dplyr::bind_rows(gsm.app::sample_dfResults, sample_dfResults2),
  fnFetchData = sample_fnFetchData,
  lPlugins = list(ParticipantProfilePlugin),
  strFavicon = Sys.getenv("GSMAPP_FAVICON", "angles-up"),
  strFaviconColor = Sys.getenv("GSMAPP_FAVICONCOLOR", ColorScheme("red")),
  strTitle = Sys.getenv("GSMAPP_TITLE", "Sample Deep Dive App")
)
