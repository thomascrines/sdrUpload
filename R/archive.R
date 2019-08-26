#' Move files from source to archive directory
#'
#' \code{archive} is an internal function that moves files from a source directory to an archive directory.
#'
#' @param source \code{string}. The path of the directory containg processed Excel workbooks.
#' @param archive \code{string}. The path of the directory to store processed Excel workbooks.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun {
#' archive("path_of_source_directory", "path_of_archive_directory")
#' }
#'
#' @keywords internal
#'
#' @noRd

archive <- function(source, archive) {

  files <- list.files(source)

  for (file in files) {
    file.rename(paste0(source, "\\", file), paste0(archive, "\\", file))
  }
}
