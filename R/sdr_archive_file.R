#' Move file from source to archive directory
#'
#' \code{sdr_archive_file} is an internal function that moves a file from a source directory to an archive directory.
#'
#' @param source \code{string}. The path of the directory containing a file.
#' @param archive \code{string}. The path of the directory to send the file to.
#' @param file \code{string}. The name of the file to be archived.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun {
#' sdr_archive_file("C:\\Users\\archive", "C:\\Users\\archive")
#' }
#'
#' @keywords internal
#'
#' @noRd

sdr_archive_file <- function(source, archive, file) {

  source_file_path <- paste0(source, "\\", file)
  archive_file_path <- paste0(archive, "\\", file)

  tryCatch({

    file.rename(from = source_file_path, to = archive_file_path)

  }, error = function(cond) {

    stop(paste0("Failed to move file from: '", source_file_path, "' to: '", archive_file_path, "'\nOriginal error message: '", cond, "'"))

  })
}

