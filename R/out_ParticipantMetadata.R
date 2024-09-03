#' Participant metadata card
#'
#' @inheritParams shared-params
#'
#' @return An [htmltools::div()] with participant metadata.
#' @keywords internal
out_ParticipantMetadata <- function(lParticipantMetadata) {
  if (!length(lParticipantMetadata)) {
    return(
      out_Card(
        "Participant Metadata",
        out_Placeholder("participant")
      )
    )
  }
  out_Card(
    "Participant Metadata",
    out_MetadataList(
      gsm::MakeParamLabelsList(names(lParticipantMetadata)),
      unname(lParticipantMetadata)
    )
  )
  #
  #
  # tag_return <- lParticipantMetadata %>%
  #   purrr::imap(out_ParticipantMetadata_Item) %>%
  #   div(class = "row p-2")
  # return(out_ParticipantCard_Wrapper("Participant Metadata", tag_return))
}

#' A single-row div or participant data
#'
#' @inheritParams shared-params
#'
#' @return An [htmltools::div()] laying out a single row of data.
#' @keywords internal
out_ParticipantMetadata_Item <- function(strValue, strName) {
  # TODO: 100% of this style/class stuff should be rolled up into a class or
  # two.
  div(
    class = "col-12",
    style = "font-weight: 500;",
    div(
      style = "display: flex; justify-content: space-between;",
      div(
        class = "card-text",
        style = "text-align: left; white-space: nowrap;",
        gsm::MakeParamLabelsList(strName)
      ),
      div(
        class = "text-secondary",
        style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"
      ),
      div(
        class = "card-text",
        style = "text-align: right; white-space: nowrap;",
        strValue
      )
    )
  )
}
