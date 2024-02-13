#' Site Details UI
#'
#' @export

site_details_ui <- function(id) {
    ns <- shiny::NS(id)

    ui <- tagList(
        shinyjs::useShinyjs(),
        div(class = "row",
            div(class = "col-12 col-sm-12 col-md-12 col-lg-4 col-xxl-3",
                div(class = "row",
                    div(class = "col-12 col-sm-6 col-md-6 col-lg-12 col-xxl-12",
                        div(id = ns("card_placeholder_site_metadata_list"),
                            class = "card mb-3",
                            style = "border-top: solid #0dcaf0",
                            div(class = "card-body",
                                h5(class = "card-title", "Site Metadata"),
                                hr(),
                                div(class = "card text-white bg-secondary",
                                    div(class = "card-body",
                                        div(class = "card-text",
                                            "Please select a site.")
                                    )
                                )
                            )
                        ),
                        shinyjs::hidden(
                            div(id = ns("card_site_metadata_list"),
                                class = "card mb-3",
                                #style = "max-width: 25rem; min-width: 17rem; border-top: solid #0dcaf0",
                                style = "border-top: solid #0dcaf0",
                                div(class = "card-body",
                                    h5(class = "card-title", "Site Metadata"),
                                    hr(),
                                    p(class = "card-text",
                                      uiOutput(ns("site_metadata_list"))
                                    )
                                )
                            )
                            )
                        ),
                    div(class = "col-12 col-sm-6 col-md-6 col-lg-12 col-xxl-12",
                        div(id = ns("card_placeholder_participant_status"),
                            class = "card mb-3",
                            style = "border-top: solid #0dcaf0",
                            div(class = "card-body",
                                h5(class = "card-title", "Participant Status"),
                                hr(),
                                div(class = "card text-white bg-secondary",
                                    div(class = "card-body",
                                        div(class = "card-text",
                                            "Please select a site.")
                                    )
                                )
                            )
                        ),
                        shinyjs::hidden(
                            div(id = ns("card_participant_status"),
                                class = "card mb-3",
                                #style = "max-width: 25rem; min-width: 17rem; border-top: solid #0dcaf0",
                                style = "border-top: solid #0dcaf0",
                                div(class = "card-body",
                                    h5(class = "card-title", "Participant Status"),
                                    hr(),
                                    p(class = "card-text",
                                      uiOutput(ns("participant_status_list"))
                                    )
                                )
                            )
                            )
                    )
                )
            ),
            div(class = "col-12 col-sm-12 col-md-12 col-lg-8 col-xxl-6",
                div(id = ns("card_placeholder_participants"),
                    class = "card mb-3",
                    style = "border-top: solid #0dcaf0",
                    div(class = "card-body",
                        h5(class = "card-title", "Site Participants"),
                        br(),
                        div(class = "card text-white bg-secondary",
                            div(class = "card-body",
                                div(class = "card-text",
                                    "Please select a site.")
                            )
                        )
                    )
                ),
                shinyjs::hidden(
                    div(id = ns("card_participants"),
                        class = "card mb-3",
                        style = "border-top: solid #0dcaf0",
                        div(class = "card-body",
                            h5(class = "card-title", "Site Participants"),
                              DT::DTOutput(ns('participants'))
                        )
                    )
                )
            )
        )
    )

    return(ui)
}

# site_details_ui <- function(id) {
#     ns <- shiny::NS(id)
#
#     ui <- shiny::tabPanel(
#         'Site Details',
#         shiny::tabsetPanel(
#             shiny::tabPanel(
#                 'Site Info',
#                 htmltools::h2('Participant Disposition'),
#                 DT::DTOutput(ns('participant_disposition_table')),
#                 htmltools::h2('Site Metadata'),
#                 DT::DTOutput(ns('site_metadata_table'))
#             ),
#             shiny::tabPanel(
#                 'Site Participants',
#                 DT::DTOutput(ns('participants'))
#             )
#         )
#     )
#
#     return(ui)
# }
