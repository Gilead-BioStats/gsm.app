#' Plugin Wrapper UI
#'
#' @inheritParams shared-params
#' @returns Plugin UI element, as a [shiny::uiOutput()]. The corresponding
#'   server function determines whether the plugin is ready to display, showing
#'   either a placeholder or the actual plugin.
#' @keywords internal
mod_Plugin_UI <- function(lPlugin, id) {
  pluginUI <- uiOutput(NS(id, "plugin"))
  bslib::nav_panel(title = lPlugin$meta$Name, pluginUI)
}

# nocov start ----
#
# Not testing this until I have more concrete examples to help me think through
# logic. UI works.

#' Run Plugin UI
#'
#' @inheritParams shared-params
#' @returns Actually launch the plugin UI.
#' @keywords internal
run_PluginUI <- function(id, lPlugin) {
  fnUI <- AsFunction(lPlugin$shiny$UI)
  UI_args <- intersect(
    names(lPlugin$config),
    rlang::fn_fmls_names(fnUI)
  )
  rlang::inject({
    fnUI(
      id,
      !!!lPlugin$config[UI_args]
    )
  })
}

#' Plugin Wrapper Server
#'
#' @inheritParams shared-params
#' @keywords internal
mod_Plugin_Server <- function(
  lPlugin,
  id,
  lDataModel,
  l_rctvDomains,
  l_rctvDomainHashes,
  l_rctvInputs,
  chrInputNamesPretty
) {
  moduleServer(id, function(input, output, session) {
    # Temporarily only use Selection. See #447.
    # l_rctvDomains <- l_rctvDomains$Selection
    # l_rctvDomainHashes <- l_rctvDomainHashes$Selection

    chrFilterLevel <- names(l_rctvDomains)

    #  Required inputs ----
    rctv_chrMissingInputs <- srvr_CompileUnsetInputs(
      lPlugin$required_inputs,
      l_rctvInputs,
      chrInputNamesPretty
    )
    rctv_bPluginReady <- reactive({
      !length(rctv_chrMissingInputs())
    })


    # Dynamic UI ----

    output[["plugin"]] <- renderUI({
      if (rctv_bPluginReady()) {
        return(run_PluginUI(session$ns("plugin"), lPlugin))
      }
      out_Placeholder(rctv_chrMissingInputs())
    })


    # Domain data ----

    # Run at all levels.
    l_rctvWorkflowOutput <- purrr::pmap(
      list(
        l_rctvDomains,
        l_rctvDomainHashes,
        names(l_rctvDomains)
      ),
      function(these_l_rctvDomains, these_l_rctvDomainHashes, this_strGroupLevel) {
        srvr_RunReactiveWorkflows(
          these_l_rctvDomains,
          lPlugin$workflows,
          these_l_rctvDomainHashes,
          rctv_bPluginReady,
          strCache = this_strGroupLevel
        )
      }
    )

    lSpec <- lPlugin$spec
    chrNonWorkflowSpecs <- setdiff(
      names(lSpec),
      names(l_rctvWorkflowOutput$Study) # Could be any set.
    )

    # Alternatively I could Ingest the workflow output as well, but I don't want
    # to waste processing time.
    l_rctvPluginData <- purrr::map(
      rlang::set_names(chrFilterLevel, chrFilterLevel),
      function(strFilterLevel) {
        c(
          l_rctvWorkflowOutput[[strFilterLevel]],
          srvr_IngestReactive(
            l_rctvDomains[[strFilterLevel]],
            lSpec[chrNonWorkflowSpecs],
            l_rctvDomainHashes[[strFilterLevel]],
            rctv_bPluginReady,
            strCache = strFilterLevel
          )
        )
      }
    ) %>%
      # "unlist" 1 level, resulting in names like "Study.AE" and
      # "Selection.ENROLL".
      unlist()

    # Used args ----

    lAvailableArgs <- c(
      l_rctvPluginData,
      ## The input-like reactives are always available.
      l_rctvInputs,
      ## We also make the main gsm dfs available.
      lDataModel,
      ## lPlugin$config is a catch-all for anything else users pass in.
      lPlugin$config
    )

    fnServer <- AsFunction(lPlugin$shiny$Server)
    chrServerArgs <- rlang::fn_fmls_names(fnServer)

    lUsedArgs <- FindUsedArgs(lAvailableArgs, chrServerArgs)

    # Run fnServer ----

    rlang::inject(
      fnServer("plugin", !!!lUsedArgs)
    )
  })
}

# nocov end ----

# Covered ----

#' Subset Available Args to Server Function Needs
#'
#' @param lAvailableArgs `list` The args available to send to the plugin.
#' @param chrServerArgs `character` The vector of arguments accepted by the
#'   plugin function.
#' @returns A `list` that is a subset of `lAvailableArgs` (only those used by
#'   the function), renamed to match the function.
#' @keywords internal
FindUsedArgs <- function(lAvailableArgs, chrServerArgs) {
  simple_chrServerArgs <- SimplifyArgs(chrServerArgs)
  simple_chrAvailableArgs <- SimplifyArgs(names(lAvailableArgs))
  chrUsedArgs <- intersect(simple_chrServerArgs, simple_chrAvailableArgs)

  names(chrServerArgs) <- simple_chrServerArgs
  names(lAvailableArgs) <- simple_chrAvailableArgs

  lAvailableArgs <- lAvailableArgs[chrUsedArgs]

  # Apply the "real" names.
  names(lAvailableArgs) <- chrServerArgs[chrUsedArgs]
  return(lAvailableArgs)
}

#' Simplify Function Arguments for Comparison
#'
#' @param chrArgs `character` A vector of argument names to use in comparisons.
#' @returns A `character` vector of lowercase argument names without prefixes or
#'   special characters.
#' @keywords internal
SimplifyArgs <- function(chrArgs) {
  chrArgs %>%
    stringr::str_replace_na("") %>%
    # Remove argument-class prefixes/infixes.
    stringr::str_remove_all(MakePrefixRegex()) %>%
    tolower() %>%
    # Get rid of any non-alphanumeric characters.
    stringr::str_remove_all("[^[:alnum:]]") %>%
    # We use "selection" to mean "the generic version".
    stringr::str_remove("^selection(?=.)") %>%
    # If the arg contains "study" or "group", put it at the beginning.
    stringr::str_replace("(.*)(study|group)(.*)", "\\2\\1\\3")
}

#' Construct Regex to Find Prefixes
#'
#' @param chrPrefixes `character` Argument "prefixes" (really can appear
#'   anywhere in the argument name, as long as they're preceded by either the
#'   beginning of the name or a non-alphanumeric character, and followed by a
#'   capital letter or a non-alphanumeric character).
#' @returns A regex to find the prefixes (to remove them).
#' @keywords internal
MakePrefixRegex <- function(
  chrPrefixes = c(
    "chr",
    "df",
    "d",
    "fct",
    "int",
    "l",
    "num",
    "rctv",
    "str"
  )
) {
  paste0(
    "(^|[^[:alnum:]])(",
    paste(
      chrPrefixes,
      collapse = "|"
    ),
    ")(?=[A-Z_.])"
  )
}
