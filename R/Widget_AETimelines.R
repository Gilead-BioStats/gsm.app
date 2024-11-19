#' AE Timelines Widget
#'
#' @param data `data.frame` A data frame with columns:
#'   - Participant ID
#'   - AE Sequence Number
#'   - AE Start Day
#'   - AE End Day
#'   - AE Term
#'   - AE Severity
#'   - AE Seriousness
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export

Widget_AETimelines <- function(
    data,
    settings = list(
        id_col = 'subjid',
        seq_col = 'aeseq',
        stdy_col = 'aest_dy',
        endy_col = 'aeen_dy',
        term_col = 'mdrpt_nsv',
        color = list(
            value_col = 'aetoxgr',
            label = 'Toxicity Grade'
        ),
        highlight = list(
            value_col = 'aeser',
            label = 'Serious Event'
        )
    ),
    width = NULL,
    height = NULL,
    elementId = NULL
) {

  # forward options using x
  x <- list(
    data = data,
    settings = settings
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'Widget_AETimelines',
    x,
    width = width,
    height = height,
    package = 'gsm.app',
    elementId = elementId
  )
}

#' Shiny bindings for Widget_AETimelines
#'
#' Output and render functions for using Widget_AETimelines within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a Widget_AETimelines
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name Widget_AETimelines-shiny
#'
#' @export
Widget_AETimelinesOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'Widget_AETimelines', width, height, package = 'gsm.app')
}

#' @rdname Widget_AETimelines-shiny
#' @export
renderWidget_AETimelines <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, Widget_AETimelinesOutput, env, quoted = TRUE)
}
