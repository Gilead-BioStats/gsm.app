# These give us a range of flags for both KRIs.
group_subset <- c(
  "0X001",
  "0X021",
  "0X103",
  "0X159",
  "0X170"
)

sample_dfResults_subset <- sample_dfResults %>%
  dplyr::filter(GroupID %in% group_subset)
sample_dfAnalyticsInput_subset <- sample_dfAnalyticsInput %>%
  dplyr::filter(GroupID %in% group_subset)
sample_dfGroups_subset <- sample_dfGroups %>%
  dplyr::filter(
    GroupLevel != "Site" | (GroupLevel == "Site" & GroupID %in% group_subset)
  )
