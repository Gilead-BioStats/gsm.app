# Define Server

Define Server

## Usage

``` r
gsmApp_Server(
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
  fnServer = NULL
)
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
  [`gsm.reporting::MakeBounds()`](https://gilead-biostats.github.io/gsm.reporting/reference/MakeBounds.html).

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

- fnServer:

  `function` A Shiny server function that takes arguments `input`,
  `output`, and `session`. This function will be called at the start of
  the main app server function.

## Value

The main server function for use in a shiny app.
