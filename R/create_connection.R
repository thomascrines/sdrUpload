#' Create ODBC connection to database
#'
#' \code{create_connection} is an internal function to create and open an ODBC database connection.
#'
#' @param database \code{string}. The name of the database to connect to.
#' @param server \code{string}. The name of the server to connect to.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun {
#' create_connection("database_name", "server_name")
#' }
#'
#' @keywords internal
#'
#' @noRd

create_connection <- function(database, server) {
  tryCatch({odbc::dbConnect(odbc::odbc(),
                            Driver="SQL Server",
                            Trusted_Connection="True",
                            DATABASE=database,
                            SERVER=server)},
           error = function(cond) {
             message(paste0("Failed to create connection to database: ", database, " on server: ", server))
             message(paste0("Original error message: ", cond))
           })
}
