#' Site Details Server
#'
#' @export

site_details_server <- function(id, snapshot, site) {
    shiny::moduleServer(id, function(input, output, session) {
        # ---- site data
        site_data <- reactive({
            shiny::req(site())

            mapping <- snapshot$lInputs$lMapping$dfSITE
            data <- snapshot$lInputs$lMeta$meta_site %>%
                dplyr::filter(
                    .data[[ mapping$strSiteCol ]] == site()
                )

            return(data)
        })

        # ---- screening data
        #dfENROLL <- get_domain(
        #    snapshot,
        #    'dfENROLL',
        #    'strSiteCol',
        #    site()
        #)

        # ---- screening data
        dfSUBJ <- get_domain(
            snapshot,
            'dfSUBJ',
            'strSiteCol',
            site()
        )

        # ---- enrollment data
        #dfSUBJ <- reactive({
        #    req(site())

        #    mapping <- snapshot$lInputs$lMapping$dfSUBJ
        #    data <- snapshot$lInputs$lData$dfSUBJ %>%
        #        filter(
        #            .data[[ mapping$strSiteCol ]] == site()
        #        )

        #    return(list(
        #        mapping = mapping,
        #        data = data
        #    ))
        #})

        # ---- disposition summary
        #disposition <- reactive({
        #    req(
        #        site(),
        #        dfENROLL(),
        #        dfSUBJ()
        #    )

        #    screening <- table(dfENROLL()$data[[ dfENROLL()$mapping$strScreenFailCol ]])
        #    enrollment <- table(dfENROLL()$data[[ dfENROLL()$mapping$strScreenFailCol ]])
        #})

        # ---- site table
        output$site_data <- DT::renderDT({
            req(site_data())

            data <- site_data() %>%
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

        # ---- participant table
        output$participants <- DT::renderDT({
            shiny::req(dfSUBJ())
browser()
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
