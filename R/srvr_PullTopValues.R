#' Find frequent values reactively
#'
#' @inheritParams shared-params
#' @returns A reactive that returns an ordered character vector of the top 6
#'   categories (or fewer if there are fewer than 6 total categories in the
#'   data).
#' @keywords internal
srvr_PullTopValues <- function(rctv_dfDomain, rctv_strCategory) {
  reactive({
    req(rctv_dfDomain())
    req(rctv_strCategory())
    PullTopValues(rctv_dfDomain(), rctv_strCategory())
  })
}

#' Find frequent values
#'
#' @inheritParams shared-params
#' @returns An ordered character vector of the top 6 categories (or fewer if
#'   there are fewer than 6 total categories in the data).
#' @keywords internal
PullTopValues <- function(dfDomain, strCategory) {
  if (!NROW(dfDomain)) {
    return(character())
  }
  if (!strCategory %in% colnames(dfDomain)) {
    return(character())
  }

  # Only keep the "highest" level.
  chrLevels <- unique(dfDomain$VizLevel)
  if ("Study" %in% chrLevels) {
    dfDomain <- dplyr::filter(dfDomain, .data$VizLevel == "Study")
  } else if ("Group" %in% chrLevels) {
    dfDomain <- dplyr::filter(dfDomain, .data$VizLevel == "Group")
  }

  # We keep 1 category that will be replaced with "Other" if there are more
  # than 6 categories. So 5 cats = show all 5, 6 cats = show all 6, 7+ cats
  # = show top 5 + "Other".
  n <- 6
  if (length(unique(dfDomain[[strCategory]])) > 6) {
    n <- 5
  }

  dfDomain %>%
    dplyr::count(.data[[strCategory]], sort = TRUE) %>%
    dplyr::pull(strCategory) %>%
    utils::head(n) %>%
    as.character()
}
