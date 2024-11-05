out_PlaceholderGT <- function(...) {
  chrRequirements <- c(...)
  chrRequirements <- paste(choose_article(chrRequirements), chrRequirements)
  label <- cli::format_inline("Please select {chrRequirements}.")
  gt::gt(data.frame(no_data = label)) %>%
    gt::tab_options(
      column_labels.hidden = TRUE,
      table.background.color = "#FFFFFF00"
    ) %>%
    gt::cols_align(align = "center") %>%
    gt::cols_width(no_data ~ gt::pct(100)) %>%
    gt::opt_table_lines("none")
}
