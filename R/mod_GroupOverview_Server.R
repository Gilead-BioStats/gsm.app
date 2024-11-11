#' Group Overview Module Server
#'
#' @inheritParams shared-params
#' @returns A list of two [shiny::reactiveVal()] values: `rctv_strGroupID` (the
#'   selected group, if any) and `rctv_strMetricID` (the selected metric, if
#'   any).
#' @keywords internal
mod_GroupOverview_Server <- function(
  id,
  dfResults,
  dfMetrics,
  dfGroups
) {
  moduleServer(id, function(input, output, session) {
    dfResults <- gsm::FilterByLatestSnapshotDate(dfResults)
    rctv_strGroupSubset <- shiny::reactiveVal("red")
    rctv_strGroupID <- shiny::reactiveVal()
    rctv_strMetricID <- shiny::reactiveVal()
    rctv_intClickCounter <- shiny::reactiveVal()

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
      rctv_strGroupID(input$group_overview$selectedGroupID)
    })
    shiny::observe({
      shiny::req(input$group_overview$groupSubset)
      rctv_strGroupSubset(input$group_overview$groupSubset)
    })
    shiny::observe({
      shiny::req(input$group_overview$clickCounter)
      rctv_intClickCounter(input$group_overview$clickCounter)
    })

    return(list(
      rctv_strGroupID = rctv_strGroupID,
      rctv_strMetricID = rctv_strMetricID,
      rctv_intClickCounter = rctv_intClickCounter
    ))
  })
}
