# Run the app

`run_gsm_app()` creates a Shiny app to explore a set of clinical trial
data. The app facilitates exploration of the data by allowing the user
to click to diver deeper into aspects of the data.

`run_sample_gsm_app()` is a thin wrapper around `run_gsm_app()`, using
the sample data provided in this package.

## Usage

``` r
run_gsm_app(
  dfAnalyticsInput,
  dfBounds,
  dfGroups,
  dfMetrics,
  dfResults,
  fnFetchData,
  fnCountData = ConstructDataCounter(fnFetchData),
  chrDomains = c(AE = "Adverse Events", DATACHG = "Data Changes", DATAENT = "Data Entry",
    ENROLL = "Enrollment", LB = "Lab", PD = "Protocol Deviations", QUERY = "Queries",
    STUDCOMP = "Study Completion", SUBJ = "Subject Metadata", SDRGCOMP =
    "Treatment Completion"),
  lPlugins = NULL,
  strTitle = ExtractAppTitle(dfGroups),
  strFavicon = "angles-up",
  strFaviconColor = "#FF5859",
  tagListExtra = NULL,
  fnServer = NULL
)

run_sample_gsm_app(strFavicon = "angles-up", strFaviconColor = "#FF5859")
```

## Arguments

- dfAnalyticsInput:

  `data.frame` Participant-level metric data. This data.frame is created
  by binding together the `lAnalysis` "Analysis_Input" list of
  data.frames output of analysis workflows, with a `MetricID` column for
  the name of each list.

- dfBounds:

  `data.frame` Set of predicted percentages/rates and upper- and
  lower-bounds across the full range of sample sizes/total exposure
  values for reporting. Created with
  [`gsm.reporting::MakeBounds()`](https://gilead-public.github.io/gsm.reporting/reference/MakeBounds.html).

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-public.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created with
  [`gsm.reporting::MakeMetric()`](https://gilead-public.github.io/gsm.reporting/reference/MakeMetric.html).

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created
  with
  [`gsm.reporting::BindResults()`](https://gilead-public.github.io/gsm.reporting/reference/BindResults.html).

- fnFetchData:

  `function` A function that takes a `strDomainID` argument and optional
  `strGroupID`, `strGroupLevel`, `strSubjectID`, and/or `dSnapshotDate`,
  and returns a data.frame. See
  [`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md)
  for an example. The returned data.frame contains information about the
  named domain. If the function throws an error, the error is elevated
  to the user, so you can use errors to pass requirements through to the
  user.

- fnCountData:

  `function` A function that takes a `strDomainID` argument and optional
  `strGroupID`, `strGroupLevel`, `strSubjectID`, and/or `dSnapshotDate`,
  and returns an integer count of the number of rows in that filtered
  domain. By default, this function is constructed using `fnFetchData()`
  and
  [`ConstructDataCounter()`](https://gilead-biostats.github.io/gsm.app/dev/reference/ConstructDataCounter.md).

- chrDomains:

  `character` A (named) vector of domains to include in the app. The
  values of the vector will be used as labels, and the names will be
  used as IDs. The IDs will be passed to `fnFetchData()` to fetch data
  about that domain.

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

- fnServer:

  `function` A Shiny server function that takes arguments `input`,
  `output`, and `session`. This function will be called at the start of
  the main app server function.

## Value

An object that represents the app. Printing the object or passing it to
[`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html) runs the
app.

## See also

[sample_dfAnalyticsInput](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfAnalyticsInput.md),
[sample_dfBounds](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfBounds.md),
[sample_dfGroups](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfGroups.md),
[sample_dfMetrics](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfMetrics.md),
[`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md),
[sample_dfResults](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfResults.md)

## Examples

``` r
if (FALSE) { # interactive()
# Sample app will launch in a new browser window.
run_sample_gsm_app()
}
```
