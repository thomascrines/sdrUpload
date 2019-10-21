#' Process worksheet from Excel file to write to SQL Server database
#'
#' \code{sdr_process_worksheet} is an internal function that processes an Excel worksheet to be written to a SQL Server database.
#'
#' @param file_path \code{string}. The full path of the file containing the worksheet.
#' @param file \code{string}. The name of the file.
#' @param worksheet \code{string}. The name of the worksheet to be processed.
#' @param database \code{string}. The name of the database to write the sheet to.
#' @param server \code{string}. The name of the server containing the database.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun {
#' sdr_process_worksheet("path_of_source_directory", "path_of_archive_directory")
#' }
#'
#' @keywords internal
#'
#' @noRd

sdr_process_worksheet <- function(file_path, file, worksheet, database, server) {

  df <- readxl::read_excel(file_path, sheet = worksheet)
  database_table_name <- gsub(" ", "_", paste0(tolower(gsub("\\..*", "", file)), "_", tolower(worksheet)))
  connection <- sdrUpload:::sdr_create_connection(database = database, server = server)

  tryCatch({

    DBI::dbWriteTable(connection, name = database_table_name, value = df)
    message(paste0("Excel worksheet: '", worksheet, "' successfully written to: '", database_table_name, "'"))

  }, error = function(cond) {

    stop(paste0("Failed to write worksheet: ", worksheet, " to database: '", database, "'\nOriginal error message: ", cond))

  })

  odbc::dbDisconnect(connection)

}
