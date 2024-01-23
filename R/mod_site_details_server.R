#' Site Details Server
#'
#' @export

site_details_server <- function(id, snapshot, site) {
    shiny::moduleServer(id, function(input, output, session) {
        # ---- site data
        site_metadata <- reactive({
            shiny::req(site())

            mapping <- snapshot$lInputs$lMapping$dfSITE
            data <- snapshot$lInputs$lMeta$meta_site %>%
                dplyr::filter(
                    .data[[ mapping$strSiteCol ]] == site()
                )

            return(data)
        })

        # ---- screening disposition
        dfENROLL <- get_domain(
            snapshot,
            'dfENROLL',
            'strSiteCol',
            site()
        )

        # ---- demographics
        dfSUBJ <- get_domain(
            snapshot,
            'dfSUBJ',
            'strSiteCol',
            site()
        )

        # ---- study disposition
        dfSTUDCOMP <- get_domain(
            snapshot,
            'dfSTUDCOMP',
            'strIDCol',
            dfSUBJ()$data[[ dfSUBJ()$mapping$strIDCol ]]
        )

        # ---- disposition summary
        disposition <- reactive({
            req(
                #dfENROLL(),
                dfSUBJ()
                #dfSTUDCOMP()
            )

            screening_disposition <- table(
                dfENROLL()$data[[
                    dfENROLL()$mapping$strScreenFailCol
                ]]
            )

            study_disposition <- table(
                dfSTUDCOMP()$data[[
                    dfSTUDCOMP()$mapping$strStudyDiscontinuationReasonCol
                ]]
            )
            browser()
            return(study_disposition)
        })

        output$participant_disposition_table <- DT::renderDT({
            dplyr::bind_rows(
                dfENROLL()$data$enrollyn %>%
                    table() %>%
                    data.frame() %>%
                    dplyr::mutate(
                        domain = 'dfENROLL'
                    ),
                dfSUBJ()$data$enrollyn %>%
                    table() %>%
                    data.frame() %>%
                    dplyr::mutate(
                        domain = 'dfSUBJ'
                    ),
                dfSTUDCOMP()$data$compreas %>%
                    table() %>%
                    data.frame() %>%
                    dplyr::mutate(
                        domain = 'dfSTUDCOMP'
                    )
            )
        })

        # ---- site table
        output$site_metadata_table <- DT::renderDT({
            req(site_metadata())

            data <- site_metadata() %>%
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

        # ---- participant table
        output$participants <- DT::renderDT({
            shiny::req(dfSUBJ())

            data <- dfSUBJ()$data %>%
                dplyr::select(
                    'ID' = dfSUBJ()$mapping$strIDCol,
                    'Study Start Date' = dfSUBJ()$mapping$strStudyStartDate,
                    'Time on Study' = dfSUBJ()$mapping$strTimeOnStudyCol,
                    'Treatment Start Date' = dfSUBJ()$mapping$strTreatmentStartDate,
                    'Time on Treatment' = dfSUBJ()$mapping$strTimeOnTreatmentCol
                )

            table <- data %>%
                DT::datatable(
                    callback = htmlwidgets::JS('
                        table.on("click", "td:nth-child(1)", function(d) {
                            const participant_id = d.currentTarget.innerText;

                            console.log(
                                `Selected participant ID: ${participant_id}`
                            );

                            const namespace = "gsmApp";

                            Shiny.setInputValue(
                                "participant",
                                participant_id
                            );
                        })
                    '),
                    options = list(
                        autoWidth = TRUE,
                        lengthChange = FALSE,
                        paging = FALSE,
                        searching = FALSE,
                        selection = 'none'
                    ),
                    rownames = FALSE,
                )

            return(table)
        })
    })
}
