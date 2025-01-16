#' Group Overview Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with a [mod_RAGPillSet_UI()] and a corresponding
#'   [Widget_GroupOverviewOutput()].
#' @keywords internal
mod_GroupOverview_UI <- function(id, dfResults) {
  ns <- NS(id)
  bslib::card(
    full_screen = TRUE,
    bslib::card_body(
      mod_RAGPillSet_UI(
        ns("kri_counts"),
        intRed = sum(abs(dfResults$Flag) == 2, na.rm = TRUE),
        intAmber = sum(abs(dfResults$Flag) == 1, na.rm = TRUE)
      ),
      Widget_GroupOverviewOutput(ns("group_overview"))
    ),
    id = id
  )
}

#' Group Overview Module Server
#'
#' @inheritParams shared-params
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
