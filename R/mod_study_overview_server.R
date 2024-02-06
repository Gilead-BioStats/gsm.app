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

        ## KRI Color KPIs

        kri_color_count <- reactive({

            snapshot$lSnapshot$results_summary |>
                filter(grepl('^kri', workflowid)) |>
                transmute(Color = ifelse(abs(flag)  == 2,"Red",
                                         ifelse(abs(flag)  ==1, "Amber", "Other"))) |>
                group_by(Color) |>
                summarize(n = n())

        })

        output$red_kri <- renderText({

            paste0(kri_color_count() |> filter(Color == "Red") |> select(n), " Red KRIs")

        })

        output$amber_kri <- renderText({

            paste0(kri_color_count() |> filter(Color == "Amber") |> select(n), " Amber KRIs")

        })


    })
}


