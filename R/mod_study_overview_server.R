#' Study Overview Server
#'
#' @inheritParams shared-params
#'
#' @export
study_overview_server <- function(id, snapshot) {
  shiny::moduleServer(id, function(input, output, session) {
    output$site_overview_table <- DT::renderDataTable({
      tb <- gsm::Overview_Table(
        snapshot$lStudyAssessResults,
        gsm::Site_Map_Raw(
          dfs = list(
            dfSITE = snapshot$lInputs$lMeta$meta_site,
            dfSUBJ = snapshot$lInputs$lData$dfSUBJ
          ),
          lMapping = snapshot$lInputs$lMapping,
          dfConfig = snapshot$lInputs$lMeta$config_param
        )
      )
      tb$x$selection <- "none"
      tb
    })

    ## KRI Color KPIs
    kri_color_count <- reactive({
      snapshot$lSnapshot$rpt_site_kri_details %>%
        dplyr::filter(grepl("^kri", .data$workflowid)) %>%
        dplyr::mutate(
          Color = ifelse(
            abs(.data$flag_value) == 2,
            "Red",
            ifelse(abs(.data$flag_value) == 1, "Amber", "Other")
          ),
          .keep = "none"
        ) %>%
        dplyr::summarize(n = dplyr::n(), .by = "Color")
    })

    output$red_kri <- renderText({
      paste0(
        kri_color_count() %>% dplyr::filter(.data$Color == "Red") %>% dplyr::select(n),
        " Red KRIs"
      )
    })

    output$amber_kri <- renderText({
      paste0(
        kri_color_count() %>% dplyr::filter(.data$Color == "Amber") %>% dplyr::select(n),
        " Amber KRIs"
      )
    })
  })
}
