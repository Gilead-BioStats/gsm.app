# Launch the ShinyApp (Do not remove this comment)
library(shiny)
pkgload::load_all(".", helpers = FALSE, attach_testthat = FALSE)

# this_path <- function(...) {
#   system.file("plugins", "AETimelines", ..., package = "gsm.app")
# }
#
# lPluginConfig <- yaml::read_yaml(this_path('AETimelines.yaml'))
#
# # TODO: source module functions dynamically with config
# source(this_path('mod_AETimelines_UI.R'))
# source(this_path('mod_AETimelines_Server.R'))
# source(this_path('AETimelines_Fetch.R'))
#
# # All modules should include the following:
# # - config file with metadata, a data specification, and a function list
# # - UI function
# # - server function
# # - data fetch function
# lPlugins <- list(
#   list(
#     strTitle = lPluginConfig$meta$Name,
#     lConfig = lPluginConfig,
#     fnUI = mod_AETimelines_UI,
#     fnServer = mod_AETimelines_Server,
#     fnFetch = AETimelines_Fetch
#   )
# )
#
# run_gsm_app(
#   dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
#   dfBounds = gsm.app::sample_dfBounds,
#   dfGroups = gsm.app::sample_dfGroups,
#   dfMetrics = gsm.app::sample_dfMetrics,
#   dfResults = gsm.app::sample_dfResults,
#   fnFetchData = sample_fnFetchData,
#   lPlugins = lPlugins,
#   strFavicon = Sys.getenv("GSMAPP_FAVICON", "angles-up"),
#   strFaviconColor = Sys.getenv("GSMAPP_FAVICONCOLOR", colorScheme("red"))
# )

run_sample_gsm_app(
  strFavicon = Sys.getenv("GSMAPP_FAVICON", "angles-up"),
  strFaviconColor = Sys.getenv("GSMAPP_FAVICONCOLOR", colorScheme("red"))
)
