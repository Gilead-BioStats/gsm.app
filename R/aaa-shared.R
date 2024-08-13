#' Parameters used in multiple functions
#'
#' Reused parameter definitions are gathered here for easier usage.
#'
#' @param id The namespace id for this module.
#' @param dfBounds `data.frame` Set of predicted percentages/rates and upper-
#'   and lower-bounds across the full range of sample sizes/total exposure
#'   values for reporting.
#' @param dfGroups `data.frame` Group-level metadata dictionary.
#' @param dfMetrics `data.frame` Metric-specific metadata for use in charts and
#'   reporting.
#' @param dfResults `data.frame` A stacked summary of analysis pipeline output.
#' @param dfSite `data.frame` Optional site-level metadata.
#' @param dfStudy `data.frame` Optional study-level metadata.
#' @param dfAnalyticsInput `data.frame` Participant-level metric data.
#' @param input Shiny inputs
#' @param lAssessment `list` List of KRI assessments from `params` within
#'   `KRIReport.Rmd`.
#' @param output Shiny outputs
#' @param rctv_strSite `reactive string` A [shiny::reactive()] object that
#'   returns the `GroupID` of a site.
#' @param rctv_strMetricID `reactive string` A [shiny::reactive()] object that
#'   returns the selected `MetricID`.
#' @param session Shiny session
#'
#' @name shared-params
#' @keywords internal
NULL
