#' Table of Participants Based on Site Selection
#'
#' @inheritParams shared-params
#'
#' @keywords internal
out_ParticipantsBySite <- function(dfAnalyticsInput, chrColumnNames) {
  table <- DT::datatable(
    dfAnalyticsInput,
    class = "compact",
    colnames = chrColumnNames,
    options = list(
      lengthChange = FALSE,
      paging = FALSE,
      searching = FALSE,
      selection = "none",
      columnDefs = list(
        list(
          targets =  c("SubjectID", "Numerator", "Denominator", "Metric"),
          className = "dt-center"
        )
      )
    ),
    rownames = FALSE,
    selection = "none",
    callback = htmlwidgets::JS('
            table.on("click", "td:nth-child(1)", function(d) {
              const participant_id = d.currentTarget.innerText;
              console.log(
                `Selected participant ID: ${participant_id}`
              );
              const namespace = "gsm.app";
              Shiny.setInputValue(
                "participant",
                participant_id
              );
            })
          ')
  ) %>%
    DT::formatRound("Metric", digits = 5)

  return(table)
}
