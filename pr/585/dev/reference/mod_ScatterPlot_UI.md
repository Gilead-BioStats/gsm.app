# ScatterPlot Module UI

ScatterPlot Module UI

## Usage

``` r
mod_ScatterPlot_UI(id, strPlotTitle = NULL, strGroupLevel = NULL)
```

## Arguments

- id:

  `character` The id for this element.

- strPlotTitle:

  `character` A title for a plot, usually the name of a metric.

- strGroupLevel:

  `character` Value for the group level. Default: `NULL` and taken from
  `dfMetrics$GroupLevel` if available.

## Value

A [`bslib::card()`](https://rstudio.github.io/bslib/reference/card.html)
with an optional title and a
[`Widget_ScatterPlotOutput()`](https://gilead-biostats.github.io/gsm.app/dev/reference/Widget_ScatterPlotOutput.md).
