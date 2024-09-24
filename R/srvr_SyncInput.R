srvr_SyncInput <- function(
  id,
  rctv_strValue,
  session = getDefaultReactiveDomain()
) {
  observe({
    updateSelectInput(
      inputId = id,
      selected = rctv_strValue(),
      session = session
    )
  })
}

srvr_SyncSelectizeInput <- function(
  id,
  rctv_strValue,
  chrChoices,
  ...,
  session = getDefaultReactiveDomain()
) {
  observe({
    strValue <- rctv_strValue()
    if (length(strValue) && strValue != "" && strValue != "None") {
      updateSelectizeInput(
        inputId = id,
        choices = chrChoices,
        selected = strValue,
        ...,
        session = session
      )
    }
  })
}
