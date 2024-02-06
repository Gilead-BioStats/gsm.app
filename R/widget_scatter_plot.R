#' Generate Scatter Plot Widget
#'
#' @export

widget_scatter_plot <- function(
    data,
    config,
    bounds,
    siteid = NULL,
    width = NULL,
    height = NULL,
    elementId = 'widget_scatter_plot'
) {
    cli::cli_alert_info(
        'Site ID: {siteid}'
    )

    inputs <- list(
        data = jsonlite::toJSON(
            data %>% dplyr::rename_with(tolower),
            na = "string"
        ),
        config = jsonlite::toJSON(as.list(config)),
        bounds = bounds %>%
            dplyr::rename_with(tolower) %>%
            jsonlite::toJSON(),
        siteid = as.character(siteid)
    )

    # create widget
    htmlwidgets::createWidget(
        name = "widget_scatter_plot",
        inputs,
        width = width,
        height = height,
        package = "gsmApp",
        elementId = 'widget_scatter_plot'
    )
}

#' Shiny bindings for widget_scatter_plot
#'
#' `r lifecycle::badge("stable")`
#'
#' Output and render functions for using widget_scatter_plot within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'     \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'     string and have \code{'px'} appended.
#' @param expr An expression that generates a widget_scatter_plot
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'     is useful if you want to save an expression in a variable.
#'
#' @name widget_scatter_plot-shiny
#'
#' @export
widget_scatter_plot_output <- function(outputId, width = "100%", height = "400px") {
    htmlwidgets::shinyWidgetOutput(outputId, "widget_scatter_plot", width, height, package = "gsmApp")
}

#' @rdname widget_scatter_plot-shiny
#' @export
render_widget_scatter_plot <- function(expr, env = parent.frame(), quoted = FALSE) {
    if (!quoted) {
        expr <- substitute(expr)
    } # force quoted

    htmlwidgets::shinyRenderWidget(expr, widget_scatter_plot_output, env, quoted = TRUE)
}
