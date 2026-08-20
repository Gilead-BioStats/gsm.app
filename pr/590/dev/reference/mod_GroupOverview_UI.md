# Group Overview Module UI

Group Overview Module UI

## Usage

``` r
mod_GroupOverview_UI(id, dfResults)
```

## Arguments

- id:

  `character` The id for this element.

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created
  with
  [`gsm.reporting::BindResults()`](https://gilead-public.github.io/gsm.reporting/reference/BindResults.html).

## Value

A [`bslib::card()`](https://rstudio.github.io/bslib/reference/card.html)
with a
[`mod_RAGPillSet_UI()`](https://gilead-biostats.github.io/gsm.app/dev/reference/mod_RAGPillSet_UI.md)
and a corresponding
[`Widget_GroupOverviewOutput()`](https://gilead-biostats.github.io/gsm.app/dev/reference/Widget_GroupOverview-shiny.md).
