#' Error messaging for this package.
#'
#' @inheritParams shared-params
#' @inheritParams cli::cli_abort
#' @return An error condition with classes `"gsm.app-condition"`,
#'   `"gsm.app-error"`, and `"gsm.app-error-{strClass}"`.
#' @keywords internal
gsmapp_abort <- function(
    chrMessage,
    strClass,
    ...,
    envCall = rlang::caller_env(),
    envEvaluate = rlang::caller_env()
) {
  cli::cli_abort(
    chrMessage,
    class = c(
      "gsm.app-condition",
      "gsm.app-error",
      paste0("gsm.app-error-", strClass)
    ),
    call = envCall,
    .envir = envEvaluate,
    ...
  )
}
