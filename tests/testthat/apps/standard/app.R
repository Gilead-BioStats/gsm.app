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

gsm.app::run_gsm_app(
  dfResults = sample_dfResults_subset,
  dfGroups = sample_dfGroups_subset,
  dfMetrics = gsm.app::sample_dfMetrics,
  dfBounds = gsm.app::sample_dfBounds,
  dfAnalyticsInput = sample_dfAnalyticsInput_subset,
  fnFetchParticipantData = gsm.app::sample_FetchParticipantData
)
