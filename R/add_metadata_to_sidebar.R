add_metadata_to_sidebar <- function(input, output, session, dfStudy, vSnapshotDate) {
  output$text_output_name <- renderText({
    dfStudy %>%
      filter(Param == "nickname") %>%
      .$Value
  })

  output$text_output_study_id <- renderText({
    dfStudy %>%
      filter(Param == "protocol_number") %>%
      .$Value
  })

  output$text_output_snapshot_date <- renderText({
    format(vSnapshotDate, "%Y-%m-%d")
  })

  output$meta_tag_list <- renderUI({
    side_panel_meta_tag_list(dfStudy)
  })
}
