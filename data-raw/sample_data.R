# Sample datasets generated from {clindata} filtered then passed through {gsm}.

# Used libraries ----

library(gsm)

# clindata is needed to generate this data, but is not a requirement for using
# or testing the package, so it is not listed in the DESCRIPTION.
library(clindata)

# Set up inputs ----

## Subset sites ----
##
## I originally planned to filter the data, but it really isn't that big once we
## clean it up. I'm leaving the subsetting code in place in case we decide to do
## so later.
used_sites <- clindata::rawplus_dm$invid %>%
  unique() %>%
  sort()

filter_site <- function(df) {
  dplyr::filter(df, invid %in% used_sites)
}

## Create sub-dfs ----

used_subjects <- clindata::rawplus_dm %>%
  filter_site() %>%
  dplyr::select(
    "studyid",
    "invid",
    "subjid",
    "subjectid",
    "enrollyn",
    age = "agerep",
    "sex",
    "race",
    "country",
    studyStartDate = "firstparticipantdate",
    studyEndDate = "lastparticipantdate",
    "timeonstudy"
  )

used_ae <- clindata::rawplus_ae %>%
  dplyr::semi_join(
    used_subjects,
    by = "invid"
  ) %>%
  dplyr::select(
    "studyid",
    "siteid",
    "invid",
    "subjid",
    "subjectid",
    "aeser",
    startDate = "aest_dt",
    endDate = "aeen_dt",
    grade = "aetoxgr",
    dictionaryDerivedTerm = "mdrpt_nsv",
    bodySystemOrOrganClass = "mdrsoc_nsv",
    treatmentEmergent = "treatmentemergent"
  )

used_pd <- clindata::ctms_protdev %>%
  dplyr::semi_join(
    used_subjects,
    by = c("subjectenrollmentnumber" = "subjid")
  ) %>%
  dplyr::select(
    "subjectenrollmentnumber",
    "deemedimportant",
    deviationDate = "deviationdate",
    category = "companycategory"
  )

used_lb <- clindata::rawplus_lb %>%
  dplyr::semi_join(
    used_subjects,
    by = "subjid"
  )

used_study_comp <- clindata::rawplus_studcomp %>%
  dplyr::semi_join(
    used_subjects,
    by = "subjid"
  ) %>%
  dplyr::select(
    "studyid",
    "invid",
    "subjid",
    "subjectid",
    "compyn",
    "compreas"
  )

used_treatment_comp <- clindata::rawplus_sdrgcomp %>%
  filter_site() %>%
  dplyr::filter(.data$phase == 'Blinded Study Drug Completion') %>%
  dplyr::select(
    "studyid",
    "invid",
    "subjid",
    "subjectid",
    "phase",
    "sdrgyn",
    treatment = "extrt",
    treatmentDiscontinuationReason = "sdrgreas"
  )

used_enroll <- clindata::rawplus_enroll %>%
  filter_site()

# Create Mapped Data - filter/map raw data
lData <- list(
  Raw_SUBJ = used_subjects,
  Raw_AE = used_ae,
  Raw_PD = used_pd,
  Raw_LB = used_lb,
  Raw_STUDCOMP = used_study_comp,
  Raw_SDRGCOMP = used_treatment_comp,
  Raw_DATACHG = clindata::edc_data_points,
  Raw_DATAENT = clindata::edc_data_pages,
  Raw_QUERY = clindata::edc_queries,
  Raw_ENROLL = used_enroll
)
mapping_wf <- MakeWorkflowList(strNames = "data_mapping")
mapped <- RunWorkflows(mapping_wf, lData)
mapped <- mapped %>%
  purrr::map(tibble::as_tibble)

# Create Analysis Data - Generate KRIs
lWorkflow <- MakeWorkflowList(strNames = c("kri0001", "kri0002"))
lAnalysis <- RunWorkflows(lWorkflow, mapped)

# Prep for standard dfs ----

# Transform CTMS Site and Study Level data
dfCTMSSite <- RunQuery(
  df = clindata::ctms_site,
  strQuery = "SELECT pi_number as GroupID, site_status as Status, pi_first_name as InvestigatorFirstName, pi_last_name as InvestigatorLastName, city as City, state as State, country as Country, * FROM df"
) |>
  MakeLongMeta(strGroupLevel = 'Site')

dfCTMSStudy <- RunQuery(
  df = clindata::ctms_study,
  strQuery = "SELECT protocol_number as GroupID, status as Status, * FROM df"
) |>
  MakeLongMeta(strGroupLevel = 'Study')

