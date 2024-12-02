#' Plugins Wrapper Server
#'
#' @inheritParams shared-params
#' @returns Nothing yet.
#' @keywords internal
mod_Plugins_Server <- function(
  id,
  lPlugins,
  fnFetchData,
  rctv_strMetricID,
  rctv_strSiteID,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    if (!is.null(lPlugins)) {
      for (i in seq_along(lPlugins)) {
        lPlugin <- lPlugins[[i]]
        fnServer <- rlang::as_function(lPlugin$fnServer)
        args_available <- list(
          fnFetchData = fnFetchData,
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
            i,
            !!!lPlugin$lConfig,
            !!!args_available[args_used]
          )
        )
      }
    }
  })
}
