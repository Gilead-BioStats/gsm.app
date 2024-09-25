#' Error messaging for this package.
#'
#' @inheritParams cli::cli_abort
#' @param class A descriptive label for this type of error, in lower_snake_case.
#' @param .envir Environment in which any variables used in the message are
#'   defined. You almost definitely want to leave this as the default value.
#'
#' @return An error condition with classes `"gsm.app-condition"`,
#'   `"gsm.app-error"`, and `"gsm.app-error-{class}"`.
#' @keywords internal
gsmapp_abort <- function(message, class, ..., .envir = rlang::caller_env()) {
  cli::cli_abort(
    message,
    class = c(
      "gsm.app-condition",
      "gsm.app-error",
      paste0("gsm.app-error-", class)
    ),
    .envir = .envir,
    ...
  )
}
