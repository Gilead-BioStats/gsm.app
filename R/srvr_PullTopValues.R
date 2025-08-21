srvr_PullTopValues <- function(rctv_dfDomain_Study, rctv_strCategory) {
  reactive({
    req(rctv_dfDomain_Study())
    req(rctv_strCategory())
    if (!NROW(rctv_dfDomain_Study())) {
      return(character())
    }
    strCategory <- rctv_strCategory()
    # We keep 1 category that will be replaced with "Other" if there are more
    # than 6 categories. So 5 cats = show all 5, 6 cats = show all 6, 7+ cats
    # = show top 5 + "Other".
    n <- 6
    rctv_dfDomain_Study() %>%
      dplyr::count(.data[[strCategory]], sort = TRUE) %>%
      dplyr::pull(strCategory) %>%
      utils::head(n) %>%
      as.character()
  })
}
