# Reactive lMetric by metric and group

Reactive lMetric by metric and group

## Usage

``` r
srvr_rctv_lMetric(
  dfMetrics,
  rctv_strMetricID,
  rctv_strGroupID,
  session = getDefaultReactiveDomain()
)
```

## Arguments

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created with
  [`gsm.reporting::MakeMetric()`](https://gilead-public.github.io/gsm.reporting/reference/MakeMetric.html).

- rctv_strMetricID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the selected `MetricID`.

- rctv_strGroupID:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the `GroupID` of the selected group (usually
  site), and can be used to update which group is selected.

- session:

  `environment` Session from which to make a child scope (the default
  should almost always be used).

## Value

A [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html) of
dfMetrics as a list, with information about the selected group.
