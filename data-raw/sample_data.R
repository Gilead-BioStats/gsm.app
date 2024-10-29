# Sample datasets generated from {clindata} filtered then passed through {gsm}.

# Used libraries ----

library(gsm)

# clindata is needed to generate this data, but is not a requirement for using
# or testing the package, so it is not listed in the DESCRIPTION.
library(clindata)

# Set up inputs ----

library(gsm)
lSourceData <- list(
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

# Create Mapped Data - filter/map raw data
mappings <- MakeWorkflowList(strPath = "workflow/1_mappings")
mapping_spec <- CombineSpecs(mappings)
lRawData <- Ingest(lSourceData, mapping_spec)
lRawData <- lRawData %>%
  purrr::map(tibble::as_tibble)

lMapped <- RunWorkflows(mappings, lRawData)
lMapped <- lMapped %>%
  purrr::map(tibble::as_tibble)

# Create Analysis Data - Generate KRIs
lWorkflows <- MakeWorkflowList("^kri", strPath = "workflow/2_metrics")
# Don't use kri0012 yet.
lWorkflows$kri0012 <- NULL
lAnalysis <- RunWorkflows(lWorkflows, lMapped)

# Choose a subset
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
  tibble::as_tibble() %>%
  dplyr::semi_join(site_subset)

# Prep participant data ----

# I don't currently update participant_data, intentionally. Will update before I
# close this PR.

# Rotate such that the data is by subjid. In a "real" usage, much of this data
# would likely be fetched via an API or other function call.
# participant_ids <- sort(lMapped$Mapped_ENROLL$subjid)
# names(participant_ids) <- participant_ids
# participant_data <- purrr::map(
#   participant_ids,
#   function(this_subjid) {
#     list(
#       metadata = lMapped$Mapped_SUBJ %>%
#         dplyr::filter(subjid == this_subjid) %>%
#         dplyr::select(
#           subjectID = "subjid",
#           siteID = "invid",
#           # "studyStartDate",
#           # "studyEndDate",
#           timeOnStudy = "timeonstudy",
#           "country" #,
#           # "sex",
#           # "age",
#           # "race"
#         ) %>%
#         as.list(),
#       metric_data = list(
#         adverseEvents = lMapped$Mapped_AE %>%
#           dplyr::filter(subjid == this_subjid) %>%
#           dplyr::select(
#             subjectID = "subjid",
#             serious = "aeser",
#             "startDate",
#             "endDate",
#             "grade",
#             "dictionaryDerivedTerm",
#             "bodySystemOrOrganClass",
#             "treatmentEmergent"
#           ),
#         protocolDeviations = used_pd %>%
#           dplyr::filter(subjectenrollmentnumber == this_subjid) %>%
#           dplyr::select(
#             subjectID = "subjectenrollmentnumber",
#             deemedImportant = "deemedimportant",
#             "deviationDate",
#             "category"
#           ),
#         studyDisposition = used_study_comp %>%
#           dplyr::filter(subjid == this_subjid, compyn == "N") %>%
#           dplyr::select(
#             subjectID = "subjid",
#             studyDiscontinuationReason = "compreas"
#           ),
#         treatmentDisposition = used_treatment_comp %>%
#           dplyr::filter(
#             subjid == this_subjid,
#             treatmentDiscontinuationReason != ""
#           ) %>%
#           dplyr::select(
#             subjectID = "subjid",
#             "phase",
#             "treatment",
#             "treatmentDiscontinuationReason"
#           )
#       )
#     )
#   }
# )

# Save ----

# The participant data is fetched using a function, so we don't export it
# directly.
# usethis::use_data(participant_data, overwrite = TRUE, internal = TRUE)

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

# Use these to figure out ideal compression.
# tools::resaveRdaFiles("data/")
# tools::checkRdaFiles("data/")


# Clean up
rm(
  dfResults,
  flag_summary,
  has_amber_only,
  has_both,
  has_neither,
  has_red_only,
  lAnalysis,
  lMapped,
  lRawData,
  lSourceData,
  lWorkflows,
  mapping_spec,
  mappings,
  sample_dfAnalyticsInput,
  sample_dfBounds,
  sample_dfGroups,
  sample_dfMetrics,
  sample_dfResults,
  site_subset
)
