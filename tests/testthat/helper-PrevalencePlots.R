set.seed(1975)
dfStudyPrevalencePlots <- dplyr::tibble(
  VizLevel = "Study",
  GroupID = sample(c("A", "B", "C"), size = 100, replace = TRUE),
  SubjectID = paste0(GroupID, sample(1:3, size = 100, replace = TRUE)),
  category = sample(letters, size = 100, replace = TRUE)
)
dfGroupPrevalencePlots <- dplyr::filter(
  dfStudyPrevalencePlots,
  .data$GroupID == "A"
) %>%
  dplyr::mutate(VizLevel = "Group")
dfParticipantPrevalencePlots <- dplyr::filter(
  dfGroupPrevalencePlots,
  .data$SubjectID == "A1"
) %>%
  dplyr::mutate(VizLevel = "Participant")
