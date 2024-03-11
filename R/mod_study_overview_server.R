#' Study Overview Server
#'
#' @param id The namespace id
#' @param snapshot The snapshot `list` object passed from `run_app()`
#'
#' @export

study_overview_server <- function(id, snapshot) {
    shiny::moduleServer(id, function(input, output, session) {
        output$site_overview_table <- DT::renderDataTable({
            gsm::Overview_Table(
                snapshot$lStudyAssessResults
            )
        })

        ## KRI Color KPIs

        kri_color_count <- reactive({
            snapshot$lSnapshot$rpt_site_kri_details %>%
                dplyr::filter(grepl("^kri", .data$workflowid)) %>%
                dplyr::transmute(Color = ifelse(abs(.data$flag_value) == 2, "Red",
                                                ifelse(abs(.data$flag_value) == 1, "Amber", "Other")
                )) %>%
                dplyr::group_by(.data$Color) %>%
                dplyr::summarize(n = n())
        })

        output$red_kri <- renderText({
            paste0(kri_color_count() %>% dplyr::filter(.data$Color == "Red") %>% dplyr::select(n), " Red KRIs")
        })

        output$amber_kri <- renderText({
            paste0(kri_color_count() %>% dplyr::filter(.data$Color == "Amber") %>% dplyr::select(n), " Amber KRIs")
        })
    })
}
