#' Parameters used in multiple functions
#'
#' Reused parameter definitions are gathered here for easier usage.
#'
#' @param id The namespace id for this module.
#' @param combinedData `data.frame` A combined data set with the required
#'   metrics.
#' @param dfBounds `data.frame` Set of predicted percentages/rates and upper-
#'   and lower-bounds across the full range of sample sizes/total exposure
#'   values for reporting.
#' @param dfGroups `data.frame` Group-level metadata dictionary.
#' @param dfMetrics `data.frame` Metric-specific metadata for use in charts and
#'   reporting.
#' @param dfResults `data.frame` A stacked summary of analysis pipeline output.
#' @param dfSite `data.frame` Optional site-level metadata.
#' @param dfStudy `data.frame` Optional study-level metadata.
#' @param domain The type of data and subsequent metrics you would like to see.
#' @param input Shiny inputs
#' @param lAssessment `list` List of KRI assessments from `params` within
#'   `KRIReport.Rmd`.
#' @param metric The reactive value provided by the metric input from `server`
#' @param output Shiny outputs
#' @param session Shiny session
#' @param site The reactive value provided by the site input from `server`
#' @param snapshot A `list` object containing the data for a snapshot. This
#'   object funnels into virtually every function of the application.
#' @param subset_col The id column that will be selected from the domain.
#' @param subset_val The specific value that the subset_col will be filtered by.
#'
#' @name shared-params
#' @keywords internal
NULL
