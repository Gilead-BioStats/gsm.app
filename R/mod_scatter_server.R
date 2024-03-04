modScatterServer <- function(id, snapshot, site) {
    shiny::moduleServer(
        id,
        function(input, output, session) {

            output$all_charts <- renderUI({
                purrr::map(snapshot$lCharts, function(x) {
                    the_chart <- x$scatterJS
                    the_chart$x$selectedGroupIDs <- site()
                    the_chart$x$bHideDropdown <- TRUE
                    the_chart$x$siteSelectLabelValue <- ""
                    tags$div(class = 'chart', the_chart %>% htmlwidgets::onRender('
  function(el, x) {
    el.style.width = null;
    el.style.height = null;
  }
'))
                })
            })


        }
    )
}
