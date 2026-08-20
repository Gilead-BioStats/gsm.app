# Study Information Card UI

Study Information Card UI

## Usage

``` r
mod_StudyInformation_UI(id, dfGroups, dfResults)
```

## Arguments

- id:

  `character` The id for this element.

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-public.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created
  with
  [`gsm.reporting::BindResults()`](https://gilead-public.github.io/gsm.reporting/reference/BindResults.html).

## Value

A [`bslib::card()`](https://rstudio.github.io/bslib/reference/card.html)
with overall study metadata.
