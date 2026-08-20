# Group Details UI

Group Details UI

## Usage

``` r
mod_GroupDetails_UI(id, dfGroups)
```

## Arguments

- id:

  `character` The id for this element.

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-public.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

## Value

A
[`bslib::layout_columns()`](https://rstudio.github.io/bslib/reference/layout_columns.html)
with group metadata and group participants.
