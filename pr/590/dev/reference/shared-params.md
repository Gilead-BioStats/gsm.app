# Parameters used in multiple functions

Reused parameter definitions are gathered here for easier usage. Note:
We intentionally use `id` rather than the more standardized `strID`
throughout this package, because
[`shiny::testServer()`](https://rdrr.io/pkg/shiny/man/testServer.html)
specifically expects an `id` argument in module server functions.

## Arguments

- chrAllowedFields:

  `character` A vector of names of allowed fields in an object.

- chrAllowedValues:

  `character` A vector of allowed values for a vector.

- chrChoices:

  `character` A (named, optionally) vector of choices for this input.

- chrColors:

  `character` Colors to use for a scale, labels, etc.

- chrDomains:

  `character` A (named) vector of domains to include in the app. The
  values of the vector will be used as labels, and the names will be
  used as IDs. The IDs will be passed to `fnFetchData()` to fetch data
  about that domain.

- chrFromTabs:

  `character` A vector of tab names. Syncing is only triggered if the
  user is currently on one of these tabs.

- chrGroups:

  `character` A vector of groups available in the study.

- chrInputNamesPretty:

  `character` A vector of names to display for missing inputs.

- chrLabels:

  `character` A vector of labels for display to the user.

- chrLinkIDs:

  `character` Module ids for multiple modules.

- chrMessage:

  `character` A vector of message elements to be formatted via
  [`cli::cli_bullets()`](https://cli.r-lib.org/reference/cli_bullets.html).

- chrPluginFiles:

  `character` The files in a plugin directory.

- chrRequiredColumns:

  `character` A vector of expected columns in a data.frame.

- chrRequiredFields:

  `character` A vector of names of required fields in an object.

- chrRequiredInputs:

  `character` An optional vector of any inputs ("metric", "group",
  "group level", "participant", or "domain") that must have a non-empty
  value before the plugin can load. "None" and "All" count as "empty"
  for this check. If the user has not set a value for that input, the
  app will display a placeholder instructing the user to make a
  selection.

- chrValues:

  `character` A vector of values to associate with a vector of labels.

- df:

  `data.frame` A data frame to wrangle.

- dfAnalyticsInput:

  `data.frame` Participant-level metric data. This data.frame is created
  by binding together the `lAnalysis` "Analysis_Input" list of
  data.frames output of analysis workflows, with a `MetricID` column for
  the name of each list.

- dfBounds:

  `data.frame` Set of predicted percentages/rates and upper- and
  lower-bounds across the full range of sample sizes/total exposure
  values for reporting. Created with
  [`gsm.reporting::MakeBounds()`](https://gilead-public.github.io/gsm.reporting/reference/MakeBounds.html).

- dfDomain:

  `data.frame` Detailed data about a specific domain, such as "Adverse
  Events".

- dfDomain_Group:

  `data.frame` Detailed data about a specific domain, such as "Adverse
  Events", at the group level.

- dfDomain_Participant:

  `data.frame` Detailed data about a specific domain, such as "Adverse
  Events", at the participant level.

- dfDomain_Study:

  `data.frame` Detailed data about a specific domain, such as "Adverse
  Events", at the study level.

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-public.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created with
  [`gsm.reporting::MakeMetric()`](https://gilead-public.github.io/gsm.reporting/reference/MakeMetric.html).

- dfParticipantGroups:

  `data.frame` Unique `SubjectID` and `GroupID` combos from
  `dfAnalyticsInput`.

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created
  with
  [`gsm.reporting::BindResults()`](https://gilead-public.github.io/gsm.reporting/reference/BindResults.html).

- dfSubjectGroups:

  `data.frame` A subset of `dfGroups` with `GroupLevel`, `GroupID`, and
  `SubjectID`.

- dSnapshotDate:

  `Date` The date of a data snapshot.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

- envEvaluate:

  `environment` The environment in which any variables used in the
  message or widget are defined. You almost definitely want to leave
  this as the default value.

- fnCountData:

  `function` A function that takes a `strDomainID` argument and optional
  `strGroupID`, `strGroupLevel`, `strSubjectID`, and/or `dSnapshotDate`,
  and returns an integer count of the number of rows in that filtered
  domain. By default, this function is constructed using `fnFetchData()`
  and
  [`ConstructDataCounter()`](https://gilead-biostats.github.io/gsm.app/dev/reference/ConstructDataCounter.md).

- fnFetchData:

  `function` A function that takes a `strDomainID` argument and optional
  `strGroupID`, `strGroupLevel`, `strSubjectID`, and/or `dSnapshotDate`,
  and returns a data.frame. See
  [`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md)
  for an example. The returned data.frame contains information about the
  named domain. If the function throws an error, the error is elevated
  to the user, so you can use errors to pass requirements through to the
  user.

- fnHtmlDependency:

  `function` A function that returns an
  [`htmltools::htmlDependency()`](https://rstudio.github.io/htmltools/reference/htmlDependency.html)
  or multiple wrapped in
  [`shiny::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html).

- fnServer:

  `function` A Shiny server function that takes arguments `input`,
  `output`, and `session`. This function will be called at the start of
  the main app server function.

- fnShinyServer:

  `function or character` A shiny module server function for the plugin,
  or the name of such a function in the current session.

- fnShinyUI:

  `function or character` A shiny module UI function for the plugin, or
  the name of such a function in the current session.

- fnWidgetOutput:

  `function` An
  [`htmlwidgets::shinyWidgetOutput()`](https://rdrr.io/pkg/htmlwidgets/man/htmlwidgets-shiny.html)
  function.

- id:

  `character` The id for this element.

- intAmber:

  `integer` The number of groups with at least one amber flag.

- intKRIColorCount:

  `integer` A named vector of counts by color.

- intRed:

  `integer` The number of groups with at least one red flag.

- l_rctvActive:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects, each of which returns a populated character vector or
  something that becomes `NULL` when passed through
  [`NullifyEmpty()`](https://gilead-biostats.github.io/gsm.app/dev/reference/NullifyEmpty.md).

- l_rctvDomainHashes:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects, each of which returns the
  [`rlang::hash()`](https://rlang.r-lib.org/reference/hash.html) of a
  domain dataframe.

- l_rctvDomainHashes_Selection:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects, each of which returns the
  [`rlang::hash()`](https://rlang.r-lib.org/reference/hash.html) of a
  domain dataframe for the current filter.

- l_rctvDomainLoaded:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects. The list contains a "Study" element and an element per group
  level, each of which returns a `logical` (`FALSE` if the data has not
  been accessed, `TRUE` if it has).

- l_rctvDomains:

  `list` A named list of lists of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects. Each list contains a "Study" element, a "Group" element, and
  a "Selection" element, each of which returns a domain dataframe.

- l_rctvDomains_Selection:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects, each of which returns a domain dataframe for the current
  filter.

- l_rctvDomainsLoaded:

  `list` A named list of lists of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects. Each list contains a "Study" element and an element per group
  level, each of which returns a `logical` (`FALSE` if the data has not
  been accessed, `TRUE` if it has).

- l_rctvInputs:

  `list` A named list of
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  objects, each of which returns the current value of an input or
  input-like variable.

- lDataModel:

  `list` Named list of the standard gsm dataframes (`dfAnalyticsInput`,
  `dfBounds`, `dfGroups`, `dfMetrics`, and `dfResults`).

- lGroups:

  `list` Named list of character vectors, in which the names are the
  group levels and the vectors are the group IDs within that group
  level.

- lMetric:

  `list` Named list of data describing a single metric, as well as
  things like which group is selected.

- lPlugin:

  `list` A named list with required elements `meta` and `shiny`, and
  optional fields `spec`, `packages` and `required_inputs`. Usually
  generated by
  [`plugin_Read()`](https://gilead-biostats.github.io/gsm.app/dev/reference/plugin_Read.md).

- lPlugins:

  `list` Optional list of plugins to include in the app.

- lSpec:

  `list` A named list defining the data domains required by the plugin,
  where the names are the names of the domains and the elements are
  column definitions.

- lStudy:

  `list` Named list of data describing the overall study.

- lWorkflows:

  `list` An optional named list of workflows to run in order to
  translate app domain data into the format required by the plugin (as
  defined in the plugin `spec`). These workflows are ran before the
  plugin's `spec` is applied, and are meant to serve as a bridge between
  your domain data and the plugin's expected domains.

- rctv_bPluginReady:

  `reactive Boolean` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns `TRUE` if all inputs required by the plugin are
  non-empty, and `FALSE` if one or more inputs are not ready.

- rctv_chrChoices:

  `reactive character` Choices to set.

- rctv_chrDisabledChoices:

  `reactive character` Choices to disable.

- rctv_dfBounds:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a set of predicted percentages/rates and upper-
  and lower-bounds across the full range of sample sizes/total exposure
  values for reporting.

- rctv_dfData:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a generic dataframe.

- rctv_dfDomain:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a domain dataframe.

- rctv_dfDomain_Combined:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a study-, group-, and/or participant-level domain
  dataframe.

- rctv_dfDomain_Group:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a group-level domain dataframe.

- rctv_dfDomain_Study:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a study-level domain dataframe.

- rctv_dfResults:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a stacked summary of analysis pipeline output.

- rctv_dSnapshotDate:

  `reactive Date` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the date of a data snapshot.

- rctv_gtObject:

  `reactive gt_table` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a
  [`gt::gt()`](https://gt.rstudio.com/reference/gt.html) object.

- rctv_intDomainCounts:

  `reactive integer` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the count of rows for the current selection for
  all domains.

- rctv_lColumnNames:

  `reactive list` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a named list of column names to substitute into
  tables for display.

- rctv_lglDisable:

  `reactive logical` Whether to disable the menu.

- rctv_lglOpen:

  `reactive logical` Whether to open (`TRUE`) or close (`FALSE`) the
  menu.

- rctv_lglState:

  `reactive logical` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)\]
  object that returns a Boolean value indicating whether something is
  "off" (`FALSE`) or "on" (`TRUE`).

- rctv_lMetric:

  `reactive list` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a named list of data describing a single metric,
  as well as things like which group is selected.

- rctv_strCategory:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the currently selected category.

- rctv_strCurrentTab:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the currently selected tab.

- rctv_strDomainHash:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the the
  [`rlang::hash()`](https://rlang.r-lib.org/reference/hash.html) of a
  domain dataframe.

- rctv_strDomainID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the selected `DomainID` (such as "AE" or "SUBJ").

- rctv_strGroupID:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the `GroupID` of the selected group (usually
  site), and can be used to update which group is selected.

- rctv_strGroupLevel:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the selected `GroupLevel`.

- rctv_strGroupSubset:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the selected subset of groups to include in the
  table.

- rctv_strInput:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the value(s) of an input to share with an
  interactive gt table. If this argument is a
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html),
  it will be used to push updates back to the calling function.

- rctv_strLabel:

  `reactive character` Label to set.

- rctv_strMetricID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the selected `MetricID`.

- rctv_strName:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the name of an object, such as a particular
  dataframe in a named list.

- rctv_strSelected:

  `reactive character` Selected value to set.

- rctv_strSelection:

  `reactiveVal` A `reactiveVal` from the parent scope that this module
  will update with its selection.

- rctv_strSubjectID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the `SubjectID` of the selected participant.

- rctv_strValue:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the value of a field.

- session:

  `environment` Session from which to make a child scope (the default
  should almost always be used).

- strArg:

  `character` The name of the argument in the calling function. In
  general, this value should either be left as the default, or passed
  from the calling function if the calling function also has a `strArg`
  argument.

- strCache:

  `character` An additional string to ensure that a cache key is unique.

- strCategory:

  `character` A category to focus on.

- strClass:

  `character` A descriptive label for this type of error, in
  lower_snake_case.

- strColorCode:

  `character` The hex code (such as `"#FFFFFF"`) for a color.

- strColorFamily:

  `character` Whether to load the `"dark"` version of this color, or the
  `"light"` version. Default: `"dark"`.

- strColorName:

  `character` The target color to report about.

- strContainerID:

  `character` The (namespaced) ID of the target container (usually a
  div).

- strDomainID:

  `character` The domain data.frame to load.

- strDomainLabel:

  `character` The domain name to display. For example, for ID `"AE"`,
  the label is `"Adverse Events"`. Can also be a
  [`shiny::uiOutput()`](https://rdrr.io/pkg/shiny/man/htmlOutput.html)
  which renders to an inline string.

- strEmpty:

  `character` The value to return when everything is deselected.

- strFavicon:

  `character` The name of an icon to use in the browser tab via
  [`favawesome::fav()`](https://favawesome.shinyworks.org/reference/fav.html).

- strFaviconColor:

  `character` The hexcode or name of a color to use as the icon fill for
  [`favawesome::fav()`](https://favawesome.shinyworks.org/reference/fav.html).

- strFunction:

  `character` The name of a function, with or without namespace
  ("reactive" or "shiny::reactive"). If a namespace is supplied, we
  check that the package is installed, and attach it. The function can
  also be supplied as a function or a purrr-style formula. See
  [`rlang::as_function()`](https://rlang.r-lib.org/reference/as_function.html)
  (the `x` argument) for more details.

- strGroupID:

  `character` A `GroupID` of an individual site or other group within a
  study.

- strGroupLabelKey:

  `character` Value for the group label key. Default:
  `"InvestigatorLastName"`.

- strGroupLevel:

  `character` Value for the group level. Default: `NULL` and taken from
  `dfMetrics$GroupLevel` if available.

- strGroupSubset:

  `character` Subset of groups to include in the table. Default:
  `"red"`. Options:

  - `"all"`: All groups.

  - `"red"`: Groups with 1+ red flags.

  - `"red/amber"`: Groups with 1+ red/amber flag.

  - `"amber"`: Groups with 1+ amber flag.

- strInputID:

  `character` An ID to use for the Shiny input created by this module or
  used by this JavaScript.

- strInputName:

  `character` The name of an input. One of `"group"`, `"level"`,
  `"participant"`, or `"domain"`.

- strLabel:

  `character` The label of a field.

- strLevel:

  `character` The grouping level for this data (one of `"Study"`,
  `"Group"` or `"Participant"`, generally).

- strMetricID:

  `character` A `MetricID` to focus on.

- strOutcome:

  `character` Outcome variable. Default: `"Score"`.

- strPlotTitle:

  `character` A title for a plot, usually the name of a metric.

- strSubjectID:

  `character` A `SubjectID` of an individual participant.

- strTargetTab:

  `character` The tab to switch to.

- strText:

  `character` Text to display.

- strTitle:

  `character` A title to display for the overall app.

- strValue:

  `character` The value of a field.

- strWhat:

  `character` A sentence-case description of the object being inspected.

- strWidgetName:

  `character` The name of a widget in the gsm package.

- tagListExtra:

  `taglist` An optional
  [`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
  of additional elements to add to the top of the app.

- x:

  An object to validate.
