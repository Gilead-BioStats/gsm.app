# Widget Plot Module UI

Widget Plot Module UI

## Usage

``` r
mod_WidgetPlot_UI(
  id,
  fnHtmlDependency,
  fnWidgetOutput,
  strPlotTitle = NULL,
  strGroupLevel = NULL
)
```

## Arguments

- id:

  `character` The id for this element.

- fnHtmlDependency:

  `function` A function that returns an
  [`htmltools::htmlDependency()`](https://rstudio.github.io/htmltools/reference/htmlDependency.html)
  or multiple wrapped in
  [`shiny::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html).

- fnWidgetOutput:

  `function` An
  [`htmlwidgets::shinyWidgetOutput()`](https://rdrr.io/pkg/htmlwidgets/man/htmlwidgets-shiny.html)
  function.

- strPlotTitle:

  `character` A title for a plot, usually the name of a metric.

- strGroupLevel:

  `character` Value for the group level. Default: `NULL` and taken from
  `dfMetrics$GroupLevel` if available.

## Value

A [`bslib::card()`](https://rstudio.github.io/bslib/reference/card.html)
with an optional title and the corresponding `fnWidgetOutput` and
dependencies to load it.
