# Example Deployment: Basic GSM App
# This example shows how to deploy a basic gsm.app using your own data

library(gsm.app)
library(dplyr)

# Example 1: Using sample data (quickest way to get started)
run_sample_gsm_app()

# Example 2: Using custom data
# =========================================

# Load your prepared data (replace these with your actual data loading code)
# dfAnalyticsInput <- readRDS("data/dfAnalyticsInput.rds")
# dfBounds <- readRDS("data/dfBounds.rds")
# dfGroups <- readRDS("data/dfGroups.rds")
# dfMetrics <- readRDS("data/dfMetrics.rds")
# dfResults <- readRDS("data/dfResults.rds")

# For this example, we'll use the sample data but show the structure
dfAnalyticsInput <- gsm.app::sample_dfAnalyticsInput
dfBounds <- gsm.app::sample_dfBounds
dfGroups <- gsm.app::sample_dfGroups
dfMetrics <- gsm.app::sample_dfMetrics
dfResults <- gsm.app::sample_dfResults

# Create a custom data fetch function
# This function should return domain-specific data based on the parameters
fnFetchData <- function(strDomainID, strGroupLevel = NULL, strGroupID = NULL, 
                       strSubjectID = NULL, dSnapshotDate = NULL) {
  
  # Use the sample function as a template
  # In your implementation, replace this with code that fetches from your data sources
  gsm.app::sample_fnFetchData(
    strDomainID = strDomainID,
    strGroupLevel = strGroupLevel, 
    strGroupID = strGroupID,
    strSubjectID = strSubjectID,
    dSnapshotDate = dSnapshotDate
  )
}

# Launch the app with custom configuration
run_gsm_app(
  dfAnalyticsInput = dfAnalyticsInput,
  dfBounds = dfBounds,
  dfGroups = dfGroups,
  dfMetrics = dfMetrics,
  dfResults = dfResults,
  fnFetchData = fnFetchData,
  strTitle = "My Clinical Trial Dashboard",
  strFavicon = "chart-line",
  strFaviconColor = "#0066CC",
  chrDomains = c(
    AE = "Adverse Events",
    ENROLL = "Enrollment",
    LB = "Laboratory Data",
    PD = "Protocol Deviations",
    STUDCOMP = "Study Completion",
    SUBJ = "Subject Metadata"
  )
)
