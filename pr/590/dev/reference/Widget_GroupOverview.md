# Group Overview Widget

Group Overview Widget

## Usage

``` r
Widget_GroupOverview(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  strGroupLevel = NULL,
  strGroupSubset = "red",
  strGroupLabelKey = "InvestigatorLastName"
)
```

## Arguments

- id:

  `character` The id for this element.

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created
  with
  [`gsm.reporting::BindResults()`](https://gilead-public.github.io/gsm.reporting/reference/BindResults.html).

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created with
  [`gsm.reporting::MakeMetric()`](https://gilead-public.github.io/gsm.reporting/reference/MakeMetric.html).

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-public.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- strGroupLevel:

  `character` Value for the group level. Default: `NULL` and taken from
  `dfMetrics$GroupLevel` if available.

- strGroupSubset:

  `character` Subset of groups to include in the table. Default:
  `"red"`. Options:

  - `"all"`: All groups.

  - `"red"`: Groups with 1+ red flags.

  - `"red/amber"`: Groups with 1+ red/amber flag.

  - `"amber"`: Groups with 1+ amber flag.

- strGroupLabelKey:

  `character` Value for the group label key. Default:
  `"InvestigatorLastName"`.
