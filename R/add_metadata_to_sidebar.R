add_metadata_to_sidebar <- function(input, output, session, snapshot) {
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
}
