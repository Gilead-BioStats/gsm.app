#' Participant Metric Summary server
#'
#' Inputs as links to metric summary reports, with counts of rows.
#'
#' @return A string identifying the selected summary (currently does not work
#'   and instead returns the string "selectedID") as a [shiny::reactive()].
#' @keywords internal
mod_ParticipantMetricSummary_Server <- function(
    id,
    rctv_lParticipantMetricData
) {
  moduleServer(id, function(input, output, session) {
    output$metric_list <- renderUI({
      lParticipantMetricData <- rctv_lParticipantMetricData()
      if (!length(lParticipantMetricData)) {
        return(out_Placeholder("participant"))
      }
      mod_ActionList_UI(
        "metric_list_choices",
        names(lParticipantMetricData),
        unname(unlist(gsm::MakeParamLabelsList(names(lParticipantMetricData)))),
        purrr::map_int(lParticipantMetricData, NROW)
      )
    })
    rctv_testing <- mod_ActionList_Server("metric_list_choices")

    #   # TODO: Modularize the rows.
    #   tag_return <- purrr::imap(
    #     lParticipantMetricData,
    #     function(df, strName) {
    #       strLabel <- gsm::MakeParamLabelsList(strName)
    #       rows <- NROW(df)
    #       div(
    #         class = "col-12",
    #         style = "font-weight: 500;",
    #         div(
    #           style = "display: flex; justify-content: space-between;",
    #           div(
    #             class = "card-text",
    #             style = "text-align: left; white-space: nowrap;",
    #             actionLink(
    #               inputId = strName,
    #               label = strLabel,
    #               style = "color:  var(--bs-secondary);"
    #             )
    #           ),
    #           div(class = "text-secondary", style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
    #           div(
    #             class = "card-text",
    #             style = "text-align: right; white-space: nowrap;",
    #             rows
    #           )
    #         )
    #       )
    #     }
    #   ) %>%
    #     div(class = "row p-2")
    #   return(tag_return)
    # })

    # TODO: Return the selected metric, for use by Participant Domain
    return(reactive("selectedID"))
  })
}
