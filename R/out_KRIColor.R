out_KRIColor <- function(dfResults) {
  intKRIColorCount <- c(
    Red = sum(abs(dfResults$Flag) == 2),
    Amber = sum(abs(dfResults$Flag) == 1)
  )
  div(
    out_KRIColor_pill(intKRIColorCount, "Red"),
    out_KRIColor_pill(intKRIColorCount, "Amber")
  )
}

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
