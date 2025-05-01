# Sample datasets generated from {clindata} filtered then passed through
# {gsm.mapping}.

# Used libraries ----

# clindata is needed to generate this data, but is not a requirement for using
# or testing the package, so it is not listed in the DESCRIPTION. Likewise for
# gsm.mapping and gsm.reporting.
# pak::pak("Gilead-BioStats/clindata")
# pak::pak("Gilead-BioStats/gsm.mapping@dev")
# pak::pak("Gilead-BioStats/gsm.reporting@dev")

pkgload::load_all()
library(conflicted)
conflicted::conflict_prefer_all("gsm.app", quiet = TRUE)
library(gsm.core)
library(gsm.mapping)
library(gsm.kri)
library(gsm.reporting)
library(clindata)
library(dplyr)
library(purrr)

# Set up inputs ----

chrDomainsUsed <- c(
  "AE", "DATACHG", "DATAENT", "ENROLL", "LB", "PD", "QUERY", "SDRGCOMP", "SITE",
  "STUDCOMP", "STUDY", "SUBJ", "Visit"
)

# I chose these sites via code in a previous iteration of this file.
chrSitesUsed <- c(
  "0X001", "0X002", "0X003", "0X004", "0X005", "0X006", "0X007",
  "0X008", "0X010", "0X011", "0X012", "0X013", "0X014", "0X015",
  "0X016", "0X021", "0X022", "0X024", "0X026", "0X027", "0X028",
  "0X029", "0X037", "0X041", "0X043", "0X064", "0X079", "0X103",
  "0X109", "0X124", "0X155", "0X159", "0X170", "0X173", "X185X"
)

lSource <- list(
  Source_AE = clindata::rawplus_ae,
  Source_DATACHG = clindata::edc_data_points,
  Source_DATAENT = clindata::edc_data_pages,
  Source_ENROLL = clindata::rawplus_enroll,
  Source_LB = clindata::rawplus_lb,
  Source_PD = clindata::ctms_protdev,
  Source_STUDY = clindata::ctms_study,
  Source_SITE = clindata::ctms_site,
  Source_SUBJ = clindata::rawplus_dm,
  Source_STUDCOMP = clindata::rawplus_studcomp,
  Source_SDRGCOMP = clindata::rawplus_sdrgcomp,
  Source_QUERY = clindata::edc_queries,
  Source_VISIT = clindata::rawplus_visdt
)

# I got an error for I think a "" value. It was easier to just cast it to date.
lSource$Source_VISIT$visit_dt <- as.Date(lSource$Source_VISIT$visit_dt)

# Create Mapped Data ----

lMappings <- gsm.core::MakeWorkflowList(
  strPath = system.file("workflow/1_mappings", package = "gsm.app"),
  strNames = chrDomainsUsed,
  strPackage = NULL
)
lSpec <- gsm.mapping::CombineSpecs(lMappings)
lRaw <- gsm.mapping::Ingest(lSource, lSpec)
lRaw <- lRaw %>%
  purrr::map(dplyr::as_tibble)

# Filter to our sites of interest.
lRaw$Raw_SUBJ <- dplyr::filter(lRaw$Raw_SUBJ, invid %in% chrSitesUsed)
lRaw$Raw_AE <- dplyr::filter(lRaw$Raw_AE, subjid %in% lRaw$Raw_SUBJ$subjid)
lRaw$Raw_ENROLL <- dplyr::filter(lRaw$Raw_ENROLL, invid %in% chrSitesUsed)
lRaw$Raw_LB <- dplyr::filter(lRaw$Raw_LB, subjid %in% lRaw$Raw_SUBJ$subjid)
lRaw$Raw_PD <- dplyr::filter(lRaw$Raw_PD, subjid %in% lRaw$Raw_SUBJ$subjid)
lRaw$Raw_SDRGCOMP <- dplyr::filter(lRaw$Raw_SDRGCOMP, subjid %in% lRaw$Raw_SUBJ$subjid)
lRaw$Raw_STUDCOMP <- dplyr::filter(lRaw$Raw_STUDCOMP, subjid %in% lRaw$Raw_SUBJ$subjid)
lRaw$Raw_VISIT <- dplyr::filter(lRaw$Raw_VISIT, subjid %in% lRaw$Raw_SUBJ$subjid)
lRaw$Raw_DATACHG <- dplyr::filter(lRaw$Raw_DATACHG, subject_nsv %in% lRaw$Raw_SUBJ$subject_nsv)
lRaw$Raw_DATAENT <- dplyr::filter(lRaw$Raw_DATAENT, subject_nsv %in% lRaw$Raw_SUBJ$subject_nsv)
lRaw$Raw_QUERY <- dplyr::filter(lRaw$Raw_QUERY, subject_nsv %in% lRaw$Raw_SUBJ$subject_nsv)
lRaw$Raw_SITE <- dplyr::filter(lRaw$Raw_SITE, invid %in% chrSitesUsed)

lMapped <- gsm.core::RunWorkflows(lMappings, lRaw)
lMapped <- lMapped %>%
  purrr::map(dplyr::as_tibble)