# Get Participant and Site counts for Country, Site and Study
dfSiteCounts <- RunQuery(
  df = mapped$Mapped_Enrolled,
  strQuery = "SELECT invid as GroupID, COUNT(DISTINCT subjectid) as ParticipantCount, COUNT(DISTINCT invid) as SiteCount FROM df GROUP BY invid"
) |>
  MakeLongMeta(strGroupLevel = "Site")

dfStudyCounts <- RunQuery(
  df = mapped$Mapped_Enrolled,
  strQuery = "SELECT studyid as GroupID, COUNT(DISTINCT subjectid) as ParticipantCount, COUNT(DISTINCT invid) as SiteCount FROM df GROUP BY studyid"
) |>
  MakeLongMeta(strGroupLevel = "Study")

dfCountryCounts <- RunQuery(
  df = mapped$Mapped_Enrolled,
  strQuery = "SELECT country as GroupID, COUNT(DISTINCT subjectid) as ParticipantCount, COUNT(DISTINCT invid) as SiteCount FROM df GROUP BY country"
) |>
  MakeLongMeta(strGroupLevel = "Country")

# Standard dfs ----

sample_dfGroups <- dplyr::bind_rows(
  SiteCounts = dfSiteCounts,
  StudyCounts = dfStudyCounts,
  CountryCounts = dfCountryCounts,
  Site = dfCTMSSite,
  Study = dfCTMSStudy
)
sample_dfMetrics <- MakeMetric(lWorkflows = lWorkflow)
sample_dfResults <- BindResults(
  lAnalysis = lAnalysis,
  strName = "Analysis_Summary",
  dSnapshotDate = as.Date("2019-11-01"),
  strStudyID = "ABC-123"
)
sample_dfBounds <- MakeBounds(
  dfResults = sample_dfResults,
  dfMetrics = sample_dfMetrics
)
sample_dfAnalyticsInput <- purrr::map(lAnalysis, "Analysis_Input") %>%
  dplyr::bind_rows(.id = "MetricID") %>%
  tibble::as_tibble()

# Prep participant data ----

# Rotate such that the data is by subjid. In a "real" usage, much of this data
# would likely be fetched via an API or other function call.
participant_ids <- sort(mapped$Mapped_Enrolled$subjid)
names(participant_ids) <- participant_ids
participant_data <- purrr::map(
  participant_ids,
  function(this_subjid) {
    list(
      metadata = mapped$Mapped_Enrolled %>%
        dplyr::filter(subjid == this_subjid) %>%
        dplyr::select(
          subjectID = "subjid",
          siteID = "invid",
          "studyStartDate",
          "studyEndDate",
          timeOnStudy = "timeonstudy",
          "country",
          "age",
          "sex",
          "race"
        ) %>%
        as.list(),
      metric_data = list(
        adverseEvents = mapped$Mapped_AE %>%
          dplyr::filter(subjid == this_subjid) %>%
          dplyr::select(
            subjectID = "subjid",
            serious = "aeser",
            "startDate",
            "endDate",
            "grade",
            "dictionaryDerivedTerm",
            "bodySystemOrOrganClass",
            "treatmentEmergent"
          ),
        protocolDeviations = dplyr::bind_rows(
          mapped$Mapped_NonimportantPD, mapped$Mapped_ImportantPD
        ) %>%
          dplyr::filter(subjid == this_subjid) %>%
          dplyr::select(
            subjectID = "subjid",
            deemedImportant = "deemedimportant",
            "deviationDate",
            "category"
          ),
        studyDisposition = mapped$Mapped_StudyDropouts %>%
          dplyr::filter(subjid == this_subjid) %>%
          dplyr::select(
            subjectID = "subjid",
            studyDiscontinuationReason = "compreas"
          ),
        treatmentDisposition = mapped$Mapped_TreatmentDropouts %>%
          dplyr::filter(subjid == this_subjid) %>%
          dplyr::select(
            subjectID = "subjid",
            "phase",
            "treatment",
            "treatmentDiscontinuationReason"
          )
      )
    )
  }
)

# Save ----

# The participant data is fetched using a function, so we don't export it
# directly.
usethis::use_data(participant_data, overwrite = TRUE, internal = TRUE)

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
  overwrite = TRUE,
  compress = "bzip2"
)
usethis::use_data(
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
  dfCountryCounts,
  dfCTMSSite,
  dfCTMSStudy,
  dfSiteCounts,
  dfStudyCounts,
  lAnalysis,
  lData,
  lWorkflow,
  mapped,
  mapping_wf,
  participant_data,
  sample_dfAnalyticsInput,
  sample_dfBounds,
  sample_dfGroups,
  sample_dfMetrics,
  sample_dfResults,
  used_ae,
  used_enroll,
  used_lb,
  used_pd,
  used_study_comp,
  used_subjects,
  used_treatment_comp,
  participant_ids,
  used_sites,
  filter_site
)
