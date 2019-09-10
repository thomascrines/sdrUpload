#' Move file from source to archive directory
#'
#' \code{sdr_archive_file} is an internal function that moves a file from a source directory to an archive directory.
#'
#' @param source \code{string}. The path of the directory containing a file.
#' @param archive \code{string}. The path of the directory to send the file to.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun {
#' sdr_archive_file("path_of_source_directory", "path_of_archive_directory")
#' }
#'
#' @keywords internal
#'
#' @noRd

sdr_archive_file <- function(source, archive, file) {

  source_file_path <- paste0(source, "\\", file)
  archive_file_path <- paste0(archive, "\\", file)

  tryCatch({file.rename(from = source_file_path, to = archive_file_path)},
           error = function(cond) {
             message(paste0("Failed to move file from: ", source_file_path, " to: ", archive_file_path))
             message(paste0("Original error message: ", cond))
           })
}

