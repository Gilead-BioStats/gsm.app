#' Plugins Wrapper Server
#'
#' @inheritParams shared-params
#' @keywords internal
mod_Plugins_Server <- function(
  id,
  lPlugins,
  l_rctvDomains,
  rctv_strMetricID,
  rctv_strSiteID,
  rctv_strSubjectID,
  rctv_strDomainID
) {
  moduleServer(id, function(input, output, session) {
    if (!is.null(lPlugins)) {
      purrr::imap(
        lPlugins,
        function(lPlugin, i) {
          chrRequiredInputs <- tolower(lPlugin$required_inputs)
          if (length(chrRequiredInputs)) {
            shiny_UI <- shiny::reactive({
              missing_inputs <- util_compileMissingInputs(
                chrRequiredInputs = chrRequiredInputs,
                rctv_strSiteID = rctv_strSiteID,
                rctv_strSubjectID = rctv_strSubjectID,
                rctv_strDomainID = rctv_strDomainID
              )
              if (length(missing_inputs)) {
                return(out_Placeholder(missing_inputs))
              }
              fnUI <- util_AsFunction(lPlugin$shiny$UI)
              rlang::inject({
                fnUI(
                  session$ns(paste0("plugin-", i)),
                  !!!lPlugin$lConfig
                )
              })
            })
            output[[i]] <- shiny::renderUI({shiny_UI()})
          }
          fnServer <- util_AsFunction(lPlugin$shiny$Server)
          names(l_rctvDomains) <- glue::glue("rctv_df{names(l_rctvDomains)}")
          args_available <- c(
            l_rctvDomains,
            rctv_strMetricID = rctv_strMetricID,
            rctv_strSiteID = rctv_strSiteID,
            rctv_strSubjectID = rctv_strSubjectID,
            rctv_strDomainID = rctv_strDomainID
          )
          args_used <- intersect(
            names(args_available),
            rlang::fn_fmls_names(fnServer)
          )
          rlang::inject(
            fnServer(
              paste0("plugin-", i),
              !!!lPlugin$lConfig,
              !!!args_available[args_used]
            )
          )
        }
      )
    }
  })
}

#' Figure out which required inputs aren't available
#'
#' @inheritParams shared-params
#' @returns A character vector of missing inputs.
#' @keywords internal
util_compileMissingInputs <- function(
  chrRequiredInputs,
  rctv_strSiteID,
  rctv_strSubjectID,
  rctv_strDomainID
) {
  missing_inputs <- c(
    util_checkInputMissing("site", chrRequiredInputs, rctv_strSiteID),
    util_checkInputMissing("participant", chrRequiredInputs, rctv_strSubjectID),
    util_checkInputMissing("domain", chrRequiredInputs, rctv_strDomainID)
  )
  return(missing_inputs)
}

#' Check whether an input is set
#'
#' @inheritParams shared-params
#' @returns `strInputName` if the input is required and is not set, or
#'   `character()` if it isn't required or is set.
#' @keywords internal
util_checkInputMissing <- function(
  strInputName,
  chrRequiredInputs,
  rctv_strValue
) {
  if (
    strInputName %in% chrRequiredInputs &&
    is.null(null_for_none(rctv_strValue()))
  ) {
    return(strInputName)
  }
  return(character())
}
