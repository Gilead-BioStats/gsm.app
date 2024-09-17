make_lStudy <- function(dfGroups, dfResults) {
  dfStudy <- dfGroups[dfGroups$GroupLevel == "Study", c("Param", "Value")]
  lStudy <- as.list(rlang::set_names(dfStudy$Value, dfStudy$Param))
  # Temporarily only use some specific columns.
  lStudy <- temp_subsetLStudy(lStudy)
  lStudy$snapshot_date <- format(max(as.Date(dfResults$SnapshotDate)), "%Y-%m-%d")
  return(lStudy)
}

temp_subsetLStudy <- function(lStudy) {
  lStudy <- lStudy[c(
    "protocol_number",
    "nickname",
    "protocol_indication",
    "therapeutic_area",
    "phase",
    "num_plan_site",
    "num_enrolled_subj_m"
  )]
  names(lStudy) <- c(
    "protocol_number",
    "nickname",
    "Indication",
    "Therapeutic Area",
    "Phase",
    "Sites",
    "Subjects"
  )
  return(lStudy)
}
