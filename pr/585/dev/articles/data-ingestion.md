# Data Ingestion for GSM App

``` r
library(gsm.app)
library(dplyr)
```

## Introduction

The {gsm.app} package provides interactive dashboards for exploring Good
Statistical Monitoring (GSM) Key Risk Indicator (KRI) assessments in
clinical trials. A critical component of this exploration is the ability
to drill down from high-level summary statistics to the underlying
source data that drives those statistics.

This vignette explains why data fetching is essential for the generated
GSM app and provides step-by-step guidance on implementing data
ingestion functions that respond to the app’s current state. See
[`vignette("data-preparation")`](https://gilead-biostats.github.io/gsm.app/dev/articles/data-preparation.md)
for advice on preparing data for use with {gsm.app}.

## Why Does the App Need to Fetch Data?

The GSM app operates on two levels:

1.  **Summary Level**: Displays KRI results, statistical bounds, and
    group-level metrics.
2.  **Detail Level**: Shows the underlying domain-specific data that
    generated those summaries.

When a user identifies a site with concerning metrics (e.g., high
adverse event rate), they need to examine the specific records that
contributed to that signal. The data fetching functionality enables this
drill-down capability by:

- Filtering data based on the current app selections (domain, group,
  subject).
- Returning only relevant records for detailed review.
- Maintaining performance by avoiding loading unnecessary data.
- Providing real-time access to source data during investigation.

### Performance and Memory Considerations

You might wonder why we don’t simply load all domain data when the app
initializes. The dynamic data fetching approach offers several critical
advantages:

**Memory Efficiency**: Clinical trial datasets can be enormous. A large
Phase III study might have:

- Millions of adverse event records.
- Hundreds of thousands of laboratory measurements.
- Extensive demographics and medical history data.
- Multiple gigabytes of total domain data.

Loading all of this data into memory would consume substantial RAM and
potentially crash the application or make it unusable on standard
hardware.

**App Startup Performance**: Reading and loading large datasets takes
time. By fetching data on-demand, the app starts quickly and users can
begin exploring summary-level results immediately, rather than waiting
for all domain data to load.

**Network Efficiency**: In database-connected environments, loading all
domain data would require massive data transfers. On-demand fetching
transfers only the specific records needed for the current
investigation.

**Scalability**: As studies grow in size or when monitoring multiple
studies simultaneously, the dynamic approach scales naturally without
increasing the base memory footprint.

**User Experience**: Most app usage focuses on summary-level
exploration. Users typically drill down to detailed data for only a
small subset of sites or subjects, making it wasteful to preload data
that may never be viewed.

The trade-off is a small delay when users first request detailed data
for a specific domain/group combination, but this is much faster than
the alternative of loading everything upfront.

## Step 1: Manual Data Fetching Example

Let’s start with a concrete scenario. An investigator has identified
that Site 101 is reporting adverse events at a rate significantly higher
than other sites. They want to review the specific adverse event records
for this site to understand what’s driving the signal.

### Setting Up the Data Location

First, we’ll define where our domain data files are stored:

``` r
# Define the base path where domain data files are stored
data_path <- "C:/clinical_trial_data/study_ABC123"

# List the available domain files
# Typically you would have files like:
# - AE.csv (Adverse Events)
# - LB.csv (Laboratory Data) 
# - DM.csv (Demographics)
# - VS.csv (Vital Signs)
# - etc.
```

### Manual Data Retrieval

Now let’s manually fetch the adverse events data for Site 101:

``` r
# Construct the file path for adverse events data
ae_file_path <- file.path(data_path, "AE.csv")

# Read the adverse events data
dfAE <- read.csv(ae_file_path, stringsAsFactors = FALSE)

# Check the structure of the data
head(dfAE)
#   SubjectID SiteID AETERM           AESEV    AEREL    AESTDT
# 1 ABC-001   101    Nausea          Mild     Possible 2023-01-15
# 2 ABC-002   101    Headache        Moderate Unlikely 2023-01-16  
# 3 ABC-003   102    Dizziness       Mild     Probable 2023-01-17
# 4 ABC-004   101    Fatigue         Severe   Definite 2023-01-18

# Filter for Site 101 specifically
dfAE_site101 <- dfAE %>%
  dplyr::filter(SiteID == "101")

# Review the results
nrow(dfAE_site101)  # Number of AE records for Site 101
head(dfAE_site101)  # First few records for review
```

This manual approach works for a one-time investigation, but the GSM app
needs a dynamic solution that can respond to user selections in
real-time.

## Step 2: Understanding App State

The GSM app maintains several state variables that determine what data
should be displayed:

- **`strDomain`**: The currently selected data domain (e.g., “AE”, “LB”,
  “DM”).
- **`strGroupLevel`**: The level of grouping (e.g., “Site”, “Country”,
  “Study”).
- **`strGroupID`**: The specific group identifier (e.g., “101”, “USA”;
  optional, for group-level drill-down).
- **`strSubjectID`**: The specific subject identifier (optional, for
  subject-level drill-down).
- **`dSnapshotDate`**: The date of the active snapshot (currently always
  the most recent snapshot in the summary data).

When a user selects a site in the app interface, these state variables
are automatically updated. For example:

- User selects Site 101 in the adverse events summary →
  `strDomain = "AE"`, `strGroupLevel = "Site"`, `strGroupID = "101"`.
- User then selects Subject ABC-004 → `strSubjectID = "ABC-004"` is
  added.
- User switches to lab data tab → `strDomain = "LB"` while other
  selections remain.

## Step 3: Creating a Basic Data Fetching Function

Now let’s create a function that can respond to the app’s state. This
function will be passed to
[`run_gsm_app()`](https://gilead-biostats.github.io/gsm.app/dev/reference/run_gsm_app.md)
via the `fnFetchData` parameter.

``` r
# Basic data fetching function that responds to app state
fnFetchData <- function(
  strDomain, 
  strGroupLevel = "Site", 
  strGroupID = NULL, 
  strSubjectID = NULL,
  dSnapshotDate = NULL
) {
  
  # Define base path to data files
  data_path <- "C:/clinical_trial_data/study_ABC123"
  
  # Construct file path based on the requested domain
  file_path <- file.path(data_path, paste0(strDomain, ".csv"))
  
  # Check if the file exists
  if (!file.exists(file_path)) {
    # Error messages are passed on to app users for better bug reports. The app
    # continues to function (other than the requested domain).
    stop("Domain data file not found: ", file_path)
  }
  
  # Read the domain data
  dfDomain <- read.csv(file_path, stringsAsFactors = FALSE)
  
  # Apply group-level filtering based on app state
  if (!is.null(strGroupID) && strGroupLevel %in% names(dfDomain)) {
    # Create the filter column name (e.g., "SiteID", "CountryID")
    group_col <- paste0(strGroupLevel, "ID")
    
    if (group_col %in% names(dfDomain)) {
      dfDomain <- dfDomain %>%
        dplyr::filter(.data[[group_col]] == strGroupID)
    }
  }
  
  # Apply subject-level filtering if specified
  if (!is.null(strSubjectID) && "SubjectID" %in% names(dfDomain)) {
    dfDomain <- dfDomain %>%
      dplyr::filter(.data$SubjectID == strSubjectID)
  }
  
  return(dfDomain)
}
```

### How the Function Responds to App State

When the app calls this function, it automatically passes the current
state:

1.  **Domain Selection**: When user is viewing the AE tab →
    `strDomain = "AE"`.
2.  **Group Selection**: When user selects Site 101 →
    `strGroupLevel = "Site"`, `strGroupID = "101"`.  
3.  **Subject Selection**: When user selects a specific subject →
    `strSubjectID = "ABC-004"`.

The function uses these parameters to:

- Load the correct domain file (`AE.csv`).
- Filter to the selected group (Site 101).
- Further filter to the selected subject if specified.

## Step 4: Enhanced Function with Error Handling

Let’s improve our function with better error handling and validation:

``` r
fnFetchData <- function(
  strDomain, 
  strGroupLevel = "Site", 
  strGroupID = NULL, 
  strSubjectID = NULL,
  dSnapshotDate = NULL
) {
  
  # Define data configuration
  data_path <- "C:/clinical_trial_data/study_ABC123"
  
  # Define valid domains and their file mappings
  valid_domains <- c(
    "AE" = "AE.csv",
    "LB" = "LB.csv", 
    "DM" = "DM.csv",
    "VS" = "VS.csv",
    "QUERY" = "QUERY.csv",
    "ENROLL" = "ENROLL.csv"
  )
  
  # Validate domain
  if (!strDomain %in% names(valid_domains)) {
    stop("Invalid domain: ", strDomain)
  }
  
  # Construct file path
  file_name <- valid_domains[[strDomain]]
  file_path <- file.path(data_path, file_name)
  
  # Read data with error handling
  dfDomain <- tryCatch({
    read.csv(file_path, stringsAsFactors = FALSE)
  }, error = function(e) {
    stop("Error reading file: ", file_path, "\n", e$message)
  })
  
  # Validate that we have data
  if (nrow(dfDomain) == 0) {
    return(data.frame())
  }
  
  # Apply group-level filtering
  if (!is.null(strGroupID) && !is.null(strGroupLevel)) {
    # Handle different group level column naming conventions
    possible_group_cols <- c(
      paste0(strGroupLevel, "ID"),     # e.g., "SiteID"
      strGroupLevel,                   # e.g., "Site"
      toupper(paste0(strGroupLevel, "ID")), # e.g., "SITEID"
      toupper(strGroupLevel)           # e.g., "SITE"
    )
    
    # Find which column exists in the data
    group_col <- intersect(possible_group_cols, names(dfDomain))[1]
    
    if (!is.na(group_col)) {
      dfDomain <- dfDomain %>%
        dplyr::filter(.data[[group_col]] == strGroupID)
    } else {
      warning("Group level column not found for ", strGroupLevel)
    }
  }
  
  # Apply subject-level filtering
  if (!is.null(strSubjectID)) {
    # Handle different subject ID column naming conventions
    possible_subj_cols <- c("SubjectID", "SUBJID", "USUBJID", "subjectID")
    subj_col <- intersect(possible_subj_cols, names(dfDomain))[1]
    
    if (!is.na(subj_col)) {
      dfDomain <- dfDomain %>%
        dplyr::filter(.data[[subj_col]] == strSubjectID)
    } else {
      warning("Subject ID column not found in data")
    }
  }
  
  return(dfDomain)
}
```

## Step 5: Passing the Function to the App

Once you’ve defined your data fetching function, you pass it to the GSM
app when launching (see
[`vignette("data-preparation")`](https://gilead-biostats.github.io/gsm.app/dev/articles/data-preparation.md)
for guidance on the other arguments):

``` r
# Launch the GSM app with your custom data fetching function
run_gsm_app(
  dfAnalyticsInput = dfAnalyticsInput,   # Your prepared analytics data
  dfBounds = dfBounds,                   # Statistical bounds
  dfGroups = dfGroups,                   # Group metadata
  dfMetrics = dfMetrics,                 # Metric definitions
  dfResults = dfResults,                 # KRI results
  fnFetchData = fnFetchData,             # Your custom data fetching function
  fnCountData = function(...) {          # Optional: data counting function
    nrow(fnFetchData(...))
  }
)
```

### How the App Uses Your Function

When the app is running:

1.  **Initial Load**: App displays summary KRI results using the
    prepared data frames.
2.  **User Interaction**: User selects Site 101 in the AE summary chart.
3.  **State Update**: App updates internal state: `strDomain = "AE"`,
    `strGroupLevel = "Site"`, `strGroupID = "101"`.
4.  **Function Call**: App calls
    `fnFetchData("AE", "Site", "101", NULL, dSnapshotDate = max(dfAnalyticsInput$SnapshotDate))`.
5.  **Data Display**: Your function returns filtered AE records, which
    the app displays in a data table.
6.  **Further Drill-down**: User selects a specific subject. If the app
    already has site-level data that includes this subject, it filters
    that data; otherwise it calls your `fnFetchData()` with the subject
    ID in addition to the other parameters.

## Step 6: Advanced Data Fetching Considerations

For production deployments, consider these enhancements:

### Database Connectivity

``` r
fnFetchData_DB <- function(
  strDomain, 
  strGroupLevel = "Site", 
  strGroupID = NULL, 
  strSubjectID = NULL,
  dSnapshotDate = NULL
) {
  
  # Connect to your database
  con <- DBI::dbConnect(
    RPostgres::Postgres(),
    host = "your-db-host",
    dbname = "clinical_trial_db",
    user = "username",
    password = "password"
  )
  
  # Build dynamic SQL query based on app state
  base_query <- paste("SELECT * FROM", tolower(strDomain))
  
  where_clauses <- c()
  
  if (!is.null(strGroupID)) {
    group_col <- paste0(tolower(strGroupLevel), "_id")
    where_clauses <- c(where_clauses, paste0(group_col, " = '", strGroupID, "'"))
  }
  
  if (!is.null(strSubjectID)) {
    where_clauses <- c(where_clauses, paste0("subject_id = '", strSubjectID, "'"))
  }
  
  if (length(where_clauses) > 0) {
    query <- paste(base_query, "WHERE", paste(where_clauses, collapse = " AND "))
  } else {
    query <- base_query
  }
  
  # Execute query and return results
  result <- DBI::dbGetQuery(con, query)
  DBI::dbDisconnect(con)
  
  return(result)
}
```

### Performance Optimization

For large datasets, consider:

- Lazy loading strategies.
- Pagination for large result sets.
- Caching frequently accessed data.
- Indexing on commonly filtered columns.

``` r
# Example with caching and pagination
fnFetchData_Optimized <- function(
  strDomain, 
  strGroupLevel = "Site",
  strGroupID = NULL,
  strSubjectID = NULL,
  dSnapshotDate = NULL,
  nMaxRows = 10000
) {
  
  # Create cache key based on parameters
  cache_key <- paste(
    strDomain, strGroupLevel, strGroupID, strSubjectID, dSnapshotDate, sep = "_"
  )
  
  # Check if data is already cached
  if (exists(cache_key, envir = .GlobalEnv)) {
    return(get(cache_key, envir = .GlobalEnv))
  }
  
  # Fetch data using your preferred method
  dfDomain <- your_data_fetch_logic(strDomain, strGroupLevel, strGroupID, strSubjectID)
  
  # Apply row limit for performance
  if (nrow(dfDomain) > nMaxRows) {
    warning(paste("Data truncated to", nMaxRows, "rows for performance"))
    dfDomain <- dfDomain[1:nMaxRows, ]
  }
  
  # Cache the result
  assign(cache_key, dfDomain, envir = .GlobalEnv)
  
  return(dfDomain)
}
```

### Data Counting Function (`fnCountData`)

The Domain Summary tab in gsm.app provides information on number of
records for each domain. To construct these counts, {gsm.app} uses a
special `fnCountData` function. `fnCountData` takes the same arguments
as `fnFetchData`, but returns a single integer instead of a data.frame
of results.

By default, `fnCountData` is constructed from `fnFetchData` via
[`ConstructDataCounter()`](https://gilead-biostats.github.io/gsm.app/dev/reference/ConstructDataCounter.md).
When working with large datasets, retrieving only the count of records
is often significantly faster than fetching the full dataset. In such
cases, you may wish to provide a specialized `fnCountData` function to
quickly fetch just the counts of data.

#### Sample Implementation

``` r
fnCountData <- function(
  strDomain, 
  strGroupLevel = "Site",
  strGroupID = NULL,
  strSubjectID = NULL,
  dSnapshotDate = NULL
) {
  # Connect to your database
  con <- DBI::dbConnect(
    RPostgres::Postgres(),
    host = "your-db-host",
    dbname = "clinical_trial_db",
    user = "username",
    password = "password"
  )
  
  # Build dynamic SQL query based on app state
  base_query <- paste("SELECT COUNT(*) FROM", tolower(strDomain))
  
  where_clauses <- c()
  
  if (!is.null(strGroupID)) {
    group_col <- paste0(tolower(strGroupLevel), "_id")
    where_clauses <- c(where_clauses, paste0(group_col, " = '", strGroupID, "'"))
  }
  
  if (!is.null(strSubjectID)) {
    where_clauses <- c(where_clauses, paste0("subject_id = '", strSubjectID, "'"))
  }
  
  if (length(where_clauses) > 0) {
    query <- paste(base_query, "WHERE", paste(where_clauses, collapse = " AND "))
  } else {
    query <- base_query
  }
  
  # Execute query and return results
  result <- DBI::dbGetQuery(con, query)
  DBI::dbDisconnect(con)
  
  return(result)
}
```

## Summary

Data ingestion is a critical component that enables the GSM app to
provide meaningful drill-down functionality. By implementing a custom
`fnFetchData` function:

1.  **Respond to App State**: Your function receives the current domain,
    group, and subject selections.
2.  **Filter Appropriately**: Return only the data relevant to the
    current investigation.
3.  **Handle Errors Gracefully**: Provide meaningful warnings and
    fallbacks.
4.  **Optimize Performance**: Consider caching and pagination for large
    datasets.

The data fetching function bridges the gap between high-level KRI
summaries and detailed source data, empowering investigators to
understand the underlying drivers of risk signals in their clinical
trials.
