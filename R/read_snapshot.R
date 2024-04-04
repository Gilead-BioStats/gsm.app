#' Read and assemble snapshot from `inst`.
#'
#' @return `list` {gsm} snapshot object.
#'
#' @examples
#' \dontrun{
#' snapshot <- read_snapshot()
#' }
#' @export
read_snapshot <- function() {
  sampledata <- qs::qread(system.file("sampledata", "snapshot.qs", package = "gsmApp"))

  return(sampledata)
}
