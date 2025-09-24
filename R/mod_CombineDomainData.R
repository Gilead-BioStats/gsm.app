#' Pseudo-module to cleanly combine domain dfs
#'
#' @inheritParams shared-params
#' @returns A `reactive` that returns the combined domain data.
#' @keywords internal
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
      CombineDomainData(
        dfDomain_Study = rctv_dfDomain_Study_Prepared(),
        dfDomain_Group = rctv_dfDomain_Group_Prepared(),
        dfDomain_Participant = rctv_dfDomain_Participant_Prepared()
      )
    })
    return(rctv_dfDomain_Combined)
  })
}

#' Combine domain data
#'
#' @inheritParams shared-params
#' @returns The combined data, with the `VizLevel` column as a factor.
#' @keywords internal
CombineDomainData <- function(
  dfDomain_Study,
  dfDomain_Group,
  dfDomain_Participant
) {
  combined <- purrr::list_rbind(list(
    Study = dfDomain_Study,
    Group = dfDomain_Group,
    Participant = dfDomain_Participant
  ))
  if (NROW(combined) && "VizLevel" %in% colnames(combined)) {
    combined <- dplyr::mutate(
      combined,
      VizLevel = factor(
        .data$VizLevel,
        levels = c("Study", "Group", "Participant")
      ) %>%
        forcats::fct_drop()
    )
  }
  return(combined)
}
