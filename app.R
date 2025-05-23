# Launch the ShinyApp (Do not remove this comment)
if (grepl("gsm\\.app", getwd()) ||
    !("gsm.app" %in% list.files(.libPaths()))) {
  pkgload::load_all(".", export_all = FALSE, attach_testthat = FALSE)
} else {
  library(gsm.app)
}

ParticipantProfilePlugin <- plugin_Read(
  system.file("plugins", "ParticipantProfile", package = "gsm.app")
)

# Alternative version with a workflow.

# ParticipantProfilePlugin <- plugin_Read(
#   system.file("plugins", "ParticipantProfile", package = "gsm.app"),
#   lWorkflows = list(
#     yaml::read_yaml(
#       system.file(
#         "plugins",
#         "ParticipantProfile",
#         "workflow",
#         "PROFILE.yml",
#         package = "gsm.app"
#       )
#     )
#   )
# )

plugin_LoadDependencies(ParticipantProfilePlugin)

run_gsm_app(
  dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
  dfBounds = gsm.app::sample_dfBounds,
  dfGroups = gsm.app::sample_dfGroups,
  dfMetrics = gsm.app::sample_dfMetrics,
  dfResults = gsm.app::sample_dfResults,
  fnFetchData = sample_fnFetchData,
  lPlugins = list(ParticipantProfilePlugin),
  strFavicon = Sys.getenv("GSMAPP_FAVICON", "angles-up"),
  strFaviconColor = Sys.getenv("GSMAPP_FAVICONCOLOR", ColorScheme("red")),
  strTitle = Sys.getenv("GSMAPP_TITLE", "Sample Deep Dive App")
)
