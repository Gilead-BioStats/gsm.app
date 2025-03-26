#' Metric Table Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an optional title and a
#'   [gsm.kri::Report_MetricTable()].
#' @keywords internal
mod_MetricTable_UI <- function(id) {
  ns <- NS(id)
  out_Card(
    tagTitle = NULL,
    id = id,
    class = "MetricTable",
    mod_gtBidirectional_UI(ns("gt"))
  )
}

#' Metric Table Module Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the id of the selected group.
#' @keywords internal
mod_MetricTable_Server <- function(
    id,
    rctv_dfResults,
    dfGroups,
    rctv_strSiteID
) {
  moduleServer(id, function(input, output, session) {
    # Update the widget when the source data changes.
    rctv_tbl <- reactive({
      req(rctv_dfResults())
      rmt <- gsm.kri::Report_MetricTable(
        rctv_dfResults(),
        dfGroups = dfGroups,
        strGroupLevel = "Site"
      )
      if (inherits(rmt, "gt_tbl")) {
        return(out_gtInteractive(rmt))
      }
      return(out_gtPlaceholder("metric with flagged sites"))
    })

    # Extract the data back out of the widget.
    rctv_tblData <- reactive({
      req(rctv_tbl())
      tbl <- rctv_tbl()
      if (inherits(tbl, "gt_tbl")) {
        return(tbl$`_data`)
      }
      # Return an empty version of the tibble. This should happen transiently at
      # most, so it's hard to test.
      #
      # nocov start
      dplyr::tibble(
        StudyID = character(),
        GroupID = character(),
        MetricID = character(),
        Group = character(),
        SnapshotDate = as.Date(1)[0],
        Enrolled = integer(),
        Numerator = numeric(),
        Denominator = numeric(),
        Metric = numeric(),
        Score = numeric(),
        Flag = numeric()
      )
      # nocov end
    })

    mod_gtBidirectional_Server(
      "gt",
      rctv_tblData,
      rctv_tbl,
      rctv_strSiteID,
      "GroupID"
    )
  })
}
