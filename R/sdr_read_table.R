#' Read a SQL Server Table
#'
#' \code{sdr_list_tables} reads the contents of an entire table from a SQL Server database to R.
#'
#' @param database \code{string}. The database containing the table.
#' @param server \code{string}. The server holding the database.
#' @param table \code{string}. The table to read data from
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun{
#' sdr_list_tables(database = "DatabaseName", server = "ServerName", table = "TableName")
#' }
#'
#' @export


sdr_read_table <- function(database, server, table) {

  connection <- sdrUpload:::sdr_create_connection(database = database, server = server)
  data <- DBI::dbReadTable(connection, table)
  dbDisconnect(connection)

  data

}
