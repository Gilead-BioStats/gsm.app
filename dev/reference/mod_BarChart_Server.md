# BarChart Module Server

BarChart Module Server

## Usage

``` r
mod_BarChart_Server(
  id,
  rctv_dfResults,
  rctv_lMetric,
  dfGroups,
  rctv_strGroupID,
  strOutcome = "Score",
  rctv_dfBounds = shiny::reactive(NULL)
)
```

## Arguments

- id:

  `character` The id for this element.

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

- rctv_strGroupID:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the `GroupID` of the selected group (usually
  site), and can be used to update which group is selected.

- strOutcome:

  `character` Outcome variable. Default: `"Score"`.

- rctv_dfBounds:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a set of predicted percentages/rates and upper-
  and lower-bounds across the full range of sample sizes/total exposure
  values for reporting.
