#' Create Summary table in KRIReport.Rmd for each KRI
#'
#' @inheritParams shared-params
#' @export
#' @keywords internal
make_summary_table <- function(lAssessment, dfSite = NULL) {
  active <- lAssessment[!sapply(lAssessment, is.data.frame)]

  if (active$bStatus) {
    dfSummary <- active$lResults$lData$dfSummary

    if (!is.null(dfSite)) {
      dfSummary <- dfSummary %>%
        dplyr::left_join(
          dfSite %>% dplyr::select("siteid", "country", "status", "enrolled_participants"),
          c("GroupID" = "siteid")
        )
    }

    if (nrow(dfSummary) && any(c(-2, -1, 1, 2) %in% unique(dfSummary$Flag))) {
      dfSummary %>%
        dplyr::filter(
          .data$Flag != 0
        ) %>%
        dplyr::arrange(dplyr::desc(abs(.data$Score))) %>%
        dplyr::mutate(
          # TODO: Update this?
          # Flag = purrr::map(.data$Flag, gsm::kri_directionality_logo),
          dplyr::across(
            dplyr::where(is.numeric),
            ~ round(.x, 3)
          )
        ) %>%
        dplyr::select(
          dplyr::any_of(c(
            "Site" = "GroupID",
            "Country" = "country",
            "Status" = "status",
            "Subjects" = "enrolled_participants"
          )),
          "Numerator",
          "Denominator",
          "Metric",
          "Score",
          "Flag"
        ) %>%
        DT::datatable(
          rownames = FALSE,
          class = "compact",
          options = list(
            lengthChange = FALSE,
            paging = FALSE,
            searching = FALSE,
            selection = "none"
          )
        )
    }
  }
}
