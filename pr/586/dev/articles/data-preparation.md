# Data Preparation and App Deployment

``` r

library(gsm.app)
library(dplyr)
library(purrr)
```

## Introduction

The {gsm.app} package creates interactive dashboards for exploring Good
Statistical Monitoring (GSM) Key Risk Indicator (KRI) assessments in
clinical trials. This vignette provides a comprehensive overview on how
to prepare data for use with the {gsm.app} Shiny application and how to
deploy an app.

The {gsm} suite of packages leverages Key Risk Indicators (KRIs) and
thresholds to conduct study-level, country-level and site-level Risk
Based Monitoring for clinical trials. The {gsm.app} package is tailored
to the {gsm} analysis data model, generating shiny apps that connect
risk signals with the underlying data.

Preparing data for use with {gsm.app} involves a standardized,
reproducible pipeline leveraging the
[gsm.core](https://gilead-biostats.github.io/gsm.core),
[gsm.mapping](https://github.com/Gilead-BioStats/gsm.mapping),
[gsm.kri](https://github.com/Gilead-BioStats/gsm.kri), and
[gsm.reporting](https://gilead-biostats.github.io/gsm.reporting/)
packages. The process consists of the following high-level steps:

1.  [Set Up Data
    Sources](https://gilead-biostats.github.io/gsm.core/articles/DataModel.html#raw-and-mapped-data).

    Define and load your raw clinical and operational data.

2.  [Create Mapping
    Workflows](https://gilead-biostats.github.io/gsm.core/articles/Cookbook.html#example-3---study-level-reporting-workflows)

    Specify and apply mapping workflows to transform raw data into
    standardized mapped data.

    It is important to note that
    [gsm.mapping](https://github.com/Gilead-BioStats/gsm.mapping)
    provides necessary functions and workflows to perform the data
    transformation from raw/source datasets to appropriate domains. The
    gsm.app is designed to be flexible to accept data conforming to the
    data.mapping specification.

3.  [Generate Mapped Data
    Layer](https://gilead-biostats.github.io/gsm.core/articles/Cookbook.html#example-3---study-level-reporting-workflows)

    Use mapping specifications to ingest, filter, and join data,
    producing a harmonized mapped data layer.

4.  [Run Analysis
    Workflows](https://gilead-biostats.github.io/gsm.core/articles/DataAnalysis.html)

    Apply analysis workflows to calculate Key Risk Indicators (KRIs) and
    perform statistical modeling.

5.  [Create Reporting
    Data](https://gilead-biostats.github.io/gsm.reporting/articles/DataReporting.html)

    Transform analysis results into reporting-ready data frames for use
    in dashboards and reports. The reporting data model is documented in
    detail at [Reporting
    Data](https://gilead-biostats.github.io/gsm.core/articles/DataModel.html#reporting-data).

At this point, you should have all required data structures to deploy
the app.

The {gsm.app} requires five main data frames to operate:

1.  **`dfAnalyticsInput`** - Participant-level metric data (stacked
    across metrics)

2.  **`dfBounds`** - Statistical bounds for flagging. Set of predicted
    percentages/rates and upper- and lower-bounds across the full range
    of sample sizes/total exposure values for reporting.

3.  **`dfGroups`** - Group-level metadata (sites, countries, study)

4.  **`dfMetrics`** - Metric-specific metadata for use in charts and
    reporting.

5.  **`dfResults`** - KRI assessment results. A stacked summary of
    analysis pipeline output.

## Data Fetching Function (`fnFetchData`)

The {gsm.app} operates on two levels: summary-level KRI results and
detail-level domain-specific data. When users identify concerning
metrics (e.g., high adverse event rates at a specific site), they need
to drill down to examine the underlying records that generated those
signals. This requires a data fetching approach that can dynamically
filter and return relevant data based on the current app selections.

The data-fetching functionality enables real-time access to source data
during investigation while maintaining performance by avoiding
unnecessary data loading. For a comprehensive guide on implementing data
ingestion functions, see
[`vignette("data-ingestion")`](https://gilead-biostats.github.io/gsm.app/dev/articles/data-ingestion.md).

## App Deployment

Once you have prepared all the required data structures and functions,
you can pass them to
[`run_gsm_app()`](https://gilead-biostats.github.io/gsm.app/dev/reference/run_gsm_app.md).

For development and testing, run the app locally: run_gsm_app() creates
a Shiny app to explore a set of clinical trial data. The app facilitates
exploration of the data by allowing the user to click to dive deeper
into aspects of the data.

``` r

# Run the app with custom data function
run_gsm_app(
  dfAnalyticsInput = dfAnalyticsInput,
  dfBounds = dfBounds,
  dfGroups = dfGroups,
  dfMetrics = dfMetrics,
  dfResults = dfResults,
  fnFetchData = fnFetchData,
  fnCountData = fnCountData(fnFetchData),
  chrDomains = c(AE = "Adverse Events", DATACHG = "Data Changes", DATAENT = "Data Entry",
    ENROLL = "Enrollment", LB = "Lab", PD = "Protocol Deviations", QUERY = "Queries",
    STUDCOMP = "Study Completion", SUBJ = "Subject Metadata", SDRGCOMP =
    "Treatment Completion"),
  lPlugins = NULL,
  strTitle = ExtractAppTitle(dfGroups),
  strFavicon = "angles-up",
  strFaviconColor = "#FF5859"
)
```

## 
