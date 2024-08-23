#' Parameters used in multiple functions
#'
#' Reused parameter definitions are gathered here for easier usage.
#'
#' @param id The namespace id for this module.
#' @param dfAnalyticsInput `data.frame` Participant-level metric data.
#' @param dfBounds `data.frame` Set of predicted percentages/rates and upper-
#'   and lower-bounds across the full range of sample sizes/total exposure
#'   values for reporting.
#' @param dfGroups `data.frame` Group-level metadata dictionary.
#' @param dfMetrics `data.frame` Metric-specific metadata for use in charts and
#'   reporting.
#' @param dfResults `data.frame` A stacked summary of analysis pipeline output.
#'   This will be filtered to cases where `GroupLevel == "Site"`.
#' @param dfSite `data.frame` Optional site-level metadata.
#' @param dfStudy `data.frame` Optional study-level metadata.
#' @param fnFetchParticipantData `function` A function that takes a single
#'   `strSubjectID` argument such as "0001", and returns a list with components
#'   `metadata` and `metric_data`. `metadata` should be a named charact vector
#'   (or something that can be coerced to a character vector) of information
#'   about the participant, and `metric_data` should be a named list of
#'   data.frames, each of which contains information related to the named
#'   metric.
#' @param lAssessment `list` List of KRI assessments from `params` within
#'   `KRIReport.Rmd`.
#' @param rctv_strMetricID `reactive string` A [shiny::reactive()] object that
#'   returns the selected `MetricID`.
#' @param rctv_strSiteID `reactive string` A [shiny::reactive()] object that
#'   returns the `GroupID` of a site.
#' @param strMetricID `string` A `MetricID` to focus on.
#' @param strSite `string` The `GroupID` of a site to focus on.
#' @param strSubjectID `string` A `SubjectID` of an individual participant.
#'
#' @name shared-params
#' @keywords internal
NULL
