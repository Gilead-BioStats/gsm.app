#' KRI Color Div
#'
#' @inheritParams shared-params
#' @returns A [htmltools::div()] with Red and Amber flag counts.
#' @keywords internal
out_KRIColor <- function(dfResults) {
  intKRIColorCount <- c(
    Red = sum(abs(dfResults$Flag) == 2, na.rm = TRUE),
    Amber = sum(abs(dfResults$Flag) == 1, na.rm = TRUE)
  )
  div(
    out_KRIColor_pill(intKRIColorCount, "Red"),
    out_KRIColor_pill(intKRIColorCount, "Amber")
  )
}

#' KRI color pill
#'
#' @inheritParams shared-params
#' @returns A [htmltools::span()] with the count of the given color, with a class
#'   to match the color.
#' @keywords internal
out_KRIColor_pill <- function(intKRIColorCount, strColor) {
  n <- tryCatch(
    intKRIColorCount[[strColor]],
    error = function(e) 0L
  )
  label <- glue::glue("{n} {strColor} KRIs")
  span(
    class = glue::glue("badge badge-{tolower(strColor)} rounded-pill text-dark"),
    label
  )
}
