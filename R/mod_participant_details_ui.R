#' Participant Details UI
#'
#' @export

participant_details_ui <- function(id) {
    ns <- shiny::NS(id)

    ui <- shiny::tabPanel(
        'Participant Details',
        shiny::tabsetPanel(
        )
    )

    return(ui)
}
