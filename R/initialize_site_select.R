#' Initialize Site Select
#'
#' @inheritParams shared-params
#'
#' @export
initialize_site_select <- function(input, output, session, snapshot) {
  strSiteCol <- snapshot$lInputs$lMapping$dfSITE$strSiteCol
  strPILastNameCol <- snapshot$lInputs$lMapping$dfSITE$strPILastNameCol

  # Capture list of site IDs.
  site_metadata <- snapshot$lInputs$lMeta$meta_site %>%
    dplyr::filter(
      .data[[strSiteCol]] %in% (
        snapshot$lInputs$lData$dfSUBJ[[
          snapshot$lInputs$lMapping$dfSUBJ$strSiteCol
        ]] %>%
          unique() %>%
          sort()
      )
    ) %>%
    dplyr::arrange(.data[[strSiteCol]])

  # Include investigator name in each option.
  choices <- site_metadata[[strSiteCol]] %>%
    stats::setNames(
      glue::glue(
        '{site_metadata[[strSiteCol]]} ({site_metadata[[strPILastNameCol]]})'
      )
    )

  shiny::updateSelectInput(
    session,
    'site',
    choices = c(
      'None',
      choices
    )
  )
}
