#' Define a Shiny server function given an workflow
#'
#' @param workflow `list` workflow specification
#'
#' @importFrom DiagrammeR renderGrViz
#' @importFrom DT renderDT
#' @importFrom gsm RunWorkflow
#' @importFrom plotly config ggplotly renderPlotly
#' @importFrom purrr imap keep map_dbl
#' @importFrom shiny renderPlot
#'
#' @return `function` Shiny server function
#'
#' @export

make_workflow_server <- function(
    workflow,
    assessments,
    thresholds,
    domain_data
) {
    workflow_server <- function(input, output, session, params) {
        observe_method(input, session, workflow, thresholds)

        run_workflow <- reactive({
            # TODO: figure out why multi-input-domain workflows return a named list of data frames
            # (every workflow except enrollment) and single-input-domain workflows return the data
            # frame itself (enrollment workflow)
            data <- params()$data
            settings <- params()$settings

            mapping_step <- workflow$steps[[
                match(
                    '_map_',
                    workflow$steps %>%
                        map_chr(~sub('.*(_map_).*', '\\1', .x$name, TRUE)) %>%
                        tolower()
                )
            ]]

            assessment_step <- workflow$steps[[
                match(
                    'assess',
                    workflow$steps %>%
                        map_chr(~sub('.*(assess).*', '\\1', .x$name, TRUE)) %>%
                        tolower()
                )
            ]]

            # TODO: figure out whether {gsm} or {safetyGraphics} needs an update when a single data
            # frame is returned by `params()` (probably safetyGraphics, which returns a named list
            # if multiple data frames are specified, and the data frame itself otherwise)
            if (!'list' %in% class(data)) {
                data <- domain_data[mapping_step$inputs]
                # TODO: figure out why to do about participant subset
                #data <- list(data)
                #names(data) <- mapping_step$inputs
            }

            if (all(!mapping_step$inputs %in% names(settings))) {
                settings <- list(settings)
                names(settings) <- mapping_step$inputs
            }

            # TODO: allow for nonexistent assessment
            defaults <- assessments[[ assessment_step$name ]]

            params <- assessment_step$params %>%
                purrr::imap(function(param, key) {
                    default <- defaults[[ key ]]
                    value <- NULL

                    # TODO: helper functions for each input type
                    if (default$type == 'character') {
                        value = input[[ key ]]
                    } else if (default$type == 'numeric') {
                        if (length(default$default) > 1) {
                            value = names(input) %>%
                                keep(~grepl(key, .x)) %>%
                                map_dbl(~input[[ .x ]]) %>%
                                sort()
                        } else {
                            value = input[[ key ]]
                        }
                    }

                    value
                })

            workflow$steps[[ 
                match(
                    'assess',
                    workflow$steps %>%
                        map_chr(~sub('.*(assess).*', '\\1', .x$name, TRUE)) %>%
                        tolower()
                )
            ]]$params <- params

            result <- RunWorkflow(
                lWorkflow = workflow,
                lData = data,
                lMapping = settings,
                #bQuiet = FALSE,
                bFlowchart = TRUE
            )

            result
        })

        #observe({
        #    updateSelectInput(
        #        session,
        #        'site_select',
        #        choices = c(
        #            'None',
        #            unique(
        #                params()$data$dfSUBJ[[
        #                    params()$settings$dfSUBJ$strSiteCol
        #                ]]
        #            )
        #        )
        #    )
        #})

        # Charts
        output$bar_chart_score <- gsm::renderBarChart({ run_workflow()$lResults$lCharts$barScoreJS })
        output$bar_chart_metric <- gsm::renderBarChart({ run_workflow()$lResults$lCharts$barMetricJS })
        output$scatter_plot <- gsm::renderScatterPlot({ run_workflow()$lResults$lCharts$scatterJS })
        #output$scatter_plot_experimental <- htmlwidgets::shinyRenderWidget({
        #    result <- run_workflow()
        #    # TODO: pass custom click callaback to ScatterPlot
        #    scatterPlot(
        #        result$lResults$lData$dfSummmary,
        #        MakeDfConfig(
        #            strMethod = 'method',
        #            strGroup = 'group',
        #            strAbbreviation = 'domain',
        #            strMetric = 'metric',
        #            strNumerator = 'numerator',
        #            strDenominator = 'denominator',
        #            vThreshold = c(-3,-2,2,3)
        #        ),
        #        result$lResults$lData$dfBounds,
        #        addSiteSelect = FALSE,
        #        clickCallback = JS(sprintf(
        #            '(data) => {
        #                console.table(data);
        #                // get class/id of container of this module > pull the prefix before dash
        #                // Shiny.setInputValue("%s", data);
        #            });',
        #            session$ns("site_select")
        #        ))
        #    )
        #})

        # Flowchart
        output$flowchart <- DiagrammeR::renderGrViz({ run_workflow()$lChecks$flowchart[[1]] })

        # Data
        # TODO: workflow runs redundantly here?
        output$data_summary <- DT::renderDT({ run_workflow()$lResults$lData$dfSummary })
        output$data_flagged <- DT::renderDT({ run_workflow()$lResults$lData$dfFlagged })
        output$data_analyzed <- DT::renderDT({ run_workflow()$lResults$lData$dfAnalyzed })
        output$data_transformed <- DT::renderDT({ run_workflow()$lResults$lData$dfTransformed })
        output$data_input <- DT::renderDT({ run_workflow()$lData$dfInput })

        # workflow
        output$workflow_steps <- shiny::renderPrint({
            jsonlite::toJSON(
                run_workflow()$steps,
                auto_unbox = TRUE,
                digits = 4,
                pretty = TRUE
            )
        })

        workflow$assessment <- run_workflow

        run_workflow
    }

    workflow_server
}
