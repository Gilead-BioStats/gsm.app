#' Study Overview Server
#'
#' @export

study_overview_server <- function(id, snapshot) {
    shiny::moduleServer(id, function(input, output, session) {
        output$site_overview_table <- DT::renderDT({
            gsm::Overview_Table(
                snapshot$lStudyAssessResults
            )
        })
    })
}
