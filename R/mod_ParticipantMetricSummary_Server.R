#' Participant Metric Summary server
#'
#' Inputs as links to metric summary reports, with counts of rows.
#'
#' @return A string identifying the selected summary as a [shiny::reactive()].
#' @keywords internal
mod_ParticipantMetricSummary_Server <- function(
  id,
  rctv_lParticipantMetricData
) {
  moduleServer(id, function(input, output, session) {
    rctv_chrParticipantMetricDataNames <- reactive({
      names(rctv_lParticipantMetricData())
    })

    output$metric_list <- renderUI({
      lParticipantMetricData <- rctv_lParticipantMetricData()
      if (!length(lParticipantMetricData)) {
        return(out_Placeholder("participant"))
      }
      mod_ActionList_UI(
        session$ns("metric_list_choices"),
        rctv_chrParticipantMetricDataNames(),
        unname(unlist(gsm::MakeParamLabelsList(names(lParticipantMetricData)))),
        purrr::map_int(lParticipantMetricData, NROW)
      )
    })
    rctv_strSelectedMetric <- mod_ActionList_Server(
      "metric_list_choices",
      rctv_chrParticipantMetricDataNames
    )
    return(rctv_strSelectedMetric)
  })
}
