library(clindata)
library(gsm)
library(shiny)
library(shinyjs)

#gsmApp <- function() {
    ui <- fluidPage(
        mod_assessment_ui('ae')
    )

    server <- function(input, output, session) {
        mod_assessment_server('ae')
    }

    shinyApp(ui, server)
#}
