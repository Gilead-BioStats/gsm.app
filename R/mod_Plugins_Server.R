#' Plugins Wrapper Server
#'
#' @inheritParams shared-params
#' @returns Nothing yet.
#' @keywords internal
mod_Plugins_Server <- function(
  id,
  lPlugins,
  l_rctvDomains,
  rctv_strMetricID,
  rctv_strSiteID,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    if (!is.null(lPlugins)) {
      purrr::imap(
        lPlugins,
        function(lPlugin, i) {
          required_inputs <- tolower(lPlugin$required_inputs)
          if (length(required_inputs)) {
            shiny_UI <- shiny::reactive({
              missing_inputs <- character()
              if ("site" %in% required_inputs && is.null(null_for_none(rctv_strSiteID()))) {
                missing_inputs <- "site"
              }
              if ("participant" %in% required_inputs && is.null(null_for_none(rctv_strSubjectID()))) {
                missing_inputs <- c(missing_inputs, "participant")
              }
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
            rctv_strSubjectID = rctv_strSubjectID
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
