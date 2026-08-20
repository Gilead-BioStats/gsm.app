# ScatterPlot Set Module UI

ScatterPlot Set Module UI

## Usage

``` r
mod_ScatterPlotSet_UI(id, dfMetrics)
```

## Arguments

- id:

  `character` The id for this element.

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created with
  [`gsm.reporting::MakeMetric()`](https://gilead-public.github.io/gsm.reporting/reference/MakeMetric.html).

## Value

An
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
containing a
[`bslib::layout_column_wrap()`](https://rstudio.github.io/bslib/reference/layout_column_wrap.html)
of plots, and the output of
[`out_DetectCardClicks()`](https://gilead-biostats.github.io/gsm.app/dev/reference/out_DetectCardClicks.md)
(the JavaScript necessary to detect that the plot has been clicked).
