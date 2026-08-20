# Bidirectional gt Table Selector Server

Bidirectional gt Table Selector Server

## Usage

``` r
mod_gtBidirectional_Server(
  id,
  rctv_dfData,
  rctv_gtObject,
  rctv_strInput,
  strLabel,
  strEmpty = "All"
)
```

## Arguments

- id:

  `character` The id for this element.

- rctv_dfData:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a generic dataframe.

- rctv_gtObject:

  `reactive gt_table` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a
  [`gt::gt()`](https://gt.rstudio.com/reference/gt.html) object.

- rctv_strInput:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the value(s) of an input to share with an
  interactive gt table. If this argument is a
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html),
  it will be used to push updates back to the calling function.

- strLabel:

  `character` The label of a field.

- strEmpty:

  `character` The value to return when everything is deselected.

## Value

A
[`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
with the id(s) of the field(s) selected in the table.
