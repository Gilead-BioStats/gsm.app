SyncBRSnapshots <- function(strPkgPath = here::here()) {
  strToPath <- CopyRawImages(strPkgPath)
  FlattenImgSubdirs(strToPath)
}

CopyRawImages <- function(strPkgPath) {
  strFromPath <- EnsureImgFromPath(strPkgPath)
  strToPath <- EnsureImgPathEmpty(strPkgPath)
  fs::dir_copy(strFromPath, strToPath)
  return(strToPath)
}

EnsureImgFromPath <- function(strPkgPath) {
  strFromPath <- fs::path(strPkgPath, "tests", "testthat", "_snaps", "br")
  if (!dir.exists(strFromPath)) {
    cli::cli_abort(c(
      "Snapshot directory not found at '{strPkgPath}'",
      i = "Did you run the QC tests?"
    ))
  }
  strFromPath
}

EnsureImgPathEmpty <- function(strPkgPath) {
  strToPath <- RequirementArticleExtrasPath(strPkgPath, "img")
  if (fs::dir_exists(strToPath)) {
    fs::dir_delete(strToPath)
  }
  strToPath
}

FlattenImgSubdirs <- function(strToPath) {
  chrToSubdirs <- fs::dir_ls(strToPath, type = "directory")
  chrToIssueSubdirs <- CreateIssueSubdirs(chrToSubdirs, strToPath)
  purrr::walk2(chrToSubdirs, chrToIssueSubdirs, FlattenIssueSubdir)
}

CreateIssueSubdirs <- function(chrToSubdirs, strToPath) {
  chrIssues <- stringr::str_extract(fs::path_file(chrToSubdirs), "br-\\d+")
  fs::dir_create(fs::path(strToPath, chrIssues))
}

FlattenIssueSubdir <- function(strOriginalSubdir, strTargetSubdir) {
  fs::file_move(fs::dir_ls(strOriginalSubdir), strTargetSubdir)
  fs::dir_delete(strOriginalSubdir)
}
