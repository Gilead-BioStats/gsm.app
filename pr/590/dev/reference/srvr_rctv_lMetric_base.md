# Reactive lMetric by metric

Reactive lMetric by metric

## Usage

``` r
srvr_rctv_lMetric_base(dfMetrics, rctv_strMetricID)
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

## Value

A [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html) of
dfMetrics as a list, filtered by metric.
