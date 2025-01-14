#' Group Overview Module Server
#'
#' @inheritParams shared-params
#' @returns A list of two [shiny::reactiveVal()] values: `rctv_strMetricID` (the
#'   selected metric, if any).
#' @keywords internal
mod_GroupOverview_Server <- function(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  rctv_strMetricID,
  rctv_strSiteID
) {
  moduleServer(id, function(input, output, session) {
    dfResults <- gsm::FilterByLatestSnapshotDate(dfResults)
    rctv_strGroupSubset <- shiny::reactiveVal("red")

    rctv_strGroupSubset_Pills <- mod_RAGPillSet_Server(
      "kri_counts",
      rctv_strGroupSubset
    )

    shiny::observe({
      rctv_strGroupSubset(rctv_strGroupSubset_Pills())
    }) %>%
      shiny::bindEvent(rctv_strGroupSubset_Pills())

    output$group_overview <- renderWidget_GroupOverview({
      Widget_GroupOverview(
        id = session$ns("group_overview"),
        dfResults = dfResults,
        dfMetrics = dfMetrics,
        dfGroups = dfGroups,
        strGroupSubset = rctv_strGroupSubset()
      )
    })
    outputOptions(output, "group_overview", suspendWhenHidden = FALSE)

    shiny::observe({
      shiny::req(input$group_overview$selectedMetricID)
      rctv_strMetricID(input$group_overview$selectedMetricID)
    })
    shiny::observe({
      shiny::req(input$group_overview$selectedGroupID)
      rctv_strSiteID(input$group_overview$selectedGroupID)
    })
    shiny::observe({
      shiny::req(input$group_overview$groupSubset)
      rctv_strGroupSubset(input$group_overview$groupSubset)
    })
  })
}
