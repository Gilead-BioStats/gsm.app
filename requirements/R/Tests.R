TestCheckBR <- function(strPkgPath = here::here()) {
  CheckReadyToTest(strPkgPath)
  purrr::walk(
    fs::dir_ls(GetTestPath(strPkgPath), regexp = "test-br-.+[.]R$"),
    TestCheckQCFile,
    strPkgPath = strPkgPath
  )
}

TestCheckQCFile <- function(strTestFile, strPkgPath = here::here()) {
  CheckReadyToTest(strPkgPath)
  withr::local_envvar(TESTTHAT_IS_QCING = "true")
  cli::cli_inform("Running tests in {.file {strTestFile}}")
  testthat::test_file(
    strTestFile,
    package = GetCurrentPackage(strPkgPath),
    reporter = testthat::TapReporter$new()
  )
}

CheckReadyToTest <- function(strPkgPath = here::here()) {
  if (!CurrentPackageIsLoaded(strPkgPath)) {
    cli::cli_abort(
      "The {.pkg {GetCurrentPackage(strPkgPath)}} package must be loaded to run this function."
    )
  }
  if (!TestthatIsLoaded()) {
    cli::cli_abort(
      "The {.pkg testthat} package must be loaded to run this function."
    )
  }
  strTestPath <- GetTestPath(strPkgPath)
  if (!fs::dir_exists(strTestPath)) {
    cli::cli_abort(
      "No tests found in {.path {strTestPath}}"
    )
  }
  invisible(TRUE)
}

GetCurrentPackage <- function(strPkgPath = here::here()) {
  strDescriptionPath <- fs::path(strPkgPath, "DESCRIPTION")
  if (!fs::file_exists(strDescriptionPath)) {
    cli::cli_abort("No DESCRIPTION file found at {.file {strDescriptionPath}}")
  }
  desc::desc(file = strDescriptionPath)$get("Package")
}

GetTestPath <- function(strPkgPath = here::here()) {
  fs::path(strPkgPath, "tests", "testthat")
}

CurrentPackageIsLoaded <- function(strPkgPath = here::here()) {
  PackageIsLoaded(GetCurrentPackage(strPkgPath))
}

PackageIsLoaded <- function(strPkg) {
  strPkg %in% loadedNamespaces()
}

TestthatIsLoaded <- function() {
  PackageIsLoaded("testthat")
}
