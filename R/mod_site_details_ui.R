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
                htmltools::h2('Participant Disposition'),
                DT::DTOutput(ns('participant_disposition_table')),
                htmltools::h2('Site Metadata'),
                DT::DTOutput(ns('site_metadata_table'))
            ),
            shiny::tabPanel(
                'Site Participants',
                DT::DTOutput(ns('participants'))
            )
        )
    )

    return(ui)
}
