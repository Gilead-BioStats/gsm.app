#' Define Server
#'
#' @param input Shiny inputs
#' @param output Shiny outputs
#' @param session Shiny session
#' @param snapshot The snapshot `list` object passed from `run_app()`
#'
#' @export

server <- function(input, output, session, snapshot) {

    # Side Panel

    output$text_output_name <- renderText({
        snapshot$lInputs$lMeta$meta_study$nickname
    })

    output$text_output_study_id <- renderText({
        snapshot$lInputs$lMeta$meta_study$protocol_number
    })

    output$text_output_snapshot_date <- renderText({
        format(snapshot$lSnapshotDate, "%Y-%m-%d")
    })

    output$meta_tag_list <- renderUI({
        side_panel_meta_tag_list(snapshot)
    })

    # Study
    add_metric_observer(snapshot, reactive(input$metric))
    study_overview_server('study_overview', snapshot)

    # Metric
    update_metric_select(input, output, session, snapshot)
    metric_details_server(
        'metric_details',
        snapshot,
        reactive(input$metric),
        reactive(input$site)
    )

    # Site
    update_site_select(input, output, session, snapshot)
    site_details_server(
        'site_details',
        snapshot,
        reactive({input$site})
    )

    # Participant
    update_participant_select(input, output, session, snapshot)
    participant_details_server(
        'participant_details',
        snapshot,
        shiny::reactive(input$participant)
    )

    observeEvent(input$participant, {
        if (input$participant != "None" & input$participant != "") {
            nav_select("primary_nav_bar", "Participant Details")
        }
    }, ignoreInit = TRUE)

}
