# Find frequent values reactively

Find frequent values reactively

## Usage

``` r
srvr_PullTopValues(rctv_dfDomain, rctv_strCategory)
```

## Arguments

- rctv_dfDomain:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a domain dataframe.

- rctv_strCategory:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the currently selected category.

## Value

A reactive that returns an ordered character vector of the top 6
categories (or fewer if there are fewer than 6 total categories in the
data).
