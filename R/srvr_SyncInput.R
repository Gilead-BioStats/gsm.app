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
