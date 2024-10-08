#' Table of Participants Based on Site Selection
#'
#' @inheritParams shared-params
#'
#' @keywords internal
out_SiteParticipants <- function(dfAnalyticsInput, chrColumnNames) {
  DT::datatable(
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
          targets = c("SubjectID", "Numerator", "Denominator", "Metric"),
          className = "dt-center"
        )
      )
    ),
    rownames = FALSE,
    selection = "none",
    callback = htmlwidgets::JS('
            table.on("click", "td:nth-child(1)", function(d) {
              const participant_id = d.currentTarget.innerText;
              const namespace = table.table().container().parentNode.id;
              const inputName = `${namespace}-participant`;
              Shiny.setInputValue(inputName, participant_id);
            })
          ')
  ) %>%
    DT::formatRound("Metric", digits = 5)
}
