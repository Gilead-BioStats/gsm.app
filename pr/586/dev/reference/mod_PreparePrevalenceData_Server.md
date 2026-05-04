# Reactively prepare data for prevalence plots

Reactively prepare data for prevalence plots

## Usage

``` r
mod_PreparePrevalenceData_Server(
  id,
  strLevel,
  l_rctvActive,
  rctv_dfData,
  rctv_strGroupLevel,
  ...
)
```

## Arguments

- id:

  `character` The id for this element.

- strLevel:

  `character` The grouping level for this data (one of `"Study"`,
  `"Group"` or `"Participant"`, generally).

- l_rctvActive:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects, each of which returns a populated character vector or
  something that becomes `NULL` when passed through
  [`NullifyEmpty()`](https://gilead-biostats.github.io/gsm.app/dev/reference/NullifyEmpty.md).

- rctv_dfData:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a generic dataframe.

- rctv_strGroupLevel:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the selected `GroupLevel`.

## Value

A reactive that returns the prepared `data.frame`, or `NULL`.
