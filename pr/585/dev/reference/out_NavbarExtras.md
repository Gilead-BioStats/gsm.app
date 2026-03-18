# Things on the right side of navbar

Things on the right side of navbar

## Usage

``` r
out_NavbarExtras(dfGroups)
```

## Arguments

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-biostats.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

## Value

A list of
[`bslib::nav_item()`](https://rstudio.github.io/bslib/reference/nav-items.html)
with
[`shinyWidgets::virtualSelectInput()`](https://dreamrs.github.io/shinyWidgets/reference/virtualSelectInput.html).
