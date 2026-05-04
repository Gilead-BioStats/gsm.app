# Time Series Widget

Time Series Widget

## Usage

``` r
Widget_TimeSeries(
  id,
  dfResults,
  strOutcome = "Score",
  lMetric = list(),
  dfGroups = NULL,
  dfBounds = NULL
)
```

## Arguments

- id:

  `character` The id for this element.

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created
  with
  [`gsm.reporting::BindResults()`](https://gilead-biostats.github.io/gsm.reporting/reference/BindResults.html).

- strOutcome:

  `character` Outcome variable. Default: `"Score"`.

- lMetric:

  `list` Named list of data describing a single metric, as well as
  things like which group is selected.

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-biostats.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- dfBounds:

  `data.frame` Set of predicted percentages/rates and upper- and
  lower-bounds across the full range of sample sizes/total exposure
  values for reporting. Created with
  [`gsm.reporting::MakeBounds()`](https://gilead-biostats.github.io/gsm.reporting/reference/MakeBounds.html).
