#' Analytics Input Dataset
#'
#' Summary metric data for the "Group Subjects" module on the "Metric Details"
#' tab.
#'
#' @format A tibble with `r nrow(gsm.app::sample_dfAnalyticsInput)` rows and
#'   `r ncol(gsm.app::sample_dfAnalyticsInput)` columns:
#' \describe{
#'   \item{MetricID}{metric identifier}
#'   \item{SubjectID}{unique subject identifier}
#'   \item{GroupID}{grouping variable}
#'   \item{GroupLevel}{level of grouping variable}
#'   \item{Numerator}{numerator for this individual}
#'   \item{Denominator}{denominator for this individual}
#'   \item{Metric}{calculated rate/metric value}
#'   \item{SnapshotDate}{The snapshot with which this data is associated. We currently only use the most recent SnapshotDate}
#' }
#' @source Generated from data in the `clindata` package, using the
#'   `gsm.mapping` package.
#' @family sample data
"sample_dfAnalyticsInput"

#' Metric Bounds Dataset
#'
#' Information about the bounds used to flag metrics.
#'
#' @format A tibble with `r nrow(gsm.app::sample_dfBounds)` rows and
#'   `r ncol(gsm.app::sample_dfBounds)` columns:
#' \describe{
#'   \item{Threshold}{number of standard deviations that the upper and lower bounds are based on}
#'   \item{Denominator}{calculated denominator value}
#'   \item{LogDenominator}{calculated log denominator value}
#'   \item{Numerator}{calculated numerator value}
#'   \item{Metric}{calculated rate/metric value}
#'   \item{MetricID}{unique metric identifier}
#'   \item{StudyID}{unique study identifier}
#'   \item{SnapshotDate}{date of the snapshot}
#' }
#' @source Generated from data in the `clindata` package, using the
#'   `gsm.mapping` package.
#' @family sample data
"sample_dfBounds"

#' Group Metadata Dataset
#'
#' Information about sites, countries, and the overall study in the sample data.
#'
#' @format A tibble with `r nrow(gsm.app::sample_dfGroups)` rows and
#'   `r ncol(gsm.app::sample_dfGroups)` columns:
#' \describe{
#'   \item{GroupID}{grouping variable}
#'   \item{GroupLevel}{level of grouping variable}
#'   \item{Param}{Parameter of interest for the group}
#'   \item{Value}{Value of specified Param}
#' }
#' @source Generated from data in the `clindata` package, using the
#'   `gsm.mapping` package.
#' @family sample data
"sample_dfGroups"

#' Metric Metadata Dataset
#'
#' Information about the metrics included in the sample data.
#'
#' @format A tibble with `r nrow(gsm.app::sample_dfMetrics)` rows and
#'   `r ncol(gsm.app::sample_dfMetrics)` columns:
#' \describe{
#'   \item{MetricID}{unique metric identifier}
#'   \item{File}{yaml file for workflow}
#'   \item{GroupLevel}{level of grouping variable}
#'   \item{Abbreviation}{abbreviation for the metric}
#'   \item{Metric}{name of the metric}
#'   \item{Numerator}{data source for the numerator}
#'   \item{Denominator}{data source for the denominator}
#'   \item{Model}{model used to calculate metric}
#'   \item{Score}{type of score reported}
#'   \item{Type}{statistical outcome type}
#'   \item{Threshold}{thresholds to be used for bounds and flags}
#'   \item{nMinDenominator}{minimum denominator required to return a score and calculate a flag}
#' }
#' @source Generated from data in the `clindata` package, using the
#'   `gsm.mapping` package.
#' @family sample data
"sample_dfMetrics"

#' KRI Results Dataset
#'
#' Information about the status of each group in the sample data.
#'
#' @format A tibble with `r nrow(gsm.app::sample_dfResults)` rows and
#'   `r ncol(gsm.app::sample_dfResults)` columns:
#' \describe{
#'   \item{GroupID}{grouping variable}
#'   \item{GroupLevel}{level of grouping variable}
#'   \item{Numerator}{number of flags in group}
#'   \item{Denominator}{total subjects in group}
#'   \item{Metric}{calculated rate/metric value}
#'   \item{Score}{statistical score}
#'   \item{Flag}{ordinal flag to be applied}
#'   \item{MetricID}{unique metric identifier}
#'   \item{StudyID}{unique study identifier}
#'   \item{SnapshotDate}{date of the snapshot}
#' }
#' @source Generated from data in the `clindata` package, using the
#'   `gsm.mapping` package.
#' @family sample data
"sample_dfResults"

#' Fetch Data for a Domain
#'
#' This is a sample function demonstrating the type of function the user will
#' supply to find additional data about a given domain.
#'
#' @inheritParams shared-params
#'
#' @returns A data.frame with information about the specified domain.
#' @family sample data
#' @export
#'
#' @examples
#' head(sample_fnFetchData("AE"))
#' head(sample_fnFetchData("AE", strGroupID = "0X103"))
#' head(sample_fnFetchData("AE", strSubjectID = "1350"))
sample_fnFetchData <- function(
  strDomainID = c(
    "AE",
    "ENROLL",
    "LB",
    "PD",
    "SDRGCOMP",
    "STUDCOMP",
    "SUBJ",
    "DATACHG",
    "DATAENT",
    "QUERY"
  ),
  strGroupID = NULL,
  strGroupLevel = NULL,
  strSubjectID = NULL,
  dSnapshotDate = NULL
) {
  strDomainID <- toupper(strDomainID)
  strDomainID <- rlang::arg_match(strDomainID)

  strGroupID <- NullifyEmpty(strGroupID)
  strSubjectID <- NullifyEmpty(strSubjectID)

  if (
    !is.null(strGroupID) && strGroupID == "0X013" && strDomainID == "LB"
  ) {
    gsmappAbort(
      c(
        "Site 0X013 has data issues for the Lab domain.",
        "This is to demonstrate behavior with errors.",
        "Please select another Site."
      ),
      strClass = "sample_data-demo"
    )
  }

  strTableName <- paste0("Mapped_", strDomainID)
  df <- sample_lMapped[[strTableName]]
  df$studyid <- NULL
  df$invid <- NULL
  df <- dplyr::rename(df, SubjectID = "subjid")
  if ("subjectid" %in% colnames(df)) {
    df <- dplyr::rename(df, IntakeID = "subjectid")
  }
  if (length(strGroupID)) {
    if (length(strGroupLevel) && "GroupLevel" %in% colnames(df)) {
      df <- dplyr::filter(df, .data$GroupLevel == strGroupLevel)
    }
    df <- dplyr::filter(df, .data$GroupID == strGroupID)
  }
  if (length(strSubjectID)) {
    df <- dplyr::filter(df, .data$SubjectID == strSubjectID)
  }
  chrDateFields <- c(
    Mapped_AE = "mincreated_dts",
    Mapped_ENROLL = "enroll_dt",
    Mapped_LB = "lb_dt",
    Mapped_PD = "deviationdate",
    Mapped_SDRGCOMP = "mincreated_dts",
    Mapped_STUDCOMP = "mincreated_dts",
    Mapped_Visit = "visit_dt",
    Mapped_DATACHG = "visit_date",
    Mapped_DATAENT = "visit_date",
    Mapped_QUERY = "created"
  )
  if (length(dSnapshotDate) && strTableName %in% names(chrDateFields)) {
    df <- FilterBefore(df, chrDateFields[[strTableName]], dSnapshotDate)
  }
  return(dplyr::select(df, "SubjectID", "GroupID", dplyr::everything()))
}
