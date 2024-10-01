# Clear shinytest2 snapshots before tests, then restore after.
if (!getOption("shinytest2.test", FALSE)) {
  shinytest2_snaps_dir <- testthat::test_path("_snaps", "run_gsm_app")
  if (dir.exists(shinytest2_snaps_dir)) {
    temp_protected_snaps <- file.path(tempdir(), "run_gsm_app")
    withr::defer(
      file.rename(temp_protected_snaps, shinytest2_snaps_dir),
      priority = "first",
      envir = teardown_env()
    )
    file.rename(shinytest2_snaps_dir, temp_protected_snaps)
  }
}
