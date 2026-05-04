# Standardized Plot Widgets as Shiny Modules

Standardized Plot Widgets as Shiny Modules

## Usage

``` r
mod_WidgetPlot_Server(
  id,
  fn_Widget,
  fn_WidgetOutput,
  rctv_dfResults,
  rctv_lMetric,
  dfGroups,
  rctv_dfBounds,
  rctv_strGroupID,
  ...
)
```

## Arguments

- id:

  `character` The id for this element.

- fn_Widget:

  A function that uses
  [`htmlwidgets::createWidget()`](https://rdrr.io/pkg/htmlwidgets/man/createWidget.html)
  to create a widget.

- fn_WidgetOutput:

  A function that uses
  [`htmlwidgets::shinyWidgetOutput()`](https://rdrr.io/pkg/htmlwidgets/man/htmlwidgets-shiny.html)
  to create the shiny version of a widget.

- rctv_dfResults:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a stacked summary of analysis pipeline output.

- rctv_lMetric:

  `reactive list` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a named list of data describing a single metric,
  as well as things like which group is selected.

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-biostats.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- rctv_dfBounds:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a set of predicted percentages/rates and upper-
  and lower-bounds across the full range of sample sizes/total exposure
  values for reporting.

- rctv_strGroupID:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the `GroupID` of the selected group (usually
  site), and can be used to update which group is selected.

- ...:

  Additional parameters passed to `fn_Widget`.
