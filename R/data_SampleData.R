#' Analytics Input Dataset
#'
#' Summary metric data for the "Site Subjects" module on the "Metric Details"
#' tab.
#'
#' @format A tibble with 2602 rows and 7 columns:
#' \describe{
#'   \item{MetricID}{metric identifier}
#'   \item{SubjectID}{unique subject identifier}
#'   \item{GroupID}{grouping variable}
#'   \item{GroupLevel}{level of grouping variable}
#'   \item{Numerator}{numerator for this individual}
#'   \item{Denominator}{denominator for this individual}
#'   \item{Metric}{calculated rate/metric value}
#' }
#' @source Generated from data in the `clindata` package, using the `gsm`
#'   package.
"sample_dfAnalyticsInput"

#' Metric Bounds Dataset
#'
#' Information about the bounds used to flag metrics.
#'
#' @format A tibble with 2091 rows and 8 columns:
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
#' @source Generated from data in the `clindata` package, using the `gsm`
#'   package.
"sample_dfBounds"

#' Group Metadata Dataset
#'
#' Information about sites, countries, and the overall study in the sample data.
#'
#' @format A tibble with 3903 rows and 4 columns:
#' \describe{
#'   \item{GroupID}{grouping variable}
#'   \item{GroupLevel}{level of grouping variable}
#'   \item{Param}{Parameter of interest for the group}
#'   \item{Value}{Value of specified Param}
#' }
#' @source Generated from data in the `clindata` package, using the `gsm`
#'   package.
"sample_dfGroups"

#' Metric Metadata Dataset
#'
#' Information about the metrics included in the sample data.
#'
#' @format A tibble with 2 rows and 12 columns:
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
#' @source Generated from data in the `clindata` package, using the `gsm`
#'   package.
"sample_dfMetrics"

#' KRI Results Dataset
#'
#' Information about the status of each site in the sample data.
#'
#' @format A tibble with 352 rows and 10 columns:
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
#' @source Generated from data in the `clindata` package, using the `gsm`
#'   package.
"sample_dfResults"

#' Fetch Data for a Participant
#'
#' This is a sample function demonstrating the type of function the user will
#' supply to find additional data about a given participant.
#'
#' @inheritParams shared-params
#'
#' @return A list with elements `metadata` (a list of participant metadata) and
#'   `metric_data` (a named list, where the names are the available metric
#'   summaries, and the values are data frames containing the details).
#' @export
#'
#' @examples
#' sample_FetchParticipantData("0001")
sample_FetchParticipantData <- function(strSubjectID) {
  if (strSubjectID %in% names(participant_data)) {
    return(participant_data[[strSubjectID]])
  }
  gsmapp_abort(
    c(
      "{.arg strSubjectID} must be one of the participants in the sample data.",
      i = "Unknown participant {strSubjectID}."
    ),
    class = "unknown_strSubjectID"
  )
}
