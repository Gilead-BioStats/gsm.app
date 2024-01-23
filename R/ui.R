#' Define UI
#'
#' @export

ui <- function(snapshot) {
    return(
        shiny::fluidPage(
            shinyjs::useShinyjs(),
            htmltools::includeCSS(
                system.file('www', 'styles.css', package = 'gsmApp')
            ),
            shiny::titlePanel('GSM - Deep Dive'),
            shiny::sidebarLayout(
                shiny::sidebarPanel(
                    shiny::selectInput('metric', 'Metric', choices = c('None')),
                    shiny::selectInput('site', 'Site', choices = c('None')),
                    shiny::selectInput('participant', 'Participant', choices = c('None')),
                    shiny::actionButton('reset', 'Reset All')
                ),
                shiny::mainPanel(
                    shiny::tabsetPanel(
                        study_overview_ui('study_overview'),
                        metric_details_ui('metric_details'),
                        site_details_ui('site_details'),
                        participant_details_ui('participant_details'),
                        id = 'main_panel',
                        selected = c(
                            'Study Overview'
                            # 'Metric Details'
                            # 'Site Details'
                            # 'Participant Details'
                        )
                    )
                )
            )
        )
    )
}
