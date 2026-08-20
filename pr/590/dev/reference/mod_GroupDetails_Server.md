# Group Details Server

Group Details Server

## Usage

``` r
mod_GroupDetails_Server(
  id,
  dfGroups,
  dfAnalyticsInput,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID,
  rctv_strMetricID,
  rctv_lMetric
)
```

## Arguments

- id:

  `character` The id for this element.

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-public.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- dfAnalyticsInput:

  `data.frame` Participant-level metric data. This data.frame is created
  by binding together the `lAnalysis` "Analysis_Input" list of
  data.frames output of analysis workflows, with a `MetricID` column for
  the name of each list.

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

- rctv_strMetricID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the selected `MetricID`.

- rctv_lMetric:

  `reactive list` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a named list of data describing a single metric,
  as well as things like which group is selected.

## Value

A [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
with the id of the most recently selected participant.
