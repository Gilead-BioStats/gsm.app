#' Site Details UI
#'
#' @export

site_details_ui <- function(id) {
    ns <- shiny::NS(id)

    ui <- shiny::tabPanel(
        'Site Details',
        shiny::tabsetPanel(
            shiny::tabPanel(
                'Site Info',
                DT::DTOutput(ns('site_metadata'))
            ),
            shiny::tabPanel(
                'Site Participants',
                DT::DTOutput(ns('participants'))
            )
        )
    )

    return(ui)
}
