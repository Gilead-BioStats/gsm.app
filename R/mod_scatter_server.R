modScatterServer <- function(id, snapshot, site) {
    shiny::moduleServer(
        id,
        function(input, output, session) {
            output$all_charts <- renderUI({
                div(
                    class = 'row',
                    purrr::map(snapshot$lCharts, function(x) {
                        the_chart <- x$scatterJS
                        the_chart$x$selectedGroupIDs <- site()
                        the_chart$x$bHideDropdown <- TRUE
                        the_chart$x$siteSelectLabelValue <- ''
                        div(
                            class = 'col-12 col-sm-12 col-md-12 col-lg-6 col-xxl-4',
                            div(
                                class = 'card mb-3',
                                style = 'border-top: solid #0dcaf0;',
                                div(
                                    class = 'card-body',
                                    tags$div(
                                        class = 'chart',
                                        the_chart %>% htmlwidgets::onRender('
                                      function(el, x) {
                                        el.style.width = null;
                                        el.style.height = null;
                                      }
                                    ')
                                    )
                                )
                            )
                        )
                    })
                )
            })
        }
    )
}
