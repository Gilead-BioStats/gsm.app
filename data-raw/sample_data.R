# Sample datasets generated from {clindata} filtered then passed through {gsm}.

# Used libraries ----

# clindata is needed to generate this data, but is not a requirement for using
# or testing the package, so it is not listed in the DESCRIPTION.

library(gsm)
pkgload::load_all(".", helpers = FALSE, attach_testthat = FALSE)
library(clindata)

# Set up inputs ----

lSource <- list(
  Source_STUDY = clindata::ctms_study,
  Source_SITE = clindata::ctms_site,
  Source_SUBJ = clindata::rawplus_dm,
  Source_AE = clindata::rawplus_ae,
  Source_PD = clindata::ctms_protdev,
  Source_LB = clindata::rawplus_lb,
  Source_STUDCOMP = clindata::rawplus_studcomp,
  Source_SDRGCOMP = clindata::rawplus_sdrgcomp,
  Source_QUERY = clindata::edc_queries,
  Source_DATAENT = clindata::edc_data_pages,
  Source_DATACHG = clindata::edc_data_points,
  Source_ENROLL = clindata::rawplus_enroll
)

# Create Mapped Data ----

lMappings <- MakeWorkflowList(
  strPath = "workflow/1_mappings"
)
raw_spec <- CombineSpecs(lMappings)
lRaw <- Ingest(lSource, raw_spec)
lRaw <- lRaw %>%
  purrr::map(dplyr::as_tibble)

lMapped <- RunWorkflows(lMappings, lRaw)
lMapped <- lMapped %>%
  purrr::map(dplyr::as_tibble)

# Create Analysis Data - Generate KRIs ----

lWorkflows <- MakeWorkflowList("^kri", strPath = "workflow/2_metrics")
## Don't use kri0012 yet.
lWorkflows$kri0012 <- NULL
lAnalysis <- RunWorkflows(lWorkflows, lMapped)

# Choose a subset ----

dfResults <- BindResults(
  lAnalysis = lAnalysis,
  strName = "Analysis_Summary",
  dSnapshotDate = as.Date("2019-11-01"),
  strStudyID = "AA-AA-000-0000"
)

flag_summary <- dfResults %>%
  dplyr::select(GroupID, MetricID, Flag) %>%
  dplyr::summarize(
    has_red = any(abs(.data$Flag) == 2, na.rm = TRUE),
    has_amber = any(abs(.data$Flag) == 1, na.rm = TRUE),
    .by = c("GroupID")
  ) %>%
  dplyr::arrange(dplyr::desc(has_red), dplyr::desc(has_amber), GroupID)

has_both <- flag_summary %>%
  dplyr::filter(has_red, has_amber) %>%
  dplyr::select(GroupID) %>%
  dplyr::arrange(GroupID)
has_red_only <- flag_summary %>%
  dplyr::filter(has_red, !has_amber) %>%
  dplyr::select(GroupID) %>%
  dplyr::arrange(GroupID)
has_amber_only <- flag_summary %>%
  dplyr::filter(!has_red, has_amber) %>%
  dplyr::select(GroupID) %>%
  dplyr::arrange(GroupID)
has_neither <- flag_summary %>%
  dplyr::filter(!has_red, !has_amber) %>%
  dplyr::select(GroupID) %>%
  dplyr::arrange(GroupID)

site_subset <- dplyr::bind_rows(
  has_both,
  has_red_only,
  head(has_amber_only, 10),
  head(has_neither, 10)
) %>%
  dplyr::arrange(GroupID)

# Standard dfs ----

sample_dfGroups <- dplyr::bind_rows(
  lMapped$Mapped_SITE %>% dplyr::semi_join(site_subset),
  lMapped$Mapped_STUDY
)
sample_dfMetrics <- MakeMetric(lWorkflows = lWorkflows)
sample_dfResults <- dfResults %>%
  dplyr::semi_join(site_subset)
sample_dfBounds <- MakeBounds(
  dfResults = sample_dfResults,
  dfMetrics = sample_dfMetrics
)
sample_dfAnalyticsInput <- purrr::map(lAnalysis, "Analysis_Input") %>%
  dplyr::bind_rows(.id = "MetricID") %>%
  # dplyr::mutate(MetricID = stringr::str_remove(.data$MetricID, "Analysis_")) %>%
  dplyr::as_tibble() %>%
  dplyr::semi_join(site_subset)

# Create User-facing Data ----

## Before I was getting this lRaw at the same time as lMapped, but that caused me to
## have duplicate columns during Analysis Data creation

lUserWorkflows <- MakeWorkflowList(
  strPath = system.file("workflow/userFacing", package = "gsm.app"),
  strPackage = NULL
)
raw_spec <- CombineSpecs(lUserWorkflows)
lRaw <- Ingest(lSource, raw_spec)
lRaw <- lRaw %>%
  purrr::map(dplyr::as_tibble)

lUser <- RunWorkflows(lUserWorkflows, c(lRaw, lMapped))
lUser <- lUser %>%
  purrr::map(dplyr::as_tibble)

# TEMPORARY: Repair dates ----

# (see https://github.com/Gilead-BioStats/gsm/issues/1925)

lUser$User_SUBJ <- lUser$User_SUBJ %>%
  dplyr::mutate(
    dplyr::across(dplyr::ends_with("_date"), as.Date)
  )


# Prep participant data ----

# Rotate such that the data is by subjid. In a "real" usage, much of this data
# would likely be fetched via an API or other function call.
participant_ids <- sample_dfAnalyticsInput$SubjectID
names(participant_ids) <- participant_ids
domains <- lUser
domains$User_SUBJ <- NULL
names(domains) <- stringr::str_remove(names(domains), "^User_")
domains <- domains[sort(names(domains))]
MakeThisData <- function(df, this_subjid) {
  df %>%
    dplyr::filter(.data$SubjectID == this_subjid) %>%
    dplyr::select("SubjectID", dplyr::everything())
}

participant_data <- purrr::map(
  participant_ids,
  function(this_subjid) {
    list(
      metadata = lUser$User_SUBJ %>%
        MakeThisData(this_subjid) %>%
        as.list(),
      metric_data = purrr::map(domains, function(this_domain) {
        MakeThisData(this_domain, this_subjid)
      })
    )
  }
)

# Save ----

# The participant data is fetched using a function, so we don't export it
# directly.
usethis::use_data(
  participant_data,
  overwrite = TRUE,
  internal = TRUE,
  compress = "xz"
)

# Everything else that we use is exported as sample data. Split things up by
# compression type.
usethis::use_data(
  sample_dfAnalyticsInput,
  sample_dfBounds,
  overwrite = TRUE,
  compress = "xz"
)
usethis::use_data(
  sample_dfGroups,
  sample_dfMetrics,
  sample_dfResults,
  overwrite = TRUE,
  compress = "gzip"
)

# Use these to figure out ideal compression. Update the usethis calls
# accordingly.

# tools::resaveRdaFiles("data/")
# tools::checkRdaFiles("data/")
# tools::resaveRdaFiles("R/")
# tools::checkRdaFiles("R/")

# Clean up ----
rm(
  dfResults,
  domains,
  flag_summary,
  has_amber_only,
  has_both,
  has_neither,
  has_red_only,
  lAnalysis,
  lMapped,
  lMappings,
  lRaw,
  lSource,
  lUser,
  lUserWorkflows,
  lWorkflows,
  MakeThisData,
  participant_data,
  participant_ids,
  raw_spec,
  sample_dfAnalyticsInput,
  sample_dfBounds,
  sample_dfGroups,
  sample_dfMetrics,
  sample_dfResults,
  site_subset
)
