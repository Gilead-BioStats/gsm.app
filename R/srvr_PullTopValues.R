srvr_PullTopValues <- function(rctv_dfDomain, rctv_strCategory) {
  reactive({
    req(rctv_dfDomain())
    req(rctv_strCategory())
    df <- rctv_dfDomain()
    if (!NROW(df)) {
      return(character())
    }

    # Only keep the "highest" level.
    chrLevels <- unique(df$VizLevel)
    if ("Study" %in% chrLevels) {
      df <- dplyr::filter(df, .data$VizLevel == "Study")
    } else if ("Group" %in% chrLevels) {
      df <- dplyr::filter(df, .data$VizLevel == "Group")
    }

    strCategory <- rctv_strCategory()
    # We keep 1 category that will be replaced with "Other" if there are more
    # than 6 categories. So 5 cats = show all 5, 6 cats = show all 6, 7+ cats
    # = show top 5 + "Other".
    n <- 6
    df %>%
      dplyr::count(.data[[strCategory]], sort = TRUE) %>%
      dplyr::pull(strCategory) %>%
      utils::head(n) %>%
      as.character()
  })
}
