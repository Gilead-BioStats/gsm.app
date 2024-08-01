#' Initialize Site Select
#'
#' @inheritParams shared-params
#'
#' @export

initialize_site_select <- function(input, output, session, dfGroups) {

    choices = dfGroups %>% filter(GroupLevel == "Site")
    choices = unique(choices$GroupID)
    choices = as.numeric(choices)
    choices = sort(choices)

    shiny::updateSelectInput(
        session,
        'site',
        choices = c("None", choices)
    )

    # # Capture list of site IDs.
    # site_metadata <- snapshot$lInputs$lMeta$meta_site %>%
    #     dplyr::filter(
    #         .data[[snapshot$lInputs$lMapping$dfSITE$strSiteCol]] %in% (
    #             snapshot$lInputs$lData$dfSUBJ[[
    #                 snapshot$lInputs$lMapping$dfSUBJ$strSiteCol
    #             ]] %>%
    #                 unique() %>%
    #                 sort()
    #         )
    #     ) %>%
    #     dplyr::arrange(
    #         .data[[snapshot$lInputs$lMapping$dfSITE$strSiteCol]]
    #     )
    #
    # # Include investigator name in each option.
    # choices <- site_metadata[[snapshot$lInputs$lMapping$dfSITE$strSiteCol]] %>%
    #     stats::setNames(
    #         glue::glue(
    #             '{
    #                 site_metadata[[ snapshot$lInputs$lMapping$dfSITE$strSiteCol ]]
    #             } ({
    #                 site_metadata[[ snapshot$lInputs$lMapping$dfSITE$strPILastNameCol ]]
    #             })'
    #         )
    #     )
    #
    # shiny::updateSelectInput(
    #     session,
    #     'site',
    #     choices = c(
    #         'None',
    #         choices
    #     )
    # )
}
