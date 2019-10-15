#' Create ODBC connection to database
#'
#' \code{sdr_create_connection} is an internal function to create and open an ODBC database connection.
#'
#' @param database \code{string}. The name of the database to connect to.
#' @param server \code{string}. The name of the server to connect to.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun {
#' sdr_create_connection("database_name", "server_name")
#' }
#'
#' @keywords internal
#'
#' @noRd

sdr_create_connection <- function(database, server) {
  odbc::dbConnect(odbc::odbc(),
                  Driver="SQL Server",
                  Trusted_Connection="True",
                  DATABASE=database,
                  SERVER=server)
  }
