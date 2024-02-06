#' Create Summary table in KRIReport.Rmd for each KRI
#' @param lAssessment `list` List of KRI assessments from `params` within `KRIReport.Rmd`.
#' @param dfSite `data.frame` Optional site-level metadata.
#' @importFrom htmltools p
#' @importFrom htmltools strong
#' @importFrom DT datatable
#' @export
#' @keywords internal

MakeSummaryTable <- function(lAssessment, dfSite = NULL) {
    active <- lAssessment[!sapply(lAssessment, is.data.frame)]
    map(active, function(kri) {
        if (kri$bStatus) {
            dfSummary <- kri$lResults$lData$dfSummary

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
                        Flag = map(.data$Flag, kri_directionality_logo),
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
                        everything()
                    ) %>%
                    DT::datatable(
                        rownames = FALSE
                    )
            } else {
                htmltools::p("Nothing flagged for this KRI.")
            }
        } else {
            htmltools::strong("Workflow failed.")
        }
    })
}
