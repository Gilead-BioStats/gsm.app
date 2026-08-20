# Plugins Wrapper Server

Plugins Wrapper Server

## Usage

``` r
mod_Plugins_Server(
  id,
  lPlugins,
  dfAnalyticsInput,
  dfBounds,
  dfGroups,
  dfMetrics,
  dfResults,
  l_rctvDomains,
  l_rctvDomainHashes,
  rctv_dSnapshotDate,
  rctv_strMetricID,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID,
  rctv_strDomainID
)
```

## Arguments

- id:

  `character` The id for this element.

- lPlugins:

  `list` Optional list of plugins to include in the app.

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

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-public.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created with
  [`gsm.reporting::MakeMetric()`](https://gilead-public.github.io/gsm.reporting/reference/MakeMetric.html).

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created
  with
  [`gsm.reporting::BindResults()`](https://gilead-public.github.io/gsm.reporting/reference/BindResults.html).

- l_rctvDomains:

  `list` A named list of lists of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects. Each list contains a "Study" element, a "Group" element, and
  a "Selection" element, each of which returns a domain dataframe.

- l_rctvDomainHashes:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects, each of which returns the
  [`rlang::hash()`](https://rlang.r-lib.org/reference/hash.html) of a
  domain dataframe.

- rctv_dSnapshotDate:

  `reactive Date` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the date of a data snapshot.

- rctv_strMetricID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the selected `MetricID`.

- rctv_strGroupID:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the `GroupID` of the selected group (usually
  site), and can be used to update which group is selected.

- rctv_strGroupLevel:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the selected `GroupLevel`.

- rctv_strSubjectID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the `SubjectID` of the selected participant.

- rctv_strDomainID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the selected `DomainID` (such as "AE" or "SUBJ").
