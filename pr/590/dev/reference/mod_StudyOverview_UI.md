# Study Overview UI

Study Overview UI

## Usage

``` r
mod_StudyOverview_UI(id, dfGroups, dfResults, dfMetrics)
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

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created with
  [`gsm.reporting::MakeMetric()`](https://gilead-public.github.io/gsm.reporting/reference/MakeMetric.html).
