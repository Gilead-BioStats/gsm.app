study_overview_ui <- function(id) {
    ns <- NS(id)

    ui <- shiny::tabPanel(
        "Study Overview",
        DT::DTOutput(ns('site_overview_table'))
    )

    return(ui)
}
