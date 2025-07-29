#' Study Information Card UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with overall study metadata.
#' @keywords internal
mod_StudyInformation_UI <- function(id, dfGroups, dfResults) {
  ns <- NS(id)
  SnapshotDate <- max(as.Date(dfResults$SnapshotDate))
  bslib::card(
    bslib::card_header(
      bslib::card_title("Study Information"),
      out_CardSubtitle(glue::glue("Snapshot Date: {SnapshotDate}"))
    ),
    gsm.kri::Report_StudyInfo(
      dfGroups,
      tagHeader = NULL,
      strId = ns("study_table")
    ),
    id = id
  )
}
