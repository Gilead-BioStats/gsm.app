#' Site Details UI
#'
#' @import stringr
#'
#' @export

site_details_ui <- function(id) {
    ns <- shiny::NS(id)

    ui <- tagList(
        div(class = "row",
            div(class = "col-3",
                div(class = "card mb-3",
                    style = "max-width: 25rem; min-width: 17rem; border-top: solid #0dcaf0",
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
