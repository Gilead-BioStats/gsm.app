cleanColumn <- function(df) {
  if (NROW(df) && "enrollyn" %in% colnames(df)) {
    df <- dplyr::mutate(
      df,
      enrollyn = !is.na(.data$enrollyn) & tolower(.data$enrollyn) == "y"
    )
  }
  return(df)
}
