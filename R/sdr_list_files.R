#' List files in a specified folder
#'
#' \code{sdr_archive_file} is an internal function to list files in a source directory.
#'
#' @param source \code{string}. The path of the directory containing files.
#'
#' @return \code{character list}
#'
#' @examples
#'
#' \dontrun {
#' sdr_list_files("C:\\example_source_folder")
#' }
#'
#' @keywords internal
#'
#' @noRd

sdr_list_files <- function(source) {

  files <- list.files(path = source, pattern = "\\.xlsx$")
  message(paste0("Reading directory: ", source))

  if (length(files) > 0) {

    message("Found files:")
    message(paste0("'", files, "'\n"))

  }

  else {

    stop(paste0("No files found in '", source, "'"))

  }

  return(files)

}
