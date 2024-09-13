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
#' @param fnFetchParticipantData `function` A function that takes a single
#'   `strSubjectID` argument such as "0001", and returns a list with components
#'   `metadata` and `metric_data`. `metadata` should be a named charact vector
#'   (or something that can be coerced to a character vector) of information
#'   about the participant, and `metric_data` should be a named list of
#'   data.frames, each of which contains information related to the named
#'   metric.
#' @param intNParticipants `integer` The number of unique participants
#'   (subjects) in the study.
#' @param lParticipantMetadata `list` Named list of data describing a single
#'   participant.
#' @param rctv_lParticipantMetricData `reactive list` A [shiny::reactive()]
#'   object that returns a list of dataframes for a given participant, one for
#'   each metric that is available.
#' @param rctv_strMetricID `reactive character` A [shiny::reactive()] object
#'   that returns the selected `MetricID`.
#' @param rctv_strSiteID `reactive character` A [shiny::reactive()] object that
#'   returns the `GroupID` of a site.
#' @param rctv_strSubjectID `reactive character` A [shiny::reactive()] object
#'   that returns the `SubjectID` of the selected participant.
#' @param session `environment` Session from which to make a child scope (the
#'   default should almost always be used).
#' @param strMetricID `character` A `MetricID` to focus on.
#' @param strSubjectID `character` A `SubjectID` of an individual participant.
#' @param strTitle `character` A title to display for the overall app.
#' @param strValue `character` The value of a field.
#'
#' @name shared-params
#' @keywords internal
NULL
