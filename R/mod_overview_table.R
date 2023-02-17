#' Define a Shiny UI function given an assessment
#'
#' @param assessment `list` assessment specification
#'
#' @importFrom gt gt_output
#' @import shiny
#'
#' @return `function` Shiny UI function
#'
#' @export

#make_assessment_ui <- function(assessment) {
    overview_table_ui <- function(id) {
        ns <- shiny::NS(id)

        shiny::sidebarLayout(
            shiny::sidebarPanel(
            ),
            shiny::mainPanel(
                gt::gt_output(ns('overview_table'))
            )
        )
    }
#
#    assessment_ui
#}

#' Define a Shiny server function given an assessment
#'
#' @param assessment `list` assessment specification
#'
#' @importFrom gsm Study_Assess Overview_Table
#' @import gt
#' @import shiny
#'
#' @return `function` Shiny server function
#'
#' @export

#make_assessment_server <- function(
#    assessment
#) {
    overview_table_server <- function(input, output, session, params) {
        output$overview_table <- gt::render_gt({
            data <- params()$data
            mapping <- params()$settings %>%
                map_meta_to_gsm()

            assessment <- gsm::Study_Assess(
                lData = data,
                lMapping = mapping,
                bQuiet = TRUE
            )

            summary <- assessment %>%
                purrr::map(~ .x$lResults) %>%
                purrr::compact() %>%
                purrr::map_df(~ .x$dfSummary)

            overview_table <- gsm::Overview_Table(summary)

            overview_tbl <- overview_table$df_summary %>%
                dplyr::mutate(
                    dplyr::across(
                        tidyselect::everything(),
                        ~map(., ~gt::html(.))
                    )
                ) %>%
                gt::gt() %>%
                gt::tab_style(
                    style = list(
                        gt::cell_text(color='white', align="left", weight="bold"),
                        gt::cell_fill(color='#50504f')
                    ),
                    locations = gt::cells_body(columns = 1)
                ) %>%
                gt::tab_style(
                    style = list(
                        gt::cell_text(color='white', align="center", weight="bold"),
                        gt::cell_fill(color="#c73442")
                    ),
                  locations = gt::cells_column_labels()
                ) %>%
                gt::tab_style(
                    style = list(
                        gt::cell_fill(color='#f8f9fa')
                    ),
                    locations = gt::cells_body(columns = -Title, rows = 1:2)
                )

            if (!is.null(overview_table$footnote)) {
                overview_tbl %>%
                    gt::tab_footnote(
                        footnote = overview_table$footnote,
                        locations = gt::cells_column_labels(
                            columns = Title
                        )
                    )
            } else {
                overview_tbl
            }
        })
    }
#
#    assessment_server
#}
