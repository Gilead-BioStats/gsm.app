#' Participant Details UI
#'
#' @export

participant_details_ui <- function(id) {
    ns <- shiny::NS(id)

    ui <- shiny::tabPanel(
        'Participant Details',
        shiny::tabsetPanel(
            shiny::tabPanel(
                'Participant Metadata',
                DT::DTOutput(ns('participant_metadata_table'))
            ),
            shiny::tabPanel(
                'Participant Data',
                shiny::selectInput(
                    ns('domain'),
                    'Data Domain',
                    c(
                        'Adverse Events' = 'dfAE',
                        'Protocol Deviations' = 'dfPD',
                        'Enrollment' = 'dfENROLL',
                        'Study Disposition' = 'dfSTUDCOMP',
                        'Treatment Disposition' = 'dfSDRGCOMP',
                        'Queries' = 'dfQUERY'
                    ),
                    'dfAE'
                ),
                DT::DTOutput(ns('domain_data_table'))
            )
        )
    )

    return(ui)
}
