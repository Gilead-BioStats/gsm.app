# Launch the shiny::shinyApp (Do not remove this comment)

if (
  isTRUE(as.logical(Sys.getenv("TESTTHAT_IS_CHECKING", "false"))) ||
    isTRUE(as.logical(Sys.getenv("R_COVR", "false")))
) {
  library("gsm.app")
} else {
  pkgload::load_all(here::here())
}

# Define plugin shells. All we really care about are the names.
plugin1 <- plugin2 <- plugin_Define(
  strName = "Plugin One",
  lSpec = list(),
  fnShinyUI = function(id) {},
  fnShinyServer = function(id) {}
)
plugin2$meta$Name <- "Plugin Two"

gsm.app::run_gsm_app(
  dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
  dfBounds = gsm.app::sample_dfBounds,
  dfGroups = gsm.app::sample_dfGroups,
  dfMetrics = gsm.app::sample_dfMetrics,
  dfResults = gsm.app::sample_dfResults,
  fnFetchData = sample_fnFetchData,
  lPlugins = list(plugin1, plugin2)
)
