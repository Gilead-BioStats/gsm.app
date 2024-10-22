#' Study Information Card
#'
#' @inheritParams shared-params
#'
#' @returns A [bslib::card()] with overall study metadata.
#' @keywords internal
out_StudyInformation <- function(dfGroups, dfResults) {
  SnapshotDate <- max(as.Date(dfResults$SnapshotDate))
  studyInfo <- gsm::Report_StudyInfo(dfGroups)
  toggle_js_path <- system.file(
    "report/lib",
    "showMetaTableDetails.js",
    package = "gsm"
  )
  toggle_js <- paste0(
    "<script>",
    paste(readLines(toggle_js_path), collapse = "\n"),
    "</script>"
  )

  bslib::card(
    studyInfo,
    htmltools::htmlDependency(
      name = "gsm_report_css",
      version = "1.0.0",
      src = "report",
      package = "gsm",
      stylesheet = "styles.css"
    ),
    htmltools::HTML(toggle_js),
    htmltools::div(
      glue::glue("Snapshot Date: {SnapshotDate}"),
      class = "date"
    )
  )
}
