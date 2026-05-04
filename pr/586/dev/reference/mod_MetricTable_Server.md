# Metric Table Module Server

Metric Table Module Server

## Usage

``` r
mod_MetricTable_Server(
  id,
  rctv_dfResults,
  dfGroups,
  rctv_strGroupID,
  rctv_strGroupLevel
)
```

## Arguments

- id:

  `character` The id for this element.

- rctv_dfResults:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a stacked summary of analysis pipeline output.

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-biostats.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- rctv_strGroupID:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the `GroupID` of the selected group (usually
  site), and can be used to update which group is selected.

- rctv_strGroupLevel:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the selected `GroupLevel`.

## Value

A [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
with the id of the selected group.
