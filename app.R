# Launch the ShinyApp (Do not remove this comment)
library(shiny)
pkgload::load_all(".", helpers = FALSE, attach_testthat = FALSE)

this_path <- function(...) {
  system.file("plugins", "AE", ..., package = "gsm.app")
}

# TODO: Take a path for a plugin, and automatically read R and yaml files.
source(this_path('mod_AE.R'))
aePlugin <- yaml::read_yaml(this_path("AE.yaml"))

run_gsm_app(
  dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
  dfBounds = gsm.app::sample_dfBounds,
  dfGroups = gsm.app::sample_dfGroups,
  dfMetrics = gsm.app::sample_dfMetrics,
  dfResults = gsm.app::sample_dfResults,
  fnFetchData = sample_fnFetchData,
  lPlugins = list(aePlugin),
  strFavicon = Sys.getenv("GSMAPP_FAVICON", "angles-up"),
  strFaviconColor = Sys.getenv("GSMAPP_FAVICONCOLOR", colorScheme("red"))
)

# run_sample_gsm_app(
#   strFavicon = Sys.getenv("GSMAPP_FAVICON", "angles-up"),
#   strFaviconColor = Sys.getenv("GSMAPP_FAVICONCOLOR", colorScheme("red"))
# )
