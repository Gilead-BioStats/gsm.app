#' Table of Participants Based on Site Selection
#'
#' @inheritParams shared-params
#'
#' @keywords internal
table_participants_by_site <- function(
    dfAnalyticsInput,
    strSite,
    strMetricID) {

  if ("MetricID" %in% colnames(dfAnalyticsInput)) {
    dfAnalyticsInput <- dplyr::filter(
      dfAnalyticsInput,
      .data$MetricID == strMetricID
    )
  }

  dat <- dfAnalyticsInput %>%
    dplyr::filter(
      .data$GroupLevel == "Site",
      .data$GroupID == strSite
    ) %>%
    dplyr::arrange(desc(.data$Metric)) %>%
    dplyr::select("SubjectID", "Numerator", "Denominator", "Metric")


  table <- DT::datatable(
    dat,
    class = "compact",
    options = list(
      lengthChange = FALSE,
      paging = FALSE,
      searching = FALSE,
      selection = "none",
      columnDefs = list(
        list(targets =  c("SubjectID", "Numerator", "Denominator"), className = "dt-center"),
        list(targets = "Metric", className = "dt-right")
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
  )

  if ("Metric" %in% colnames(dat)) {
    table <- table %>%
      DT::formatRound("Metric", digits = 5)
  }

  return(table)

}




