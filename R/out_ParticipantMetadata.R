#' Participant metadata card
#'
#' @inheritParams shared-params
#'
#' @returns A [bslib::card()] with participant metadata.
#' @keywords internal
out_ParticipantMetadata <- function(lParticipantMetadata) {
  if (!length(lParticipantMetadata)) {
    return(
      out_Card(
        "Participant Metadata",
        out_Placeholder("participant"),
        id = "participant-metadata"
      )
    )
  }
  out_Card(
    "Participant Metadata",
    out_MetadataList(
      gsm::MakeParamLabelsList(names(lParticipantMetadata), chrFieldNames),
      unname(lParticipantMetadata)
    ),
    id = "participant-metadata"
  )
}
