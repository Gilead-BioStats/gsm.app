#' Table of Participants Based on Site Selection
#'
#' @inheritParams shared-params
#'
#' @keywords internal
table_participants_by_site <- function(
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
    dplyr::arrange(desc(.data$Metric)) %>%
    dplyr::select("SubjectID", "Numerator", "Denominator", "Metric") %>%
    as.data.frame(.data)

  ## Selecting columns from dfMetrics

  new_column_names <- dfMetrics %>%
    dplyr::filter(.data$MetricID == strMetricID) %>%
    dplyr::select("Numerator", "Denominator", "Metric") %>%
    as.data.frame(.data)

  column_names_to_update <- colnames(dat)

  for (i in colnames(new_column_names)) {
    column_names_to_update[column_names_to_update == i] <- new_column_names[,i]
  }

  table <- DT::datatable(
    dat,
    class = "compact",
    colnames = column_names_to_update,
    options = list(
      lengthChange = FALSE,
      paging = FALSE,
      searching = FALSE,
      selection = "none",
      columnDefs = list(
        list(targets =  c("SubjectID", "Numerator", "Denominator", "Metric"), className = "dt-center")
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




