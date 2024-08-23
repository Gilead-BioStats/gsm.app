div_ParticipantMetadata <- function(lParticipantMetadata) {
  if (!length(lParticipantMetadata)) {
    return(
      div_ParticipantMetadata_Wrapper(div_ParticipantMetadata_Placeholder())
    )
  }
  tag_return <- lParticipantMetadata %>%
    purrr::imap(div_ParticipantMetadata_Item) %>%
    tags$div(
      class = "row p-2"
    )
  return(div_ParticipantMetadata_Wrapper(tag_return))
}

div_ParticipantMetadata_Wrapper <- function(divParticipantMetadataCore) {
  div(
    class = "col-12 col-sm-8 col-md-6 col-lg-5 col-xl-3 col-xxl-3",
    div(
      class = "card mb-3",
      div(
        class = "card-body",
        h5(class = "card-title", "Participant Metadata"),
        hr(),
        divParticipantMetadataCore
      )
    )
  )
}

div_ParticipantMetadata_Placeholder <- function() {
  div(
    class = "card placeholder",
    div(
      class = "card-body",
      div(
        class = "card-text",
        "Please select a participant."
      )
    )
  )
}

div_ParticipantMetadata_Item <- function(strValue, strName) {
  # TODO: 100% of this style/class stuff should be rolled up into a class or
  # two.
  #
  # TODO: Apply capitalization/spacing to strName.
  tags$div(
    class = "col-12",
    style = "font-weight: 500;",
    tags$div(
      style = "display: flex; justify-content: space-between;",
      tags$div(
        class = "card-text",
        style = "text-align: left; white-space: nowrap;",
        strName
      ),
      tags$div(
        class = "text-secondary",
        style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"
      ),
      tags$div(
        class = "card-text",
        style = "text-align: right; white-space: nowrap;",
        strValue
      )
    )
  )
}
