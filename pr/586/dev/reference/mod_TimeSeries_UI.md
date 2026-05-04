# TimeSeries Module UI

TimeSeries Module UI

## Usage

``` r
mod_TimeSeries_UI(id, strPlotTitle = NULL)
```

## Arguments

- id:

  `character` The id for this element.

- strPlotTitle:

  `character` A title for a plot, usually the name of a metric.

## Value

A [`bslib::card()`](https://rstudio.github.io/bslib/reference/card.html)
with an optional title and a
[`Widget_TimeSeriesOutput()`](https://gilead-biostats.github.io/gsm.app/dev/reference/Widget_TimeSeriesOutput.md).
