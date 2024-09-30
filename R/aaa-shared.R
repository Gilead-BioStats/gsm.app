#' Parameters used in multiple functions
#'
#' Reused parameter definitions are gathered here for easier usage. Note: We
#' intentionally use `id` rather than the more standardized `strID` throughout
#' this package, because [shiny::testServer()] specifically expects an `id`
#' argument in module server functions.
#'
#' @param chrChoices `character` Choices for a [shiny::selectizeInput()] or
#'   other menu.
#' @param chrLinkIDs `character` Module ids for multiple modules.
#' @param chrLabels `character` A vector of labels for display to the user.
#' @param chrMessage `character` A vector of message elements to be formatted
#'   via [cli::cli_bullets()].
#' @param chrMetrics `character` A named vector of MetricIDs, where the names
#'   are the full Metric.
#' @param chrRequiredColumns `character` A vector of expected columns in a
#'   data.frame.
#' @param chrSites `character` A vector of sites available in the study.
#' @param chrValues `character` A vector of values to associate with a vector of
#'   labels.
#' @param dfAnalyticsInput `data.frame` Participant-level metric data.
#' @param dfBounds `data.frame` Set of predicted percentages/rates and upper-
#'   and lower-bounds across the full range of sample sizes/total exposure
#'   values for reporting.
#' @param dfGroups `data.frame` Group-level metadata dictionary.
#' @param dfMetrics `data.frame` Metric-specific metadata for use in charts and
#'   reporting.
#' @param dfResults `data.frame` A stacked summary of analysis pipeline output.
#'   This will be filtered to cases where `GroupLevel == "Site"`.
#' @param envCall `environment` The environment from which this function was
#'   called, for use in better error messages. This value should usually be left
#'   as the default, or passed from the calling function if the calling function
#'   also has an `envCall` argument.
#' @param envEvaluate `environment` The environment in which any variables used
#'   in the message are defined. You almost definitely want to leave this as the
#'   default value.
#' @param fnFetchParticipantData `function` A function that takes a single
#'   `strSubjectID` argument such as "0001", and returns a list with components
#'   `metadata` and `metric_data`. `metadata` should be a named charact vector
#'   (or something that can be coerced to a character vector) of information
#'   about the participant, and `metric_data` should be a named list of
#'   data.frames, each of which contains information related to the named
#'   metric.
#' @param id `character` The id for this module, widget, or other element.
#' @param intKRIColorCount `integer` A named vector of counts by color.
#' @param intNParticipants `integer` The number of unique participants
#'   (subjects) in the study.
#' @param lMetric `list` Named list of data describing a single metric, as well
#'   as things like which group is selected.
#' @param lParticipantMetadata `list` Named list of data describing a single
#'   participant.
#' @param lStudy `list` Named list of data describing the overall study.
#' @param rctv_chrIDs `reactive character` A [shiny::reactive()] object that
#'   returns a vector of ids for modules, inputs, or other elements.
#' @param rctv_dfBounds `reactive dataframe` A [shiny::reactive()] object that
#'   returns a set of predicted percentages/rates and upper- and lower-bounds
#'   across the full range of sample sizes/total exposure values for reporting.
#' @param rctv_dfResults `reactive dataframe` A [shiny::reactive()] object that
#'   returns a stacked summary of analysis pipeline output.
#' @param rctv_lData `reactive list` A [shiny::reactive()] object that returns a
#'   named list of dataframes.
#' @param rctv_lMetric `reactive list` A [shiny::reactive()] object that returns
#'   a named list of data describing a single metric, as well as things like
#'   which group is selected.
#' @param rctv_lParticipantMetricData `reactive list` A [shiny::reactive()]
#'   object that returns a list of dataframes for a given participant, one for
#'   each metric that is available.
#' @param rctv_strMetricID `reactive character` A [shiny::reactive()] object
#'   that returns the selected `MetricID`.
#' @param rctv_strName `reactive character` A [shiny::reactive()] object that
#'   returns the name of an object, such as a particular dataframe in a named
#'   list.
#' @param rctv_strSiteID `reactive character` A [shiny::reactive()] object that
#'   returns the `GroupID` of a site.
#' @param rctv_strSubjectID `reactive character` A [shiny::reactive()] object
#'   that returns the `SubjectID` of the selected participant.
#' @param rctv_strValue `reactive character` A [shiny::reactive()] object that
#'   returns the value of a field.
#' @param session `environment` Session from which to make a child scope (the
#'   default should almost always be used).
#' @param strArg `character` The name of the argument in the calling function.
#'   In general, this value should either be left as the default, or passed from
#'   the calling function if the calling function also has a `strArg` argument.
#' @param strClass `character` A descriptive label for this type of error, in
#'   lower_snake_case.
#' @param strColor `character` The target color to report about.
#' @param strContainerID `character` The (namespaced) ID of the target container
#'   (usually a div).
#' @param strGroupID `character` A `GroupID` to focus on.
#' @param strInputID `character` An ID to use for the Shiny input created by
#'   this module or used by this Javascript.
#' @param strLabel `character` The label of a field.
#' @param strMetricID `character` A `MetricID` to focus on.
#' @param strPlotTitle `character` A title for a plot, usually the name of a
#'   metric.
#' @param strSubjectID `character` A `SubjectID` of an individual participant.
#' @param strTargetTab `character` The tab to switch to.
#' @param strText `character` Text to display.
#' @param strTitle `character` A title to display for the overall app.
#' @param strValue `character` The value of a field.
#'
#' @name shared-params
#' @keywords internal
NULL
