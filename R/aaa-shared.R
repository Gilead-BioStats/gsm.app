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
#' @param chrChoices `character` A (named, optionally) vector of choices for a
#'   [shiny::selectInput()] or similar input function.
#' @param chrDomains `character` A (named) vector of domains to include in the
#'   app. The values of the vector will be used as labels, and the names will be
#'   used as IDs. The IDs will be passed to `fnFetchData()` to fetch data about
#'   that domain.
#' @param chrFromTabs `character` A vector of tab names. Syncing is only
#'   triggered if the user is currently on one of these tabs.
#' @param chrInputNamesPretty `character` A vector of names to display for
#'   missing inputs.
#' @param chrLinkIDs `character` Module ids for multiple modules.
#' @param chrLabels `character` A vector of labels for display to the user.
#' @param chrMessage `character` A vector of message elements to be formatted
#'   via [cli::cli_bullets()].
#' @param chrPluginFiles `character` The files in a plugin directory.
#' @param chrRequiredColumns `character` A vector of expected columns in a
#'   data.frame.
#' @param chrRequiredFields `character` A vector of names of required fields in
#'   an object.
#' @param chrRequiredInputs `character` An optional vector of any inputs
#'   ("metric", "group", "group level", "participant", or "domain") that must
#'   have a non-empty value before the plugin can load. "None" and "All" count
#'   as "empty" for this check. If the user has not set a value for that input,
#'   the app will display a placeholder instructing the user to make a
#'   selection.
#' @param chrGroups `character` A vector of groups available in the study.
#' @param chrValues `character` A vector of values to associate with a vector of
#'   labels.
#' @param df `data.frame` A data frame to wrangle.
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
#' @param dfSubjectGroups `data.frame` A subset of `dfGroups` with `GroupLevel`,
#'   `GroupID`, and `SubjectID`.
#' @param dSnapshotDate `Date` The date of a data snapshot.
#' @param envCall `environment` The environment from which this function was
#'   called, for use in better error messages. This value should usually be left
#'   as the default, or passed from the calling function if the calling function
#'   also has an `envCall` argument.
#' @param envEvaluate `environment` The environment in which any variables used
#'   in the message or widget are defined. You almost definitely want to leave
#'   this as the default value.
#' @param fnCountData `function` A function that takes a `strDomainID` argument
#'   and optional `strGroupID`, `strGroupLevel`, `strSubjectID`, and/or
#'   `dSnapshotDate`, and returns an integer count of the number of rows in that
#'   filtered domain. By default, this function is constructed using
#'   `fnFetchData()` and [ConstructDataCounter()].
#' @param fnFetchData `function` A function that takes a `strDomainID` argument
#'   and optional `strGroupID`, `strGroupLevel`, `strSubjectID`, and/or
#'   `dSnapshotDate`, and returns a data.frame. See [sample_fnFetchData()] for
#'   an example. The returned data.frame contains information about the named
#'   domain. If the function throws an error, the error is elevated to the user,
#'   so you can use errors to pass requirements through to the user.
#' @param fnHtmlDependency `function` A function that returns an
#'   [htmltools::htmlDependency()] or multiple wrapped in [shiny::tagList()].
#' @param fnServer `function` A Shiny server function that takes arguments
#'   `input`, `output`, and `session`. This function will be called at the start
#'   of the main app server function.
#' @param fnShinyUI `function or character` A shiny module UI function for the
#'   plugin, or the name of such a function in the current session.
#' @param fnShinyServer `function or character` A shiny module server function
#'   for the plugin, or the name of such a function in the current session.
#' @param fnWidgetOutput `function` An [htmlwidgets::shinyWidgetOutput()]
#'   function.
#' @param id `character` The id for this element.
#' @param intKRIColorCount `integer` A named vector of counts by color.
#' @param intRed `integer` The number of groups with at least one red flag.
#' @param intAmber `integer` The number of groups with at least one amber flag.
#' @param lDataModel `list` Named list of the standard gsm dataframes
#'   (`dfAnalyticsInput`, `dfBounds`, `dfGroups`, `dfMetrics`, and `dfResults`).
#' @param lGroups `list` Named list of character vectors, in which the names are
#'   the group levels and the vectors are the group IDs within that group level.
#' @param lMetric `list` Named list of data describing a single metric, as well
#'   as things like which group is selected.
#' @param l_rctvDomains `list` A named list of lists of [shiny::reactive()]
#'   objects. Each list contains a "Study" element, a "Group" element, and a
#'   "Selection" element, each of which returns a domain dataframe.
#' @param l_rctvDomainLoaded `list` A named list of [shiny::reactive()] objects.
#'   The list contains a "Study" element and an element per group level, each of
#'   which returns a `logical` (`FALSE` if the data has not been accessed,
#'   `TRUE` if it has).
#' @param l_rctvDomainsLoaded `list` A named list of lists of
#'   [shiny::reactive()] objects. Each list contains a "Study" element and an
#'   element per group level, each of which returns a `logical` (`FALSE` if the
#'   data has not been accessed, `TRUE` if it has).
#' @param l_rctvDomains_Selection `list` A named list of [shiny::reactive()]
#'   objects, each of which returns a domain dataframe for the current filter.
#' @param l_rctvDomainHashes `list` A named list of [shiny::reactive()] objects,
#'   each of which returns the [rlang::hash()] of a domain dataframe.
#' @param l_rctvDomainHashes_Selection `list` A named list of
#'   [shiny::reactive()] objects, each of which returns the [rlang::hash()] of a
#'   domain dataframe for the current filter.
#' @param l_rctvInputs `list` A named list of [shiny::reactiveVal()] objects,
#'   each of which returns the current value of an input or input-like variable.
#' @param lPlugin `list` A named list with required elements `meta` and `shiny`,
#'   and optional fields `spec`, `packages` and `required_inputs`. Usually
#'   generated by [plugin_Read()].
#' @param lPlugins `list` Optional list of plugins to include in the app.
#' @param lSpec `list` A named list defining the data domains required by the
#'   plugin, where the names are the names of the domains and the elements are
#'   column definitions.
#' @param lStudy `list` Named list of data describing the overall study.
#' @param lWorkflows `list` An optional named list of workflows to run in order
#'   to translate app domain data into the format required by the plugin (as
#'   defined in the plugin `spec`). These workflows are ran before the plugin's
#'   `spec` is applied, and are meant to serve as a bridge between your domain
#'   data and the plugin's expected domains.
#' @param rctv_bPluginReady `reactive Boolean` A [shiny::reactive()] object that
#'   returns `TRUE` if all inputs required by the plugin are non-empty, and
#'   `FALSE` if one or more inputs are not ready.
#' @param rctv_dSnapshotDate `reactive Date` A [shiny::reactive()] object that
#'   returns the date of a data snapshot.
#' @param rctv_dfBounds `reactive dataframe` A [shiny::reactive()] object that
#'   returns a set of predicted percentages/rates and upper- and lower-bounds
#'   across the full range of sample sizes/total exposure values for reporting.
#' @param rctv_dfData `reactive dataframe` A [shiny::reactive()] object that
#'   returns a generic dataframe.
#' @param rctv_dfDomain `reactive dataframe` A [shiny::reactive()] object that
#'   returns a domain dataframe.
#' @param rctv_dfResults `reactive dataframe` A [shiny::reactive()] object that
#'   returns a stacked summary of analysis pipeline output.
#' @param rctv_gtObject `reactive gt_table` A [shiny::reactive()] object that
#'   returns a [gt::gt()] object.
#' @param rctv_intDomainCounts `reactive integer` A [shiny::reactive()] object
#'   that returns the count of rows for the current selection for all domains.
#' @param rctv_lColumnNames `reactive list` A [shiny::reactive()] object that
#'   returns a named list of column names to substitute into tables for display.
#' @param rctv_lMetric `reactive list` A [shiny::reactive()] object that returns
#'   a named list of data describing a single metric, as well as things like
#'   which group is selected.
#' @param rctv_lglState `reactive logical` A [shiny::reactive()]] object that
#'   returns a Boolean value indicating whether something is "off" (`FALSE`) or
#'   "on" (`TRUE`).
#' @param rctv_strDomainID `reactive character` A [shiny::reactive()] object
#'   that returns the selected `DomainID` (such as "AE" or "SUBJ").
#' @param rctv_strDomainHash `reactive character` A [shiny::reactive()] object
#'   that returns the the [rlang::hash()] of a domain dataframe.
#' @param rctv_strCurrentTab `reactive character` A [shiny::reactive()] object
#'   that returns the currently selected tab.
#' @param rctv_strGroupID `reactive character` A [shiny::reactiveVal()] object
#'   that returns the `GroupID` of the selected group (usually site), and can be
#'   used to update which group is selected.
#' @param rctv_strGroupLevel `reactive character` A [shiny::reactiveVal()]
#'   object that returns the selected `GroupLevel`.
#' @param rctv_strGroupSubset `reactive character` A [shiny::reactive()] object
#'   that returns the selected subset of groups to include in the table.
#' @param rctv_strInput `reactive character` A [shiny::reactive()] object that
#'   returns the value(s) of an input to share with an interactive gt table. If
#'   this argument is a [shiny::reactiveVal()], it will be used to push updates
#'   back to the calling function.
#' @param rctv_strMetricID `reactive character` A [shiny::reactive()] object
#'   that returns the selected `MetricID`.
#' @param rctv_strName `reactive character` A [shiny::reactive()] object that
#'   returns the name of an object, such as a particular dataframe in a named
#'   list.
#' @param rctv_strSubjectID `reactive character` A [shiny::reactive()] object
#'   that returns the `SubjectID` of the selected participant.
#' @param rctv_strValue `reactive character` A [shiny::reactive()] object that
#'   returns the value of a field.
#' @param session `environment` Session from which to make a child scope (the
#'   default should almost always be used).
#' @param strArg `character` The name of the argument in the calling function.
#'   In general, this value should either be left as the default, or passed from
#'   the calling function if the calling function also has a `strArg` argument.
#' @param strCache `character` An additional string to ensure that a cache key
#'   is unique.
#' @param strClass `character` A descriptive label for this type of error, in
#'   lower_snake_case.
#' @param strColorFamily `character` Whether to load the `"dark"` version of
#'   this color, or the `"light"` version. Default: `"dark"`.
#' @param strColorName `character` The target color to report about.
#' @param strColorCode `character` The hex code (such as `"#FFFFFF"`) for a
#'   color.
#' @param strContainerID `character` The (namespaced) ID of the target container
#'   (usually a div).
#' @param strDomainID `character` The domain data.frame to load.
#' @param strDomainLabel `character` The domain name to display. For example,
#'   for ID `"AE"`, the label is `"Adverse Events"`.
#' @param strEmpty `character` The value to return when everything is
#'   deselected.
#' @param strFavicon `character` The name of an icon to use in the browser tab
#'   via [favawesome::fav()].
#' @param strFaviconColor `character` The hexcode or name of a color to use as
#'   the icon fill for [favawesome::fav()].
#' @param strFunction `character` The name of a function, with or without
#'   namespace ("reactive" or "shiny::reactive"). If a namespace is supplied, we
#'   check that the package is installed, and attach it. The function can also
#'   be supplied as a function or a purrr-style formula. See
#'   [rlang::as_function()] (the `x` argument) for more details.
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
#' @param strInputName `character` The name of an input. One of `"group"`,
#'   `"level"`, `"participant"`, or `"domain"`.
#' @param strLabel `character` The label of a field.
#' @param strMetricID `character` A `MetricID` to focus on.
#' @param strOutcome `character` Outcome variable. Default: `"Score"`.
#' @param strPlotTitle `character` A title for a plot, usually the name of a
#'   metric.
#' @param strGroupID `character` A `GroupID` of an individual site or other
#'   group within a study.
#' @param strSubjectID `character` A `SubjectID` of an individual participant.
#' @param strTargetTab `character` The tab to switch to.
#' @param strText `character` Text to display.
#' @param strTitle `character` A title to display for the overall app.
#' @param strValue `character` The value of a field.
#' @param strWhat `character` A sentence-case description of the object being
#'   inspected.
#' @param strWidgetName `character` The name of a widget in the gsm package.
#' @param tagListExtra `taglist` An optional [htmltools::tagList()] of
#'   additional elements to add to the top of the app.
#' @param x An object to validate.
#'
#' @name shared-params
#' @keywords internal
NULL
