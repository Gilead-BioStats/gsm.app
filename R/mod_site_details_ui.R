#' Site Details UI
#'
#' @inheritParams shared-params
#'
#' @export

site_details_ui <- function(id) {
    ns <- shiny::NS(id)

    ui <- tagList(
        shinyjs::useShinyjs(),
        div(
            class = 'row',
            div(
                class = 'col-12 col-sm-12 col-md-12 col-lg-10 col-xxl-3',
                div(
                    class = 'row',
                    div(
                        class = 'col-12 col-sm-6 col-md-6 col-lg-6 col-xxl-12', # "col-12 col-sm-6 col-md-6 col-lg-3 col-xxl-3",
                        div(
                            id = ns('card_placeholder_metric_meta_data'),
                            class = 'card mb-3',
                            style = 'border-top: solid #0dcaf0',
                            div(
                                class = 'card-body',
                                h5(class = 'card-title', 'Metric Metadata'),
                                hr(),
                                p(
                                    class = 'card-text',
                                    uiOutput(ns('metric_metadata_list'))
                                )
                            )
                        )
                    ),
                    div(
                        class = 'col-12 col-sm-6 col-md-6 col-lg-6 col-xxl-12', # "col-12 col-sm-6 col-md-6 col-lg-3 col-xxl-3",
                        div(
                            id = ns('card_placeholder_site_metadata_list'),
                            class = 'card mb-3',
                            style = 'border-top: solid #0dcaf0',
                            div(
                                class = 'card-body',
                                h5(class = 'card-title', 'Site Details'),
                                hr(),
                                div(
                                    class = 'card placeholder',
                                    div(
                                        class = 'card-body',
                                        div(
                                            class = 'card-text',
                                            'Please select a site.'
                                        )
                                    )
                                )
                            )
                        ),
                        shinyjs::hidden(
                            div(
                                id = ns('card_site_metadata_list'),
                                class = 'card mb-3',
                                # style = "max-width: 25rem; min-width: 17rem; border-top: solid #0dcaf0",
                                style = 'border-top: solid #0dcaf0',
                                div(
                                    class = 'card-body',
                                    h5(class = 'card-title', 'Site Metadata'),
                                    hr(),
                                    p(
                                        class = 'card-text',
                                        uiOutput(ns('site_metadata_list'))
                                    )
                                )
                            )
                        )
                    )
                )
            ),
            # div(class = "row",
            div(
                class = 'col-12 col-sm-12 col-md-12 col-lg-12 col-xxl-9',
                div(
                    id = ns('card_placeholder_participants'),
                    class = 'card mb-3',
                    style = 'border-top: solid #0dcaf0',
                    div(
                        class = 'card-body',
                        h5(class = 'card-title', 'Site Participants'),
                        br(),
                        div(
                            class = 'card placeholder',
                            div(
                                class = 'card-body',
                                div(
                                    class = 'card-text',
                                    'Please select a site.'
                                )
                            )
                        )
                    )
                ),
                shinyjs::hidden(
                    div(
                        id = ns('card_participants'),
                        class = 'card mb-3',
                        style = 'border-top: solid #0dcaf0',
                        div(
                            class = 'card-body',
                            h5(class = 'card-title', 'Site Participants'),
                            DT::DTOutput(ns('participants'))
                        )
                    )
                )
            )
        )
    )
    return(ui)
}
