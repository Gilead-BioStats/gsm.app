# library(bslib)
# library(dplyr)
# library(gsm)
# library(purrr)
# library(shiny)
# library(shinyjs)
# library(stringr)
# library(tidyr)
# library(DT)
# library(htmltools)

purrr::walk(
    list.files('R', full.names = TRUE),
    source
)

snapshot <- gsmApp::read_snapshot()

    shinyApp(
        ui = ui(),
        server = function(input, output, session) {
            server(input, output, session, snapshot)
        }
    )


