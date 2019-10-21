#' List tables in a SQL Server database
#'
#' \code{sdr_list_tables} lists all base tables in a SQL Server database on a specified server.
#'
#' @param database \code{string}. A SQL Server database name.
#' @param server \code{string}. A SQL Server database server.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun{
#' sdr_list_tables(database = "DatabaseName", server = "DatabaseServer")
#' }
#'
#' @export

sdr_list_tables <- function(database, server) {

  connection <- sdrUpload:::sdr_create_connection(database = database, server = server)
  query_string <- paste0("SELECT TABLE_NAME FROM ", database, ".INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'")

  data <- dbGetQuery(connection, query_string)

  dbDisconnect(connection)

  data

}
