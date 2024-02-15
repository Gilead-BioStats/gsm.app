#' Participant Details Server
#'
#' @export

participant_details_server <- function(id, snapshot, participant) {
    shiny::moduleServer(id, function(input, output, session) {

        # ---- placeholders

        observeEvent(participant(),{

            if (participant() == "None") {

                ## Show placeholders

                shinyjs::hide("card_participant_domain_data")
                shinyjs::hide("card_participant_meta_data")
                shinyjs::show("card_placeholder_participant_meta_data")
                shinyjs::show("card_placeholder_participant_domain_data")


            } else {

                ## Hide placeholders

                shinyjs::hide("card_placeholder_participant_meta_data")
                shinyjs::hide("card_placeholder_participant_domain_data")
                shinyjs::show("card_participant_domain_data")
                shinyjs::show("card_participant_meta_data")


            }


        }, ignoreInit = TRUE)

        # ---- demographics
        dfSUBJ <- reactive({
            get_domain(
                snapshot,
                'dfSUBJ',
                'strIDCol',
                participant()
            )
        })

        ## --- participant metadata tag list

        output$participant_summary <- renderUI({

            req(dfSUBJ())

            column_selection <- dfSUBJ()$mapping %>% as.data.frame() %>% pivot_longer(everything()) %>% select(value)

            column_selection <- column_selection$value

            data <- dfSUBJ()$data %>%
                select(any_of(column_selection)) %>%
                select(!studyid) %>%
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

            participant_summary_tag_list(data)

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

            mapping <- domain$mapping |>
                as.data.frame() |>
                pivot_longer(everything())

            domain <- domain$data |>
                select(any_of(mapping$value))

            domain |>
                DT::datatable(class = "compact",
                  options = list(
                      paging = FALSE,
                      searching = FALSE,
                      selection = 'none',
                      scrollX = TRUE#,
                      # columnDefs = list(
                      #     list(className = "dt-center", targets = c(0:6))
                      # )
                  ),
                  rownames = FALSE,
                )
        })
    })
}
