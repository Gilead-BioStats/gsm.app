#' Shiny UI function
#'
#' This function defines the user interface for your Shiny web application.
#' It specifies the layout of the web page and the interface elements it contains.
#'
#' @inheritParams shared-params
#' @return A Shiny UI object
gsmApp_UI <- function(strTitle = "GSM Deep Dive") {
  bslib::page_fluid(
    shinyjs::useShinyjs(),
    class = "bg-light",
    title = strTitle,
    theme = bslib::bs_theme(version = 5),
    htmlDependency_Stylesheet(),
    htmlDependency_HighlightTableRow(),
    htmlDependency_TableClick(),
    out_MainContent(strTitle = strTitle)
  )
}
