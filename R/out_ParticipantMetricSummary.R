#' Participant metadata card
#'
#' @inheritParams shared-params
#'
#' @return An [htmltools::div()] with participant metadata.
#' @keywords internal
out_ParticipantMetricSummary <- function(id, lParticipantMetadata) {
  if (!length(lParticipantMetadata)) {
    return(
      out_ParticipantCard_Wrapper(
        "Metric Summary",
        out_ParticipantCard_Placeholder()
      )
    )
  }
  tag_return <- out_ParticipantMetricSummary_Item(id, lParticipantMetadata)
  return(out_ParticipantCard_Wrapper("Metric Summary", tag_return))
}

#' A single-row div or participant data
#'
#' @inheritParams shared-params
#'
#' @return An [htmltools::div()] laying out a single row of data.
#' @keywords internal
out_ParticipantMetricSummary_Item <- function(id, lParticipantMetadata) {
  tag_return <- purrr::imap(
    lParticipantMetadata,
    function(df, strName) {
      strLabel <- gsm::MakeParamLabelsList(strName)
      rows <- NROW(df)
      div(
        class = "col-12",
        style = "font-weight: 500;",
        div(
          style = "display: flex; justify-content: space-between;",
          div(
            class = "card-text",
            style = "text-align: left; white-space: nowrap;",
            actionLink(
              inputId = paste0(id, strName),
              label = strLabel,
              style = "color:  var(--bs-secondary);"
            )
          ),
          div(class = "text-secondary", style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
          div(
            class = "card-text",
            style = "text-align: right; white-space: nowrap;",
            rows
          )
        )
      )
    }
  ) %>%
    div(class = "row p-2")
  return(tag_return)
}
