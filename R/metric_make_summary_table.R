#' Create Summary table in KRIReport.Rmd for each KRI
#' @param lAssessment `list` List of KRI assessments from `params` within `KRIReport.Rmd`.
#' @param dfSite `data.frame` Optional site-level metadata.
#' @importFrom htmltools p
#' @importFrom htmltools strong
#' @importFrom DT datatable
#' @export
#' @keywords internal

make_summary_table <- function(lAssessment, dfSite = NULL) {
    active <- lAssessment[!sapply(lAssessment, is.data.frame)]

    if (active$bStatus) {
            dfSummary <- active$lResults$lData$dfSummary

            if (!is.null(dfSite)) {
                dfSummary <- dfSummary %>%
                    left_join(
                        dfSite %>% select("siteid", "country", "status", "enrolled_participants"),
                        c("GroupID" = "siteid")
                    )
            }

            if (nrow(dfSummary) > 0 &
                any(c(-2, -1, 1, 2) %in% unique(dfSummary$Flag))) {
                dfSummary %>%
                    filter(
                        .data$Flag != 0
                    ) %>%
                    arrange(desc(abs(.data$Score))) %>%
                    mutate(
                        Flag = map(.data$Flag, gsm::kri_directionality_logo),
                        across(
                            where(is.numeric),
                            ~ round(.x, 3)
                        )
                    ) %>%
                    select(
                        any_of(c(
                            "Site" = "GroupID",
                            "Country" = "country",
                            "Status" = "status",
                            "Subjects" = "enrolled_participants"
                        )),
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
                            selection = 'none')
                    )
            }
        }
}
