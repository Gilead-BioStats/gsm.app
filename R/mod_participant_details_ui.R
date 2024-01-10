participant_details_ui <- function(id) {
    ns <- NS(id)

    ui <- shiny::tabPanel(
        'Participant Details',
        shiny::tabsetPanel(
        )
    )

    return(ui)
}
