#' Participant Details Server
#'
#' @export

participant_details_server <- function(id, snapshot, participant) {
    shiny::moduleServer(id, function(input, output, session) {
        # ---- demographics
        dfSUBJ <- get_domain(
            snapshot,
            'dfSUBJ',
            'strIDCol',
            participant()
        )

        # ---- site table
        output$participant_metadata_table <- DT::renderDT({
            req(dfSUBJ())

            data <- dfSUBJ()$data %>%
                dplyr::mutate(
                    dplyr::across(tidyselect::everything(), as.character)
                ) %>%
                tidyr::pivot_longer(
                    tidyselect::everything()
                ) %>%
                dplyr::mutate(
                    Characteristic = name %>%
                        gsub('_', ' ', .) %>%
                        gsub('\\b([a-z])', '\\U\\1', ., perl = TRUE) %>%
                        sub('pi', 'PI', ., TRUE) %>%
                        sub('id', 'ID', ., TRUE)
                ) %>%
                dplyr::select(
                    Characteristic, Value = value
                )

            data %>%
                DT::datatable(
                    options = list(
                        lengthChange = FALSE,
                        paging = FALSE,
                        searching = FALSE
                    ),
                    rownames = FALSE
                )
        })

        # ---- domain data table
        output$domain_data_table <- DT::renderDT({
            req(input$domain)

            domain <- get_domain(
                snapshot,
                input$domain,
                'strIDCol',
                participant()
            )

            domain()$data %>%
                DT::datatable(
                    rownames = FALSE
                )
        })
    })
}
