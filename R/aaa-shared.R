#' Parameters used in multiple functions
#'
#' Reused parameter definitions are gathered here for easier usage. Note: We
#' intentionally use `id` rather than the more standardized `strID` throughout
#' this package, because [shiny::testServer()] specifically expects an `id`
#' argument in module server functions.
#'
#' @param chrAllowedFields `character` A vector of names of allowed fields in an
#'   object.
#' @param chrAllowedValues `character` A vector of allowed values for a vector.
#' @param chrDomains `character` A vector of names of domain data.frames to show
#'   in the app. Supported domains are shown in the default value.
#' @param chrLinkIDs `character` Module ids for multiple modules.
#' @param chrLabels `character` A vector of labels for display to the user.
#' @param chrMessage `character` A vector of message elements to be formatted
#'   via [cli::cli_bullets()].
#' @param chrMetrics `character` A named vector of MetricIDs, where the names
#'   are the full Metric.
#' @param chrPluginFiles `character` The files in a plugin directory.
#' @param chrRequiredColumns `character` A vector of expected columns in a
#'   data.frame.
#' @param chrRequiredFields `character` A vector of names of required fields in
#'   an object.
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
#' @param dfParticipantGroups `data.frame` Unique `SubjectID` and `GroupID`
#'   combos from `dfAnalyticsInput`.
#' @param dfResults `data.frame` A stacked summary of analysis pipeline output.
#'   This will be filtered to cases where `GroupLevel == "Site"`.
#' @param envCall `environment` The environment from which this function was
#'   called, for use in better error messages. This value should usually be left
#'   as the default, or passed from the calling function if the calling function
#'   also has an `envCall` argument.
#' @param envEvaluate `environment` The environment in which any variables used
#'   in the message are defined. You almost definitely want to leave this as the
#'   default value.
#' @param fnFetchData `function` A function that takes a `strDomain` argument
#'   and optional `strSiteID` and `strSubjectID` and returns a data.frame. See
#'   [sample_fnFetchData()] for an example. The returned data.frame contains
#'   information about the named domain.
#' @param fnServer `function` A Shiny server function that takes arguments
#'   `input`, `output`, and `session`. This function will be called at the start
#'   of the main app server function.
#' @param id `character` The id for this module, widget, or other element.
#' @param intKRIColorCount `integer` A named vector of counts by color.
#' @param intNParticipants `integer` The number of unique participants
#'   (subjects) in the study.
#' @param intRed `integer` The number of sites with at least one red flag.
#' @param intAmber `integer` The number of sites with at least one amber flag.
#' @param lMetric `list` Named list of data describing a single metric, as well
#'   as things like which group is selected.
#' @param lDomains `list` Named list of data domain data.frames.
#' @param lParticipantMetadata `list` Named list of data describing a single
#'   participant.
#' @param lPluginDefinition `list` A named list with required elements
#'   `strTitle`, `fnUI`, and `fnServer`, and optional field `lConfig`.
#' @param lPlugins `list` Optional list of plugins to include in the app.
#' @param lStudy `list` Named list of data describing the overall study.
#' @param rctv_chrIDs `reactive character` A [shiny::reactive()] object that
#'   returns a vector of ids for modules, inputs, or other elements.
#' @param rctv_dfBounds `reactive dataframe` A [shiny::reactive()] object that
#'   returns a set of predicted percentages/rates and upper- and lower-bounds
#'   across the full range of sample sizes/total exposure values for reporting.
#' @param rctv_dfData `reactive dataframe` A [shiny::reactive()] object that
#'   returns a generic dataframe.
#' @param rctv_dfResults `reactive dataframe` A [shiny::reactive()] object that
#'   returns a stacked summary of analysis pipeline output.
#' @param rctv_gtObject `reactive gt_table` A [shiny::reactive()] object that
#'   returns a [gt::gt()] object.
#' @param rctv_lData `reactive list` A [shiny::reactive()] object that returns a
#'   named list of dataframes.
#' @param rctv_lMetric `reactive list` A [shiny::reactive()] object that returns
#'   a named list of data describing a single metric, as well as things like
#'   which group is selected.
#' @param rctv_lParticipantMetricData `reactive list` A [shiny::reactive()]
#'   object that returns a list of dataframes for a given participant, one for
#'   each metric that is available.
#' @param rctv_lglState `reactive logical` A [shiny::reactive()]] object that
#'   returns a Boolean value indicating whether something is "off" (`FALSE`) or
#'   "on" (`TRUE`).
#' @param rctv_strCurrentTab `reactive character` A [shiny::reactive()] object
#'   that returns the currently selected tab.
#' @param rctv_strGroupSubset `reactive character` A [shiny::reactive()] object
#'   that returns the selected subset of groups to include in the table.
#' @param rctv_strInput `reactive character` A [shiny::reactive()] object that
#'   returns the name of the target input.
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
#' @param strColorFamily `character` Whether to load the `"dark"` version of
#'   this color, or the `"light"` version. Default: `"dark"`.
#' @param strColorName `character` The target color to report about.
#' @param strColorCode `character` The hex code (such as `"#FFFFFF"`) for a
#'   color.
#' @param strContainerID `character` The (namespaced) ID of the target container
#'   (usually a div).
#' @param strDomain `character` The domain data.frame to load. Supported domains
#'   are shown in the default value.
#' @param strEmpty `character` The value to return when everything is
#'   deselected.
#' @param strFavicon `character` The name of an icon to use in the browser tab
#'   via [favawesome::fav()].
#' @param strFaviconColor `character` The hexcode or name of a color to use as
#'   the icon fill for [favawesome::fav()].
#' @param strGroupID `character` A `GroupID` to focus on.
#' @param strGroupLabelKey `character` Value for the group label key. Default:
#'   `"InvestigatorLastName"`.
#' @param strGroupLevel `character` Value for the group level. Default: `NULL`
#'   and taken from `dfMetrics$GroupLevel` if available.
#' @param strGroupSubset `character` Subset of groups to include in the table.
#'   Default: `"red"`. Options:
#' - `"all"`: All groups.
#' - `"red"`: Groups with 1+ red flags.
#' - `"red/amber"`: Groups with 1+ red/amber flag.
#' - `"amber"`: Groups with 1+ amber flag.
#' @param strInputID `character` An ID to use for the Shiny input created by
#'   this module or used by this JavaScript.
#' @param strLabel `character` The label of a field.
#' @param strMetricID `character` A `MetricID` to focus on.
#' @param strOutcome `character` Outcome variable. Default: `"Score"`.
#' @param strPlotTitle `character` A title for a plot, usually the name of a
#'   metric.
#' @param strSiteID `character` A `GroupID` of an individual site within a
#'   study.
#' @param strSubjectID `character` A `SubjectID` of an individual participant.
#' @param strTargetTab `character` The tab to switch to.
#' @param strText `character` Text to display.
#' @param strTitle `character` A title to display for the overall app.
#' @param strValue `character` The value of a field.
#' @param strWhat `character` A sentence-case description of the object being
#'   inspected.
#' @param tagListSidebar `taglist` An optional [htmltools::tagList()] of
#'   additional elements to add to the top of the app sidebar.
#' @param x An object to validate.
#'
#' @name shared-params
#' @keywords internal
NULL
