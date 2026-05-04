# Shiny UI function

The user interface for a gsm deep dive app.

## Usage

``` r
gsmApp_UI(
  chrDomains,
  dfGroups,
  dfMetrics,
  dfResults,
  lPlugins = NULL,
  strTitle = ExtractAppTitle(dfGroups),
  strFavicon = "angles-up",
  strFaviconColor = ColorScheme("red"),
  tagListExtra = NULL
)
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

- strTitle:

  `character` A title to display for the overall app.

- strFavicon:

  `character` The name of an icon to use in the browser tab via
  [`favawesome::fav()`](https://favawesome.shinyworks.org/reference/fav.html).

- strFaviconColor:

  `character` The hexcode or name of a color to use as the icon fill for
  [`favawesome::fav()`](https://favawesome.shinyworks.org/reference/fav.html).

- tagListExtra:

  `taglist` An optional
  [`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
  of additional elements to add to the top of the app.

## Value

A Shiny UI object
