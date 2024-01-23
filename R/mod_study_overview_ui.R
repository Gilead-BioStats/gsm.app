#' Study Overview UI
#'
#' @export

study_overview_ui <- function(id) {
    ns <- shiny::NS(id)

    ui <- shiny::tabPanel(
        "Study Overview",
        DT::DTOutput(ns('site_overview_table'))
    )

    return(ui)
}
