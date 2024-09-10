out_KRIColor <- function(dfResults) {
  dfKRIColorCount <- dfResults %>%
    dplyr::mutate(
      Color = dplyr::case_when(
        abs(.data$Flag) == 2 ~ "Red",
        abs(.data$Flag) == 1 ~ "Amber"
      ),
      .keep = "none"
    ) %>%
    dplyr::filter(!is.na(Color)) %>%
    dplyr::summarize(n = dplyr::n(), .by = "Color")
  div(
    out_KRIColor_pill(dfKRIColorCount, "Red"),
    out_KRIColor_pill(dfKRIColorCount, "Amber")
  )
}

out_KRIColor_pill <- function(dfKRIColorCount, strColor) {
  n <- dfKRIColorCount$n[dfKRIColorCount$Color == strColor]
  n <- n %|0|% 0
  n <- n[[1]]
  label <- glue::glue("{n} {strColor} KRIs")
  span(
    class = glue::glue("badge badge-{tolower(strColor)} rounded-pill text-dark"),
    label
  )
}
