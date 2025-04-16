#' Figure out which required inputs aren't available
#'
#' @inheritParams shared-params
#' @returns A character vector of missing inputs.
#' @keywords internal
srvr_CompileUnsetInputs <- function(
  chrRequiredInputs,
  l_rctvInputs,
  chrInputNamesPretty
) {
  reactive({
    unname(unlist(purrr::map2(
      l_rctvInputs,
      chrInputNamesPretty,
      ~ CheckInputUnset(.y, chrRequiredInputs, NullifyEmpty(.x()))
    )))
  })
}

#' Check whether an input is set
#'
#' @inheritParams shared-params
#' @returns `strInputName` if the input is required and is not set, or
#'   `character()` if it isn't required or is set.
#' @keywords internal
CheckInputUnset <- function(strInputName, chrRequiredInputs, strValue) {
  if (tolower(strInputName) %in% tolower(chrRequiredInputs) && is.null(strValue)) {
    return(strInputName)
  }
  return(character())
}

#' Run Workflows Reactively
#'
#' @inheritParams shared-params
#' @returns A named list of the final output from `lWorkflows`, where the names
#'   are the names of the final results.
#' @keywords internal
srvr_RunReactiveWorkflows <- function(
  l_rctvDomains,
  lWorkflows,
  l_rctvDomainHashes,
  rctv_bPluginReady
) {
  # nocov start

  # I'm intentionally skipping tests in here until I can decouple it from the
  # noisy gsm logging.

  rlang::check_installed("gsm.mapping", "to process data for plugins.")

  lSpec <- gsm.mapping::CombineSpecs(lWorkflows)

  l_rctvWorkflowInput <- srvr_IngestReactive(
    l_rctvDomains,
    lSpec,
    l_rctvDomainHashes,
    rctv_bPluginReady
  )

  rctv_strDomainHashCombined <- srvr_CombineHashes(l_rctvDomainHashes, lSpec)

  l_rctvWorkflowOutput <- purrr::imap(
    lWorkflows,
    function(lWorkflow, nm) {
      reactive({
        req(rctv_bPluginReady())
        withProgress(
          message = glue::glue("Running {nm} workflow."),
          {
            # Materialize the DFs used by this wf.
            used_dfs <- names(lWorkflow$spec)
            lData <- purrr::map(
              l_rctvWorkflowInput[used_dfs],
              ~ .x()
            )

            # Use that data in the workflow.
            return(
              gsm.core::RunWorkflow(lWorkflow, lData, bKeepInputData = FALSE)
            )
          }
        )
      }) %>%
        bindCache(rctv_strDomainHashCombined())
    }
  )
  names(l_rctvWorkflowOutput) <- FinalWorkflowOutputNames(lWorkflows)
  return(l_rctvWorkflowOutput)
  # nocov end
}

#' Ingest Data Reactively
#'
#' @inheritParams shared-params
#' @returns A named list of ingested data.
#' @keywords internal
srvr_IngestReactive <- function(
  l_rctvDomains,
  lSpec,
  l_rctvDomainHashes,
  rctv_bPluginReady
) {
  # nocov start
  if (!length(l_rctvDomains)) {
    return(list())
  }

  # I'm intentionally skipping tests in here until I can decouple it from the
  # noisy gsm logging.

  rlang::check_installed("gsm.mapping", "to process data for plugins.")
  # Remove "Mapped_" etc from names.
  spec_names <- names(lSpec)
  names(l_rctvDomains) <- sub("^.*_", "", names(l_rctvDomains))
  names(lSpec) <- sub("^.*_", "", spec_names)
  rctv_strDomainHashCombined <- srvr_CombineHashes(l_rctvDomainHashes, lSpec)

  l_rctvMappedData <- purrr::imap(
    lSpec,
    function(columnSpecs, domain) {
      reactive({
        req(rctv_bPluginReady())
        dfSource <- l_rctvDomains[[domain]]()
        dfMapped <- gsm.mapping::ApplySpec(dfSource, columnSpecs, domain)
        return(dfMapped)
      }) %>%
        bindCache(domain, rctv_strDomainHashCombined())
    })
  names(l_rctvMappedData) <- spec_names

  return(l_rctvMappedData)
  # nocov end
}

#' Merge Used Hashes
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] that returns a string with the hashes of the
#'   loaded domains concatenated with "-".
#' @keywords internal
srvr_CombineHashes <- function(l_rctvDomainHashes, lSpec) {
  l_rctvDomainHashes_Used <- l_rctvDomainHashes[names(lSpec)]
  rctvDomainHashCombined <- reactive({
    paste(
      purrr::map_chr(l_rctvDomainHashes_Used, ~ .x()),
      collapse = "-"
    )
  })
  return(rctvDomainHashCombined)
}

#' Find the Names of the Final Steps
#'
#' @inheritParams shared-params
#' @returns A character vector of [FinalWorkflowOutputName()] output.
#' @keywords internal
FinalWorkflowOutputNames <- function(lWorkflows) {
  purrr::map_chr(lWorkflows, FinalWorkflowOutputName)
}

#' Find the Name of the Final Step
#'
#' @inheritParams shared-params
#' @returns A string with the "output" name of the final step of a workflow.
#' @keywords internal
FinalWorkflowOutputName <- function(lWorkflow) {
  chrOutputNames <- purrr::map_chr(lWorkflow$steps, "output")
  chrOutputNames[[length(chrOutputNames)]]
}
