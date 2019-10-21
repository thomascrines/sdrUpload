#' Upload Excel worksheets to SDR
#'
#' \code{sdr_upload} uploads all Excel worksheets in a specified location to a specified database.
#'
#' @param source \code{string}. The path of the directory containing Excel files.
#' @param archive \code{string}. The path of the directory to send processed files to.
#' @param database \code{string}. The database to write the data to.
#' @param server \code{string}. The server holding the database.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun{
#' sdr_upload(source = "C:\\example_source", archive = "C:\\example_archive", database = "DatabaseName", server = "ServerName")
#' }
#'
#' @export

sdr_upload <- function(source, archive, database, server) {

  files <- sdrUpload:::sdr_list_files(source)

  for (file in files) {

    sdrUpload:::sdr_process_file(source = source, file = file, archive = archive, database = database, server = server)

    }

  message("Processing complete")

}
