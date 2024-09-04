#' Table of Participants Based on Site Selection
#'
#' @inheritParams shared-params
#'
#' @keywords internal
out_ParticipantsBySite <- function(
    dfAnalyticsInput,
    dfMetrics,
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
    dplyr::arrange(dplyr::desc(.data$Metric)) %>%
    dplyr::select("SubjectID", "Numerator", "Denominator", "Metric")

  ## Rename using dfMetrics
  metric_names <- dfMetrics %>%
    dplyr::filter(.data$MetricID == strMetricID) %>%
    dplyr::select("Numerator", "Denominator", "Metric") %>%
    as.list()

  new_colnames <- setNames(colnames(dat), colnames(dat))
  new_colnames[names(metric_names)] <- metric_names
  new_colnames <- unname(unlist(new_colnames))

  table <- DT::datatable(
    dat,
    class = "compact",
    colnames = new_colnames,
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
  )

  if ("Metric" %in% colnames(dat)) {
    table <- table %>%
      DT::formatRound("Metric", digits = 5)
  }

  return(table)
}
