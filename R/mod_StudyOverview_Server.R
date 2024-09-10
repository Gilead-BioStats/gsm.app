#' Study Overview Server
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_StudyOverview_Server <- function(id, dfResults, dfMetrics, dfGroups) {
  moduleServer(id, function(input, output, session) {
    output$site_overview_table <- gsm::renderWidget_GroupOverview({
      gsm::Widget_GroupOverview(
        dfResults = dfResults,
        dfMetrics = dfMetrics,
        dfGroups = dfGroups,
        strGroupSubset = "all"
      )
    })

    ## KRI Color KPIs


    output$red_kri <- renderText({

    })

    output$amber_kri <- renderText({
      out_KRIColor(dfKRIColorCount, "Amber")
    })
  })
}