# Cast mapped data that should be a timestamp to that format. See
# https://github.com/Gilead-BioStats/gsm.core/issues/22
lMapped$Mapped_AE$mincreated_dts <- lubridate::as_datetime(lMapped$Mapped_AE$mincreated_dts)
lMapped$Mapped_SDRGCOMP$mincreated_dts <- lubridate::as_datetime(lMapped$Mapped_SDRGCOMP$mincreated_dts)
lMapped$Mapped_STUDCOMP$mincreated_dts <- lubridate::as_datetime(lMapped$Mapped_STUDCOMP$mincreated_dts)
lMapped$Mapped_SUBJ$mincreated_dts <- lubridate::as_datetime(lMapped$Mapped_SUBJ$mincreated_dts)

# Create Analysis Data - Generate KRIs ----

lWorkflows <- gsm.core::MakeWorkflowList(
  "^kri",
  strPath = "workflow/2_metrics",
  strPackage = "gsm.kri"
)
## Don't use kri0012 yet.
lWorkflows$kri0012 <- NULL
## Don't use kri0013 yet.
lWorkflows$kri0013 <- NULL

# Things that are done already ----
sample_dfGroups <- dplyr::bind_rows(
  lMapped$Mapped_SITE,
  lMapped$Mapped_STUDY
)
sample_dfMetrics <- gsm.reporting::MakeMetric(lWorkflows = lWorkflows)

dSnapshotDate <- c(
  as.Date("2018-01-01"),
  as.Date("2019-01-01"),
  as.Date("2020-01-01")
)
chrDateFields <- c(
  Mapped_AE = "mincreated_dts",
  Mapped_ENROLL = "enroll_dt",
  Mapped_LB = "lb_dt",
  Mapped_PD = "deviationdate",
  Mapped_SDRGCOMP = "mincreated_dts",
  Mapped_STUDCOMP = "mincreated_dts",
  Mapped_Visit = "visit_dt",
  Mapped_DATACHG = "visit_date",
  Mapped_DATAENT = "visit_date",
  Mapped_QUERY = "created"
)

lAllResults <- purrr::map(
  dSnapshotDate,
  function(this_dSnapshotDate) {
    this_lMapped <- lMapped
    for (tbl in names(chrDateFields)) {
      this_lMapped[[tbl]] <- FilterBefore(
        this_lMapped[[tbl]],
        strField = chrDateFields[[tbl]],
        dMaxDate = this_dSnapshotDate
      )
    }
    lAnalysis <- gsm.core::RunWorkflows(lWorkflows, this_lMapped)
    dfResults <- gsm.reporting::BindResults(
      lAnalysis = lAnalysis,
      strName = "Analysis_Summary",
      dSnapshotDate = this_dSnapshotDate,
      strStudyID = "AA-AA-000-0000"
    )
    dfAnalyticsInput <- purrr::map(lAnalysis, "Analysis_Input") %>%
      dplyr::bind_rows(.id = "MetricID") %>%
      dplyr::as_tibble() %>%
      dplyr::mutate(SnapshotDate = this_dSnapshotDate)
    dfBounds <- gsm.reporting::MakeBounds(
      dfResults = dfResults,
      dfMetrics = sample_dfMetrics
    )
    list(
      dfAnalyticsInput = dfAnalyticsInput,
      dfResults = dfResults,
      dfBounds = dfBounds
    )
  }
)

# Standard dfs ----

sample_dfResults <- purrr::list_rbind(
  purrr::map(lAllResults, "dfResults")
)
sample_dfBounds <- purrr::list_rbind(
  purrr::map(lAllResults, "dfBounds")
)
sample_dfAnalyticsInput <- purrr::list_rbind(
  purrr::map(lAllResults, "dfAnalyticsInput")
)

# lMapped for Domain Data ----

# SITE and STUDY are in dfGroups
lMapped$Mapped_SITE <- NULL
lMapped$Mapped_STUDY <- NULL

# Apply subset to each mapped df.
dfSubjectGroups <- dplyr::distinct(
  sample_dfAnalyticsInput,
  .data$SubjectID,
  .data$GroupID
)
sample_lMapped <- purrr::map(lMapped, function(thisDomain) {
  dplyr::inner_join(
    thisDomain,
    dfSubjectGroups,
    by = c("subjid" = "SubjectID")
  )
})

# User-facing names ----

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
  mincreated_dts = "Minimum Creation Datetime",
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
  compress = "xz"
)

# Everything else that we use is exported as sample data. Split things up by
# compression type.
usethis::use_data(
  sample_dfAnalyticsInput,
  sample_dfBounds,
  sample_dfResults,
  overwrite = TRUE,
  compress = "xz"
)
usethis::use_data(
  sample_dfGroups,
  sample_dfMetrics,
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
  chrDateFields,
  chrFieldNames,
  chrSitesUsed,
  chrDomainsUsed,
  dSnapshotDate,
  dfSubjectGroups,
  lAllResults,
  lMapped,
  lMappings,
  lRaw,
  lSource,
  lWorkflows,
  lSpec,
  sample_dfAnalyticsInput,
  sample_dfBounds,
  sample_dfGroups,
  sample_dfMetrics,
  sample_dfResults,
  sample_lMapped
)
