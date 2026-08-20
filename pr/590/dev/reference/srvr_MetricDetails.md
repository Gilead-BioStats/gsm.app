# Temporary Metric Details wrapper

This really should be a full module, but this lets me "hide" some server
code so it isn't all inside
[`gsmApp_Server()`](https://gilead-biostats.github.io/gsm.app/dev/reference/gsmApp_Server.md).

## Usage

``` r
srvr_MetricDetails(
  dfAnalyticsInput,
  dfBounds,
  dfGroups,
  dfMetrics,
  dfResults,
  rctv_strMetricID,
  rctv_strPrimaryNavBar,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID,
  input,
  output,
  session
)
```

## Arguments

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

- session:

  `environment` Session from which to make a child scope (the default
  should almost always be used).

## Value

A [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html) for
`rctv_strGroupDetailsParticipant` from
[`mod_GroupDetails_Server()`](https://gilead-biostats.github.io/gsm.app/dev/reference/mod_GroupDetails_Server.md).
