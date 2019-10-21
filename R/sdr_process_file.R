#' Process files to write to SQL Server database
#'
#' \code{sdr_process_file} is an internal function that processes files to be written to a SQL Server database.
#'
#' @param source \code{string}. The path of the directory containing the file.
#' @param file \code{string}. The name of the file.
#' @param archive \code{string}. The path of the directory to move the processed file to.
#' @param database \code{string}. The name of the databse to write the file to.
#' @param server \code{string}. The name of the server containing the database.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun {
#' sdr_process_file(source = "C:\\Temp", "ExcelFile.xlsx")
#' }
#'
#' @keywords internal
#'
#' @noRd

sdr_process_file <- function(source, file, archive, database, server) {

  message(paste0("Processing file: '", file, "'"))

  file_path <- file.path(source, file)
  worksheets <- readxl::excel_sheets(file_path)

  for (worksheet in worksheets) {

    sdrUpload:::sdr_process_worksheet(file_path = file_path, file = file, worksheet = worksheet, database = database, server = server)

  }

  sdrUpload:::sdr_archive_file(source, archive, file)

  message(paste0("'", file, "' successfully processed and moved from: '", source, "' to: '", archive, "'\n"))

}
