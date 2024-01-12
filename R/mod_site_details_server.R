site_details_server <- function(id, snapshot, site) {
    moduleServer(id, function(input, output, session) {
        site_metadata <- reactive({
            req(site())

            mapping <- snapshot$lInputs$lMapping$dfSITE
            data <- snapshot$lInputs$lMeta$meta_site %>%
                filter(
                    .data[[ mapping$strSiteCol ]] == site()
                )

            return(data)
        })

        output$site_metadata <- DT::renderDT({
            req(site_metadata())

            data <- site_metadata() %>%
                tidyr::pivot_longer(
                    everything()
                ) %>%
                mutate(
                    Characteristic = name %>%
                        gsub('_', ' ', .) %>%
                        gsub('\\b([a-z])', '\\U\\1', ., perl = TRUE) %>%
                        sub('pi', 'PI', ., TRUE) %>%
                        sub('id', 'ID', ., TRUE)
                ) %>%
                select(
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

        site_participants <- reactive({
            req(site())

            mapping <- snapshot$lInputs$lMapping$dfSUBJ
            data <- snapshot$lInputs$lData$dfSUBJ %>%
                filter(
                    .data[[ mapping$strSiteCol ]] == site()
                )

            return(data)
        })

        output$participants <- DT::renderDT({
            req(site_metadata())

            mapping <- snapshot$lInputs$lMapping$dfSUBJ
            data <- site_participants() %>%
                select(
                    'ID' = mapping$strIDCol,
                    'Study Start Date' = mapping$strStudyStartDate,
                    'Time on Study' = mapping$strTimeOnStudyCol,
                    'Treatment Start Date' = mapping$strTreatmentStartDate,
                    'Time on Treatment' = mapping$strTimeOnTreatmentCol
                )

            return(data)
        })
    })
}
