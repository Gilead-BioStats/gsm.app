#' Study Information Card
#'
#' @inheritParams shared-params
#'
#' @returns A [bslib::card()] with overall study metadata.
#' @keywords internal
out_StudyInformation <- function(lStudy) {
  strProtocolNumber <- lStudy$protocol_number
  strNickname <- lStudy$nickname
  strSnapshotDate <- lStudy$snapshot_date
  lStudy$protocol_number <- NULL
  lStudy$nickname <- NULL
  lStudy$snapshot_date <- NULL

  bslib::card(
    bslib::card_header(
      bslib::card_title(strProtocolNumber),
      out_CardSubtitle(strNickname, "mb-2"),
      out_CardSubtitle(strSnapshotDate)
    ),
    out_MetadataList(
      gsm::MakeParamLabelsList(names(lStudy)),
      unname(lStudy)
    )
  )
}
