#' Study Overview Server
#'
#' @inheritParams shared-params
#'
#' @keywords internal
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
    rctv_dfKRIColorCount <- reactive({
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
      textOutput_KRIColor(rctv_dfKRIColorCount(), "Red")
    })

    output$amber_kri <- renderText({
      textOutput_KRIColor(rctv_dfKRIColorCount(), "Amber")
    })
  })
}

textOutput_KRIColor <- function(dfKRIColorCount, strColor) {
  n <- dfKRIColorCount %>%
    dplyr::filter(.data$Color == strColor) %>%
    dplyr::pull("n")
  n <- n %|0|% 0
  return(glue::glue("{n} {strColor} KRIs"))
}
