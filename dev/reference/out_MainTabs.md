# Main Tabbed Content

Main Tabbed Content

## Usage

``` r
out_MainTabs(chrDomains, dfGroups, dfMetrics, dfResults, lPlugins = NULL)
```

## Arguments

- chrDomains:

  `character` A (named) vector of domains to include in the app. The
  values of the vector will be used as labels, and the names will be
  used as IDs. The IDs will be passed to `fnFetchData()` to fetch data
  about that domain.

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-biostats.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created with
  [`gsm.reporting::MakeMetric()`](https://gilead-biostats.github.io/gsm.reporting/reference/MakeMetric.html).

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created
  with
  [`gsm.reporting::BindResults()`](https://gilead-biostats.github.io/gsm.reporting/reference/BindResults.html).

- lPlugins:

  `list` Optional list of plugins to include in the app.

## Value

A list of
[`bslib::nav_panel()`](https://rstudio.github.io/bslib/reference/nav-items.html)
elements, containing the main tabbed content.
