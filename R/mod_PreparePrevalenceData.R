mod_PreparePrevalenceData_Server <- function(
  id,
  strLevel,
  l_rctvActive,
  rctv_dfData,
  rctv_strGroupLevel,
  ...
) {
  moduleServer(id, function(input, output, session) {
    rctv_dfDomain_Prepared <- reactiveVal(NULL)
    dots <- list(...)
    observe({
      req(rctv_strGroupLevel())
      purrr::walk(
        dots,
        ~ req(.x())
      )
      dot_checks <- purrr::map_lgl(
        dots,
        ~ length(NullifyEmpty(.x())) > 0
      )
      if (all(dot_checks) && length(NullifyEmpty(l_rctvActive[[strLevel]]()))) {
        df <- PreparePrevalenceData(
          df = rctv_dfData(),
          strGroupLevel = rctv_strGroupLevel(),
          strLevel = strLevel
        )
        rctv_dfDomain_Prepared(df)
      } else {
        rctv_dfDomain_Prepared(NULL)
      }
    })
    return(rctv_dfDomain_Prepared)
  })
}

PreparePrevalenceData <- function(df, strGroupLevel, strLevel) {
  if (!NROW(df)) {
    return(NULL)
  }
  if ("GroupLevel" %in% colnames(df)) {
    df <- dplyr::filter(df, .data$GroupLevel == strGroupLevel)
  }
  df |>
    dplyr::select(-dplyr::any_of(c("GroupID", "GroupLevel", "SubjectID"))) |>
    dplyr::mutate(VizLevel = strLevel)
}
