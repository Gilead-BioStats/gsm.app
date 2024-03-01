#' Participant Details Server
#'
#' @param id The namespace id
#' @param snapshot The snapshot `list` object passed from `run_app()`
#' @param participant The reactive value provided by the participant input from `server`
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
                shinyjs::hide("card_participant_metric_summary_data")
                shinyjs::hide("card_placeholder_participant_domain_data_no_metric")
                shinyjs::show("card_placeholder_participant_meta_data")
                shinyjs::show("card_placeholder_participant_domain_data")
                shinyjs::show("card_placeholder_participant_metric_summary_data")
                #card_placeholder_participant_domain_data_no_metric

            } else {

                ## Hide placeholder

                shinyjs::hide("card_participant_domain_data")
                shinyjs::hide("card_placeholder_participant_meta_data")
                shinyjs::hide("card_placeholder_participant_metric_summary_data")
                shinyjs::hide("card_placeholder_participant_domain_data")
                shinyjs::show("card_participant_meta_data")
                shinyjs::show("card_participant_metric_summary_data")
                shinyjs::show("card_placeholder_participant_domain_data_no_metric")

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

            mapping_column <- utils::read.csv(system.file('rbmLibrary', 'mapping_column.csv', package = 'gsmApp')) %>%
                filter(
                    .data$gsm_domain_key == 'dfSUBJ'
                )

            data <- dfSUBJ()$data %>%
                select(any_of(as.character(dfSUBJ()$mapping))) %>%
                mutate(across(everything(), as.character)) %>%
                pivot_longer(everything()) %>%
                left_join(mapping_column, by = c("name" = "default")) %>%
                mutate(
                    Characteristic = ifelse(!is.na(.data$description), .data$description, .data$name)
                ) %>%
                select(
                    "Characteristic",
                    "Value" = "value"
                )

            participant_summary_tag_list(data)

        })

        output$participant_metric_summary <- renderUI({

            participant_metric_summary_tag_list(session$ns(""), participant(), snapshot)

        })


        domain_filter <- reactiveVal(
            NULL
        )

        observeEvent(input$`dfAE`,{
            domain_filter("dfAE")
            shinyjs::hide("card_placeholder_participant_domain_data")
            shinyjs::hide("card_placeholder_participant_domain_data_no_metric")
            shinyjs::show("card_participant_domain_data")
            })
        observeEvent(input$`dfPD`,{
            domain_filter("dfPD")
            shinyjs::hide("card_placeholder_participant_domain_data")
            shinyjs::hide("card_placeholder_participant_domain_data_no_metric")
            shinyjs::show("card_participant_domain_data")
        })
        observeEvent(input$`dfENROLL`,{
            domain_filter("dfENROLL")
            shinyjs::hide("card_placeholder_participant_domain_data")
            shinyjs::hide("card_placeholder_participant_domain_data_no_metric")
            shinyjs::show("card_participant_domain_data")
        })
        observeEvent(input$`dfSTUDCOMP`,{
            domain_filter("dfSTUDCOMP")
            shinyjs::hide("card_placeholder_participant_domain_data")
            shinyjs::hide("card_placeholder_participant_domain_data_no_metric")
            shinyjs::show("card_participant_domain_data")
        })
        observeEvent(input$`dfSDRGCOMP`,{
            domain_filter("dfSDRGCOMP")
            shinyjs::hide("card_placeholder_participant_domain_data")
            shinyjs::hide("card_placeholder_participant_domain_data_no_metric")
            shinyjs::show("card_participant_domain_data")
        })
        observeEvent(input$`dfQUERY`,{
            domain_filter("dfQUERY")
            shinyjs::hide("card_placeholder_participant_domain_data")
            shinyjs::hide("card_placeholder_participant_domain_data_no_metric")
            shinyjs::show("card_participant_domain_data")
        })

        # ---- domain data table
        output$domain_data_table <- DT::renderDT({
            req(domain_filter())

            domain <- get_domain(
                snapshot,
                domain_filter(),
                'strIDCol',
                participant()
            )

            mapping <- domain$mapping |>
                as.data.frame() |>
                tidyr::pivot_longer(everything())

            domain <- domain$data |>
                select(any_of(mapping$value))

            domain |>
                DT::datatable(class = "compact",
                  options = list(
                      paging = FALSE,
                      searching = FALSE,
                      selection = 'none',
                      scrollX = TRUE
                  ),
                  rownames = FALSE,
                )
        })
    })
}
