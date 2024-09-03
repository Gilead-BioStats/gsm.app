out_MainTabs <- function(strTitle = "GSM Deep Dive") {
  column(
    width = 9,
    class = "pt-1",
    bslib::navset_bar(
      bslib::nav_panel(
        title = "Study Overview",
        mod_StudyOverview_UI("study_overview")
      ),
      bslib::nav_panel(
        title = "Metric Details",
        mod_MetricDetails_UI("metric_details"),
        mod_SiteDetails_UI("site_details")
      ),
      bslib::nav_panel(
        title = "Participant Details",
        mod_ParticipantDetails_UI("participant_details")
      ),
      id = "primary_nav_bar",
      title = strTitle,
      padding = 0,
      position = "fixed-top",
      bg = "white"
    )
  )
}
