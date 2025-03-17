# Sample datasets generated from {clindata} filtered then passed through
# {gsm.mapping}.

# Used libraries ----

# clindata is needed to generate this data, but is not a requirement for using
# or testing the package, so it is not listed in the DESCRIPTION. Likewise for
# gsm.mapping and gsm.reporting.
# pak::pak("Gilead-BioStats/clindata")
# pak::pak("Gilead-BioStats/gsm.mapping@dev")
# pak::pak("Gilead-BioStats/gsm.reporting@dev")

library(gsm.core)
library(gsm.mapping)
library(gsm.kri)
library(gsm.reporting)
library(clindata)
library(dplyr)
library(purrr)

# Set up inputs ----

core_mappings <- c("AE", "DATACHG", "DATAENT", "ENROLL", "LB",
                   "PD", "QUERY", "STUDY", "STUDCOMP", "SDRGCOMP", "SITE", "SUBJ")

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

lMappings <- gsm.core::MakeWorkflowList(
  strPath = system.file("workflow/1_mappings", package = "gsm.mapping"),
  strNames = core_mappings,
  strPackage = NULL
)

raw_spec <- gsm.mapping::CombineSpecs(lMappings)
lRaw <- gsm.mapping::Ingest(lSource, raw_spec)
lRaw <- lRaw %>%
  purrr::map(dplyr::as_tibble)

lMapped <- gsm.core::RunWorkflows(lMappings, lRaw)
lMapped <- lMapped %>%
  purrr::map(dplyr::as_tibble)

# Create Analysis Data - Generate KRIs ----

lWorkflows <- gsm.core::MakeWorkflowList(
  "^kri",
  strPath = "workflow/2_metrics",
  strPackage = "gsm.kri"
)
## Don't use kri0012 yet.
lWorkflows$kri0012 <- NULL
lWorkflows$kri0005 <- NULL
lAnalysis <- gsm.core::RunWorkflows(lWorkflows, lMapped)


dfResults <- gsm.reporting::BindResults(
  lAnalysis = lAnalysis,
  strName = "Analysis_Summary",
  dSnapshotDate = as.Date("2019-11-01"),
  strStudyID = "AA-AA-000-0000"
)


# Standard dfs ----

sample_dfGroups <- dplyr::bind_rows(
  lMapped$Mapped_SITE,
  lMapped$Mapped_STUDY
)
sample_dfMetrics <- gsm.reporting::MakeMetric(lWorkflows = lWorkflows)
sample_dfResults <- dfResults
sample_dfBounds <- gsm.reporting::MakeBounds(
  dfResults = sample_dfResults,
  dfMetrics = sample_dfMetrics
)
sample_dfAnalyticsInput <- purrr::map(lAnalysis, "Analysis_Input") %>%
  dplyr::bind_rows(.id = "MetricID") %>%
  # dplyr::mutate(MetricID = stringr::str_remove(.data$MetricID, "Analysis_")) %>%
  dplyr::as_tibble()


# lMapped for Domain Data ----

# SITE and STUDY are in dfGroups
lMapped$Mapped_SITE <- NULL
lMapped$Mapped_STUDY <- NULL

# Apply subset to each mapped df.
subject_groups <- dplyr::distinct(
  sample_dfAnalyticsInput,
  .data$SubjectID,
  .data$GroupID
)
sample_lMapped <- purrr::map(lMapped, function(thisDomain) {
  dplyr::inner_join(
    thisDomain,
    subject_groups,
    by = c("subjid" = "SubjectID")
  )
})

# User-facing names ----

# Ideally this should all be defined in gsm.mapping.

# chrDomainLabels <- c(
#   AE = "Adverse Events",
#   DATACHG = "Data Changes",
#   DATAENT = "Data Entry",
#   ENROLL = "Enrollment",
#   LB = "Lab",
#   PD = "Protocol Deviations",
#   QUERY = "Queries",
#   STUDCOMP = "Study Completion",
#   SUBJ = "Subject Metadata",
#   SDRGCOMP = "Treatment Completion"
# )

chrFieldNames <- c(
  aeen_dt = "End Date",
  aeser = "Serious",
  aest_dt = "Start Date",
  aetoxgr = "Toxicity Grade",
  agerep = "Age",
  companycategory = "Company Category",
  compreas = "Discontinuation Reason",
  compyn = "Completed Study",
  deemedimportant = "Deemed Important",
  deviationdate = "Deviation Date",
  enroll_dt = "Enrollment Date",
  enrollyn = "Enrolled",
  ethnic = "Ethnicity",
  fieldoid = "Field",
  firstdosedate = "Treatment Start Date",
  firstparticipantdate = "Study Start Date",
  formoid = "Form",
  lb_dt = "Visit Date",
  lbtstnam = "Lab Test",
  mdrpt_nsv = "Preferred Term",
  mdrsoc_nsv = "System Organ Class",
  queryage = "Query Age",
  querystatus = "Query Status",
  sdrgreas = "Discontinuation Reason",
  sdrgyn = "Completed Treatment",
  sfreas = "Screen Failure Reason",
  siresn = "Result",
  subject_nsv = "Intake ID",
  subjectid = "Intake ID",
  subjid = "Subject ID",
  timeonstudy = "Days on Study",
  timeontreatment = "Days on Treatment",
  toxgrg_nsv = "Toxicity Grade",
  visnam = "Visit"
)

# Save ----

# The mapped domain data is fetched using a function, so we don't export it
# directly.
usethis::use_data(
  sample_lMapped,
  # chrDomainLabels,
  chrFieldNames,
  overwrite = TRUE,
  internal = TRUE,
  compress = "bzip2"
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
  chrDomainLabels,
  chrFieldNames,
  dfResults,
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
  lWorkflows,
  raw_spec,
  sample_dfAnalyticsInput,
  sample_dfBounds,
  sample_dfGroups,
  sample_dfMetrics,
  sample_dfResults,
  sample_lMapped,
  site_subset,
  subject_groups
)
