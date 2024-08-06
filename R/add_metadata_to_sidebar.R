add_metadata_to_sidebar <- function(input, output, session, dfStudy, vSnapshotDate) {
  output$text_output_name <- renderText({
    dfStudy$Value[dfStudy$Param == "nickname"]
  })

  output$text_output_study_id <- renderText({
    dfStudy$Value[dfStudy$Param == "protocol_number"]
  })

  output$text_output_snapshot_date <- renderText({
    format(vSnapshotDate, "%Y-%m-%d")
  })

  output$meta_tag_list <- renderUI({
    side_panel_meta_tag_list(dfStudy)
  })
}
