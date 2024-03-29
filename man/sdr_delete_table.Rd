% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sdr_delete_table.R
\name{sdr_delete_table}
\alias{sdr_delete_table}
\title{Delete database table}
\usage{
sdr_delete_table(table, database, server)
}
\arguments{
\item{table}{\code{string}. The table to be deleted.}

\item{database}{\code{string}. The database to delete the table from.}

\item{server}{\code{string}. The server holding the database.}
}
\value{
\code{null}
}
\description{
\code{sdr_delete_table} opens an ODBC connection and deletes a specified table.
}
\examples{

\dontrun{
sdr_delete_table(table = "TableName", database = "DatabaseName", server = "ServerName")
}

}
