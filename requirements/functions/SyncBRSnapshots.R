SyncBRSnapshots <- function(path = ".") {
  strToPath <- CopyRawImages(path)
  FlattenImgSubdirs(strToPath)
}

CopyRawImages <- function(path) {
  strFromPath <- EnsureImgFromPath(path)
  strToPath <- EnsureImgPathEmpty(path)
  fs::dir_copy(strFromPath, strToPath)
  return(strToPath)
}

EnsureImgFromPath <- function(path) {
  strFromPath <- fs::path(path, "tests", "testthat", "_snaps", "br")
  if (!dir.exists(strFromPath)) {
    cli::cli_abort(c(
      "Snapshot directory not found at '{path}'",
      i = "Did you run the QC tests?"
    ))
  }
  strFromPath
}

EnsureImgPathEmpty <- function(path) {
  strToPath <- RequirementArticleExtrasPath(path, "img")
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
