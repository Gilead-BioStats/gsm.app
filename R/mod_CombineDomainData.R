mod_CombineDomainData_Server <- function(
  id,
  l_rctvActive,
  rctv_dfDomain_Study,
  rctv_dfDomain_Group,
  rctv_dfDomain,
  rctv_strGroupLevel,
  rctv_strGroupID,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    rctv_dfDomain_Study_Prepared <- mod_PreparePrevalenceData_Server(
      "StudyPreparer",
      "Study",
      l_rctvActive,
      rctv_dfDomain_Study,
      rctv_strGroupLevel
    )

    rctv_dfDomain_Group_Prepared <- mod_PreparePrevalenceData_Server(
      "GroupPreparer",
      "Group",
      l_rctvActive,
      rctv_dfDomain_Group,
      rctv_strGroupLevel,
      rctv_strGroupID
    )

    rctv_dfDomain_Participant_Prepared <- mod_PreparePrevalenceData_Server(
      "ParticipantPreparer",
      "Participant",
      l_rctvActive,
      rctv_dfDomain,
      rctv_strGroupLevel,
      rctv_strSubjectID
    )

    rctv_dfDomain_Combined <- reactive({
      combined <- purrr::list_rbind(list(
        Study = rctv_dfDomain_Study_Prepared(),
        Group = rctv_dfDomain_Group_Prepared(),
        Participant = rctv_dfDomain_Participant_Prepared()
      ))
      if (NROW(combined)) {
        combined <- dplyr::mutate(
          combined,
          VizLevel = factor(
            .data$VizLevel,
            levels = c("Study", "Group", "Participant")
          ) |>
            forcats::fct_drop()
        )
      }
      combined
    })
    return(rctv_dfDomain_Combined)
  })
}
