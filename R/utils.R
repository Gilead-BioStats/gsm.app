#' Default value for zero length
#'
#' Utility to easily replace length-0 values with a default value. Similar to
#' the infix operator (`%||%`) from `rlang`, which was recently added to base R.
#'
#' @param x A value to check for length.
#' @param y A default value.
#'
#' @return If `x` has a length, `x`; otherwise `y`.
#' @name op-length-0-default
#' @keywords internal
`%|0|%` <- function(x, y) {
  if (length(x)) {
    return(x)
  }
  return(y)
}

integer() %|0|% 1
