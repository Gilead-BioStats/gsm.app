#' Initialize Site Select
#'
#' @inheritParams shared-params
#'
#' @export

initialize_site_select <- function(input, output, session, dfGroups) {
  choices <- dfGroups %>% dplyr::filter(.data$GroupLevel == "Site")
  choices <- unique(choices$GroupID)
  choices <- as.numeric(choices)
  choices <- sort(choices)

  shiny::updateSelectInput(
    session,
    "site",
    choices = c("None", choices)
  )
}
