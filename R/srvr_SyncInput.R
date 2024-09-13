srvr_SyncInput <- function(
    strID,
    rctv_strValue,
    session = getDefaultReactiveDomain()
) {
  observe({
    updateSelectInput(
      inputId = strID,
      selected = rctv_strValue(),
      session = session
    )
  })
}

srvr_SyncSelectizeInput <- function(
    strID,
    rctv_strValue,
    chrChoices,
    ...,
    session = getDefaultReactiveDomain()
) {
  observe({
    strValue <- rctv_strValue()
    if (length(strValue) && strValue != "" && strValue != "None") {
      updateSelectizeInput(
        inputId = strID,
        choices = chrChoices,
        selected = strValue,
        ...,
        session = session
      )
    }
  })
}
