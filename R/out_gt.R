#' Interactive gt Table
#'
#' @inheritParams gt::opt_interactive
#' @param gt_object A [gt::gt()] object to use interactively.
#' @returns A [gt::gt()] with our standard options.
#' @keywords internal
out_gtInteractive <- function(gt_object, selection_mode = "single") {
  gt_object %>%
    gt::opt_interactive(
      use_resizers = TRUE,
      use_highlight = TRUE,
      use_compact_mode = TRUE,
      use_text_wrapping = TRUE,
      use_page_size_select = TRUE,
      selection_mode = selection_mode
    ) %>%
    gt::tab_options(
      table.background.color = "transparent",
      column_labels.background.color = "transparent"
    ) %>%
    gt::opt_row_striping()
}

#' Placeholder gt Table
#'
#' @param ... `character` Text to describe what is required, as a string,
#'   character vector, or multiple strings or character vectors.
#' @param id `character` An optional ID for the table.
#'
#' @returns A [gt::gt()] with a placeholder.
#' @keywords internal
out_gtPlaceholder <- function(..., id = NULL) {
  chrRequirements <- c(...)
  chrRequirements <- paste(choose_article(chrRequirements), chrRequirements)
  label <- cli::format_inline("Please select {chrRequirements}.")
  gt::gt(data.frame(no_data = label), id = id) %>%
    gt::tab_options(
      column_labels.hidden = TRUE,
      table.background.color = "#81e3f3"
    ) %>%
    gt::cols_align(align = "center") %>%
    gt::cols_width(no_data ~ gt::pct(100)) %>%
    gt::opt_table_lines("none")
}

#' Intelligently format numeric data
#'
#' @inheritParams out_gtInteractive
#' @returns A [gt::gt()] with numeric formatting applied.
#' @keywords internal
out_gtSmartFmtNumbers <- function(gt_object, intMaxDecimals = 5L) {
  df <- gt_object$`_data`
  cols <- purrr::map_lgl(df, ~ is.numeric(.x) & !rlang::is_integerish(.x))
  purrr::reduce(
    names(cols)[cols],
    function(gt_object, col_name) {
      decimals_to_keep <- FindNonZeroDecimals(df[[col_name]], intMaxDecimals)
      gt::fmt_number(gt_object, decimals = decimals_to_keep, columns = col_name)
    },
    .init = gt_object
  )
}
