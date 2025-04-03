#' Figure out which required inputs aren't available
#'
#' @inheritParams shared-params
#' @returns A character vector of missing inputs.
#' @keywords internal
CompileUnsetInputs <- function(
    chrRequiredInputs,
    rctv_strSiteID,
    rctv_strSubjectID,
    rctv_strDomainID
) {
  missing_inputs <- c(
    CheckInputUnset("site", chrRequiredInputs, rctv_strSiteID),
    CheckInputUnset("participant", chrRequiredInputs, rctv_strSubjectID),
    CheckInputUnset("domain", chrRequiredInputs, rctv_strDomainID)
  )
  return(missing_inputs)
}

#' Check whether an input is set
#'
#' @inheritParams shared-params
#' @returns `strInputName` if the input is required and is not set, or
#'   `character()` if it isn't required or is set.
#' @keywords internal
CheckInputUnset <- function(
    strInputName,
    chrRequiredInputs,
    rctv_strValue
) {
  if (
    strInputName %in% chrRequiredInputs &&
    is.null(NullifyEmpty(rctv_strValue()))
  ) {
    return(strInputName)
  }
  return(character())
}

# srvr_RunReactiveWorkflows <- function(
#   lWorkflows,
#   l_rctvDomains,
#   lDataModel
# ) {
#   #
# }

srvr_IngestReactive <- function(l_rctvDomains, lSpec, l_rctvInputs) {
  rlang::check_installed("gsm.mapping", "to process data for plugins.")

  # Remove "Mapped_" etc from names.
  spec_names <- names(lSpec)
  names(l_rctvDomains) <- sub("^.*_", "", names(l_rctvDomains))
  names(lSpec) <- sub("^.*_", "", spec_names)

  l_rctvMappedData <- purrr::imap(
    lSpec,
    function(columnSpecs, domain) {
      rctv_dfDomain <- reactive({
        dfSource <- l_rctvDomains[[domain]]()
        dfMapped <- gsm.mapping::ApplySpec(dfSource, columnSpecs, domain)
        return(dfMapped)
      }) %>%
        shiny::bindCache(
          l_rctvInputs$rctv_dateSnapshot(),
          l_rctvInputs$rctv_strMetricID(),
          l_rctvInputs$rctv_strSiteID(),
          l_rctvInputs$rctv_strSubjectID(),
          l_rctvInputs$rctv_strDomainID()
        )
    })
  names(l_rctvMappedData) <- spec_names
  return(l_rctvMappedData)
}
