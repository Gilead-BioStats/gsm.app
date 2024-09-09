out_Sidebar <- function(lStudy, chrMetrics, chrSites) {
  column(
    width = 3,
    id = "sidebar",
    out_StudyInformation(lStudy = lStudy),
    out_Inputs(
      chrMetrics = chrMetrics,
      chrSites = chrSites
    )
  )
}

out_StudyInformation <- function(lStudy) {
  strProtocolNumber <- lStudy$protocol_number
  strNickname <- lStudy$nickname
  strSnapshotDate <- lStudy$snapshot_date
  lStudyMetadata <- lStudy
  lStudyMetadata$protocol_number <- NULL
  lStudyMetadata$nickname <- NULL
  lStudyMetadata$snapshot_date <- NULL

  bslib::card(
    bslib::card_header(
      h5(strProtocolNumber),
      h6(class = "card-subtitle mb-2 text-muted", strNickname),
      h6(class = "card-subtitle text-muted", strSnapshotDate)
    ),
    out_MetadataList(
      gsm::MakeParamLabelsList(names(lStudyMetadata)),
      unname(lStudyMetadata)
    )
  )
}

out_Inputs <- function(chrMetrics, chrSites) {
  bslib::card(
    class = "overflow-on",
    bslib::card_body(
      class = "overflow-on",
      selectInput(
        "metric",
        strong("Metric"),
        choices = chrMetrics,
        width = "100%"
      ),
      selectInput(
        "site",
        strong("Site"),
        choices = c("None", chrSites),
        width = "100%"
      ),
      selectizeInput(
        "participant",
        strong("Participant"),
        choices = c("None"),
        width = "100%"
      ),
      actionButton("reset", "Reset All", class = "btn btn-primary btn-sm")
    )
  )
}
