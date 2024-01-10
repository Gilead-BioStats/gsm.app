site_details_ui <- function(id) {
    ns <- NS(id)

    ui <- shiny::tabPanel(
        'Site Details',
        shiny::tabsetPanel(
            shiny::tabPanel(
                'Site Info',
                'site_metadata'
            ),
            shiny::tabPanel(
                'Site Participants',
                'participants'
            )
        )
    )

    return(ui)
}
