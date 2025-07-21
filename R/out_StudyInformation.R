#' Study Information Card
#'
#' @inheritParams shared-params
#'
#' @returns A [bslib::card()] with overall study metadata.
#' @keywords internal
out_StudyInformation <- function(dfGroups, dfResults) {
  SnapshotDate <- max(as.Date(dfResults$SnapshotDate))
  bslib::card(
    bslib::card_header(
      bslib::card_title("Study Information"),
      out_CardSubtitle(glue::glue("Snapshot Date: {SnapshotDate}"))
    ),
    gsm.kri::Report_StudyInfo(
      dfGroups,
      tagHeader = NULL,
      strId = "study_overview-study_information-study_table"
    ),
    id = "study_overview-study_information"
  )
}
