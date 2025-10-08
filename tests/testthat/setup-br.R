# Hide any existing br snapshots for cases where qualification won't run.
if (testing_entire_package()) {
  br_snap_folder <- test_path("_snaps", CompileVariantDir())
  if (fs::dir_exists(br_snap_folder)) {
    br_snap_holder <- test_path("br_hold")
    if (fs::dir_exists(br_snap_holder)) {
      cli::cli_abort(c(
        "Folder `{br_snap_holder}` already exists.",
        i = "Delete that folder (or move it to a new location) before testing."
      ))
    }
    cli::cli_inform(c("!" = "Temporarily moving requirement snapshots."))
    withr::defer(
      {
        cli::cli_inform(c(v = "Restoring br snapshots."))
        fs::file_move(br_snap_holder, br_snap_folder)
      },
      teardown_env()
    )
    fs::file_move(br_snap_folder, br_snap_holder)
  }
}
