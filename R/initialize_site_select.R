#' Initialize Site Select
#'
#' @inheritParams shared-params
#'
#' @keywords internal
initialize_site_select <- function(dfGroups, session) {
  choices <- dfGroups %>% dplyr::filter(.data$GroupLevel == "Site")
  choices <- unique(choices$GroupID)
  choices <- sort(choices)

  updateSelectInput(
    session,
    "site",
    choices = c("None", choices)
  )
}
