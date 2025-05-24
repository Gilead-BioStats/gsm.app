# Sample datasets generated from {clindata} filtered then passed through
# {gsm.mapping}.

# Used libraries ----

# clindata is needed to generate this data, but is not a requirement for using
# or testing the package, so it is not listed in the DESCRIPTION. Likewise for
# gsm.mapping and gsm.reporting.
# pak::pak("Gilead-BioStats/gsm.reporting")
# pak::pak("Gilead-BioStats/gsm.core@dev")
# pak::pak("Gilead-BioStats/gsm.mapping@dev")
# pak::pak("Gilead-BioStats/gsm.datasim@dev")

pkgload::load_all()
library(conflicted)
conflicted::conflict_prefer_all("gsm.app", quiet = TRUE)
library(gsm.core)
library(gsm.mapping)
library(gsm.datasim)
library(gsm.reporting)
library(dplyr)
library(purrr)

# Set up inputs ----

chrDomainsUsed <- c(
  "AE", "DATACHG", "DATAENT", "ENROLL", "LB", "PD", "QUERY",
  "SDRGCOMP", "SITE", "STUDCOMP", "STUDY", "SUBJ", "Visit"
)

strStudyID <- "DEMO-001"

# Metric & workflow info is the same regardless of how many sites.
lWorkflows <- gsm.core::MakeWorkflowList(
  "^kri",
  strPath = "workflow/2_metrics",
  strPackage = "gsm.kri"
)
## Don't use kri/cou0012 (Screen Failure Rate) yet.
lWorkflows$kri0012 <- NULL
# lWorkflows$cou0012 <- NULL
## Don't use kri/cou0013 (PKCollection Compliance Rate) yet.
lWorkflows$kri0013 <- NULL
# lWorkflows$cou0013 <- NULL

sample_dfMetrics <- gsm.reporting::MakeMetric(lWorkflows = lWorkflows)

lMappings <- gsm.core::MakeWorkflowList(
  strPath = "workflow/1_mappings",
  strNames = chrDomainsUsed,
  strPackage = "gsm.mapping"
)
lSpec <- gsm.mapping::CombineSpecs(lMappings)

intSiteCount <- 50L
intParticipantCountPerSite <- 5L
intParticipantCount <- intSiteCount * intParticipantCountPerSite
# Determined by iterating from 1-938 looking for >5 sites with red flags.
intSeed <- 938L
# bGoodEnough <- FALSE

# while (!bGoodEnough) {
  set.seed(intSeed)
  snapshots <- gsm.datasim::generate_rawdata_for_single_study(
    SnapshotCount = 3,
    SnapshotWidth = "months",
    ParticipantCount = intParticipantCount,
    SiteCount = intSiteCount,
    StudyID = strStudyID,
    workflow_path = "workflow/1_mappings",
    mappings = chrDomainsUsed,
    package = "gsm.mapping"
  )

  dSnapshotDate <- as.Date(names(snapshots))

  # We can't use just the latest snapshot and then re-divide; among other likely
  # issues, `Raw_SUBJ$timeonstudy` is updated regardless of when the subject's
  # profile was created, for example.

  lAllResults <- purrr::map(dSnapshotDate, function(thisDate) {
    lRaw <- snapshots[[as.character(thisDate)]]
    # Temporarily fix a weird column name.
    lRaw$Raw_SUBJ$firstparticipantdate <- lRaw$Raw_SUBJ$firstparticipant

    # Create Mapped Data ----

    lIngested <- gsm.mapping::Ingest(lRaw, lSpec)

    lMapped <- gsm.core::RunWorkflows(lMappings, lIngested)
    lMapped <- lMapped %>%
      purrr::map(dplyr::as_tibble)

    # Create Analysis Data - Generate KRIs ----

    lAnalysis <- gsm.core::RunWorkflows(lWorkflows, lMapped)
    dfResults <- gsm.reporting::BindResults(
      lAnalysis = lAnalysis,
      strName = "Analysis_Summary",
      dSnapshotDate = thisDate,
      strStudyID = strStudyID
    )
    dfAnalyticsInput <- purrr::map(lAnalysis, "Analysis_Input") %>%
      dplyr::bind_rows(.id = "MetricID") %>%
      dplyr::as_tibble() %>%
      dplyr::mutate(SnapshotDate = thisDate)
    dfBounds <- gsm.reporting::MakeBounds(
      dfResults = dfResults,
      dfMetrics = sample_dfMetrics
    )
    list(
      dfAnalyticsInput = dfAnalyticsInput,
      dfResults = dfResults,
      dfBounds = dfBounds,
      lMapped = lMapped
    )
  })

  # Standard dfs ----

  sample_dfResults <- purrr::list_rbind(
    purrr::map(lAllResults, "dfResults")
  )

#   RedSites <- sample_dfResults %>%
#     dplyr::filter(SnapshotDate == "2012-03-31") %>%
#     dplyr::summarize(
#       RedsAtSite = sum(!is.na(Flag) & abs(Flag) == 2),
#       .by = c("GroupLevel", "GroupID")
#     ) %>%
#     dplyr::filter(RedsAtSite >= 1) %>%
#     nrow()
#
#   if (RedSites > 5 || intSeed > 1000) {
#     bGoodEnough <- TRUE
#   } else {
#     intSeed <- intSeed + 1L
#   }
# }
#
# cli::cli_inform("Seed {intSeed} has {RedSites} red sites.")

  sample_dfBounds <- purrr::list_rbind(
    purrr::map(lAllResults, "dfBounds")
  )
  sample_dfAnalyticsInput <- purrr::list_rbind(
    purrr::map(lAllResults, "dfAnalyticsInput")
  )

  # We'll use lMapped as of the final snapshot date. In sample_fnFetchData, I'll
  # have to recalculate some fields, like `Mapped_SUBJ$timeonstudy`.
  lMapped <- lAllResults[[3]]$lMapped

  sample_dfGroups <- dplyr::bind_rows(
    # lMapped$Mapped_COUNTRY,
    lMapped$Mapped_SITE,
    lMapped$Mapped_STUDY
  )

# lMapped for Domain Data ----

# COUNTRY, SITE, and STUDY are in dfGroups
# lMapped$Mapped_COUNTRY <- NULL
lMapped$Mapped_SITE <- NULL
lMapped$Mapped_STUDY <- NULL

# Apply subset to each mapped df.
dfSubjectGroups <- dplyr::distinct(
  sample_dfAnalyticsInput,
  .data$SubjectID,
  .data$GroupID,
  .data$GroupLevel
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
  aeongo = "Ongoing?",
  aerel = "Related?",
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
  compress = "bzip2"
)

# Everything else that we use is exported as sample data. Split things up by
# compression type.
# usethis::use_data(
#   overwrite = TRUE,
#   compress = "bzip2"
# )
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
  # chrDateFields,
  chrFieldNames,
  chrDomainsUsed,
  dSnapshotDate,
  dfSubjectGroups,
  intParticipantCount,
  intParticipantCountPerSite,
  intSeed,
  intSiteCount,
  lAllResults,
  lMapped,
  lMappings,
  lWorkflows,
  lSpec,
  sample_dfAnalyticsInput,
  sample_dfBounds,
  sample_dfGroups,
  sample_dfMetrics,
  sample_dfResults,
  sample_lMapped,
  snapshots,
  strStudyID
)
