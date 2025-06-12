#' Shiny UI function
#'
#' The user interface for a gsm deep dive app.
#'
#' @inheritParams shared-params
#' @returns A Shiny UI object
#' @keywords internal
gsmApp_UI <- function(
  chrDomains,
  dfGroups,
  dfMetrics,
  dfResults,
  lPlugins = NULL,
  strTitle = ExtractAppTitle(dfGroups),
  strFavicon = "angles-up",
  strFaviconColor = ColorScheme("red"),
  tagListExtra = NULL
) {
  bslib::page_navbar(
    id = "primary_nav_bar",
    title = strTitle,
    theme = bslib::bs_theme(version = 5),
    fillable = FALSE,
    !!!out_MainTabs(
      chrDomains = chrDomains,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfResults = dfResults,
      lPlugins = lPlugins
    ),
    bslib::nav_spacer(),
    !!!out_NavbarExtras(
      dfGroups
    ),
    header = tagList(
      favawesome::fav(strFavicon, fill = strFaviconColor),
      htmlDependency_Stylesheet("defaultStyles.css"),
      shinyjs::useShinyjs(),
      tagListExtra
    )
  )
}
