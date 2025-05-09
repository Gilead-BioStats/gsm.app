# nocov start
#
# Not testing this until I have more concrete examples to help me think through
# logic. UI works.


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
    l_rctvDomains <- purrr::map(l_rctvDomains, "Selection")

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

    l_rctvWorkflowOutput <- srvr_RunReactiveWorkflows(
      l_rctvDomains,
      lPlugin$workflows,
      l_rctvDomainHashes,
      rctv_bPluginReady
    )

    lSpec <- lPlugin$spec
    chrNonWorkflowSpecs <- setdiff(names(lSpec), names(l_rctvWorkflowOutput))

    # Alternatively I could Ingest the workflow output as well, but I don't want
    # to waste processing time.
    l_rctvPluginData <- c(
      l_rctvWorkflowOutput,
      srvr_IngestReactive(
        l_rctvDomains,
        lSpec[chrNonWorkflowSpecs],
        l_rctvDomainHashes,
        rctv_bPluginReady
      )
    )

    # Allow for our formal naming convention in addition to the "base" domain
    # names.
    l_rctvPluginData <- c(
      l_rctvPluginData,
      rlang::set_names(
        l_rctvPluginData,
        paste0("rctv_df", names(l_rctvPluginData))
      )
    )

    # Other args ----

    lOtherArgs <- c(
      ## The input-like reactives are always available.
      l_rctvInputs,
      ## We also make the main gsm dfs available.
      lDataModel,
      ## lPlugin$config is a catch-all for anything else users pass in.
      lPlugin$config
    )

    # Run fnServer ----

    fnServer <- AsFunction(lPlugin$shiny$Server)
    chrServerArgs <- rlang::fn_fmls_names(fnServer)

    rlang::inject(
      fnServer(
        "plugin",
        !!!l_rctvPluginData[intersect(names(l_rctvPluginData), chrServerArgs)],
        !!!lOtherArgs[intersect(names(lOtherArgs), chrServerArgs)]
      )
    )
  })
}

# nocov end
