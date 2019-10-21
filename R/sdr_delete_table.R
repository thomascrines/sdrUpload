#' Delete database table
#'
#' \code{sdr_delete_table} opens an ODBC connection and deletes a specified table.
#'
#' @param table \code{string}. The table to be deleted.
#' @param database \code{string}. The database to delete the table from.
#' @param server \code{string}. The server holding the database.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun{
#' sdr_delete_table(table = "TableName", database = "DatabaseName", server = "ServerName")
#' }
#'
#' @export

sdr_delete_table <- function(table, database, server){

  connection <- sdrUpload:::sdr_create_connection(database = database, server = server)

  tryCatch({

    odbc::dbRemoveTable(conn = connection, name = table)

  }, error = function(cond){

    stop(paste0("Failed to delete table: '", table, "' from database: '", database, "' on server: '", server, "'\nOriginal error message: ", cond))

  })

  dbDisconnect(connection)
  message("Table: '", table, "' successfully deleted from database: '", database, "' on server '", server, "'")

}
