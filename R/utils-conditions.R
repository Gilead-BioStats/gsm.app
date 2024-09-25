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
