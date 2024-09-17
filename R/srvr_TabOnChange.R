srvr_TabOnChange <- function(
  strTargetTab,
  rctv_strValue,
  session = getDefaultReactiveDomain()
) {
  observe(
    bslib::nav_select("primary_nav_bar", strTargetTab, session = session)
  ) %>%
    bindEvent(
      null_for_none(rctv_strValue()),
      ignoreInit = TRUE
    )
}

null_for_none <- function(strValue) {
  if (strValue != "None" && strValue != "") {
    return(strValue)
  }
  NULL
}
