# Define UI
ui <- function(snapshot) {
    return(
        shiny::fluidPage(
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
                        metric_details_ui('metric_details'),
                        study_overview_ui('study_overview'),
                        site_details_ui('site_details'),
                        participant_details_ui('participant_details')
                    )
                )
            )
        )
    )
}
