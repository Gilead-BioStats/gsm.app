# Launch the ShinyApp (Do not remove this comment)
# To deploy, run: rsconnect::deployApp()
# Or use the blue button on top of this file

if (
  isTRUE(as.logical(Sys.getenv("TESTTHAT_IS_CHECKING", "false"))) ||
    isTRUE(as.logical(Sys.getenv("R_COVR", "false")))
) {
  library("gsm.app")
} else {
  pkgload::load_all(here::here())
}

group_subset <- c(
  "0X001",
  "0X021",
  "0X103",
  "0X159",
  "0X161"
)

sample_dfResults_subset <- gsm.app::sample_dfResults %>%
  dplyr::filter(GroupID %in% group_subset)
sample_dfAnalyticsInput_subset <- gsm.app::sample_dfAnalyticsInput %>%
  dplyr::filter(GroupID %in% group_subset)
sample_dfGroups_subset <- gsm.app::sample_dfGroups %>%
  dplyr::filter(
    GroupLevel != "Site" | (GroupLevel == "Site" & GroupID %in% group_subset)
  )

slow_FetchParticipantData <- function(strSubjectID) {
  if (strSubjectID %in% names(participant_data)) {
    Sys.sleep(5)
    return(participant_data[[strSubjectID]])
  }
  gsmapp_abort(
    c(
      "{.arg strSubjectID} must be one of the participants in the sample data.",
      i = "Unknown participant {strSubjectID}."
    ),
    strClass = "unknown_strSubjectID"
  )
}

gsm.app::run_gsm_app(
  dfAnalyticsInput = sample_dfAnalyticsInput_subset,
  dfBounds = gsm.app::sample_dfBounds,
  dfGroups = sample_dfGroups_subset,
  dfMetrics = gsm.app::sample_dfMetrics,
  dfResults = sample_dfResults_subset,
  fnFetchParticipantData = slow_FetchParticipantData
)
