#' Study Overview Server
#'
#' @inheritParams shared-params
#'
#' @export

mod_study_overview_server <- function(id, dfResults, dfMetrics, dfGroups) {
  shiny::moduleServer(id, function(input, output, session) {
    output$site_overview_table <- gsm::renderWidget_GroupOverview({
      gsm::Widget_GroupOverview(
        dfResults = dfResults,
        dfMetrics = dfMetrics,
        dfGroups = dfGroups,
        strGroupSubset = "all"
      )
    })

    ## KRI Color KPIs
    kri_color_count <- reactive({
      dfResults %>%
        dplyr::mutate(
          Color = ifelse(
            abs(.data$Flag) == 2, "Red",
            ifelse(abs(.data$Flag) == 1, "Amber", "Other")
          ),
          .keep = "none"
        ) %>%
        dplyr::summarize(n = dplyr::n(), .by = "Color")
    })

    output$red_kri <- renderText({
      paste0(
        kri_color_count() %>%
          dplyr::filter(.data$Color == "Red") %>%
          dplyr::select("n"),
        " Red KRIs"
      )
    })

    output$amber_kri <- renderText({
      paste0(
        kri_color_count() %>%
          dplyr::filter(.data$Color == "Amber") %>%
          dplyr::select("n"),
        " Amber KRIs"
      )
    })
  })
}
