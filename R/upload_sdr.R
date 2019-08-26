#' Upload Excel workbooks to SDR and archive
#'
#' \code{upload_sdr} processes all Excel workbooks in a specified location, saving all sheets as tables in the SDR and moving processed files to an archive folder.
#' It relies on internal functions: \code{upload} and \code{archive}
#'
#' @param source \code{string}. The path of the directory containg processed Excel workbooks.
#' @param archive \code{string}. The path of the directory to store processed Excel workbooks.
#'
#' @return \code{null}.
#'
#' @examples
#'
#' \dontrun{
#' archive("path_of_source_directory", "path_of_archive_directory")
#' }
#'
#' @export

upload_sdr <- function(source, archive) {
  sdrUpload:::upload(source)
  sdrUpload:::archive(source, archive)
}
