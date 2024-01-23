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
                tidyr::pivot_longer(
                    everything()
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

            DT::datatable(
                data,
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

            return(data)
        })
    })
}
