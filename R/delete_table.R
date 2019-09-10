#' Delete database table
#'
#' \code{delete_table} opens an ODBC connection and deletes a specified table.
#'
#' @param table \code{string}. The table to be deleted.
#' @param database \code{string}. The database to delete the table from.
#' @param server \code{string}. The server holding the database.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun {
#' delete_table("table name", "database name", "server name")
#' }
#'
#' @export

delete_table <- function(table, database, server) {

  connection <- sdrUpload:::create_connection(database = database, server = server)

  tryCatch({odbc::dbRemoveTable(conn = connection, name = table)},
           error = function(cond) {
             message(paste0("Failed to delete table: ", table, " from database: ", database, " on server: ", server))
             message(paste0("Original error message: ", cond))
           })
}
