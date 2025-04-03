mod_Plugin_UI <- function(lPlugin, id) {
  subID <- NS(id, "plugin")
  if (length(lPlugin$required_inputs)) {
    # Allow for a placeholder instead of the plugin.
    pluginUI <- uiOutput(subID)
  } else {
    pluginUI <- run_PluginUI(subID, lPlugin)
  }
  bslib::nav_panel(title = lPlugin$meta$Name, pluginUI)
}

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

mod_Plugin_Server <- function(
  lPlugin,
  id,
  dfAnalyticsInput,
  dfBounds,
  dfGroups,
  dfMetrics,
  dfResults,
  l_rctvDomains,
  rctv_dateSnapshot,
  rctv_strMetricID,
  rctv_strSiteID,
  rctv_strSubjectID,
  rctv_strDomainID
) {
  moduleServer(id, function(input,
                            output,
                            session) {
    fnServer <- AsFunction(lPlugin$shiny$Server)

    # Required inputs ----
    chrRequiredInputs <- tolower(lPlugin$required_inputs)
    if (length(chrRequiredInputs)) {
      shiny_UI <- reactive({
        missing_inputs <- CompileUnsetInputs(
          chrRequiredInputs = chrRequiredInputs,
          rctv_strSiteID = rctv_strSiteID,
          rctv_strSubjectID = rctv_strSubjectID,
          rctv_strDomainID = rctv_strDomainID
        )
        if (length(missing_inputs)) {
          return(out_Placeholder(missing_inputs))
        }
        run_PluginUI(session$ns("plugin"), lPlugin)
      })
      output[["plugin"]] <- renderUI({shiny_UI()})
    }

    # fnServer arguments ----

    # We use the static dfs in various places, so bundle them to avoid typing.
    lDataModel <- list(
      dfAnalyticsInput = dfAnalyticsInput,
      dfBounds = dfBounds,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfResults = dfResults
    )

    # We also bundle up the Shiny-input-like reactives for portability.
    l_rctvInputs <- list(
      rctv_dateSnapshot = rctv_dateSnapshot,
      rctv_strMetricID = rctv_strMetricID,
      rctv_strSiteID = rctv_strSiteID,
      rctv_strSubjectID = rctv_strSubjectID,
      rctv_strDomainID = rctv_strDomainID
    )

    ## Domain data ----

    ### Workflows ----

    #### If there are workflows, run them. These might directly result in the
    #### data for the plugin, but they also might be ingested for the spec.
    # if (length(lPlugin$workflows)) {
    #   l_rctvDomains <- srvr_RunReactiveWorkflows(
    #     lWorkflows = lPlugin$workflows,
    #     l_rctvDomains = l_rctvDomains,
    #     lDataModel = lDataModel
    #   )
    # }

    ### Spec ----
    #### If there's a spec, apply it.
    if (length(lPlugin$spec)) {
      l_rctvDomains <- srvr_IngestReactive(
        l_rctvDomains = l_rctvDomains,
        lSpec = lPlugin$spec,
        l_rctvInputs = l_rctvInputs
      )
    }

    ## Args used ----

    ### We send them the requested domains + the standard variables, if there is
    ### a place to put them.
    chrServerArgs <- rlang::fn_fmls_names(fnServer)

    # For l_rctvDomains, we give them named ones, and optionally the rest if
    # their server accepts ...
    if (!("..." %in% chrServerArgs)) {
      l_rctvDomains <- l_rctvDomains[
        intersect(names(l_rctvDomains), chrServerArgs)
      ]
    }

    lOtherArgs <- c(
      #### The input-like reactives are always available.
      l_rctvInputs,
      #### We also make the main gsm dfs available.
      lDataModel,
      #### lPlugin$config is a catch-all for anything else users pass in.
      lPlugin$config
    )
    lOtherArgs <- lOtherArgs[intersect(names(lOtherArgs), chrServerArgs)]

    # Run fnServer ----
    rlang::inject(
      fnServer(
        "plugin",
        !!!l_rctvDomains,
        !!!lOtherArgs
      )
    )
  })
}
